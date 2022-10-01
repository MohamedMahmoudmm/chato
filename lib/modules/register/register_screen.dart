import 'package:chat_iti/modules/login/login_screen.dart';
import 'package:chat_iti/modules/register/cubit/cubit.dart';
import 'package:chat_iti/modules/register/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class Register extends StatelessWidget {
  Register();
  final formkey = GlobalKey<FormState>();
  var name1=TextEditingController();
  var name2=TextEditingController();
  var country=TextEditingController();
  var phone=TextEditingController();
  var email=TextEditingController();
  var password=TextEditingController();
  var password2=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>ChatoRegisterCubit(),
      child: BlocConsumer<ChatoRegisterCubit,ChatoRegisterStates>(
        listener: (BuildContext context,ChatoRegisterStates state){},
        builder: (BuildContext context,ChatoRegisterStates state){

          ChatoRegisterCubit cubit =ChatoRegisterCubit.get(context);
          return SafeArea(
            child: Scaffold(
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 15.0,right:40,left: 40 ),
                  child: Form(
                    key: formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 20,),
                        Text('SIGN UP',style:TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey
                        ),),
                        SizedBox(height: 50,),
                       SingleChildScrollView(
                         scrollDirection: Axis.horizontal,
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Container(
                               width: 130,

                               child: TextFormField(

                                 validator: (value){
                                   if(value!.isEmpty)
                                   {
                                     return 'enter name';
                                   }
                                   return null;
                                 },
                                 controller: name1,
                                 style: TextStyle(color:Colors.white ),
                                 cursorColor: Color(0xff006d77) ,
                                 cursorHeight: 30,
                                 decoration: InputDecoration(
                                   //ext: 'First name',

                                   fillColor:  Color(0xff151718),
                                   focusedBorder:OutlineInputBorder(
                                     borderSide: BorderSide(
                                       color: Color(0xff006d77),
                                     ),
                                     borderRadius: BorderRadius.circular(10),
                                   ),
                                   enabledBorder: OutlineInputBorder(
                                     borderRadius: BorderRadius.circular(10.0),
                                     borderSide: BorderSide(
                                       color:Color(0xff006d77),
                                       width: 2.0,
                                     ),
                                   ),
                                   filled: false,

                                   labelStyle: TextStyle(),
                                   hintText: 'first name',


                                   hintStyle: TextStyle(color: Color(0xff727373)),
                                   focusColor: Colors.white,


                                 ),
                               ),
                             ),
                             SizedBox(width: 10,),
                             Container(
                               width: 130,
                               child: TextFormField(

                                 validator: (value){
                                   if(value!.isEmpty)
                                   {
                                     return 'please enter your lastname';
                                   }
                                   return null;
                                 },
                                 controller: name2,
                                 style: TextStyle(color:Colors.white ),
                                 cursorColor: Color(0xff006d77) ,
                                 cursorHeight: 30,
                                 decoration: InputDecoration(
                                   //ext: 'Last name',
                                   fillColor:  Color(0xff151718),
                                   focusedBorder:OutlineInputBorder(
                                     borderSide: BorderSide(
                                       color: Color(0xff006d77),
                                     ),
                                     borderRadius: BorderRadius.circular(10),
                                   ),
                                   enabledBorder: OutlineInputBorder(
                                     borderRadius: BorderRadius.circular(10.0),
                                     borderSide: BorderSide(
                                       color:Color(0xff006d77),
                                       width: 2.0,
                                     ),
                                   ),
                                   filled: false,

                                   labelStyle: TextStyle(),
                                   hintText: 'second name',
                                   hintStyle: TextStyle(color: Color(0xff727373)),
                                   focusColor: Colors.white,


                                 ),
                               ),
                             ),
                           ],
                         ),
                       ),
                        SizedBox(height: 10,),

                        SizedBox(height: 10,),
                        TextFormField(

                          validator: (value){
                            if(value!.isEmpty)
                            {
                              return 'please enter your email';
                            }
                            return null;
                          },
                          controller: email,
                          style: TextStyle(color:Colors.white ),
                          cursorColor: Color(0xff006d77) ,
                          cursorHeight: 30,
                          decoration: InputDecoration(
                            //ext: 'Email',
                            fillColor:  Color(0xff151718),
                            focusedBorder:OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xff006d77),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                color:Color(0xff006d77),
                                width: 2.0,
                              ),
                            ),
                            filled: false,

                            labelStyle: TextStyle(),
                            hintText: 'email',
                            hintStyle: TextStyle(color: Color(0xff727373)),
                            focusColor: Colors.white,


                          ),
                        ),
                        SizedBox(height: 10,),
                        TextFormField(

                          validator: (value){
                            if(value!.isEmpty)
                            {
                              return 'please enter your password';
                            }
                            return null;
                          },
                          controller: password,
                          obscureText: true,
                          cursorColor: Color(0xff006d77) ,
                          cursorHeight: 30,
                          decoration: InputDecoration(
                            //ext: 'Password',
                            fillColor:  Color(0xff151718),
                            focusedBorder:OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xff006d77),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                color:Color(0xff006d77),
                                width: 2.0,
                              ),
                            ),
                            filled: false,

                            labelStyle: TextStyle(),
                            hintText: '**********',
                            hintStyle: TextStyle(color: Color(0xff727373)),
                            focusColor: Colors.white,


                          ),
                        ),
                        SizedBox(height: 10,),
                        TextFormField(

                          validator: (value){
                            if(value!.isEmpty)
                            {
                              return 'please enter your password';
                            }
                            return null;
                          },
                          controller: password2,
                          obscureText: true,

                          cursorColor: Color(0xff006d77) ,
                          cursorHeight: 30,
                          decoration: InputDecoration(
                            //ext: 'Confirm password',
                            fillColor:  Color(0xff151718),
                            focusedBorder:OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xff006d77),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                color:Color(0xff006d77),
                                width: 2.0,
                              ),
                            ),
                            filled: false,

                            labelStyle: TextStyle(),
                            hintText: '**********',
                            hintStyle: TextStyle(color: Color(0xff727373)),
                            focusColor: Colors.white,


                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          width: double.infinity,
                          height: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Color(0xff006d77),
                          ),

                          child:TextButton(onPressed: (){
                            if(formkey.currentState!.validate()){
                              cubit.userRegister(
                                  name1: name1.text,
                                  name2: name2.text,
                                  phone: phone.text,
                                  email: email.text,
                                  country: country.text,
                                 // accountImage: "",
                                  password: password.text);


                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Login()),
                              );
                            }
                          },
                              child: Text(
                                'SIGN UP',
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Color(0xffffffff),
                                    fontWeight: FontWeight.bold
                                ),
                              )
                          ),
                        ),
                        TextButton(onPressed: (){


                        },
                            child: Text(
                              ' Or Sign Up with ',
                              style: TextStyle(
                                  fontSize: 19,
                                  color: Color(0xff006d77),
                                  fontWeight: FontWeight.normal
                              ),
                            )
                        ),
                        SizedBox(height: 30,),
                        Align(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: SvgPicture.asset('assets/image/google.svg',
                                  height: 80,width: 80,),
                                color: Color(0xff006d77),
                                onPressed: () {  },
                              ),
                              SizedBox(width: 20,),
                              IconButton( onPressed: () {  },
                                icon: SvgPicture.asset('assets/image/apple.svg',height: 80,width: 80,),
                                color: Color(0xff006d77),
                              ),
                              SizedBox(width: 20,),
                              IconButton( onPressed: () {  },
                                icon: SvgPicture.asset('assets/image/facebook.svg',height: 80,width: 80,),
                                color: Color(0xff006d77),
                              ),
                            ],
                          ),
                        ),



                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}