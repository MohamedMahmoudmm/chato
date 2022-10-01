
//import 'package:beauty_navigation/beauty_navigation.dart';
import 'package:chat_iti/layout/cubit/cubit.dart';
import 'package:chat_iti/layout/cubit/states.dart';
import 'package:chat_iti/model/profile.dart';
import 'package:chat_iti/modules/login/login_screen.dart';
//import 'package:circle_bottom_navigation_bar/circle_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'flutter\.pub-cache\hosted\pub.dartlang.org\circle_bottom_navigation_bar-1.0.0\lib\circle_bottom_navigation_bar.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
   List menu=[
     {
       'title' : 'My account ',
     },
     {
       'title' : 'History ',
     },
     {
       'title' : 'Setting ',
     },
     {
       'title' : 'Change account ',
     },
     {
       'title' : 'Log out ',
     },
   ];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context)=>ChatoCubit()..getUserData(),
        child: BlocConsumer<ChatoCubit,ChatoStates>(
        listener: (BuildContext context,ChatoStates state){},
    builder: (BuildContext context,ChatoStates state) {
      var cubit = ChatoCubit.get(context);
      return SafeArea(
        child: Scaffold(
          endDrawer:  Drawer(
            elevation: 20,
            child: Container(
              color: const Color(0xff151718),
              child: ListView(
                children: [
                  UserAccountsDrawerHeader(
                    decoration: const BoxDecoration(
                      color: Colors.black87,
                    ),
                    currentAccountPicture: InkWell(
                      onTap: ()
                      {
                        cubit.getImage();

                      },
                      child:  CircleAvatar(//cubit.model?.accountImage ==null accountImage
                        backgroundImage:  cubit.model?.accountImage == null?NetworkImage('https://images.pexels.com/photos/1666779/pexels-photo-1666779.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1') :NetworkImage(cubit.model!.accountImage) ,
                        maxRadius: 30,
                        backgroundColor:  Color(0xff151718),
                      ),
                    ),
                    accountName: cubit.model?.name1 != null? Text(cubit.model!.name1,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                      ),
                    ):Text('account name',
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    accountEmail: cubit.model?.email != null? Text(cubit.model!.email,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                      ),
                    ):Text('account email',
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    arrowColor: const Color(0xff006d77),
                  ),
                  Column(

                    children: [
                         Card(
                          color:  Color(0xff151718),
                          child:  ListTile(
                              onTap: (){

                                Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) => ProfileScreen(cubit.model!)),
                                );

                              },

                              title:  Text('my account',
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                ),
                              )
                          ),
                        ),

                        const Card(
                          color: Color(0xff151718),
                          child: ListTile(

                              title: Text('History',
                                style:  TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                ),
                              )
                          ),
                        ),

                        const Card(
                          color:  Color(0xff151718),
                          child:  ListTile(

                              title: Text('Setting',
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                ),
                              )
                          ),
                        ),

                        const Card(
                          color: Color(0xff151718),
                          child: ListTile(

                              title: Text('Change Account',
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                ),
                              )
                          ),
                        ),

                        Card(
                          color: const Color(0xff151718),
                          child: ListTile(
                              onTap: (){
                                print('log out');
                                Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) => Login()),
                                );

                              },
                              title: const Text('Log Out',
                                style:  TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                ),
                              )
                          ),
                        ),
                    ],
                  )
                ],

              ),
            ),
          ),
          key: _scaffoldKey,
          extendBody: true,
         // backgroundColor: Color(0xff151718),
          appBar: AppBar(
            title: Row(
              children: [

                SvgPicture.asset('assets/image/chat.svg'),


                const SizedBox(width: 10,),
                const Text('Chato',
                  style: TextStyle(fontSize: 31, letterSpacing: 1.55),)
              ],
            ),
            actions: [
              IconButton(onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
                icon: const Icon(Icons.search,
                 ),
              ),
              IconButton(onPressed: () {
                _scaffoldKey.currentState?.openEndDrawer();
              },
                icon: SvgPicture.asset('assets/image/listIcon.svg',height: 25,width: 25,color: Color(0xff006d77) ,),

      )
            ],

          ),
          // bottomNavigationBar: FloatingNavbar(
          //   borderRadius: 25,
          //   width: double.infinity,
          //   margin: EdgeInsets.only(bottom: 20,),
          //   //padding: EdgeInsets.only(right: 25,left: 25),
          //   selectedItemColor: Color(0xff03a5b4),
          //   backgroundColor: Color(0xff0e0e10),
          //     currentIndex: cubit.currentIndex,
          //     onTap: (index){
          //     cubit.changeBottomNavBar(index);
          //     },
          //     items: cubit.bottomItems),

          // bottomNavigationBar: Padding(
          //   padding: const EdgeInsets.only(bottom: 10),
          //   child: DotNavigationBar(
          //       margin:  EdgeInsets.only(left: 10, right: 10),
          //       currentIndex: cubit.currentIndex,
          //       backgroundColor: const Color(0xff0e0e10),
          //       borderRadius: 31,
          //
          //       //dotIndicatorColor: Color(0xff03a5b4),
          //       selectedItemColor:  const Color(0xff006d77),
          //       unselectedItemColor: Colors.grey[300],
          //       // enableFloatingNavBar: false,
          //       onTap:(index){
          //
          //         cubit.changeBottomNavBar(index);
          //       },
          //       items: cubit.bottomItems)),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.only(bottom: 12,right:15,left: 15),
            child: CircleBottomNavigationBar(

                tabs: cubit.bottom1Items,
              inactiveIconColor: Colors.grey,
              arcHeight: 0,
              arcWidth: 0,
              circleOutline:-10,
              circleSize: 60,
              barBackgroundColor: Color(0xff0e0e10),
              circleColor: Color(0xff006d77),
                initialSelection: cubit.currentIndex,
                onTabChangedListener:(index){

              cubit.changeBottomNavBar(index);
             },),
          ),
            // bottomNavigationBar: BeautyNavigation(
            //   items: cubit.bottom2Items,
            //
            // ),
          body: cubit.screens[cubit.currentIndex],


        ),
      );
    })
    );
  }
}
