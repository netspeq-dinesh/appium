import 'package:flutter/material.dart';

class ScrollTestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scroll Test Page"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              key: Key("searchField"), // Key for testing
              decoration: InputDecoration(
                labelText: "Enter text",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              key: Key("scrollList"), // Matches the test script
              itemCount: 50,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.greenAccent.withOpacity(0.5),
                  child: ListTile(
                    key: Key("item_$index"), // Key to locate items in the test
                    title: Text("Item $index"),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
