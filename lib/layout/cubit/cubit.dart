import 'dart:io';

//import 'package:beauty_navigation/beauty_navigation.dart';
import 'package:chat_iti/layout/cubit/states.dart';
import 'package:chat_iti/model/chato/message_model.dart';
import 'package:chat_iti/model/chato/user_model.dart';
import 'package:chat_iti/modules/calls/calls_screen.dart';
import 'package:chat_iti/modules/chat/chat_screen.dart';
import 'package:chat_iti/modules/storys/story.dart';
import 'package:chat_iti/shared/constant/Chato.dart';
import 'package:circle_bottom_navigation_bar/widgets/tab_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class ChatoCubit extends Cubit<ChatoStates> {
  ChatoCubit() : super(ChatoInitialState());
  static ChatoCubit get(context) => BlocProvider.of(context);
  // int itemColor= 0xff03a5b4;

  int currentIndex = 1;
void refresh()
{
  emit(ChatoGetlastMessageSuccessState());
}
  List<String> picture = [
    'https://images.pexels.com/photos/12050692/pexels-photo-12050692.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/459957/pexels-photo-459957.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/775358/pexels-photo-775358.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/13441747/pexels-photo-13441747.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/12050692/pexels-photo-12050692.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/775358/pexels-photo-775358.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/13441747/pexels-photo-13441747.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/775358/pexels-photo-775358.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/12050692/pexels-photo-12050692.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/459957/pexels-photo-459957.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/775358/pexels-photo-775358.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/13441747/pexels-photo-13441747.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/12050692/pexels-photo-12050692.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/775358/pexels-photo-775358.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/13441747/pexels-photo-13441747.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/775358/pexels-photo-775358.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
  ];
  int itemColor = 0xff03a5b4;
  ChatoUserModel? model;

  List<DotNavigationBarItem> bottomItems = [
    DotNavigationBarItem(
      icon: const Icon(
        Icons.phone,
        size: 30,
      ),
      //selectedColor: Color(0xff03a5b4),
    ),
    DotNavigationBarItem(
      icon: const Icon(
        Icons.chat_outlined,
        size: 30,
      ),
      //selectedColor: Color(0xff03a5b4),
    ),
    DotNavigationBarItem(
      icon: SvgPicture.asset(
        'assets/image/storyIcon.svg',
        height: 30, width: 30,
        // color: currentIndex==2? Color(0xff006d77): Colors.grey[300],
      ),

      //selectedColor: Color(0xff03a5b4),
    ),
  ];
  List<TabData> bottom1Items = [
    TabData(
      icon:
        Icons.phone,
        iconSize: 30,

      //selectedColor: Color(0xff03a5b4),
    ),
    TabData(
      icon:
      Icons.chat_outlined,
      iconSize: 30,

      //selectedColor: Color(0xff03a5b4),
    ),
    TabData(
      icon:
      Icons.amp_stories_outlined,
      iconSize: 30,

      //selectedColor: Color(0xff03a5b4),
    ),
  ];
  // List<Items> bottom2Items = [
  //   Items(
  //     icon:
  //     Icon(
  //       Icons.phone,
  //       size: 30,
  //     )),
  //   Items(
  //       icon:
  //       Icon(
  //         Icons.chat_outlined,
  //         size: 30,
  //       )),
  //   Items(
  //       icon:
  //       Icon(
  //         Icons.account_circle,
  //         size: 30,
  //       )),
  // ];

  List<Widget> screens = [
    CallsScreen(),
    ChatScreen(),
    const StoryScreen(),
  ];

  int changeIndexNavBar(int index) {
    currentIndex = index;
    emit(ChatoIndexNavState());
    return currentIndex;
  }

  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(ChatoBottomNavState());
  }

  void getUserData() async {
    print('helllloooo');
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .get()
        .then((value) {
      model = ChatoUserModel.fromJson(value.data()!);
      print(model!.email);
      //print('url image${model!.accountImage}');
      print('hiii');

      emit(ChatoGetUserDataSuccessState());
    }).catchError((error) {
      print("error:::" + error.toString());
      emit(ChatoGetUserDataErrorState());
    });
  }

  List<ChatoUserModel> allUser = [];
  void getAllUser() {
    FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((value)
    {
      value.docs.forEach((element)
      {
        if (element.data()['uId'] != uId)
        {
          allUser.add(ChatoUserModel.fromJson(element.data()));
        }
      });

      emit(ChatoGetAllUserSuccessState());
    }).catchError((error) {
      print("error:::" + error.toString());
      emit(ChatoGetAllUserErrorState());
    });
  }



  void sendMessage({
    required String receiverId,
    required String dateTime,
    required String text,
  }) {
    ChatoMessageModel model = ChatoMessageModel(
        senderId: uId!,
        receiverId: receiverId,
        dateTime: dateTime,
        text: text);

    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .collection('chats')
        .doc(receiverId)
        .collection('messages')
        .add(model.toMap())
        .then((value) {
      emit(ChatoSendMessageSuccessState());
    }).catchError((error) {
      emit(ChatoSendMessageErrorState());
    });

    FirebaseFirestore.instance
        .collection('users')
        .doc(receiverId)
        .collection('chats')
        .doc(uId)
        .collection('messages')
        .add(model.toMap())
        .then((value) {
          //getLastMessage(receiverId: receiverId);
      emit(ChatoSendMessageSuccessState());
    }).catchError((error) {
      emit(ChatoSendMessageErrorState());
    });
  }


  List<ChatoMessageModel> messages = [];
 // String lastMessages='last message' ;
  void getMessage({required String receiverId}) {
    //print('111111111111111');
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .collection('chats')
        .doc(receiverId)
        .collection('messages')
        .orderBy('dateTime')
        .snapshots()
        .listen((event) {
      messages = [];
      event.docs.forEach((element) {
        messages.add(ChatoMessageModel.fromJson(element.data()));
      });

         getLastMessage(receiverId: receiverId);
      //print('222');
      //lastMessages=messages[messages.length-1].text;
      //print(lastMessages[]);
      emit(ChatoGetMessageSuccessState());
    });
  }
  void getLastMessage({required receiverId})
  {
    print('set last messagge');
    print(lastMessages);
    lastMessages['$receiverId']=
      {'text':messages[messages.length-1].text,
        'date':messages[messages.length-1].dateTime};


    print(lastMessages);
  }
  File? accountImage;
  var picker = ImagePicker();

  Future<void> getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      accountImage = File(pickedFile.path);
      uploadAccountImage();
      print('inside get $accountImage');
      emit(ChatoPickerImageSuccessState());
    } else {
      print('no selected image');
      emit(ChatoPickerImageErrorState());
    }
  }

  String accountImageUrl='';

  void uploadAccountImage() {
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(accountImage!.path).pathSegments.last}')
        .putFile(accountImage!)
        .then((value) {
          print(value);
      value.ref.getDownloadURL()
          .then((value)
      {

        emit(ChatoUploadImageSuccessState());
        accountImageUrl=value;
        image =value;

        updateUser();
        print('link$accountImageUrl');

      }).catchError((error)
      {
        print('777777777777:$error');
        emit(ChatoUploadImageErrorState());
      });
    }).catchError((error) {
      print('8888888888:$error');
      emit(ChatoUploadImageErrorState());
    });
  }


  void updateUser()
  {
    ChatoUserModel updateModel = ChatoUserModel(
              accountImage: accountImageUrl,
        // isEmailVerified:false ,
        uId: model!.uId,
        email: model!.email,
        name2: model!.name2,
        name1:model!.name1,
        phone: '',
        country: '');

    FirebaseFirestore.instance
        .collection('users')
        .doc(model!.uId)
        .update(updateModel.toMap())
        .then((value)
    {
      getUserData();
      print(model!.accountImage);
    }).catchError((error)
    {
      print('error:$error');
      emit(ChatoUpdateImageErrorState());
    });
  }
}
