import 'package:flutter/material.dart';

class InventoryTab extends StatefulWidget {
  const InventoryTab({super.key});

  @override
  InventoryTabState createState() => InventoryTabState();
}

class InventoryTabState extends State<InventoryTab> {
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: _controller,
                  decoration:
                      const InputDecoration(labelText: 'Finventario goes here'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      // Process the input
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                    }
                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
