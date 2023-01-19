import 'package:flutter/material.dart';
import 'package:flutter_sql_todolist/screens/home_screen.dart';

import '../screens/categories_screens.dart';

class DrawerNavigation extends StatefulWidget {
  const DrawerNavigation({Key? key}) : super(key: key);

  @override
  State<DrawerNavigation> createState() => _DrawerNavigationState();
}

class _DrawerNavigationState extends State<DrawerNavigation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: ListView(
          children:  [
            const UserAccountsDrawerHeader (
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage('https://avatars.githubusercontent.com/u/84609471?s=400&u=d63e8190e756c0dfee8f2baf7e314cd204a24e80&v=4'),
                ),
                accountName: Text('Ameh Christopher'),
                accountEmail: Text("akrine2christophine@gmail.com"),
                decoration: BoxDecoration(
                  color: Colors.blue
                ),
            ),
            ListTile(
              title: const Text('Home'),
              leading: const Icon(Icons.home),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomeScreen()));
              },
            ),
            ListTile(
              title: const Text('Categories'),
              leading: const Icon(Icons.view_list),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const CategoriesScreen()));

              },
            )
          ],
        ),
      ),
    );
  }
}
