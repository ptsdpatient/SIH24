import 'package:flutter/material.dart';
import 'package:gradsy/pages/notification_page.dart';
import 'package:gradsy/pages/profile_page.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../components/input.dart';
import '../methods.dart';
import 'home_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class TabNavigationItems{
  final IconData icon;
  final String label;
  final String url;

    TabNavigationItems({
      required this.icon,
      required this.label,
      required this.url,

    });
}


class NavigationItems{
  final IconData icon;
  final String label;
  final List<TabNavigationItems> navigationItems;
  NavigationItems({
    required this.icon,
    required this.label,
    required this.navigationItems
  });
}

class _HomePageState extends State<HomePage> {
  var currentBottomIndex=0;
  final searchController=TextEditingController();



  final GlobalKey<ScaffoldState> mainPageKey = GlobalKey<ScaffoldState>();

  List navigation = [
    new NavigationItems(
      icon: Icons.home,
      label: 'Home',
      navigationItems: [
        TabNavigationItems(
          icon: Icons.message,
          label: 'Message',
          url: '/messages',
        ),
        TabNavigationItems(
          icon: Icons.groups,
          label: 'Groups',
          url: '/groups',
        ),
        TabNavigationItems(
          icon: Icons.home_work_outlined,
          label: 'College',
          url: '/college',
        ),
      ]
    ),
    new NavigationItems(
        icon: Icons.home,
        label: 'Explore',
        navigationItems: [
          TabNavigationItems(
            icon: Icons.newspaper_rounded,
            label: 'Blog',
            url: '/blogs',
          ),
          TabNavigationItems(
            icon: Icons.campaign,
            label: 'Campaigns',
            url: '/campaign',
          ),
          TabNavigationItems(
            icon: Icons.work,
            label: 'Jobs',
            url: '/job',
          ),
        ]
    ),
    new NavigationItems(
        icon: Icons.photo_album_rounded,
        label: 'Alumni',
        navigationItems: [
          TabNavigationItems(
            icon: Icons.people,
            label: 'Alumni',
            url: '/alumni',
          ),
          TabNavigationItems(
            icon: Icons.stairs,
            label: 'Success Stories',
            url: '/success_stories',
          ),
          TabNavigationItems(
            icon: Icons.home_work_outlined,
            label: 'College',
            url: '/college',
          ),
        ]
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: mainPageKey,
      drawer: NotificationPage(),
      endDrawer: ProfilePage(),
      body: DefaultTabController(
          length: 3,
          initialIndex: 0,
          child: CustomScrollView(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.white,
                expandedHeight: 220,
                leading:  IconButton(
                    onPressed: (){
                      mainPageKey.currentState?.openDrawer();
                    },
                    icon: Padding(
                      padding: EdgeInsets.only(left: 16),
                      child: Icon(Icons.notifications_active_sharp,size: 35),
                    )
                  ),

                centerTitle: true,
                pinned: true,
                floating: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                        Padding(
                            padding: EdgeInsets.only(left: 24,right:24,bottom: 94),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: TextField(
                                  controller: searchController,
                                  decoration: InputDecoration(

                                    filled: true,
                                    fillColor: Colors.black12,
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
                    labelColor: Colors.blue,
                    indicatorColor: getColor('49b6c5'),
                    unselectedLabelColor: Colors.black,
                  tabs: [
                    Tab(
                      icon: Icon(Icons.message_rounded,size: 35),
                      child: Text("Messages",
                        style: TextStyle(fontSize: 10),
                      ),
                    ),
                    Tab(
                      icon: Icon(Icons.groups,size: 35),
                      child: Text("Group",
                        style: TextStyle(fontSize: 10),
                      ),
                    ),
                    Tab(
                      icon: Icon(Icons.home_work_outlined,size: 35),
                      child: Text("College",
                        style: TextStyle(fontSize: 10),
                      ),
                    ),
                  ],
                ),
                title: Text("Home", style: TextStyle(color: Colors.black),),
                automaticallyImplyLeading: false,
                actions: [
                  IconButton(
                    onPressed: (){
                      mainPageKey.currentState?.openEndDrawer();
                    },
                    icon: Padding(
                      padding: EdgeInsets.only(right: 16),
                      child: Icon(Icons.account_circle,size: 35,color:Colors.black
                      ),
                    ),
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

      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          child: SalomonBottomBar(
              selectedItemColor: Colors.blue[600],
              selectedColorOpacity: 0.1,
              unselectedItemColor: Colors.black,
              currentIndex:currentBottomIndex ,
              onTap: (int i){
                setState(() {
                  currentBottomIndex=i;
                });
              },
              items: [
                SalomonBottomBarItem(
                    icon: Icon(Icons.home,size: 35,
                    ),
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