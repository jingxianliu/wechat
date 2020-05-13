import 'package:flutter/material.dart';

enum itemType {GroupChat,AddFriend,QrCode,PayMents,Help}
class App extends StatefulWidget{
  @override
  MainState createState() => MainState();  
}
  
class MainState extends State<App>{
  var _currentIndex = 0 ;

  // Message message ;
  // Contacts contacts;
  // Found found ;
  // Me me;
  // currentPage(){
  //   switch(_currentIndex){
  //     case 0 :{
  //       if(message == null){
  //         message = new Message()
  //       }
  //       return message
  //     }
  //     case 1 :{
  //       if(contacts == null){
  //         contacts = new Contacts()
  //       }
  //     }
  //     case 2 :{
  //       if(found == null){
  //         found = new Found()
  //       }
  //     }
  //     case 3 :{
  //       if(me == null){
  //         me = new Me()
  //       }
  //     }
  //   }
  // }

  _popupMeneItem(String title,{String imagePath,IconData icon}){
    return PopupMenuItem(child: Row(
      children: <Widget>[
        imagePath != null 
        ? Image.asset(
          imagePath,width:32.0,height:32.0
          )
        : SizedBox(
          width:32.0,height:32.0,child:Icon(icon,color:Colors.white,)
          ),
        Container(
          padding:const EdgeInsets.only(left:20.0) ,
          child: Text(title,style:TextStyle(color:Colors.white)),
        ),
      ],
    ));
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      appBar: AppBar(
        title:Text('微信'),
        actions: <Widget>[
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, 'search');
            },
            child: Icon(
              Icons.search,
            ) ,
          ),
          Padding(
            padding: const EdgeInsets.only(left:30.0,right:20.0),
            child: GestureDetector(
              onTap: (){
                 print("点击事件");
                 showMenu(context: context, 
                 position: RelativeRect.fromLTRB(500.0, 76.0, 10.0, 0.0), 
                 items: <PopupMenuEntry>[
                   _popupMeneItem('发起群聊',icon:Icons.people),
                   _popupMeneItem('添加朋友',icon:Icons.person_add),
                   _popupMeneItem('扫一扫',icon:Icons.crop_free),
                   _popupMeneItem('收付款',icon:Icons.account_balance_wallet),
                   _popupMeneItem('帮助与反馈',icon:Icons.email)

                 ]);
              },
              child: Icon(Icons.add),
            ),
          ),
        ] 
      ),
      bottomNavigationBar: new BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,  
        onTap: (int index) {
          setState(() {
             print(index);
            _currentIndex = index;
          });
        },
        items: [
          new BottomNavigationBarItem(
            title: new Text('微信',
              style: TextStyle(
              color: _currentIndex == 0
                    ? Color(0xFF46C01B)
                    : Color(0xff999999)
              ),
            ),
            // icon:_currentIndex == 0
            //   ? Image.asset('image/weixin_pressed.png',width:32.0,height:28.0)
            //   :Image.asset('image/weixin_normal.png',width:32.0,height:28.0),
              icon:Icon(Icons.message)
          ),
          new BottomNavigationBarItem(
            title: new Text('通讯录',
              style: TextStyle(
                color: _currentIndex == 1
                    ? Color(0xFF46C01B)
                    : Color(0xff999999)
              ),
            ),
            // icon:_currentIndex == 1
            //   ? Image.asset('image/weixin_pressed.png',width:32.0,height:28.0)
            //   : Image.asset('image/weixin_normal.png',width:32.0,height:28.0)
              icon:Icon(Icons.perm_contact_calendar)
            
          ),
          new BottomNavigationBarItem(
            title: new Text('发现',
              style: TextStyle(
                color: _currentIndex == 2
                    ? Color(0xFF46C01B)
                    : Color(0xff999999)
              ),
            ),
            // icon:_currentIndex == 2
            //   ? Image.asset('image/weixin_pressed.png',width:32.0,height:28.0)
            //   : Image.asset('image/weixin_normal.png',width:32.0,height:28.0)
            icon:Icon(Icons.help)

          ), 
          new BottomNavigationBarItem(
            title: new Text('我呀',
              style: TextStyle(
                color: _currentIndex == 3
                    ? Color(0xFF46C01B)
                    : Color(0xff999999)
              ),
            ),
            // icon:_currentIndex == 3
            //   ? Image.asset('image/weixin_pressed.png',width:32.0,height:28.0)
            //   : Image.asset('image/weixin_normal.png',width:32.0,height:28.0)
            icon:Icon(Icons.person)

          )
        ],
        selectedItemColor: Color(0xFF46C01B),
      ),
//    body: currentPage(),
    );
  }
    
}