import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<bool> isDeleted = [false, false, false, false, false];
  List<Color> color = [
    Colors.purpleAccent,
    Colors.indigoAccent,
    Colors.blueAccent,
    Colors.greenAccent,
    Colors.yellowAccent
  ];

  void deleteItem(int index) {
    setState(() {
      isDeleted[index] = !isDeleted[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(20),
      child: ListView.builder(
        itemBuilder: (context, index) {
          return isDeleted[index]
              ? Text('')
              : ListItem(
                  deleteItem: deleteItem, index: index, color: color[index]);
        },
        itemCount: 5,
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final Function deleteItem;
  final int index;
  final Color color;
  ListItem({this.deleteItem, this.index, this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {deleteItem(index)},
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: Container(
          height: 100,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(20)),
        ),
      ),
    );
  }
}
