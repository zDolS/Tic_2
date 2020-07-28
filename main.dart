import 'package:flutter/material.dart';
import 'package:flutter_socket_io/flutter_socket_io.dart';
import 'package:flutter_socket_io/socket_io_manager.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tik tok',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  _MyHomePageState() {}

  void getConnection() {
    SocketIO socketIO = SocketIOManager().createSocketIO(
      "http://localhost:8080",
      "/",
    );
    socketIO.init();
    socketIO.connect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tic tok"),
      ),
      body: Container(
          child: Column(
        children: <Widget>[
          RaisedButton(
            onPressed: getConnection,
            child: Text("connect"),
          ),
        ],
      )),
    );
  }
}
