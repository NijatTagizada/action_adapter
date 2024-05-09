import 'package:flutter/material.dart';

import 'action_adapter.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
              actions: [
                WebAction(url: 'https://pub.dev/'),
                ShareAction(data: 'https://pub.dev/')
              ],
              text: 'Url: https://pub.dev/',
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

  final String text;
  final List<ActionAdapter> actions;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: Text(text)),
              SizedBox(width: 8),
              ...actions,
            ],
          ),
          Divider(),
        ],
      ),
    );
  }
}
