// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:gesture/constants/app_exports.dart';
import 'package:gesture/features/chat/controller/chat_service.dart';

class ConvoView extends StatefulWidget {
  final String email;
  final String receiverId;

  const ConvoView({
    Key? key,
    required this.email,
    required this.receiverId,
  }) : super(key: key);

  @override
  State<ConvoView> createState() => _ConvoViewState();
}

class _ConvoViewState extends State<ConvoView> {
  final _ctrl = TextEditingController();
  final _chatService = ChatService();
  final _firebaseAuth = FirebaseAuth.instance;

  //? Send message
  void send() async {
    if (_ctrl.text.isNotEmpty) {
      await _chatService.sendMessage(
        receiverId: widget.receiverId,
        message: _ctrl.text,
      );
      //? clear the controller
      _ctrl.clear();
    }
  }

//? The appbar rebuilds every time state changes cos it's in a build method
  AppBar appbar() {
    return AppConstants.appBar(
      child: Text(getEmailPrefix(widget.email)),
    );
  }

//? creating a final variable outside of the build method fixes that
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: appbar(),
      body: Padding(
        padding: AppConstants.padding,
        child: Column(
          children: [
            Expanded(
              child: _messages(),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: CustomTextf(
                      controller: _ctrl,
                      hintText: 'Send a message',
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: send,
                  child: const Icon(
                    Iconsax.send_1_copy,
                    size: 32,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _messages() {
    return StreamBuilder(
      stream: _chatService.getMessage(
          widget.receiverId, _firebaseAuth.currentUser!.uid),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return const Text('No connection');
          case ConnectionState.waiting:
            return const Center(
                child: CircularProgressIndicator()); //! custom loader here
          case ConnectionState.active:
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            return ListView(
              children:
                  snapshot.data!.docs.map((doc) => _message(doc)).toList(),
            );
          case ConnectionState.done:
            return const Text('Stream ended');
        }
      },
    );
  }

//? Individual message
  Widget _message(DocumentSnapshot doc) {
    MapString data = doc.data() as MapString;
    String senderId = data['senderId'];
    String message = data['message'];
    String email = data['senderEmail'];
    Timestamp timestamp = data['timestamp'];
    //? Align based on which user
    // var alignment = (senderId == _firebaseAuth.currentUser!.uid)
    //     ? Alignment.centerRight
    //     : Alignment.centerLeft;

    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: senderId == _firebaseAuth.currentUser!.uid
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        // mainAxisAlignment: alignment,
        children: [
          Container(
            // constraints: const BoxConstraints(maxWidth: 90),
            alignment: senderId == _firebaseAuth.currentUser!.uid
                ? Alignment.center
                : Alignment.centerLeft,
            padding: const EdgeInsets.all(16.0),
            // margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              borderRadius: AppConstants.borderRadius,
              color: senderId == _firebaseAuth.currentUser!.uid
                  ? Pallete.primaryColor
                  : Pallete.neutral,
            ),
            child: Text(
              message,
              style: AppStyle.bNeutral400.copyWith(color: Pallete.lightColor),
            ),
          ),
          AppConstants.h04,
          Text(timestamp.toDate().toString())
        ],
      ),
    );
  }
}
