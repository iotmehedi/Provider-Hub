import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModelResponse {
  final int? status;
  final List<MessageModel>? data;

  MessageModelResponse({ this.status,  this.data});

  // Factory method to create MessageModelResponse from JSON
  factory MessageModelResponse.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    List<MessageModel> chatMessages = list.map((i) => MessageModel.fromJson(i)).toList();

    return MessageModelResponse(
      status: json['status'],
      data: chatMessages,
    );
  }
}

class MessageModel {
  final String? message;
  final String? receiverId;
  final String? receiverImage;
  final String? receiverName;
  final String? senderId;
  final String? senderImage;
  final String? senderName;
  final Timestamp? timestamp;

  MessageModel({
    this.message,
    this.receiverId,
    this.receiverImage,
    this.receiverName,
    this.senderId,
    this.senderImage,
    this.senderName,
    this.timestamp,
  });

  // Factory method to create MessageModel from JSON
  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
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
