import 'package:chat_iti/layout/cubit/cubit.dart';
import 'package:chat_iti/layout/cubit/states.dart';
import 'package:chat_iti/modules/massage/massage_screen.dart';
import 'package:chat_iti/modules/storys/story_screen.dart';
import 'package:chat_iti/shared/constant/Chato.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatScreen extends StatelessWidget {
   ChatScreen({Key? key}) : super(key: key);

   // List mydata =[
   //
   //   {
   //     'image': (  'https://images.pexels.com/photos/12050692/pexels-photo-12050692.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
   //     ),
   //     'title':'mohamed mahmoud ',
   //     'mesg': 'communicate now with chato',
   //   },
   //   {
   //     'image': (    'https://images.pexels.com/photos/459957/pexels-photo-459957.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
   //     'title':'Ahmed Mohamed ',
   //     'mesg': 'hi Ahmed'
   //   },
   //   {
   //     'image': (  'https://images.pexels.com/photos/12050692/pexels-photo-12050692.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
   //     'title':'Ahmed Sayed ',
   //     'mesg': 'thanks'
   //   },
   //   {
   //     'image': (    'https://images.pexels.com/photos/459957/pexels-photo-459957.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
   //     'title':'Ahmed mabrok ',
   //     'mesg': 'communicate now with chato',
   //   },
   //   {
   //     'image': (  'https://images.pexels.com/photos/12050692/pexels-photo-12050692.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
   //     'title':'Ahmed Mohamed ',
   //     'mesg': 'hello world'
   //   },
   //   {
   //     'image': (  'https://images.pexels.com/photos/12050692/pexels-photo-12050692.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
   //     'title':'Ahmed Sayed ',
   //     'mesg': 'communicate now with chato',
   //   },
   //   {
   //     'image': (  'https://images.pexels.com/photos/12050692/pexels-photo-12050692.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
   //     'title':'Ahmed Ali ',
   //     'mesg': 'hi',
   //   },
   //
   // ];
  @override

  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>ChatoCubit()..getAllUser(),
      child: BlocConsumer<ChatoCubit,ChatoStates>(
        listener: (context,state){},
          builder:  (context,state){
          var cubit=ChatoCubit.get(context).allUser;
          return ConditionalBuilder(
              condition: cubit.length>0,
              builder: (context)=>SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Divider(
                      color: Color(0xff212121),
                      thickness: 3,
                      indent: 50,
                      endIndent: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4,bottom: 4,right: 15,left: 15),
                      child: SizedBox(height: 100,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            SvgPicture.asset('assets/image/story.svg',height: 70,width: 70,color:Color(0xff03a5b4) ,),
                            SizedBox(width: 10,),
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount: cubit.length,
                             physics: const NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => InkWell(
                                onTap: ()
                                {
                                  Navigator.of(context).push( MaterialPageRoute(builder: (context)=>PersonStory()));

                                },
                                child: Container(
                                  height: 70,
                                  width: 70,
                                  margin: EdgeInsets.all(10),
                                  child: CircleAvatar(
                                    radius: 35,
                                    backgroundColor: Color(0xff03a5b4),
                                    child: CircleAvatar(
                                      radius: 33,
                                      backgroundColor: Color(0xff151718),
                                      child: CircleAvatar(
                                        backgroundImage: NetworkImage(cubit[index].accountImage),
                                        radius: 30,
                                        //backgroundColor: Colors.indigo,
                                      ),
                                    ),
                                  ),
                                  color: Color(0xff151718),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      color: Color(0xff212121),
                      thickness: 3,
                      indent: 50,
                      endIndent: 50,
                    ),
                    SizedBox(height: 5,),
                    ListView.builder(
                      itemCount: cubit.length,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index)
                      {print("from page:$lastMessages");
                        //print(index);
                        print(cubit[index].uId);
                        //ChatoCubit.get(context).getMessage(receiverId: cubit[index].uId);
                        //String lastMessage=ChatoCubit.get(context).messages[ChatoCubit.get(context).messages.length-1].text;
                        return Container(
                                      child: Padding(
                                        padding: const EdgeInsets.all(0.0),
                                        child: ListTile(
                                          onTap: () {
                                             Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        MassagesScreen(
                                                            cubit[index]))).then((value) {ChatoCubit.get(context).refresh();});
                                          },
                                          title: Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  '${cubit[index].name1} ${cubit[index].name2}',
                                                  style: TextStyle(
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      fontSize: 18,
                                                      color: Color(0xffd6d6d6),
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ],
                                          ),
                                          subtitle: Row(
                                            children: [
                                              Icon(
                                                Icons.check,
                                                color: Color(0xff006d77),
                                                size: 13,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Expanded(
                                                child: lastMessages[cubit[index].uId]?['text'] !=null?Text(

                                                '${(lastMessages[cubit[index].uId]['text'])}'
                                                ,
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    color: Color(0xff727373),
                                                    fontWeight:
                                                    FontWeight.bold),
                                              ):Text('no message'),
                                              ),
                                            ],
                                          ),
                                          leading: CircleAvatar(
                                            backgroundImage: NetworkImage(
                                                cubit[index].accountImage),
                                            radius: 35,
                                            backgroundColor: Colors.indigo,
                                          ),
                                          trailing: Text(
                                            '12:25'

                                                  //'${(lastMessages[cubit[index].uId]['date'])??"no date"}'
                                            ,
                                            style: TextStyle(
                                              overflow: TextOverflow.ellipsis,
                                                fontSize: 13,
                                                color: Color(0xff727373)),
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                  ],
                ),
              ),
              fallback: (context)=>Center(child: CircularProgressIndicator(
                color: Color(0xff006d77),
              ),)
          );
          }
         ),
    );
  }
}
