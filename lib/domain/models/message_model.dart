// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firechat/core/core.dart';

enum MessageType { image, text }

class Message {
  final String senderId;
  final String senderEmail;
  final String receiverId;
  final String message;
  final MessageType? messageType;
  final Timestamp timestamp;
  Message({
    required this.senderId,
    required this.senderEmail,
    required this.receiverId,
    required this.message,
    required this.timestamp,
    this.messageType,
  });

  MapString toMap() {
    return {
      'senderId': senderId,
      'senderEmail': senderEmail,
      'receiverId': receiverId,
      'message': message,
      'timestamp': timestamp.toDate(),
      'messageType': messageType,
    };
  }
}
