import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:subject_api/Models/subject_class.dart';

import '../ProviderSubject/data_provider.dart';

class ApiServices{
  Future fetchAllData (BuildContext context) async {
    try {

      final result = await InternetAddress.lookup("google.com");
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        var url = Uri.parse(StringHelper.BASE_URL);
        final response = await http.get(url, headers: {
          "Accept": "Application/json",

        });
        var decoded = jsonDecode(response.body);
        if (response.statusCode == 200) {
          SubjectClass subjectClass = SubjectClass.fromJson(decoded);
          Provider.of<DataProvider>(context, listen: false)
              .getSubjectProduct(subjectClass);
          return response;
        }  else {
          Fluttertoast.showToast(msg: "${decoded['message']}");
        }
      } else {
        Fluttertoast.showToast(msg: "No Internet");
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }
}


class StringHelper {
  static String BASE_URL = "https://s3.us-west-2.amazonaws.com/secure.notion-static.com/9c1101b7-efd9-4d20-a9c1-9bf193e799df/classes.json?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20220524%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20220524T044931Z&X-Amz-Expires=86400&X-Amz-Signature=f13ba5f40e12f23a2b8618432deaff9e5b7bfb7f0eae7e37ac3d5f63aa7f9a37&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22classes.json%22&x-id=GetObject";
}