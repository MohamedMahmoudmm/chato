import 'package:chat_iti/model/chato/user_model.dart';
import 'package:chat_iti/shared/constant/Chato.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';


class ProfileScreen extends StatelessWidget {
  //const ProfileScreen({Key? key}) : super(key: key);
ChatoUserModel? model;
  ProfileScreen(ChatoUserModel model)
  {
    this.model=model;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        /* Icon(Icons.arrow_back_ios,
          color: Color(0xff006d77),
          ),*/
        actions: [
          IconButton(
              icon: Icon(Icons.edit_note,size:35 ,color: Color(0xff006d77)              ),
              onPressed: null //do something,
          ),
          IconButton(
              icon:Icon(Icons.account_circle,
                  size: 35,
                  color: Color(0xff006d77)),
              onPressed: null //do something,
          ),
        ],


        backgroundColor: Color(0xff151718),
      ),
      body: Container(
        color: Color(0xff151718),
        child: SingleChildScrollView(
          child: Column(
            children:[
              // Divider(
              //   color: Color(0xff212121),
              //   thickness: 3,
              //   indent: 50,
              //   endIndent: 50,
              // ),
              SizedBox(height: 20,),
              CircleAvatar(
               // backgroundImage: image==null?NetworkImage('https://images.pexels.com/photos/12050692/pexels-photo-12050692.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'):NetworkImage('$image'),

                backgroundImage: NetworkImage(model!.accountImage),
      maxRadius: 95,
                backgroundColor: Colors.indigo,
              ),
              SizedBox(height: 20,),
              Text('${model!.name1} ${model!.name2}',
                style: TextStyle(
                    fontSize: 25,
                    color: Color(0xffd6d6d6),
                    fontWeight: FontWeight.bold
                ),
              ),
              Text(' App Developer ',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                    fontWeight: FontWeight.normal
                ),
              ),
              Text(model!.email,
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                    fontWeight: FontWeight.normal
                ),
              ),
              SizedBox(height: 25,),
              Padding(
                padding: const EdgeInsets.only(left: 35, bottom: 10 , top: 10),
                child: ListTile(

                  onTap: (){},
                  title: Text('Profile details',
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0xffd6d6d6),
                        fontWeight: FontWeight.normal
                    ),
                  ),
                  subtitle: Text('password , phon , emile.......',
                    style: TextStyle(
                        fontSize: 15,
                        color: Color(0xff727373),
                        fontWeight: FontWeight.normal
                    ),
                  ),
                  leading:Icon(Icons.account_circle,size: 40,color: Color(0xff006d77),)
                ),
              ),
              Divider(
                color: Color(0xff212121),
                thickness: 3,
                indent: 50,
                endIndent: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 35, bottom: 10,top: 10),
                child: ListTile(

                  onTap: (){},
                  title: Text('Notification',
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0xffd6d6d6),
                        fontWeight: FontWeight.normal
                    ),
                  ),
                  subtitle: Text('password , phon , emile.......',
                    style: TextStyle(
                        fontSize: 15,
                        color: Color(0xff727373),
                        fontWeight: FontWeight.normal
                    ),
                  ),
                  leading: Icon(Icons.notifications,size:40,color: Color(0xff006d77)),
                ),
              ),
              Divider(
                color: Color(0xff212121),
                thickness: 3,
                indent: 50,
                endIndent: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 35, bottom: 10, top: 10),
                child: ListTile(

                  onTap: (){},
                  title: Text('Delete',
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0xffd6d6d6),
                        fontWeight: FontWeight.normal
                    ),
                  ),
                  subtitle: Text('password , phon , emile.......',
                    style: TextStyle(
                        fontSize: 15,
                        color: Color(0xff727373),
                        fontWeight: FontWeight.normal
                    ),
                  ),
                  leading: Icon(Icons.delete,size:40,color: Color(0xff006d77)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
