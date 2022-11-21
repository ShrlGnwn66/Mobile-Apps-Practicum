import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './editdata.dart';
import './main.dart';

class Detail extends StatefulWidget {
  List list;
  int index;
  Detail({
    Key? key,
    required this.list,
    required this.index,
  }) : super(key: key);
  @override
  _DetailState createState() => new _DetailState();
}

class _DetailState extends State<Detail> {
  void deleteData() {
    var url = 'http://192.168.154.53:8080/api/api_pendidikan/';
    http.delete(Uri.parse(url + widget.list[widget.index]['id'].toString()),
        body: {
          'id': widget.list[widget.index]['id'].toString()
        }).then((response) {
      print('Response status : ${response.statusCode}');
      print('Response body : ${response.body}');
    });
  }

  void confirm() {
    AlertDialog alertDialog = new AlertDialog(
      content: new Text(
          "Are You Sure want to delete '${widget.list[widget.index]['nama']}'"),
      actions: <Widget>[
        new ElevatedButton(
          child: new Text(
            "OKE DELETE!",
            style: new TextStyle(color: Colors.black),
          ),
          onPressed: () {
            deleteData();
            Navigator.of(context).push(new MaterialPageRoute(
              builder: (BuildContext context) => new Home(),
            ));
          },
        ),
        new ElevatedButton(
          child: new Text("CANCEL", style: new TextStyle(color: Colors.black)),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );

    showDialog(builder: (context) => alertDialog, context: context);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar:
          new AppBar(title: new Text("${widget.list[widget.index]['nama']}")),
      body: new Container(
        height: 270.0,
        padding: const EdgeInsets.all(20.0),
        child: new Card(
          child: new Center(
            child: new Column(
              children: <Widget>[
                new Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                ),
                new Text(
                  widget.list[widget.index]['nama'],
                  style: new TextStyle(fontSize: 20.0),
                ),
                new Text(
                  "Tingkatan : ${widget.list[widget.index]['tingkatan']}",
                  style: new TextStyle(fontSize: 18.0),
                ),
                new Text(
                  "Tahun Masuk : ${widget.list[widget.index]['tahun_masuk']}",
                  style: new TextStyle(fontSize: 18.0),
                ),
                new Text(
                  "Tahun Keluar : ${widget.list[widget.index]['tahun_keluar']}",
                  style: new TextStyle(fontSize: 18.0),
                ),
                new Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                ),
                new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new ElevatedButton(
                      child: new Text("EDIT"),
                      onPressed: () =>
                          Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) => new EditData(
                          list: widget.list,
                          index: widget.index,
                        ),
                      )),
                    ),
                    Padding(padding: EdgeInsets.only(right: 10.0)),
                    new ElevatedButton(
                      child: new Text("DELETE"),
                      onPressed: () => confirm(),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
