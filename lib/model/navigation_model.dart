import 'package:flutter/material.dart';

class NavigationModel {
  String title;
  IconData icon;

  NavigationModel({this.title, this.icon});
}

List<NavigationModel> navigationItems = [
  NavigationModel(title: "Take Attendance", icon: Icons.mode_edit),
  NavigationModel(title: "Att. History", icon: Icons.playlist_add_check),
  NavigationModel(title: "Add Event", icon: Icons.add_a_photo),
  NavigationModel(title: "Events", icon: Icons.calendar_today),
  NavigationModel(title: "Calendar", icon: Icons.calendar_view_day),
  NavigationModel(title: "Add Delegates", icon: Icons.add),
  NavigationModel(title: "Announcments", icon: Icons.notifications),
  NavigationModel(title: "Settings", icon: Icons.settings),
  
];