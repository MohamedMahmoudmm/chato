
import 'package:chat_iti/layout/cubit/cubit.dart';
import 'package:chat_iti/layout/cubit/states.dart';
import 'package:chat_iti/modules/storys/story_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoryScreen extends StatelessWidget {
  const StoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context)=>ChatoCubit(),
        child: BlocConsumer<ChatoCubit,ChatoStates>(
        listener: (BuildContext context,ChatoStates state){},
    builder: (BuildContext context,ChatoStates state) {
      var cubit = ChatoCubit.get(context);
      return Center(
        child: GridView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: cubit.picture.length,

            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:3,
              childAspectRatio: 105/160,
              crossAxisSpacing: 0,
              mainAxisSpacing:0,
              //crossAxisSpacing: 10
            ),
            itemBuilder:(context,index)
            {
              return InkWell(
                onTap: ()
                {
                  Navigator.of(context).push( MaterialPageRoute(builder: (context)=>PersonStory()));
                },
                child: Stack(
                 // clipBehavior: Clip.antiAlias,
                  fit: StackFit.loose,
                  children: [

                    Align(
                    // alignment: Alignment.center,
                      child:  Container(

                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                        image: DecorationImage(image: NetworkImage(cubit.picture[index]),
                               fit: BoxFit.cover)),

                        width: 105,
                         height: 160,
                            // child:Image(image: NetworkImage(cubit.picture[index]),
                            //     fit: BoxFit.cover)  ,
                      ),
                    ),
                    Positioned(
                        left: 10,
                        bottom: 15,
                        child: Text('mohamed mahmoud',style: TextStyle(color: Colors.white,fontSize: 10),)),
                    Positioned(

                      left: 13,
                      bottom: 30,
                      child:  CircleAvatar(
                        radius: 18,
                        backgroundColor:Color(0xff03a5b4) ,
                        child: CircleAvatar(radius: 16,backgroundColor: Color(0xff151718),
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                                cubit.picture[index]),
                            radius: 14,

                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            }
        ),
      );



    }
    )
    ) ;
  }
}

