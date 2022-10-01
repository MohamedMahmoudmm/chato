import 'package:chat_iti/model/chato/user_model.dart';
import 'package:chat_iti/modules/register/cubit/states.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class ChatoRegisterCubit extends Cubit<ChatoRegisterStates>
{
   ChatoRegisterCubit():super(ChatoRegisterInitialState());
   static ChatoRegisterCubit get(context)=>BlocProvider.of(context);


   void userRegister({
     required String name1,
     required String name2,
     required String phone,
     required String email,
     required String country,
    // required String accountImage,
     required String password

})
   {
     print('inside register');
     FirebaseAuth.instance.createUserWithEmailAndPassword(
         email: email.trim(),
         password: password)
         .then((value) {
           userCreate(
               name1: name1,
               name2: name2,
               phone: phone,
               email: email,
              // accountImage: accountImage,

              // isEmailVerified:false,
               country: country,
               uId: value.user!.uid);
           print('after create');
           emit(ChatoRegisterISuccessState());
     }).catchError((error){
       print('33333:$error');
       emit(ChatoRegisterIErrorState());
     });
   }

   void userCreate(
   {
     required String name1,
     required String name2,
     required String phone,
     required String email,
     required String country,
     required String uId,
    // required String accountImage,

    // required bool isEmailVerified
}
)

{
  ChatoUserModel model = ChatoUserModel(
      email: email,
      name1: name1,
      name2: name2,
      country: country,
      phone: phone,
      accountImage: 'https://images.pexels.com/photos/1666779/pexels-photo-1666779.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',

      // isEmailVerified:false ,
      uId: uId);
    FirebaseFirestore.instance
       .collection('users')
       .doc(uId)
       .set
      (
        model.toMap()
      ).then((value) {
      print('create success');
     emit(ChatoCreateISuccessState());
   }).catchError((error){
     emit(ChatoCreateIErrorState());
   });
}

//         sqflite          //

//   Database? database;
//   List<Map> users=[];
// void createDatabase()
// {
//      openDatabase(
//        'chato.db',
//        version: 1,
//       onCreate: (database,version)
//        {
//           print('database created');
//           database.execute('CREATE TABLE userData(id INTEGER PRIMARY KEY,firstName TEXT,lastName TEXT,email TEXT,password TEXT)')
//               .then((value)
//           {
//              print('table created');
//             // emit(ChatoCreateDatabaseSuccessState());
//
//           }).catchError((error)
//           {
//              print('the error is ${error.toString()}');
//              //emit(ChatoCreateDatabaseErrorState());
//           });
//        },
//       onOpen: (database)
//        {
//          getFromDatabase(database).then((value)
//          {
//            users=value;
//            print(users);
//            emit(ChatoGetDatabaseSuccessState());
//          }).catchError((error){
//            print('error');
//            emit(ChatoGetDatabaseErrorState());
//          });
//
//
//          print('database opened');
//        }
//    ).then((value)
//      {
//        database=value;
//        emit(ChatoCreateDatabaseSuccessState());
//
//      }).catchError((error){
//
//        emit(ChatoCreateDatabaseErrorState());
//      });
// }
//
//  insertToDatabase(
//   {
//
//   required String firstName,
//     required String lastName,
//     required String email,
//     required String password,
// }
//     )async
// {
//   await database!.transaction((txn)async
//   {
//     txn.rawInsert('INSERT INTO userData(firstName,lastName,email,password)VALUES("$firstName","$lastName","$email","$password")')
//         .then((value)
//     {
//       print('$value insert Success');
//       emit(ChatoInsertDatabaseSuccessState());
//
//       getFromDatabase(database)
//           .then((value)
//       {
//         users=value;
//         print(users);
//         emit(ChatoGetDatabaseSuccessState());
//       }).catchError((error){
//         print('error');
//         emit(ChatoGetDatabaseErrorState());
//       });
//
//
//
//     }).catchError((error)
//     {
//       print(error.toString());
//       emit(ChatoInsertDatabaseErrorState());
//     });
//
//   });
//
//
// }
// Future<List<Map>> getFromDatabase(database)async
// {
//   return await database.rawQuery('SELECT * FROM userData');
//
//
// }
//
// bool checkUser()
// {
//   bool check=false;
//
//
//   return check;
//
// }
}