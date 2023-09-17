import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firechat/core/core.dart';
import 'package:firechat/domain/models/message_model.dart';

class ChatService extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> sendMessage({
    required String receiverId,
    required String message,
  }) async {
    //! Get user info

    final currentUserId = _firebaseAuth.currentUser!.uid;
    final currentUserEmail = _firebaseAuth.currentUser!.email.toString();
    final Timestamp timestamp = Timestamp.now();

    //! Create a new message

    Message newMessage = Message(
      senderId: currentUserId,
      senderEmail: currentUserEmail,
      receiverId: receiverId,
      message: message,
      timestamp: timestamp,
    );

    //? chat room id
    ListOfString ids = [currentUserId, receiverId];
    //?sort the ids to ensure room id is same for pair of people
    ids.sort();
    String chatRoomId = ids.join('_');

    // add new message to db
    await _firestore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .add(
          newMessage.toMap(),
        );
  }

  //?! get messages from db
  Stream<QuerySnapshot> getMessage(String userId, String otherUserId) {
    //? chat room id
    ListOfString ids = [userId, otherUserId];
    //?sort the ids to ensure room id is same for pair of people
    ids.sort();
    String chatRoomId = ids.join('_');

    return _firestore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .orderBy('timestamp', descending: false)
        .snapshots();
  }
}
