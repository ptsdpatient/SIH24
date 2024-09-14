import 'package:flutter/material.dart';
import 'package:gradsy/pages/notification_page.dart';
import 'package:gradsy/pages/profile_page.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../components/input.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class TabNavigationItems{
  final IconData icon;
  final String label;
  final String url;
  FutureBuilder<Widget> builder;
    TabNavigationItems({
      required this.icon,
      required this.label,
      required this.url,
      required this.builder
    });
}
class BottomNavigationItems{
  final IconData icon;
  final String label;
  final List<TabNavigationItems> navigationItems;
  BottomNavigationItems({
    required this.icon,
    required this.label,
    required this.navigationItems
  });
}

class _HomePageState extends State<HomePage> {
  var currentBottomIndex=0;
  final searchController=TextEditingController();


  final GlobalKey<ScaffoldState> mainPageKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: mainPageKey,
      drawer: NotificationPage(),
      endDrawer: ProfilePage(),
      body: DefaultTabController(
          length: 2,
          initialIndex: 0,
          child: CustomScrollView(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            slivers: [
              SliverAppBar(
                expandedHeight: 225,
                leading:  IconButton(
                    onPressed: (){
                      mainPageKey.currentState?.openDrawer();
                    },
                    icon: Icon(Icons.notifications_active_sharp,size: 35),
                    color: Colors.white
                  ),


                backgroundColor: Colors.blue,
                centerTitle: true,
                pinned: false,
                floating: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(left: 20,right:20,bottom: 100),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: TextField(
                                controller: searchController,
                                decoration: InputDecoration(

                                  filled: true,
                                  fillColor: Colors.white,
                                  prefixIcon: Icon(Icons.search),
                                  hintText: "Search",
                                  border: InputBorder.none,

                                ),
                                style: TextStyle(color: Colors.black),
                              )
                          ),
                      ),
                    ],
                  ),
                ),
                bottom: TabBar(
                  tabs: [
                    Tab(
                      icon: Icon(Icons.message_rounded,size: 35,color: Colors.white,),
                      child: Text("Messages",
                        style: TextStyle(color: Colors.white,fontSize: 10),
                      ),
                    ),
                    Tab(
                      child: Text("Trending",style: TextStyle(color: Colors.white),),
                    ),
                  ],
                ),
                title: Text("Home", style: TextStyle(color: Colors.white),),
                automaticallyImplyLeading: false,
                actions: [
                  IconButton(
                    onPressed: (){
                      mainPageKey.currentState?.openEndDrawer();
                    },
                    icon: Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Icon(Icons.account_circle,size: 35,
                      ),
                    ),
                    color: Colors.white,
                  ),
                ],
              ),


              SliverToBoxAdapter(
                child:ListView.builder(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemCount: 20,
                    itemBuilder: (context,index){
                      return Container(
                        height: 500,
                        color: Colors.blue,
                        margin: EdgeInsets.symmetric(vertical: 30),
                      );
                    }
                ),
              )
            ],
          ),
      ),

      bottomNavigationBar: Padding(padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          child: SalomonBottomBar(
              selectedItemColor: Colors.blue,
              selectedColorOpacity: 0.1,
              unselectedItemColor: Colors.grey,
              currentIndex:currentBottomIndex ,
              onTap: (int i){
                setState(() {
                  currentBottomIndex=i;
                });
              },
              items: [
                SalomonBottomBarItem(
                    icon: Icon(Icons.home,size: 35,),
                    title: Text("Home"),
                ),
                SalomonBottomBarItem(icon: Icon(Icons.explore,size: 35), title: Text("Explore")),
                SalomonBottomBarItem(icon: Icon(Icons.supervisor_account,size: 35), title: Text("Alumni")),
              ]
          ),
      ),
    );
  }
}