import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class CallsScreen extends StatelessWidget {
   CallsScreen({Key? key}) : super(key: key);
  List mydata =[

    {
      'image': (  'https://images.pexels.com/photos/12050692/pexels-photo-12050692.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
      ),
      'title':'Ahmed Ali ',
      'mesg': '02 September 2022 12:07 PM',
    },
    {
      'image': (    'https://images.pexels.com/photos/459957/pexels-photo-459957.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
      'title':'Ahmed Mohamed ',
      'mesg': '02 September 2022 12:07 PM'
    },
    {
      'image': (  'https://images.pexels.com/photos/12050692/pexels-photo-12050692.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
      'title':'Ahmed Sayed ',
      'mesg': '02 September 2022 12:07 PM'
    },
    {
      'image': (    'https://images.pexels.com/photos/459957/pexels-photo-459957.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
      'title':'Ahmed Ali ',
      'mesg': '02 September 2022 12:07 PM',
    },
    {
      'image': (  'https://images.pexels.com/photos/12050692/pexels-photo-12050692.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
      'title':'Ahmed Mohamed ',
      'mesg': '02 September 2022 12:07 PM'
    },
    {
      'image': (  'https://images.pexels.com/photos/12050692/pexels-photo-12050692.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
      'title':'Ahmed Sayed ',
      'mesg': '02 September 2022 12:07 PM'
    },
    {
      'image': (  'https://images.pexels.com/photos/12050692/pexels-photo-12050692.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
      'title':'Ahmed Ali ',
      'mesg': '02 September 2022 12:07 PM',
    },

  ];
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
  final String _phoneNumber='01033891608';
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          for(int i=0;i<mydata.length;i++)
            Padding(
              padding: const EdgeInsets.all(10),
              child: ListTile(

                onTap: ()async{
                  final _call = 'tel:$_phoneNumber';
                  final _text = 'sms:$_phoneNumber';
                  if(await canLaunchUrlString(_call))
                    {
                      await launchUrlString(_call);
                    }

                },
                title: Text(mydata[i]['title'],
                  style: TextStyle(
                      fontSize: 18,
                      color: Color(0xffd6d6d6),
                      fontWeight: FontWeight.bold
                  ),

                ),
                subtitle: Row(
                  children: [
                    Icon(Icons.call_missed,color: Colors.red,size: 20,),
                    Expanded(
                      child: Text(mydata[i]['mesg'],
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                            fontSize: 13,
                            color: Color(0xff727373),
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ],
                ),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(mydata[i]['image']),
                  maxRadius: 35,
                  backgroundColor: Colors.indigo,
                ),
                trailing: Icon(Icons.phone_enabled,
                  color: Color(0xff006d77),
                  size: 25,
                ),
              ),
            ),
        ],

      ),
    );
  }
}
