import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gallery_grid_flutter/PageDetail.dart';
import 'package:http/http.dart' as http;

import 'IpServer.dart';

class PageGallery extends StatefulWidget {
  @override
  _PageGalleryState createState() => _PageGalleryState();
}

class _PageGalleryState extends State<PageGallery> {
  List<Container> daftarMakananPadang = new List();

  Future<List> getData() async {
    final response =
        await http.get("http://$IP_SERVER/gallery_flutter/getGallery.php");

    return json.decode(response.body);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Apps Gallery "),
        backgroundColor: Colors.deepOrange,
      ),
      body: new FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  children: List.generate(snapshot.data.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(new MaterialPageRoute(
                          builder: (BuildContext context) =>
                              PageDetail(list: snapshot.data, index: index),
                        ));
                      },
                      child: Image.network(
                        snapshot.data[index]['photoPath'],
                        fit: BoxFit.fitHeight,
                      ),
                    );
                  }),
                )
              : new Center(
                  child: new CircularProgressIndicator(),
                );
        },
      ),
      // body:
    );
  }
}
