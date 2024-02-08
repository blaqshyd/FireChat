// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:firechat/constants/app_exports.dart';
import 'package:firechat/features/chat/controller/chat_service.dart';

class ConvoView extends StatefulWidget {
  final String email;
  final String receiverId;
  final String initials;

  const ConvoView({
    Key? key,
    required this.email,
    required this.receiverId,
    required this.initials,
  }) : super(key: key);

  @override
  State<ConvoView> createState() => _ConvoViewState();
}

class _ConvoViewState extends State<ConvoView> {
  final _ctrl = TextEditingController();
  final _chatService = ChatService();
  final _firebaseAuth = FirebaseAuth.instance;
  final _focusNode = FocusScopeNode();

  //? Send message
  void send() async {
    if (_ctrl.text.isNotEmpty) {
      await _chatService.sendMessage(
        receiverId: widget.receiverId,
        message: _ctrl.text,
      );
      //? clear the controller
      _ctrl.clear();
      _focusNode.unfocus();
    }
    _focusNode.unfocus();
  }

//? The appbar rebuilds every time state changes cos it's in a build method
  AppBar appbar() {
    String? initials;
    return AppConstants.appBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            child: Text(initials ?? 'AB'),
          ),
          12.sbW,
          Text(
            widget.email.emailPrefix,
            style: AppStyle.bDark400,
          ),
        ],
      ),
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
                GestureDetector(
                  onTap: pickFile,
                  child: const Icon(
                    Iconsax.add_square_copy,
                    size: 32,
                  ),
                ),
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
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Pallete.primaryColor,
                    ),
                    child: Icon(
                      Iconsax.send_1_copy,
                      color: Pallete.lightColor,
                      size: 32,
                    ),
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
        widget.receiverId,
        _firebaseAuth.currentUser!.uid,
      ),
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
    // final height = MediaQuery.sizeOf(context).height * .02;
    MapString data = doc.data() as MapString;
    String senderId = data['senderId'];
    String message = data['message'];
    Timestamp timestamp = data['timestamp'];
    // String email = data['senderEmail'];

    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Column(
        mainAxisSize: MainAxisSize.min, //? takes as little space as allowed
        crossAxisAlignment: senderId == _firebaseAuth.currentUser!.uid
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,

        children: [
          Container(
            constraints: const BoxConstraints(maxWidth: 320),
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: senderId == _firebaseAuth.currentUser!.uid
                  ? const BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(15),
                    )
                  : const BorderRadius.only(
                      bottomRight: Radius.circular(15),
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(15),
                    ),
              color: senderId == _firebaseAuth.currentUser!.uid
                  ? Pallete.primaryColor
                  : Pallete.neutral,
            ),
            child: Text(
              message,
              style: AppStyle.bNeutral400.copyWith(color: Pallete.lightColor),
            ),
          ),
          4.sbH,

          Text(timestamp.toDate().formatToTime),
          //  Icon(isRead ? Icons.done_all_rounded : Icons.done_rounded)
        ],
      ),
    );
  }
}
