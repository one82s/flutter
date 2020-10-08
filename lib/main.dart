import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "List View Sample",
    home: Scaffold(
      body: getListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=> debugPrint('FAB was clicked'),
        child: Icon(Icons.add),
        tooltip: 'Add one more item',
      ),
    )
  ));
}

Widget getListView(){
  var listItems = getListElements();
  var listView = ListView.builder(
      itemBuilder: (context,index){
        return ListTile(
          leading: Icon(Icons.arrow_right),
          title: Text(listItems[index]),
          onTap: ()=> showSnackBar(context, listItems[index])
        );
  });

    return listView;

}
List <String> getListElements(){
  return List<String>.generate(1000, (index) => 'Item $index');
}

void showSnackBar(BuildContext context, String item){
  var snackBar = SnackBar(
      content: Text('You just tapped $item'),
      action: SnackBarAction(
        label: 'UNDO',
        onPressed: ()=>debugPrint('Performing UNDO operation')
      )
  );
  Scaffold.of(context).showSnackBar(snackBar);
}

