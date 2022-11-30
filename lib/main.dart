import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:friendly_chat_app/src/config/values/strings.dart';
import 'package:friendly_chat_app/src/config/values/themes.dart';
import 'package:friendly_chat_app/src/ui/chat/chat_screen.dart';

void main() {
  runApp(const FriendlyChatApp());
}

class FriendlyChatApp extends StatelessWidget {
  const FriendlyChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: Strings.titleApp,
        theme: defaultTargetPlatform == TargetPlatform.iOS? Themes.iOS: Themes.android,
        home : const ChatScreen());
  }
}