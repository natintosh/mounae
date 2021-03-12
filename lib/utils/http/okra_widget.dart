import 'package:flutter/cupertino.dart';
import 'package:okra_widget/okra_widget.dart';

class OkraWidget {
  static Future<OkraHandler> launch(BuildContext context) async {
    var banks = [
      "ecobank-nigeria",
      "fidelity-bank",
      "first-bank-of-nigeria",
      "first-city-monument-bank",
      "guaranty-trust-bank",
      "access-bank",
      "unity-bank",
      "alat",
      "polaris-bank",
      "stanbic-ibtc-bank",
      "standard-chartered-bank",
      "sterling-bank",
      "union-bank-of-nigeria",
      "united-bank-for-africa",
      "wema-bank",
      "rubies-bank",
      "kuda-bank"
    ];

    var okraOptions = {
      "key": "37fa3661-2a15-58ff-bdff-01554fbd3e70",
      "token": "5f74365c05805f088505daa8",
      "products": ["auth", "balance", "identity", "transactions"],
      "environment": "production",
      "clientName": "Mounae",
      "color": "#635EA8",
      "limit": "3",
      "isCorporate": false,
      "connectMessage": "Mounae would like to connect to to your bank account?",
      "callback_url": "",
      "redirect_url": "",
      "logo": "https://avatars.githubusercontent.com/u/71211212?s=50&v=4",
      "widget_success": "Your account was successfully linked to Mounae",
      "widget_failed": "An unknown error occurred, please try again.",
      "currency": "NGN",
      "noPeriodic": true,
      "exp": "",
      "success_title": "null",
      "success_message": "null",
      "guarantors": {
        "status": false,
        "message": "Okra requires you to add guarantors",
        "number": 3,
      },
      "filter": {
        "industry_type": "all",
        "banks": banks,
      }
    };

    OkraHandler handler = await Okra.create(context, okraOptions);

    return handler;
  }
}
