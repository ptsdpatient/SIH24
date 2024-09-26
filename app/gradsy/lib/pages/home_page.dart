import 'package:flutter/material.dart';
import 'package:gradsy/builder.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import '../methods.dart';
import 'notification_page.dart';
import 'profile_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class TabNavigationItems {
  final IconData icon;
  final String label;
  final String url;
  final FutureBuilder builder;

  TabNavigationItems({
    required this.icon,
    required this.label,
    required this.url,
    required this.builder,
  });

}

class NavigationItems {
  final IconData icon;
  final String label;
  final List<TabNavigationItems> navigationItems;

  NavigationItems({
    required this.icon,
    required this.label,
    required this.navigationItems,
  });
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

  var bottomNavIndex = 0;
  final searchController = TextEditingController();
  final GlobalKey<ScaffoldState> mainPageKey = GlobalKey<ScaffoldState>();

  // Bottom navigation items
  List<NavigationItems> navigation = [
    NavigationItems(
      icon: Icons.home,
      label: 'Home',
      navigationItems: [
        TabNavigationItems(
            icon: Icons.message,
            label: 'Messages',
            url: '/messages',
            builder: messageBuilder()
        ),TabNavigationItems(
            icon: Icons.groups,
            label: 'Groups',
            url: '/groups',
            builder: groupBuilder()
        ),TabNavigationItems(
            icon: Icons.home_work_rounded,
            label: 'College',
            url: '/college',
            builder: collegeBuilder()
        ),
      ],
    ),NavigationItems(
      icon: Icons.explore,
      label: 'Explore',
      navigationItems: [
        TabNavigationItems(
            icon: Icons.feed,
            label: 'Feed',
            url: '/feed',
            builder: messageBuilder()
        ),TabNavigationItems(
            icon: Icons.campaign,
            label: 'Campaigns',
            url: '/campaign',
            builder: messageBuilder()
        ),TabNavigationItems(
            icon: Icons.work_outlined,
            label: 'Job',
            url: '/job',
            builder: messageBuilder()
        ),
      ],
    ),NavigationItems(
      icon: Icons.group,
      label: 'Alumni',
      navigationItems: [
        TabNavigationItems(
            icon: Icons.person,
            label: 'Alumni',
            url: '/alumni',
            builder: messageBuilder()
        ),TabNavigationItems(
            icon: Icons.stairs,
            label: 'Success Story',
            url: '/success_story',
            builder: messageBuilder()
        ),TabNavigationItems(
            icon: Icons.edit_note_sharp,
            label: 'Resource',
            url: '/resources',
            builder: messageBuilder()
        ),
      ],
    ),
  ];

  late TabController tabController;
  late CircularBottomNavigationController bottomNavigationController;

  @override
  void initState() {
    // TODO: implement initState
    tabController = TabController(
        length: navigation[bottomNavIndex].navigationItems.length,
        vsync: this
    );

    bottomNavigationController= CircularBottomNavigationController(0);



    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: mainPageKey,
      drawer: NotificationPage(),
      endDrawer: ProfilePage(),
      body: DefaultTabController(
        length: navigation[bottomNavIndex].navigationItems.length,
        initialIndex: 0,
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.white,
              expandedHeight: 220,
              leading: IconButton(
                onPressed: () {
                  mainPageKey.currentState?.openDrawer();
                },
                icon: Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Icon(Icons.notifications_active_sharp, size: 35),
                ),
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
                      padding: EdgeInsets.only(left: 24, right: 24, bottom: 94),
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
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              bottom: TabBar(
                controller: tabController,
                onTap:(index){
                  setState(() {
                    tabController.index = index;
                  });
                },
                labelColor: getColor('49b6c5'),
                indicatorColor: getColor('49b6c5'),
                unselectedLabelColor: Colors.black,
                tabs: [
                  for(TabNavigationItems item in navigation[bottomNavIndex].navigationItems)
                     Tab(
                       text:item.label,
                       icon:Icon(item.icon),
                     )
                ],
              ),
              title: Text("Home", style: TextStyle(color: Colors.black)),
              actions: [
                IconButton(
                  onPressed: () {
                    mainPageKey.currentState?.openEndDrawer();
                  },
                  icon: Padding(
                    padding: EdgeInsets.only(right: 16),
                    child: Icon(Icons.account_circle, size: 35, color: Colors.black),
                  ),
                ),
              ],
            ),
            SliverToBoxAdapter(
              child: Container(

              )
            ),
          ],
        ),
      ),
      bottomNavigationBar: CircularBottomNavigation(
            [
              for(NavigationItems items in navigation)
                TabItem(
                  items.icon,
                  items.label,
                  getColor('49b6c5'),
                )
            ],
            normalIconColor: Colors.black,
            iconsSize: 35,
            controller:bottomNavigationController,
            selectedPos: 0,
            barHeight: 70,
            animationDuration: Duration(milliseconds: 300),
            selectedCallback: (int? selectedPos) {
              setState(() {
                if(selectedPos!=bottomNavIndex)tabController.index=0;
                bottomNavIndex = selectedPos!;
              });
            },
      )
    );
  }
}
