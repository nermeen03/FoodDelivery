import 'package:flutter/material.dart';

class PromoCode extends StatelessWidget {
  PromoCode({super.key});
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: SizedBox(
        width: 300,
        child: TextField(
          controller: _controller,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            hintText: "Promo Code",
            border: const OutlineInputBorder(),
            suffixIcon: ElevatedButton(onPressed: (){},style:
            ButtonStyle(backgroundColor: WidgetStateProperty.all(Color(0xFFE54630))),
              child: Text("Add",style: TextStyle(color: Colors.white),),),
          ),
          onChanged: (text) {
          },
        ),
      ),
    );
  }
}
