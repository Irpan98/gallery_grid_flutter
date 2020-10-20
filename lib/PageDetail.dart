import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageDetail extends StatefulWidget {
  List list;
  int index;

  PageDetail({this.list, this.index});

  @override
  _PageDetailState createState() => _PageDetailState();
}

class _PageDetailState extends State<PageDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.list[widget.index]['name']}"),
        backgroundColor: Colors.deepOrange,
      ),
      body: ListView(
        children: [
          Container(
            child: Hero(
              tag: widget.list[widget.index]['name'],
              child: Material(
                child: InkWell(
                  child: Image.network(
                    widget.list[widget.index]['photoPath'],
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
          BagianNama(nama: widget.list[widget.index]['name']),
        ],
      ),
    );
  }
}

class BagianNama extends StatelessWidget {
  String nama;

  BagianNama({this.nama});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        child: Row(children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(nama,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.brown,
                      fontWeight: FontWeight.bold,
                    )),
              ],
            ),
          )
        ]));
  }
}
