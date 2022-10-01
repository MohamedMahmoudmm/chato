import 'dart:io';

import 'package:flutter/material.dart';

class ChatoUserModel
{

   late String name1;
   late String name2;
   late String phone;
   late String email;
   late String country;
   late String uId;
   late String accountImage;
   //late bool isEmailVerified;

  ChatoUserModel({
     required this.email,
     required this.name1,
     required this.name2,
    required this.country,
    required this.phone,
    required this.uId,
    required this.accountImage,

    // required this.isEmailVerified,

  });
  ChatoUserModel.fromJson(Map< String,dynamic> json)
  {
    email=json['email'];
    name1=json['name1'];
    phone=json['phone'];
    uId=json['uId'];
    name2=json['name2'];
    country=json['country'];
    accountImage=json['accountImage'];

    //isEmailVerified=json['isEmailVerified'];


  }

  Map<String,dynamic> toMap(){
    return
      {
        'name1':name1,
        'name2':name2,
        'email':email,
        'phone':phone,
        'country':country,
        'uId':uId,
        'accountImage':accountImage,

        // 'isEmailVerified':isEmailVerified
      };
  }
}