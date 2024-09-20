import 'package:cloud_firestore/cloud_firestore.dart';

class ChatMessageResponse {
  final int? status;
  final List<ChatMessage>? data;

  ChatMessageResponse({ this.status,  this.data});

  // Factory method to create ChatMessageResponse from JSON
  factory ChatMessageResponse.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    List<ChatMessage> chatMessages = list.map((i) => ChatMessage.fromJson(i)).toList();

    return ChatMessageResponse(
      status: json['status'],
      data: chatMessages,
    );
  }
}

class ChatMessage {
  final String? message;
  final String? receiverId;
  final String? receiverImage;
  final String? receiverName;
  final String? senderId;
  final String? senderImage;
  final String? senderName;
  final Timestamp ? timestamp;

  ChatMessage({
   this.message,
   this.receiverId,
   this.receiverImage,
   this.receiverName,
   this.senderId,
   this.senderImage,
   this.senderName,
   this.timestamp,
  });

  // Factory method to create ChatMessage from JSON
  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    return ChatMessage(
      message: json['message'] ?? '',
      receiverId: json['receiverId'] ?? '',
      receiverImage: json['receiverImage'] ?? '',
      receiverName: json['receiverName'] ?? '',
      senderId: json['senderId'] ?? '',
      senderImage: json['senderImage'] ?? '',
      senderName: json['senderName'] ?? '',
      timestamp: json['timestamp'] ?? Timestamp.now(),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'receiverId': receiverId,
      'receiverImage': receiverImage,
      'receiverName': receiverName,
      'senderId': senderId,
      'senderImage': senderImage,
      'senderName': senderName,
      'timestamp': timestamp,
    };
  }
}
