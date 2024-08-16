import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:api_get/model/postmodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class Postmodelrepository {
  Future<List<postmodel>> getdata() async {
    try {
      List<postmodel> postmodel1;
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString()) as List;
         /*  Method 1 : 
          for(Map i in data)
          photolist.add(Photos(title: i['title'], url: i['url'])); 
           
           
           Method 2 : 
           for(Map<String, dynamic> i in data){
           postlist.add(Postmodel.fromJson(i));
              }
          */
          //Method 3 : 
        return data.map((e) {      
          return postmodel(
            id: e['id'],
            userId: e['userId'],
            title: e['title'],
            body: e['body'],
          );
        }).toList();
      }
    }on SocketException{
      throw Exception('Network Connection Error'); 
    }on TimeoutException{
      throw Exception('Time Out Error');
    }
    
    throw Exception('Error while fetching data'); 
  }
}
