import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:json_app/detail_page.dart';
import 'dart:convert';
import 'dart:async';
import 'Model/data.dart';

class homePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {

  Future<List<Data>> getAllData() async {
    var api = 'https://jsonplaceholder.typicode.com/photos';
   var data = await http.get(api);

    var jsonData = json.decode(data.body);
    List<Data> listof = [];

    for (var i in jsonData) {
      Data data = Data(i['id'], i['title'], i['url'], i['thumbnailUrl']);
      listof.add(data);
    }

    return listof;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Json Parsing'),
        backgroundColor: Colors.deepOrange,
        actions: [
          new IconButton(
              icon: Icon(Icons.search),
              onPressed: () => {}
          ),
          new IconButton(
              icon: Icon(Icons.add),
              onPressed: () => {}
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('CodeWith Ydc'),
              accountEmail: Text('ydc@gmail.com'),
              decoration: BoxDecoration(
                  color: Colors.deepOrange
              ),
            ),
            ListTile(
              title: Text('First Page'),
              leading: Icon(Icons.search, color: Colors.orange,),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: Text('Second Page'),
              leading: Icon(Icons.add, color: Colors.red,),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: Text('Third Page'),
              leading: Icon(Icons.title, color: Colors.purple,),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: Text('Fourth Page'),
              leading: Icon(Icons.list, color: Colors.green,),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            Divider(
              height: 5.0,
            ),
            ListTile(
              title: Text('Close'),
              leading: Icon(Icons.close, color: Colors.red,),
              onTap: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      ),

      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.all(10.0),
            height: 250.0,
            child: FutureBuilder(
              future: getAllData(),
              builder: (BuildContext c, AsyncSnapshot snapshot,) {
                if (snapshot.data == null) {
                  return Center(
                    child: Text("Loading Data....."),
                  );
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext c, int index) {
                      return Card(
                        elevation: 10.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(
                              snapshot.data[index].url,
                              height: 150.0,
                              width: 150.0,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              height: 7.0,
                            ),
                            Container(
                              margin: EdgeInsets.all(6.0),
                              height: 50.0,
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.red,
                                    child: Text(snapshot.data[index].id.toString()),
                                    foregroundColor: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 6.0,
                                  ),
                                  Container(
                                    width: 80.0,
                                    child: Text(snapshot.data[index].title, maxLines: 1, style: TextStyle(color: Colors.orange),),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),

          SizedBox(
            height: 7.0,
          ),

          Container(
            margin: EdgeInsets.all(10.0),
            height: MediaQuery.of(context).size.height,
            child: FutureBuilder(
              future: getAllData(),
              builder: (BuildContext c, AsyncSnapshot snapshot){
                if(snapshot.data == null){
                  return Center(
                    child: Text('Loading data....'),
                  );
                }else{
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext c, int index){
                      return Card(
                        elevation: 7.0,
                        child: Container(
                          height: 80.0,
                          child: InkWell(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext c)=> detailPage(snapshot.data[index])));
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 1,
                                    child: Image.network(
                                      snapshot.data[index].thumbnailUrl,
                                      height: 100.0,
                                      fit: BoxFit.cover,
                                    ),
                                ),
                                SizedBox(
                                  width: 6.0,
                                ),
                                Expanded(
                                  flex: 2,
                                    child: Text(
                                      snapshot.data[index].title,
                                      maxLines: 2,
                                      style: TextStyle(
                                        fontSize: 16.0
                                      ),
                                    )
                                ),
                                Expanded(
                                  flex: 1,
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: CircleAvatar(
                                        child: Text(
                                          snapshot.data[index].id.toString(),
                                        ),
                                        backgroundColor: Colors.red,
                                        foregroundColor: Colors.white,
                                      ),
                                    ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                      },
                  );
                }
              },
            ),
          )

        ],
      ),
    );
  }
}


