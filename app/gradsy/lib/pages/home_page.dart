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
  final IconData createIcon;
  final String label;
  final String url;
  final FutureBuilder builder;

  TabNavigationItems({
    required this.icon,
    required this.createIcon,
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
            createIcon: Icons.add_comment_rounded,
            builder: messageBuilder()
        ),TabNavigationItems(
            icon: Icons.groups,
            label: 'Groups',
            url: '/groups',
            createIcon: Icons.group_add_rounded,
            builder: groupBuilder()
        ),TabNavigationItems(
            icon: Icons.home_work_rounded,
            label: 'College',
            url: '/college',
            createIcon: Icons.add_box_rounded,
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
            createIcon: Icons.add_box_rounded,
            url: '/feed',
            builder: messageBuilder()
        ),TabNavigationItems(
            icon: Icons.campaign,
            label: 'Campaigns',
            url: '/campaign',
            createIcon: Icons.add_box,
            builder: messageBuilder()
        ),TabNavigationItems(
            icon: Icons.work_outlined,
            label: 'Job',
            url: '/job',
            createIcon: Icons.add_box,
            builder: messageBuilder()
        ),
      ],
    ),NavigationItems(
      icon: Icons.school_rounded,
      label: 'Alumni',
      navigationItems: [
        TabNavigationItems(
            icon: Icons.person,
            label: 'Alumni',
            url: '/alumni',
            createIcon: Icons.person_add_rounded,
            builder: messageBuilder()
        ),TabNavigationItems(
            icon: Icons.stairs,
            label: 'Success Story',
            url: '/success_story',
            createIcon: Icons.add_rounded,
            builder: messageBuilder()
        ),TabNavigationItems(
            icon: Icons.edit_note_sharp,
            label: 'Resource',
            url: '/resources',
            createIcon: Icons.add_box,
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

      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        child: Icon(
            navigation[bottomNavIndex].navigationItems[tabController.index].createIcon,
            color:Colors.white,
            size:33
        ),
        backgroundColor:getColor('49b6c5')
      ),
      body: DefaultTabController(
        length: navigation[bottomNavIndex].navigationItems.length,
        initialIndex: 0,
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          slivers: [
            SliverAppBar(
              title:Text(navigation[bottomNavIndex].navigationItems[tabController.index].label),
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
