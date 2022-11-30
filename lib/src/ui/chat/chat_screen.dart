import 'package:flutter/material.dart';
import 'package:friendly_chat_app/src/ui/widget/chat_message_widget.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<ChatMessageWidget> _messagesWidget = <ChatMessageWidget>[];
  final TextEditingController _textController   = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('FriendlyChat')),
        ),
        body: _buildTextComposer());
  }

  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(
        color: Theme.of(context).colorScheme.secondary,
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child : Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller : _textController,
                onSubmitted: _handleSubmited,
                decoration : 
                    const InputDecoration.collapsed(hintText: 'Send a message'),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child : IconButton(
                icon: const Icon(Icons.send),
                onPressed: () => _handleSubmited(_textController.text),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _handleSubmited(String text) {
    _textController.clear();
    ChatMessageWidget message = ChatMessageWidget(
      text: text,
    );
    setState(() {
      _messagesWidget.insert(0, message);
    });
  }
}