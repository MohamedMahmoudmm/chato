import 'package:chat_iti/layout/cubit/cubit.dart';
import 'package:chat_iti/layout/cubit/states.dart';
import 'package:chat_iti/model/chato/user_model.dart';
import 'package:chat_iti/model/profile.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chat_iti/shared/constant/Chato.dart';
import 'package:flutter_svg/flutter_svg.dart';


class MassagesScreen extends StatelessWidget {


late ChatoUserModel data;
  MassagesScreen(ChatoUserModel data)
  {

    this.data=data;
    // void _scrollDown() {
    //   _controller.jumpTo(_controller.position.maxScrollExtent);
    // }
  }
  final ScrollController controller = ScrollController();
  final formKey = GlobalKey<FormState>();
var messageController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context)=>ChatoCubit()..getMessage(receiverId: data.uId),
        child: BlocConsumer<ChatoCubit,ChatoStates>(
        listener: (BuildContext context,ChatoStates state){},
    builder: (BuildContext context,ChatoStates state) {
      var cubit = ChatoCubit.get(context);
      return Scaffold(
          appBar: AppBar(
            title: Row(
              children: [

                InkWell(
                  onTap: ()
                  {
                   // Navigator.of(context).push(MaterialPageRoute(builder:(context)=>ProfileScreen()));
                  },
                  child: CircleAvatar(
                    backgroundColor: Color(0xff03a5b4),
                    radius: 32,
                    child: CircleAvatar(
                      backgroundColor: Color(0xff151718),
                      radius: 30,
                      child: CircleAvatar(radius: 26,
                        backgroundImage: NetworkImage( data.accountImage,
                        ),),
                    ),
                  ),
                ),


                SizedBox(width: 10,),
                Expanded(
                  child: Text('${data.name1} ${data.name2}',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 18, letterSpacing: 1.55),),
                )
              ],
            ),
            actions: [
              IconButton(onPressed: () {},
                icon: Icon(Icons.search,
                ),
              ),
              IconButton(onPressed: () {},
                icon: SvgPicture.asset('assets/image/listIcon.svg',height: 25,width: 25,color: Color(0xff006d77) ,),
              )
            ],

          ),
          body: Padding(
            padding:  EdgeInsets.only(right: 20,left: 20,top: 20,bottom: 10),
            child: Column(
              children: [
                Expanded(
                  child: ConditionalBuilder(
                      condition: cubit.messages.length>0,
                      builder: (context)=>ListView.separated(
                          controller: controller,
                          itemBuilder: (context,index)
                          {

                            var message=cubit.messages[index];
                            if(data.uId==message.receiverId)
                            {
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(left: 30),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional.centerEnd,
                                          child: Container(
                                            //width: 270,
                                            padding: EdgeInsets.symmetric(
                                                vertical: 5, horizontal: 11),
                                            decoration: BoxDecoration(
                                                color: Color(0xff006d77),
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(15),
                                                    topRight:
                                                        Radius.circular(15),
                                                    bottomLeft:
                                                        Radius.circular(15))),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Text(
                                                message.text,
                                                style: TextStyle(
                                                  height: 1.2,
                                                  fontSize: 14,
                                                  color: Color(0xffd6d6d6),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                            }
                            else
                            {
                              return Padding(
                                padding: const EdgeInsets.only(right: 30),
                                child: Align(
                                  alignment: AlignmentDirectional.centerStart,
                                  child: Container(

                                    padding: EdgeInsets.symmetric(vertical: 5,horizontal: 11),
                                    decoration: BoxDecoration(
                                        color: Color(0xff2f3233),
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(15),
                                            topRight: Radius.circular(15),
                                            bottomRight: Radius.circular(15))
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text(message.text,
                                        style: TextStyle(
                                          fontSize: 13,
                                          height: 1.2,
                                          color: Color(0xffd6d6d6),
                                        ),),
                                    ),
                                  ),
                                ),
                              );
                            }



                          },
                          separatorBuilder: (context,index)=>SizedBox(height:10 ,),
                          itemCount: cubit.messages.length
                      ),
                      fallback: (context)=>Center(child: Text('send your first message now',style: TextStyle(fontSize: 20,color: Colors.grey),))),
                ),


                // Padding(
                //   padding: const EdgeInsets.only(right: 30),
                //   child: Align(
                //     alignment: AlignmentDirectional.centerStart,
                //     child: Container(
                //
                //       padding: EdgeInsets.symmetric(vertical: 5,horizontal: 11),
                //       decoration: BoxDecoration(
                //           color: Color(0xff2f3233),
                //           borderRadius: BorderRadius.only(
                //               topLeft: Radius.circular(15),
                //               topRight: Radius.circular(15),
                //               bottomRight: Radius.circular(15))
                //       ),
                //       child: Text('Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old ',
                //         style: TextStyle(
                //           fontSize: 13,
                //           color: Color(0xffd6d6d6),
                //         ),),
                //     ),
                //   ),
                // ),
                // SizedBox(height: 8,),
                // Padding(
                //   padding: const EdgeInsets.only(left: 30),
                //   child: Align(
                //     alignment: AlignmentDirectional.centerEnd,
                //     child: Container(
                //       //width: 270,
                //       padding: EdgeInsets.symmetric(vertical: 5,horizontal: 11),
                //       decoration: BoxDecoration(
                //           color: Color(0xff006d77),
                //           borderRadius: BorderRadius.only(
                //               topLeft: Radius.circular(15),
                //               topRight: Radius.circular(15),
                //               bottomLeft: Radius.circular(15))
                //       ),
                //       child: Text('There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour,',
                //         style: TextStyle(
                //           fontSize: 13,
                //           color: Color(0xffd6d6d6),
                //         ),),
                //     ),
                //   ),
                // ),
                // Spacer(),
                Row(
                  children: [
                    Form(
                      key: formKey,
                      child: Expanded(
                        child: Container(
                          height: 50,
                          child: TextFormField(

                              // validator: (value){
                              //   if(value!.isEmpty)
                              //   {
                              //     return null;
                              //   }
                              //   return null;
                              // },
                              controller: messageController,
                              decoration: InputDecoration(

                                filled: true,
                                fillColor: Color(0xffd6d6d6),
                                //labelText: "Enter Email",
                                hintText: 'typing something here .......',
                                hintStyle: TextStyle(color: Color(0xff727373)),
                                suffixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.add,color: Colors.grey,size: 30,)),

                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: BorderSide(
                                    color: Color(0xff006d77),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: BorderSide(
                                    color:Color(0xff006d77),
                                    width: 2.0,
                                  ),
                                ),
                              )
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 6,),
                    CircleAvatar(
                      backgroundColor: Color(0xff006d77),
                      radius:25 ,
                      child: MaterialButton(
                        onPressed: (){//formKey.currentState!.validate()
                          if(messageController.text.isNotEmpty)
                          {

                          cubit.sendMessage(
                                receiverId:  data.uId,
                                dateTime: DateTime.now().toString(),
                                text: messageController.text);

                          }
                          controller.jumpTo(controller.position.maxScrollExtent);
                          // if (controller.hasClients) {
                          //   final position = controller.position.maxScrollExtent;
                          //   controller.animateTo(
                          //     position,
                          //     duration: Duration(seconds: 0),
                          //     curve: Curves.easeOut,
                          //   );
                          // }
                          messageController.text='';
                        },
                        child:Icon(Icons.send_sharp,color: Colors.white,) ,),
                    )
                  ],
                )
              ],
            ),
          )
      );
    }
    )
    );
  }
}
