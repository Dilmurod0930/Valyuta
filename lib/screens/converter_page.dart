
import 'package:flutter/material.dart';
import 'package:valyute/core/components/decoration.dart';
import 'package:valyute/core/components/mytext.dart';
import 'package:valyute/core/constants/colors.dart';
import 'package:valyute/models/currency_model.dart';
import 'package:valyute/service/currency_service.dart';
import 'package:valyute/widgets/app_bar_widget.dart';

class ConverterPage extends StatefulWidget {
  CurrencyModel? currencyModel;
  ConverterPage({Key? key, this.currencyModel}) : super(key: key);

  @override
  State<ConverterPage> createState() => _ConverterPageState();
}

class _ConverterPageState extends State<ConverterPage> {
  String title1 = "AED";
  String title2 = "AED";
  num results = 0;
  final TextEditingController _valController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: CurrencyService.getCurrencies(),
      builder: (context, AsyncSnapshot<List<CurrencyModel>> snap) {
        if (!snap.hasData) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        } else if (snap.hasError) {
          return Center(
            child: MyText(
              text: "Internet bilan muammo bor :( tekshirib qaytadan kiring",
              color: MyColor.kGreen,
            ),
          );
        } else {
          var data = snap.data!;
          return Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: AppBarWidget(
                      text: "Valyutalar",
                    ),
                  ),
                  Expanded(
                    flex: 9,
                    child: Container(
                      color: MyColor.kGrey,
                    ),
                  )
                ],
              ),
              Center(
                child: Positioned(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.6,
                    padding: const EdgeInsets.all(10.0),
                    decoration: MyBoxDecoration.boxDecWithShadow(
                        color: MyColor.kPrimaryGrey.withOpacity(0.04), shadowColor: MyColor.kGrey),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: _valController,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide: BorderSide(
                                        color: MyColor.kPrimaryColor),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide: BorderSide(
                                        color: MyColor.kPrimaryColor),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.05),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.2,
                              height:
                                  MediaQuery.of(context).size.height * 0.070,
                              padding: const EdgeInsets.all(5.0),
                              decoration: MyBoxDecoration.boxDecoration(
                                  color2: MyColor.kGreen),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  value: title1,
                                  items: List.generate(
                                    data.length,
                                    (index) => DropdownMenuItem(
                                      child: Text(
                                        data[index].code.toString(),
                                      ),
                                      value: data[index].code,
                                    ),
                                  ),
                                  onChanged: (v) {
                                    title1 = v.toString();
                                    setState(() {});
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                        IconButton(
                          icon: Icon(Icons.check,
                              size: 70, color: MyColor.kGreen),
                          onPressed: () {
                            if (_valController.text.isEmpty) {
                              results = 0;
                              setState(() {});
                            }
                            for (int i = 0; i < data.length; i++) {
                              for (int j = 0; j < data.length; j++) {
                                if (title1 == data[i].code.toString() &&
                                    title2 == data[j].code.toString()) {
                                  results = double.parse(_valController.text) *
                                      double.parse(data[i].cbPrice!) /
                                      double.parse(data[j].cbPrice!);
                                  setState(() {});
                                }
                              }
                            }
                          },
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                alignment: Alignment.centerLeft,
                                height:
                                    MediaQuery.of(context).size.height * 0.070,
                                padding: const EdgeInsets.all(5.0),
                                decoration: MyBoxDecoration.boxDecoration(
                                    color2: MyColor.kPrimaryColor),
                                child: MyText(text: results.toStringAsFixed(2)),
                              ),
                            ),
                            SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.05),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.2,
                              height:
                                  MediaQuery.of(context).size.height * 0.070,
                              padding: const EdgeInsets.all(5.0),
                              decoration: MyBoxDecoration.boxDecoration(
                                  color2: MyColor.kGreen),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  value: title2,
                                  items: List.generate(
                                    data.length,
                                    (index) => DropdownMenuItem(
                                      child: Text(
                                        data[index].code.toString(),
                                      ),
                                      value: data[index].code,
                                    ),
                                  ),
                                  onChanged: (v) {
                                    title2 = v.toString();
                                    setState(() {});
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
