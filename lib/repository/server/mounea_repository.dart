import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:mounae/models/response_model.dart';
import 'package:mounae/utils/http/http_client.dart';

const String BASE = 'http://35.202.149.30:8080';
const String AddBankAuthEndpoint = '/transaction/bankauth';
const String GetListOfBankEndpoint = '/transaction/getlistofbanks';

class MounaeRepository {
  static Future<ResponseModel> addBankAccountAuth(
      {@required Map<String, dynamic> payload}) async {
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
}
