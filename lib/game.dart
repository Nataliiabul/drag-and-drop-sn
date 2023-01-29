import 'package:drag_and_drop_social_networks/style/colors.dart';
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
  late int score;
  late bool restart;

  @override
  void initState() {
    super.initState();
    initGame();
  }

  initGame() {
    score = 0;
    restart = false;
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
    if (socialItems.length == 0) {
      restart = true;
    }
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: const Text(
          'Drag&Drop Game',
          style: TextStyle(
            color: Color(0xFF78A1BB),
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
            Text(
              'Score: $score',
              style: TextStyle(
                color: AppColors.secondColor,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            SizedBox(height: 15),

            // row with matching columns
            Row(
              children: [
                // column with icons
                Column(
                  children: socialItems.map((socialItem) {
                    return Container(
                      margin: const EdgeInsets.all(8),
                      child: Draggable<SocialItemModel>(
                        data: socialItem,
                        feedback: Icon(
                          socialItem.icon,
                          color: AppColors.secondColor,
                          size: 55,
                        ),
                        childWhenDragging: Icon(
                          socialItem.icon,
                          color: AppColors.secondColor.withOpacity(0.3),
                          size: 55,
                        ),
                        child: Icon(
                          socialItem.icon,
                          color: AppColors.secondColor,
                          size: 55,
                        ),
                      ),
                    );
                  }).toList(),
                ),
                Spacer(),

                // column with titles
                Column(
                  children: socialItems2.map((socialItem) {
                    return DragTarget<SocialItemModel>(
                      onAccept: (receivedItem) {
                        if (socialItem.value == receivedItem.value) {
                          setState(() {
                            socialItems.remove(receivedItem);
                            socialItems2.remove(socialItem);
                            score += 10;
                            socialItem.accepting = false;
                          });
                        } else {
                          setState(() {
                            score -= 5;
                            socialItem.accepting = false;
                          });
                        }
                      },
                      onWillAccept: (receivedItem) {
                        setState(() {
                          socialItem.accepting = true;
                        });
                        return true;
                      },
                      onLeave: (receivedItem) {
                        setState(() {
                          socialItem.accepting = false;
                        });
                      },
                      builder: (context, candidateData, rejectedData) =>
                          AnimatedContainer(
                        duration: const Duration(milliseconds: 350),
                        curve: Curves.easeOut,
                        height: 55,
                        width: 110,
                        alignment: Alignment.center,
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: socialItem.accepting
                              ? AppColors.secondColor.withOpacity(0.3)
                              : AppColors.secondColor,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Text(
                          socialItem.name,
                          style: const TextStyle(
                            color: Color(0xFF283044),
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
            const SizedBox(height: 15),

            // restart button
            if (restart)
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    restart = true;
                    initGame();
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.secondColor,
                  foregroundColor: AppColors.mainColor,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 7,
                  ),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
                child: const Text(
                  'Restart',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
