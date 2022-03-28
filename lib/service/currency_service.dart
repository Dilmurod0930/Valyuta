
import 'package:dio/dio.dart';
import 'package:valyute/core/api/api.dart';
import 'package:valyute/models/currency_model.dart';

class CurrencyService{
  static Future<List<CurrencyModel>> getCurrencies()async{
    Response res = await Dio().get(Constants.myApi);

    return (res.data as List).map((e) => CurrencyModel.fromJson(e)).toList();
  }
}