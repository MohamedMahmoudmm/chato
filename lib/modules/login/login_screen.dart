import 'package:chat_iti/layout/home.dart';
import 'package:chat_iti/modules/login/cubit/cubit.dart';
import 'package:chat_iti/modules/login/cubit/states.dart';
import 'package:chat_iti/modules/register/register_screen.dart';
import 'package:chat_iti/network/local/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class Login extends StatelessWidget {

  final formkey = GlobalKey<FormState>();
  var email=TextEditingController();
  var password=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context)=>ChatoLoginCubit(),
    child: BlocConsumer<ChatoLoginCubit,ChatoLoginStates>(
        listener: (context,state){},
        builder: (context,state){
          return SafeArea(
            child: Scaffold(
              body: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0,vertical: 20),
                    child: Form(
                      key: formkey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Login ',
                            style:TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueGrey
                            ),),
                          SizedBox(height: 40,),
                          Column(
                            children :[
                              Text(
                                'Email Address                                                                                         ',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xffd6d6d6),

                                ),
                              ),
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
                                  hintText: '@gmail.com',
                                  hintStyle: TextStyle(color: Color(0xff727373)),
                                  focusColor: Colors.white,


                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20,),
                          Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children :
                            [
                              Text(
                                'Password',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xffd6d6d6),

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
                                style: TextStyle(color:Colors.white ),
                                cursorColor: Color(0xff006d77) ,
                                cursorHeight: 30,
                                obscureText: true,

                                decoration: InputDecoration(

                                  fillColor:  Color(0xff151718),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xff006d77),
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color:Color(0xff006d77),

                                      width: 1.0,
                                    ),
                                  ),
                                  filled: false,
                                  labelStyle: TextStyle(),
                                  hintText: '************',
                                  hintStyle: TextStyle(color: Color(0xff727373)),
                                  focusColor: Colors.white,

                                  suffixIcon: Icon(Icons.visibility,
                                    color: Color(0xff006d77),),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20,),
                          Row(
                            children: [
                              Icon(Icons.check_box,
                                color: Color(0xff006d77),
                              ),
                              SizedBox(width: 15,),
                              Text(
                                'Keep me sign in ',
                                style: TextStyle(
                                    fontSize: 19,
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 30,),
                          Container(
                            width: double.infinity,
                            height: 45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              color: Color(0xff006d77),
                            ),

                            child:TextButton(onPressed: (){
                              if(formkey.currentState!.validate()){
                                ChatoLoginCubit.get(context).userLogin(
                                    email: email.text,
                                    context: context,
                                    password: password.text);

                              }
                            },
                                child: Text(
                                  'LOGIN',
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: Color(0xffffffff),
                                      fontWeight: FontWeight.bold
                                  ),
                                )
                            ),
                          ),
                          TextButton(onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Register()),
                            );
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
                          SizedBox(height: 25,),
                          Row(
                            children: [
                              TextButton(onPressed: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Register()),
                                );
                              },
                                  child: Text(
                                    'Do not have Account ?',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white38,
                                        fontWeight: FontWeight.normal
                                    ),
                                  )
                              ),
                              TextButton(onPressed: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Register()),
                                );
                              },
                                  child: Text(
                                    'Sign up here  ',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Color(0xff03a5b4),
                                        fontWeight: FontWeight.normal
                                    ),
                                  )
                              ),
                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
    },)
    );
  }
}