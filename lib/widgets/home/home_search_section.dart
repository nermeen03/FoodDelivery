import 'package:flutter/material.dart';

class SearchSection extends StatefulWidget {
  const SearchSection({super.key});

  @override
  State<SearchSection> createState() => _SearchSectionState();
}

class _SearchSectionState extends State<SearchSection> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose(); // Always dispose your controller!
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 14),
      child: Column(
        children: [
          const Text("Good Afternoon!!",
              style: TextStyle(color: Color(0xFFFE724D), fontSize: 25)),
          const SizedBox(height: 12),
          Center(
            child: SizedBox(
              width: 380,
              child: TextField(
                controller: _controller,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  hintText: "Search dishes, restaurants",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.search),
                ),
                onChanged: (text) {
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}