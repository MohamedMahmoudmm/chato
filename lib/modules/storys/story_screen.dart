import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PersonStory extends StatelessWidget {
   PersonStory({Key? key}) : super(key: key);
  final PageController _storyController = PageController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [

              InkWell(
                onTap: ()
                {
                  //Navigator.of(context).push(MaterialPageRoute(builder:(context)=>ProfileScreen()));
                },
                child: CircleAvatar(
                  backgroundColor: Color(0xff03a5b4),
                  radius: 28,
                  child: CircleAvatar(
                    backgroundColor: Color(0xff151718),
                    radius: 26,
                    child: CircleAvatar(radius: 24,
                      backgroundImage: NetworkImage(  'https://images.pexels.com/photos/12050692/pexels-photo-12050692.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                      ),),
                  ),
                ),
              ),


              SizedBox(width: 10,),
              Expanded(
                child: Text('mohamed mahmoud',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 18, letterSpacing: 1.55),),
              )
            ],
          ),
          actions: [
          
            IconButton(onPressed: () {},
              icon: SvgPicture.asset('assets/image/listIcon.svg',height: 25,width: 25,color: Color(0xff006d77) ,),
            )
          ],

        ),
        
        body:Column(

          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(height: 20,),
            SmoothPageIndicator(
                controller: _storyController,
                count: 2,
              effect: ExpandingDotsEffect(
                dotColor: Colors.grey,
                dotWidth: 14,
                activeDotColor: Color(0xff006d77)
              ),

            ),

            Expanded(
              child: PageView(
                controller: _storyController,
                onPageChanged:(index){
                  print(index);
                } ,

                children: [
                  Container(
                    width: double.infinity,
                      height: double.infinity,
                      child: Image(image: NetworkImage( 'https://images.pexels.com/photos/12050692/pexels-photo-12050692.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',),)),
                  Container(
                      width: double.infinity,
                      height: double.infinity,
                      child: Image(image: NetworkImage( 'https://images.pexels.com/photos/459957/pexels-photo-459957.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',),)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
