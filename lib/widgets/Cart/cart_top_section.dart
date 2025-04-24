import 'package:flutter/material.dart';

class TopSection extends StatelessWidget {
  const TopSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
      child: SizedBox(height: 60,child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Icon(Icons.arrow_back_ios_new),
          ),

          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text("Cart", style: TextStyle(fontSize: 24)),
              ],
            ),
          ),
        ],
      ),),
    );
  }
}
