import 'package:flutter/material.dart';
import 'package:friendly_chat_app/src/config/values/strings.dart';

class ChatMessageWidget extends StatelessWidget {
  final String text;
  final AnimationController animationController;

  const ChatMessageWidget({
    super.key,
    required this.text,
    required this.animationController
  });

  final String _name = Strings.nameVal;

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: CurvedAnimation(
        parent: animationController,
        curve : Curves.easeOut,
      ),
      axisAlignment: 0.0,
      child        : Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        child : Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children          : <Widget>[
            Container(
              margin: const EdgeInsets.only(right: 16.0),
              child : CircleAvatar(
                child: Text(_name[0]),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children          : <Widget>[
                  Text(
                    _name,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 5.0),
                    child : Text(text),
                  ),
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}