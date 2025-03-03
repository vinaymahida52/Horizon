import 'package:flutter/material.dart';

class NavMdoel {
  String title;
  IconData icon;
  NavMdoel({required this.title, required this.icon});
}

List<NavMdoel> navItems = [
  NavMdoel(title: 'Home', icon: Icons.home),
  NavMdoel(title: 'My Tasks', icon: Icons.list),
  NavMdoel(title: 'Inbox', icon: Icons.inbox),
  NavMdoel(title: "Leaderboard", icon: Icons.leaderboard),
  NavMdoel(title: 'Calendar', icon: Icons.calendar_month),
];
