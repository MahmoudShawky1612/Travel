import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/data_model.dart';

class DataService{
  String baseUrl="http://mark.bslmeiyu.com/api";

 Future<Object> getInfo() async{
    String endPoint='/getplaces';
    http.Response res = await http.get(Uri.parse(baseUrl+endPoint));

    try {
      if(res.statusCode==200)
        {
          List<dynamic> list = json.decode(res.body);
          return list.map((e) => DataModel.fromJson(e)).toList();
        }
      return <DataModel>[];
    } on Exception catch (e) {
      print(e);
      return <DataModel>[];
    }
  }
}
















