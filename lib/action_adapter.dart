import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class ActionAdapter extends StatelessWidget {
  const ActionAdapter({super.key});

  /// Getter for icon
  Widget get icon;

  /// Getter tap function
  /// Optionally we can pass BuildContext
  void Function(BuildContext context) get onTap;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: icon,
      onPressed: () => onTap(context),
    );
  }
}

class PhoneAction extends ActionAdapter {
  const PhoneAction({
    super.key,
    required this.phoneNumber,
  });

  /// Custom data. You can pass anything you want
  final String phoneNumber;

  /// Override [icon] getter and implement your icons
  @override
  Widget get icon => const Icon(
        CupertinoIcons.phone_arrow_up_right,
        color: Colors.green,
      );

  /// Override the [onTap] function to handle your action.
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
  Widget get icon => const Icon(
        CupertinoIcons.bubble_right,
        color: Colors.green,
      );

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
  Widget get icon => const Icon(CupertinoIcons.globe, color: Colors.green);

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
  Widget get icon => const Icon(CupertinoIcons.share, color: Colors.green);

  @override
  void Function(BuildContext context) get onTap => (context) {
        print(data);
      };
}
