import 'package:firstapp/src/utils/commons.dart';
import 'package:flutter/material.dart';
import 'package:firstapp/src/widgets/custom_text.dart';

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
                  child: CustomText(
                      text:"What do you desire?",
                      size: 18.0,
                      color: white
                  )
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
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder:(_, index){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                            decoration: BoxDecoration(
                                color: red,
                                boxShadow: [
                                  BoxShadow(
                                      color: red[50],
                                      offset: Offset(4,6),
                                      blurRadius:20
                                  )
                                ]
                            ),
                            child:Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Image.asset("images/beef_kebab.jpg", width: 60,)
                            )
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        CustomText(text: "Beef", size: 14, color: white,)
                      ],
                    ),
                  );
                }
              ),
            )

          ],
        ),
      )

    );
  }
}
