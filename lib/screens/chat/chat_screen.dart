import 'package:BuddeeUp/helpers/fire_store.dart';
import 'package:BuddeeUp/helpers/logger.dart';
import 'package:BuddeeUp/models/msg.dart';
import 'package:BuddeeUp/models/new_user.dart';
import 'package:chat_bubbles/bubbles/bubble_normal.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChatScreen extends StatefulWidget {
  static const String routeName = 'chat-screen';
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    NewUser user = ModalRoute.of(context)!.settings.arguments as NewUser;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        
      ),
      body: Column(
        children: [
          StreamBuilder(
            stream: firebaseFirestore
                .collection('chats')
                .doc(firebaseAuth.currentUser!.uid)
                .collection('message-sent')
                .doc(user.id)
                .collection('messages')
                .orderBy('timestamp')
                .snapshots(),
            builder: (context, snapshot) {
              try {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: Expanded(child: Text('Loading messages')),
                  );
                }
                if (snapshot.data!.docs.isEmpty) {
                  return const Center(
                    child: Expanded(
                      child: Text('No message'),
                    ),
                  );
                }
                if (snapshot.connectionState == ConnectionState.active) {
                  logger.i(snapshot.data!.docs);

                  return Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      // reverse: true,
                      itemBuilder: (context, index) {
                        Message message =
                            Message.fromJson(snapshot.data!.docs[index].data());
                        return BubbleNormal(
                          bubbleRadius: 20,
                          tail: true,
                          isSender: (message.isSender ==
                              firebaseAuth.currentUser!.uid),
                          color: (message.isSender ==
                                  firebaseAuth.currentUser!.uid)
                              ? Colors.pink
                              : Colors.green,
                          text: message.message,
                          textStyle: TextStyle(
                            color: (message.isSender ==
                                    firebaseAuth.currentUser!.uid)
                                ? Colors.white
                                : Colors.black,
                          ),
                        );
                      },
                      itemCount: snapshot.data!.docs.length,
                    ),
                  );
                }
                return const CircularProgressIndicator();
              } catch (e) {
                logger.e(e);
                return Container();
              }
            },
          ),
          SendMessage(userId: user.id),
        ],
      ),
    );
  }
}

class SendMessage extends StatefulWidget {
  final String userId;
  const SendMessage({
    super.key,
    required this.userId,
  });

  @override
  State<SendMessage> createState() => _SendMessageState();
}

class _SendMessageState extends State<SendMessage> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: controller,
        onSubmitted: (_) {
          setState(() {
            logger.i(controller.text += '\n');
            controller.text += '\n';
          });
        },
        enabled: true,
        keyboardType: TextInputType.multiline,
        textInputAction: TextInputAction.newline,
        decoration: InputDecoration(
          enabled: true,
          isDense: true,
          hintText: 'Type your message...',
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
          suffixIcon: GestureDetector(
            onTap: controller.text.trim().isNotEmpty
                ? () {}
                : () async {
                    FocusScope.of(context).unfocus();
                    logger.i(controller.text);
                    try {
                      await FireStore()
                          .sendMessage(controller.text.trim(), widget.userId);
                      controller.clear();
                    } catch (e) {
                      // ScaffoldMessenger.of(context).removeCurrentSnackBar();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(e.toString()),
                        ),
                      );
                      logger.i(e);
                    }
                  },
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: FaIcon(
                FontAwesomeIcons.solidPaperPlane,
                size: 18,
                color: Colors.green,
              ),
            ),
          ),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }
}
