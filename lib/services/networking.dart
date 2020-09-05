import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class NetworkHelper{

  final String address;
  NetworkHelper({@required this.address});

  Future getData()async
  {
    http.Response response = await http.get(address);
    if(response.statusCode==200)
    {
      String a =response.body;
      var decodedData= jsonDecode(a);
      return decodedData;
    }
    else{
      print(response.statusCode);
    }
  }

}
