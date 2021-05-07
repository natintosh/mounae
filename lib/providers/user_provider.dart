import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mounae/models/bank_list_model.dart';
import 'package:mounae/models/response_model.dart';
import 'package:mounae/repository/server/mounea_repository.dart';

class UserProvider extends ChangeNotifier {
  BankListModel? _bankList;

  set bankList(BankListModel? value) {
    _bankList = value;
    notifyListeners();
  }

  BankListModel? get bankList => _bankList;

  void getListOfBank(Map<String, dynamic> payload) async {
    try {
      ResponseModel? response =
          await MounaeRepository.getListOfBanks(payload: payload);

      if (response != null) {
        if (response.responseCode == '00') {
          Object? data = response.data;

          BankListModel bankListModel =
              BankListModel.fromJson((data is Map) ? data as Map<String, dynamic> : json.decode(data as String));

          bankList = bankListModel;
        }
      }
    } on Exception catch (e) {
      log(e.toString());
    }
  }
}
