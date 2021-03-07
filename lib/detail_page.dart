import 'package:flutter/material.dart';

import 'Model/data.dart';

class detailPage extends StatefulWidget {
  Data data;
  detailPage(this.data);

  @override
  _detailPageState createState() => _detailPageState();
}

class _detailPageState extends State<detailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Page', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.deepOrange,
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.all(5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.network(
                  widget.data.url,
                  height: 250.0,
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                          child: CircleAvatar(
                            child: Text(widget.data.id.toString()),
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                          ),
                      ),
                      SizedBox(
                        width: 7.0,
                      ),
                      Expanded(
                        flex: 2,
                          child: Text(widget.data.title),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
