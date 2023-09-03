import 'package:get/get.dart';

import '../../utils/db_helper.dart';

class DataController extends GetxController
{
  RxList downloadData = [].obs;
  Future<void> readData()
  async {
    downloadData.value = await DBHelper.dbHelper.readDB();
  }
}