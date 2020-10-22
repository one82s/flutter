import 'package:firstapp/src/utils/commons.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: red,
      body: SafeArea(
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("What do you desire?",
                    style: TextStyle(
                        fontSize: 18.0,
                        color: white
                    ),
                  ),
                ),
                Stack(
                  children: [
                    IconButton(
                      icon:Icon(Icons.notifications_none, color: white),
                      onPressed: (){},
                    ),
                    Positioned(
                        top: 12,
                        right: 12,
                        child: Container(
                          height:10.0,
                          width: 10.0,
                          decoration: BoxDecoration(
                              color: grey,
                              borderRadius: BorderRadius.circular(20.0)
                          ),
                        )
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: white,
                  boxShadow: [
                    BoxShadow(
                      color: grey[300],
                      offset: Offset(1,1),
                      blurRadius:4
                    )

                  ]
                ),
                child: ListTile(
                  leading: Icon(Icons.search, color: red),
                  title: TextField(
                    decoration: InputDecoration(
                      hintText: "Seach for what you crave for",
                      border: InputBorder.none,
                      hintStyle:   TextStyle(
                          fontSize: 14.0,
                          color: grey
                      ),

                    ),
                  ),
                  trailing: Icon(Icons.filter_list, color: red),

                ),
              ),
            )

          ],
        ),
      )

    );
  }
}
