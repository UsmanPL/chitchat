import 'package:chitchat/pages/chat_pages/contacts_page.dart';
import 'package:chitchat/pages/profile_pages/profile_page.dart';
import 'package:chitchat/pages/search_pages/search_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("Chit Chat"),
        ),
        body: IndexedStack(
          index: currentIndex,
          children: const [
            ContactsPage(),
            SearchPage(),
            ProfilePage(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (int value) => _updateIndex(value),
          items: const [
            BottomNavigationBarItem(
              label: "Chats",
              icon: Icon(Icons.chat_bubble),
            ),
            BottomNavigationBarItem(
              label: "Search",
              icon: Icon(Icons.search),
            ),
            BottomNavigationBarItem(
              label: "Profile",
              icon: Icon(Icons.person),
            ),
          ],
        ),
      );

  // Functions
  void _updateIndex(int value) => setState(() => currentIndex = value);
}
