import 'package:flutter/material.dart';

class DetailsOptions extends StatelessWidget {
  const DetailsOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 10),
      child: Row(
        children: const [
          Icon(Icons.fire_truck),
          SizedBox(width: 5),
          Text("Free delivery"),
          SizedBox(width: 10),
          Icon(Icons.alarm),
          SizedBox(width: 5),
          Text("45 mins"),
          SizedBox(width: 10),
          Icon(Icons.star),
          SizedBox(width: 5),
          Text("4.5"),
        ],
      ),
    );
  }
}
