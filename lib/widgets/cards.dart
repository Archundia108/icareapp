import 'dart:async';

import 'package:flutter/material.dart';

class Cards extends StatefulWidget {
  Cards({super.key});

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  int _selectedCard = 0;

  List<Image> widgetList = [
    Image.asset("assets/quality_basics.jpg"),
    Image.asset("assets/communication.jpg"),
    Image.asset("assets/advice_critical.jpg"),
  ];

  late Timer timer;

  final PageController cardController = PageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_selectedCard < 2) {
        _selectedCard++;
      } else {
        _selectedCard = 0;
      }

      if (cardController.positions.isNotEmpty) {
        cardController.animateToPage(
          _selectedCard,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeIn,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Featured lessons",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade800,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    "See all",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 250,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              PageView.builder(
                controller: cardController,
                itemCount: widgetList.length,
                itemBuilder: ((context, index) {
                  return widgetList[index];
                }),
                onPageChanged: (int selectedCard) {
                  setState(() {
                    _selectedCard = selectedCard;
                  });
                },
              ),
              Container(
                margin: EdgeInsets.only(bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int index = 0; index < widgetList.length; index++)
                      if (index == _selectedCard) ...[createCircle(true)] else
                        createCircle(false)
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget createCircle(bool current) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      height: current ? 12 : 8,
      width: current ? 12 : 8,
      decoration: BoxDecoration(
        color: current ? Colors.indigo : Colors.grey,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}
