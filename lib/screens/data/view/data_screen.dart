import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vasundhra_3/screens/data/controller/data_controller.dart';

import '../../utils/db_helper.dart';

class DataScreen extends StatefulWidget {
  const DataScreen({super.key});

  @override
  State<DataScreen> createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {

  DataController dataController = Get.put(DataController());

  @override
  void initState() {
    super.initState();

    dataController.readData();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Data Screen"),
        ),
        body: Obx(
          () => ListView.builder(itemBuilder: (context, index) {
            return GestureDetector(
              onLongPress: () {
                DBHelper.dbHelper.deletDB(id: dataController.downloadData[index].id);
                dataController.readData();
              },
                child: Text("${dataController.downloadData[index].author}"));
          },
            itemCount: dataController.downloadData.length,
          ),
        ),
      ),
    );
  }
}