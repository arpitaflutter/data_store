import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vasundhra_3/screens/apicall/controller/apicall_controller.dart';
import 'package:vasundhra_3/screens/apicall/model/api_model.dart';
import 'package:vasundhra_3/screens/data/model/data_model.dart';

import '../../utils/db_helper.dart';

class ApicallScreen extends StatefulWidget {
  const ApicallScreen({super.key});

  @override
  State<ApicallScreen> createState() => _ApicallScreenState();
}

class _ApicallScreenState extends State<ApicallScreen> {
  ApiController apiController = Get.put(ApiController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Api call screen"),
        ),
        body: FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else if (snapshot.hasData) {
              NewsModel? n1 = snapshot.data;
              List l1 = n1!.articles;
              return ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            "${l1[index].urlToImage}",
                            fit: BoxFit.cover,
                            height: 150,
                            width: 150,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {

                            DataModel d1 = DataModel(
                              description: l1[index].description,
                              title: l1[index].title,
                              content: l1[index].content,
                              author: l1[index].author
                            );
                            DBHelper.dbHelper.insertDB(d1: d1);
                            Get.toNamed('/data');
                          },
                          child: Text("Download"),
                        ),
                      ],
                    ),
                  );
                },
                itemCount: l1.length,
              );
            }
            return CircularProgressIndicator();
          },
          future: apiController.apiCall(),
        ),
      ),
    );
  }
}
