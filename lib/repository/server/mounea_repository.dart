import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mounae/models/response_model.dart';
import 'package:mounae/utils/http/http_client.dart';

const String BASE = 'http://35.202.149.30';
const String AddBankAuthEndpoint = ':8081/transaction/bankauth';
const String GetListOfBankEndpoint = ':8081/transaction/getlistofbanks';
const String CreateBudget = ':8080/createbudget';
const String GetCustomerBudget = ':8080/getcustomerbudget';
const String GetCustomerExpense = ':8080/getcustomerexpense';

class MounaeRepository {
  static Future<ResponseModel?> addBankAccountAuth(
      {required Map<String, dynamic> payload}) async {
    final dio = HttpClient.get;

    final String url = BASE + AddBankAuthEndpoint;

    try {
      Response response = await dio.post(url,
          data: payload,
          options: Options(
              headers: {"Authorization": "xx"},
              contentType: Headers.jsonContentType,
              responseType: ResponseType.json));

      if (response.statusCode == HttpStatus.ok) {
        log(response.data.toString());
        Map<String, dynamic> data =
            (response.data is Map) ? response.data : json.decode(response.data);

        log(data.toString());
        ResponseModel responseModel = ResponseModel.fromJson(data);

        return responseModel;
      }
    } on DioError catch (e) {
      log(e.toString());
    }
    return null;
  }

  static Future<ResponseModel?> getListOfBanks(
      {required Map<String, dynamic> payload}) async {
    final dio = HttpClient.get;

    final String url = BASE + GetListOfBankEndpoint;

    try {
      Response response = await dio.post(url,
          data: payload,
          options: Options(
              headers: {"Authorization": "xx"},
              contentType: Headers.jsonContentType,
              responseType: ResponseType.json));

      if (response.statusCode == HttpStatus.ok) {
        log(response.data.toString());
        Map<String, dynamic> data =
            (response.data is Map) ? response.data : json.decode(response.data);

        log(data.toString());
        ResponseModel responseModel = ResponseModel.fromJson(data);

        return responseModel;
      }
    } on DioError catch (e) {
      log(e.toString());
    }
    return null;
  }

  static Future<ResponseModel?> createBudget(
      {required Map<String, dynamic> payload}) async {
    final dio = HttpClient.get;

    final String url = BASE + CreateBudget;

    try {
      Response response = await dio.post(url,
          data: payload,
          options: Options(
              headers: {"Authorization": "xx"},
              contentType: Headers.jsonContentType,
              responseType: ResponseType.json));

      if (response.statusCode == HttpStatus.ok) {
        log(response.data.toString());
        Map<String, dynamic> data =
            (response.data is Map) ? response.data : json.decode(response.data);

        log(data.toString());
        ResponseModel responseModel = ResponseModel.fromJson(data);

        return responseModel;
      }
    } on DioError catch (e) {
      log(e.toString());
    }
    return null;
  }

  static Future<ResponseModel?> getCustomerBudget(
      {required Map<String, dynamic> payload}) async {
    final dio = HttpClient.get;

    final String url = BASE + GetCustomerBudget;

    try {
      Response response = await dio.post(url,
          data: payload,
          options: Options(
              headers: {"Authorization": "xx"},
              contentType: Headers.jsonContentType,
              responseType: ResponseType.json));

      if (response.statusCode == HttpStatus.ok) {
        log(response.data.toString());
        Map<String, dynamic> data =
            (response.data is Map) ? response.data : json.decode(response.data);

        log(data.toString());
        ResponseModel responseModel = ResponseModel.fromJson(data);

        return responseModel;
      }
    } on DioError catch (e) {
      log(e.toString());
    }
    return null;
  }

  static Future<ResponseModel?> getCustomerExpenses(
      {required Map<String, dynamic> payload}) async {
    final dio = HttpClient.get;

    final String url = BASE + GetCustomerExpense;

    try {
      Response response = await dio.post(url,
          data: payload,
          options: Options(
              headers: {"Authorization": "xx"},
              contentType: Headers.jsonContentType,
              responseType: ResponseType.json));

      if (response.statusCode == HttpStatus.ok) {
        log(response.data.toString());
        Map<String, dynamic> data =
            (response.data is Map) ? response.data : json.decode(response.data);

        log(data.toString());
        ResponseModel responseModel = ResponseModel.fromJson(data);

        return responseModel;
      }
    } on DioError catch (e) {
      log(e.toString());
    }
    return null;
  }
}
