import 'package:flutter/material.dart';
import 'package:flutter_google_sheet_example/monument_model.dart';


  Widget monumentList( List<MonumentModel> monumentList) {
    return ListView.builder(
          itemCount: monumentList.length,
          itemBuilder: (context, index) {
            return Card(
                elevation: 5,
                child: Container(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "|| " + monumentList[index].name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                      Container(
                        child: Image.network(monumentList[index].imageUrl),
                      ),
                      Container(
                        child: Text(
                          '\n' + monumentList[index].about,
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ));
          });
  }


class MyHomePage extends StatelessWidget {
  final Future<List<MonumentModel>> monuments;

  MyHomePage({Key key, this.monuments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Monument"),
        ),
        body: Center(
      child: FutureBuilder<List<MonumentModel>>(
        future: monuments,
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? monumentList(snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
    ));
  }
}
