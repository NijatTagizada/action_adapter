import 'package:flutter/material.dart';

import 'action_adapter.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text(
            'Action Adapter',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Column(
          children: [
            ContactItem(
              actions: [
                PhoneAction(phoneNumber: '123 456 789'),
                SmsAction(phoneNumber: '123 456 789'),
              ],
              text: 'John Doe (123 456 789)',
            ),
            ContactItem(
              actions: [ShareAction(data: 'https://pub.dev/')],
              text: 'Url: https://pub.dev/',
            ),
            ContactItem(
              actions: [WebAction(url: 'https://pub.dev/packages/kt_utils')],
              text: 'Url: https://pub.dev/packages/kt_utils',
            ),
          ],
        ),
      ),
    );
  }
}

class ContactItem extends StatelessWidget {
  const ContactItem({
    super.key,
    required this.actions,
    required this.text,
  });

  /// For title
  final String text;

  /// Important: List type should be [ActionAdapter]
  final List<ActionAdapter> actions;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  text,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(width: 8),

              /// Add actions here
              ...actions,
            ],
          ),
        ),
        Divider(
          color: Colors.blue.withAlpha(50),
          thickness: 1,
        ),
      ],
    );
  }
}
