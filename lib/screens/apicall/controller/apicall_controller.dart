import 'package:get/get.dart';
import 'package:vasundhra_3/screens/apicall/model/api_model.dart';
import 'package:vasundhra_3/screens/utils/api_helper.dart';

class ApiController extends GetxController
{
  Future<NewsModel> apiCall()
  async {
    NewsModel n1 = await ApiHelper.apiHelper.getApi();
    return n1;
  }


}