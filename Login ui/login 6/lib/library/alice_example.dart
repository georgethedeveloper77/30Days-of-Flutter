import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:alice/alice.dart';

import '../main.dart';

class AliceExample extends StatefulWidget {
  @override
  _AliceExampleState createState() => _AliceExampleState();
}

class _AliceExampleState extends State<AliceExample> {
  var output;
  Dio dio;
  Alice alice;

  @override
  void initState() {
    super.initState();
    dio = Dio();

    alice = Alice(
        showNotification: true, navigatorKey: navigatorKey, darkTheme: false);
    dio.interceptors.add(alice.getDioInterceptor());
  }

  getHttpRequest() async {
    var res = await http.get("https://jsonplaceholder.typicode.com/posts/1");
    alice.onHttpResponse(res);
    setState(() {
      output = jsonDecode(res.body);
    });
    print(jsonDecode(res.body));
  }

  postHttpRequest() async {
    var res = await http.post("https://jsonplaceholder.typicode.com/posts",
        body: {"Name": "HTTP"});
    alice.onHttpResponse(res);
    setState(() {
      output = jsonDecode(res.body);
    });
    print(jsonDecode(res.body));
  }

  getDioRequest() async {
    var res = await dio.get("https://jsonplaceholder.typicode.com/posts");
    setState(() {
      output = res;
    });
    print(res);
  }

  postDioRequest() async {
    var res = await dio.post("https://jsonplaceholder.typicode.com/posts",
        data: {"Name": "DIO"});
    setState(() {
      output = res;
    });
    print(res);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Network Tool"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "HTTP",
                textScaleFactor: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                      getHttpRequest();
                    },
                    child: Text("GET"),
                    color: Colors.tealAccent,
                  ),
                  RaisedButton(
                    onPressed: () {
                      postHttpRequest();
                    },
                    child: Text("POST"),
                    color: Colors.yellowAccent,
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "DIO",
                textScaleFactor: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                      getDioRequest();
                    },
                    child: Text("GET"),
                    color: Colors.orangeAccent,
                  ),
                  RaisedButton(
                    onPressed: () {
                      postDioRequest();
                    },
                    child: Text("POST"),
                    color: Colors.greenAccent,
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                output?.toString() ?? "Show Output Here",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
