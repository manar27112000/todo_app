 import 'package:flutter/material.dart';
import 'package:todo_app/ui/home/tabs/settings_tab/settings_tab.dart';

import 'tabs/tasks_tab/tasks_tab.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 int selectedTab=0;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      extendBody: true,
        appBar: AppBar(
          title: const Text('ToDo List',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
        ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
      //  color: Colors.blue,
       // elevation: 0,
        notchMargin: 10,
        child: BottomNavigationBar(
          onTap: (index){
          selectedTab=index;
          setState(() {

          });
          },
          elevation: 0,
          backgroundColor: Colors.transparent,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.list,color: Colors.grey,),label: 'Tasks',),
            BottomNavigationBarItem(icon: Icon(Icons.settings,),label: 'Settings'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        shape: const StadiumBorder(side: BorderSide(color: Colors.white,
             width: 4)),
        onPressed: () {

        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: tabs[selectedTab],
    );
  }

  List<Widget>tabs=[
    const TasksTab(),
    const SettingsTab()
  ];
}
