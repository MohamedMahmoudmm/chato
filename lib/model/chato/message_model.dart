import 'package:flutter/material.dart';

class ChatoMessageModel
{
  // late late String receiverId;
  // late late String senderId;
  // late late String dataTime;
  // late late String text;
  late String senderId;
  late String receiverId;
  late String dateTime;
  late String text;


  ChatoMessageModel({
    required this.senderId,
    required this.receiverId,
    required this.dateTime,
    required this.text,

  });
  ChatoMessageModel.fromJson(Map< String,dynamic> json)
  {
    senderId=json['senderId'];
    receiverId=json['receiverId'];
    dateTime=json['dateTime'];
    text=json['text'];



  }

  Map<String,dynamic> toMap(){
    return
      {
        'receiverId':receiverId,
        'senderId':senderId,
        'dateTime':dateTime,
        'text':text,
      };
  }
}