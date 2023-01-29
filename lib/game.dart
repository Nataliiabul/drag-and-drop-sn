import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:drag_and_drop_social_networks/models/social_model.dart';


class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late List<SocialItemModel> socialItems;
  late List<SocialItemModel> socialItems2;

  @override
  void initState() {
    super.initState();
    initGame();
  }

  initGame() {
    socialItems = [
      SocialItemModel(
          name: 'Google', value: 'Google', icon: FontAwesomeIcons.google),
      SocialItemModel(
          name: 'Twitter', value: 'Twitter', icon: FontAwesomeIcons.twitter),
      SocialItemModel(
          name: 'YouTube', value: 'YouTube', icon: FontAwesomeIcons.youtube),
      SocialItemModel(name: 'VK', value: 'VK', icon: FontAwesomeIcons.vk),
      SocialItemModel(
          name: 'Instagram',
          value: 'Instagram',
          icon: FontAwesomeIcons.instagram),
    ];
    socialItems2 = List<SocialItemModel>.from(socialItems);
    socialItems.shuffle();
    socialItems2.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drag&Drop'),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [],
      )),
    );
  }
}
