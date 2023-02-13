import 'package:flutter/animation.dart';
import 'package:rive/rive.dart';

class GRiveAssets {
  final String artboard, stateMachineName, title, src;
  SMIBool input;
  final VoidCallback onTap;

  GRiveAssets(this.src,
      {this.artboard,
      this.input,
      this.onTap,
      this.stateMachineName,
      this.title});

  set setInput(SMIBool status) {
    input = status;
  }
}

List<GRiveAssets> bottomNavs = [
  GRiveAssets(
    "assets/RiveAssets/icons.riv",
    artboard: "HOME",
    stateMachineName: "HOME_Interactivity",
    title: "Home",
  ),
  GRiveAssets(
    "assets/RiveAssets/icons.riv",
    artboard: "TIMER",
    onTap: () {},
    stateMachineName: "TIMER_Interactivity",
    title: "My Colors",
  ),
  GRiveAssets(
    "assets/RiveAssets/icons.riv",
    artboard: "SEARCH",
    stateMachineName: "SEARCH_Interactivity",
    title: "Creat Color",
  ),
  GRiveAssets(
    "assets/RiveAssets/icons.riv",
    artboard: "LIKE/STAR",
    stateMachineName: "STAR_Interactivity",
    title: "Favourites",
  ),
  GRiveAssets(
    "assets/RiveAssets/icons.riv",
    artboard: "CHAT",
    stateMachineName: "CHAT_Interactivity",
    title: "Color Theory",
  ),
];

List<GRiveAssets> sideMenus = [
  GRiveAssets(
    "assets/RiveAssets/icons.riv",
    artboard: "HOME",
    stateMachineName: "HOME_Interactivity",
    title: "Home",
  ),
  GRiveAssets(
    "assets/RiveAssets/icons.riv",
    artboard: "TIMER",
    onTap: () {},
    stateMachineName: "TIMER_Interactivity",
    title: "My Colors",
  ),
  GRiveAssets(
    "assets/RiveAssets/icons.riv",
    artboard: "SEARCH",
    stateMachineName: "SEARCH_Interactivity",
    title: "Creat Color",
  ),
  GRiveAssets(
    "assets/RiveAssets/icons.riv",
    artboard: "LIKE/STAR",
    stateMachineName: "STAR_Interactivity",
    title: "Favourites",
  ),
  GRiveAssets(
    "assets/RiveAssets/icons.riv",
    artboard: "CHAT",
    stateMachineName: "CHAT_Interactivity",
    title: "Color Theory",
  ),
];

List<GRiveAssets> sideMenu2 = [
  GRiveAssets(
    "assets/RiveAssets/icons.riv",
    artboard: "TIMER",
    stateMachineName: "TIMER_Interactivity",
    title: "History",
  ),
  GRiveAssets(
    "assets/RiveAssets/icons.riv",
    artboard: "SEARCH",
    stateMachineName: "SEARCH_Interactivity",
    title: "Notifications",
  ),
];
