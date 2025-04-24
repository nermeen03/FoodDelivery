import 'package:flutter/material.dart';

class TextSection extends StatelessWidget {
  const TextSection({super.key,required this.txt});

  final String txt;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(padding: EdgeInsets.only(left: 10,top: 10)),
        Text(txt,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.black),),
        Padding(padding: EdgeInsets.only(left: 150)),
        Text("View All",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.orange))
      ],);
  }
}