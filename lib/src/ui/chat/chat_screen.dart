import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:friendly_chat_app/src/ui/widget/chat_message_widget.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  final List<ChatMessageWidget> _messages     = <ChatMessageWidget>[];
  final TextEditingController _textController = TextEditingController();
  bool  _isComposing                          = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title    : const Center(child: Text('Friendly Chat')),
        elevation: Theme.of(context).platform == TargetPlatform.iOS? 0.0: 4.0,
      ),
      body: Container(
        decoration: Theme.of(context).platform == TargetPlatform.iOS ? const BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.grey),
          ),
        ) : null,
        child: Column(
          children: <Widget>[
            Flexible(
              child: ListView.builder(
                padding    : const EdgeInsets.all(8.0),
                reverse    : true,
                itemBuilder: (_, int index) => _messages[index],
                itemCount  : _messages.length,
              ),
            ),
            const Divider(height: 1.0),
            Container(
              decoration: BoxDecoration(color: Theme.of(context).cardColor),
              child     : _buildTextComposer(),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    for (ChatMessageWidget message in _messages) {
      message.animationController.dispose();
    }
    super.dispose();
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
                controller: _textController,
                onChanged : (String text) {
                  setState(() {
                    _isComposing = text.isNotEmpty;
                  });
                },
                onSubmitted: _handleSubmited,
                decoration : 
                    const InputDecoration.collapsed(hintText: 'Send a message'),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child : Theme.of(context).platform == TargetPlatform.iOS ?
              CupertinoButton(
                onPressed: _isComposing? () => _handleSubmited(_textController.text): null,
                child    : const Text("Send"),
                )        : 
              IconButton(
                icon     : const Icon(Icons.send),
                onPressed: _isComposing? () => _handleSubmited(_textController.text): null,
              ),
            )
          ],
        ),
      ),
    );
  }

  void _handleSubmited(String text) {
    _textController.clear();
    setState(() {
      _isComposing = false;
    });
    ChatMessageWidget message = ChatMessageWidget(
      text               : text,
      animationController: AnimationController(
        duration: const Duration(milliseconds: 700),
        vsync   : this,
      ),
    );
    setState(() {
      _messages.insert(0, message);
    });
    message.animationController.forward();
  }
}