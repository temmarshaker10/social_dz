import 'dart:math';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:confetti/confetti.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:social_dz/components/mytext.dart';
import 'package:social_dz/pages/add_post_page.dart';
import 'package:social_dz/pages/ai_chat_page.dart';
import 'package:social_dz/pages/home_page.dart';
import 'package:social_dz/pages/notification_page.dart';
import 'package:social_dz/pages/profile_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final user = FirebaseAuth.instance.currentUser!;
  late ConfettiController _confettiController;
  bool isNewUser = false;
  int _currentindex = 0;

  final List<Widget> _pages = [
    HomePage(),
    AiChatPage(),
    NotificationPage(),
    ProfilePage(),
  ];

  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController(
      duration: const Duration(seconds: 3),
    );
    _checkIfNewUser();
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  void _checkIfNewUser() async {
    await user.reload();
    final updatedUser = FirebaseAuth.instance.currentUser;

    if (updatedUser != null) {
      final creationTime = updatedUser.metadata.creationTime;
      final lastSignInTime = updatedUser.metadata.lastSignInTime;

      if (creationTime != null &&
          lastSignInTime != null &&
          creationTime == lastSignInTime) {
        setState(() {
          isNewUser = true;
        });
        _showWelcomeMessage();
      }
    }
  }

  void _showWelcomeMessage() {
    _confettiController.play();

    AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.bottomSlide,
      title: '🎉 مرحبًا بك في Sozia!',
      desc: 'سعداء بانضمامك إلينا. استمتع بتجربة رائعة!',
      btnOkOnPress: () {},
      btnOkText: 'ابدأ',
    ).show();
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Scaffold(
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DrawerHeader(child: CircleAvatar()),
            ListTile(
              leading: Mytext(
                text: "LogOut",
                color: colors.onSurface,
                size: 15,
                isFight: false,
              ),
              trailing: IconButton(
                onPressed: () => FirebaseAuth.instance.signOut(),
                icon: Icon(Icons.logout),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
      appBar: AppBar(
        title: Mytext(
          text: "Sozia",
          color: theme.appBarTheme.titleTextStyle!.color!,
          size: 30,
          isFight: true,
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(
            onPressed: () {},
            icon: FaIcon(FontAwesomeIcons.arrowsRotate),
          ),
          IconButton(
            onPressed: () {},
            icon: FaIcon(FontAwesomeIcons.facebookMessenger),
          ),
        ],
        backgroundColor: theme.hoverColor,
      ),
      body: Stack(
        children: [
          SafeArea(child: _pages[_currentindex]),
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: _confettiController,
              blastDirection: pi / 2,
              emissionFrequency: 0.5,
              gravity: 0.2,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (context) => AddPostPage(
                    uid: user.uid,
                    userImage: "shaker",
                    username: "temmar",
                  ),
            ),
          );
        },
        backgroundColor: colors.primary,
        child: Icon(Icons.add, color: Colors.white),
      ),
      bottomNavigationBar: GNav(
        onTabChange: _onTabTapped,
        padding: EdgeInsets.all(15),
        duration: Duration(milliseconds: 300),
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        backgroundColor: theme.bottomNavigationBarTheme.backgroundColor!,
        activeColor: theme.bottomNavigationBarTheme.selectedItemColor,
        color: theme.bottomNavigationBarTheme.unselectedItemColor,
        tabs: [
          GButton(icon: Icons.home, text: 'Home'),
          GButton(icon: Icons.smart_toy, text: 'AI Chat'),
          GButton(icon: Icons.notifications, text: 'Notification'),
          GButton(icon: Icons.person, text: 'Profile'),
        ],
        gap: 4,
      ),
    );
  }
}
