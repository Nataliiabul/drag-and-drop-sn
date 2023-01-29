import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:drag_and_drop_social_networks/assets/colors.dart';
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
          name: 'Facebook', value: 'Facebook', icon: FontAwesomeIcons.facebook),
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
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: const Text(
          'Drag&Drop',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        // main column
        child: Column(
          children: [
            // row with matching columns
            Row(
              children: [
                // column with icons
                Column(
                  children: socialItems.map((socialItem) {
                    return Container(
                      margin: const EdgeInsets.all(8),
                      child: Icon(
                        socialItem.icon,
                        color: AppColors.secondColor,
                        size: 55,
                      ),
                    );
                  }).toList(),
                ),
                Spacer(),
                // column with titles
                Column(
                  children: socialItems2.map((socialItem) {
                    return Container(
                      color: AppColors.secondColor,
                      height: 55,
                      width: 110,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.all(8),
                      child: Text(
                        socialItem.name,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
