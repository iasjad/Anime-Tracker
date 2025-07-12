import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late TextEditingController _controller;
  late Box settingsBox;
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    settingsBox = Hive.box('settings');
    _controller = TextEditingController(
      text: settingsBox.get('clientId', defaultValue: ''),
    );
  }

  void _saveClientId() {
    final trimmed = _controller.text.trim();
    if (trimmed.isNotEmpty) {
      settingsBox.put('clientId', trimmed);
       _controller.clear();
      setState(() {}); 
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Client ID saved.")),
      );
    }
  }

  void _deleteClientId() {
    settingsBox.delete('clientId');
    _controller.clear();
    setState(() {}); 
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Client ID deleted.")),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentClientId = settingsBox.get('clientId', defaultValue: '');

    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: "MyAnimeList Client ID",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveClientId,
              child: Text("Save"),
            ),
            SizedBox(height: 30),
            if (currentClientId.isNotEmpty) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      _obscureText ? '•••••••••••••••' : currentClientId,
                      style: TextStyle(fontSize: 16),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  IconButton(
                    icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: _deleteClientId,
                    tooltip: 'Delete Client ID',
                  ),
                ],
              ),
            ]
          ],
        ),
      ),
    );
  }
}