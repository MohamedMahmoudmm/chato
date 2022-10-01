import 'package:chat_iti/layout/home.dart';
import 'package:chat_iti/modules/login/cubit/states.dart';
import 'package:chat_iti/network/local/cache_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ChatoLoginCubit extends Cubit<ChatoLoginStates>
{
   ChatoLoginCubit():super(ChatoLoginInitialState());
   static ChatoLoginCubit get(context)=>BlocProvider.of(context);


   void userLogin({
     required String email,
     required String password,
     required var context

})
   {
     FirebaseAuth.instance.signInWithEmailAndPassword(
         email: email.trim(),
         password: password)
         .then((value) {
       CacheHelper.saveData(key: 'uId',value: value.user!.uid);
         Navigator.push(
           context,
           MaterialPageRoute(builder: (context) => HomeScreen()),
         );
         print('uid::${value.user!.uid}');

           emit(ChatoLoginISuccessState());
     }).catchError((error){
       print('44444444:$error');
       emit(ChatoLoginIErrorState());
     });
   }
}