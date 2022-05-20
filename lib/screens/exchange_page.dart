import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:valyute/core/components/mytext.dart';
import 'package:valyute/core/constants/colors.dart';
import 'package:valyute/data/code_info_data.dart';
import 'package:valyute/data/flag_data.dart';
import 'package:valyute/models/currency_model.dart';
import 'package:valyute/service/currency_service.dart';
import 'package:valyute/widgets/app_bar_widget.dart';

class ExchangePage extends StatefulWidget {
  CurrencyModel? currencyModel;
  ExchangePage({Key? key, this.currencyModel}) : super(key: key);

  @override
  State<ExchangePage> createState() => _ExchangePageState();
}

class _ExchangePageState extends State<ExchangePage> {
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
              color: MyColor.kPrimaryColor,
            ),
          );
        } else {
          var data = snap.data!;
          return Column(
            children: [
              Expanded(
                flex: 1,
                child: 
                  AppBarWidget(text: "Valyutalar"),
              ),
              Expanded(
                flex: 7,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: ListView.builder(
                    itemBuilder: (ctx, i) {
                      return Column(
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                                radius: 25.0,
                                backgroundImage: CachedNetworkImageProvider(
                                    FlagData.flagList[i])),
                            title: MyText(
                              text: data[i].title.toString(),
                              color: MyColor.kPrimaryColor,
                            ),
                            subtitle: MyText(
                              text: "${data[i].cbPrice} UZS",
                              size: 16,
                              color: MyColor.kPrimaryGrey,
                            ),
                            trailing: IconButton(
                              icon: Icon(
                                FontAwesomeIcons.infoCircle,
                                color: MyColor.kGreen,
                              ),
                              onPressed: () async {
                                launch(CodeInfoData.codeInfoList[i]);
                              },
                            ),
                          ),
                          const Divider(thickness: 0.5)
                        ],
                      );
                    },
                    itemCount: data.length,
                  ),
                ),
              )
            ],
          );
        }
      },
    );
  }
}
