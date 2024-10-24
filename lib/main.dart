import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black54,
        appBar: AppBar(
          title: const Text('RELORCASA_CPE31_DICE'),
          backgroundColor: Colors.grey,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int left = 1, right = 1;
  String resultMessage = '';
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                  onPressed: (){
                    setState(() {
                      ChangeValue();
                    });
                    print('Left image is clicked');
                    print(left);
                  },
                  child: Image.asset('images/dice$left.png')),
            )),
              Expanded(child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                    onPressed: (){
                      setState(() {
                        ChangeValue();
                      });
                      print('Right image is clicked');
                      print(right);
                    },
                    child: Image.asset('images/dice$right.png')),
              )),
            ],
          ),
          const SizedBox(height: 20), // Space between dice and text
          Text(
            'The total roll is ${left + right}',
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10), // Space between the total roll and result message
          Text(
            resultMessage,
            style: const TextStyle(
              fontSize: 21,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  void ChangeValue(){
    left = 1 + Random().nextInt(6);
    right = 1 + Random().nextInt(6);

    if (left > right) {
      resultMessage = 'Left dice rolls higher';
    } else if (right > left) {
      resultMessage = 'Right dice rolls higher';
    } else {
      resultMessage = 'Dice rolls are equal';
    }
  }
}



