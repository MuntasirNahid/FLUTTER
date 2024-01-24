import 'package:flutter/material.dart';
import 'package:instagram_clone/models/user.dart';
import 'package:instagram_clone/providers/user_provider.dart';
import 'package:provider/provider.dart';

class MessageCard extends StatefulWidget {
  final snap;

  const MessageCard({
    Key? key,
    required this.snap,
  }) : super(key: key);

  @override
  State<MessageCard> createState() => _MessageCardState();
}

class _MessageCardState extends State<MessageCard> {
  @override
  Widget build(BuildContext context) {
    UserModel user = Provider.of<UserProvider>(context).getUser;

    var alignment = widget.snap['senderId'] == user.uid
        ? Alignment.centerRight
        : Alignment.centerLeft;

    return Container(
      alignment: alignment,
      margin: widget.snap['senderId'] == user.uid
          ? const EdgeInsets.fromLTRB(50, 10, 15, 10)
          : const EdgeInsets.fromLTRB(15, 10, 50, 10),
      padding: const EdgeInsets.fromLTRB(10, 10, 20, 10),
      decoration: BoxDecoration(
        color: widget.snap['senderId'] == user.uid
            ? Colors.lightBlueAccent
            : Colors.grey,
        borderRadius: widget.snap['senderId'] == user.uid
            ? BorderRadius.circular(10)
            : const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
      ),
      child: Text(widget.snap['message']),
    );
  }
}
