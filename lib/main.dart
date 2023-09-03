import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vasundhra_3/screens/data/view/data_screen.dart';

import 'screens/apicall/view/ApicallScreen.dart';

void main()
{
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: '/', page: () => ApicallScreen()),
        GetPage(name: '/data', page: () => DataScreen()),
      ],
    ),
  );
}