import 'package:flutter/material.dart';

abstract class ActionAdapter extends StatelessWidget {
  const ActionAdapter({super.key});

  Widget get icon;
  void Function(BuildContext context) get onTap;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: icon,
      onPressed: () {
        onTap(context);
      },
    );
  }
}

class PhoneAction extends ActionAdapter {
  const PhoneAction({
    super.key,
    required this.phoneNumber,
  });

  final String phoneNumber;

  @override
  Widget get icon => const Icon(Icons.phone);

  @override
  void Function(BuildContext context) get onTap => (context) {
        print(phoneNumber);
      };
}

class SmsAction extends ActionAdapter {
  const SmsAction({
    super.key,
    required this.phoneNumber,
  });

  final String phoneNumber;

  @override
  Widget get icon => const Icon(Icons.message, color: Colors.red);

  @override
  void Function(BuildContext context) get onTap => (context) {
        print(phoneNumber);
      };
}

class WebAction extends ActionAdapter {
  const WebAction({
    super.key,
    required this.url,
  });

  final String url;

  @override
  Widget get icon => const Icon(
        Icons.open_in_browser,
        color: Colors.blue,
      );

  @override
  void Function(BuildContext context) get onTap => (context) {
        print(url);
      };
}

class ShareAction extends ActionAdapter {
  const ShareAction({
    super.key,
    required this.data,
  });

  final String data;

  @override
  Widget get icon => const Icon(Icons.share, color: Colors.amber);

  @override
  void Function(BuildContext context) get onTap => (context) {
        print(data);
      };
}
