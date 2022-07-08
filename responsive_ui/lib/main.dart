// /*
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text("Responsive UI"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Expanded(flex: 2, child: designerRowCreation()),
            const SizedBox(
              height: 10,
            ),
            Expanded(flex: 1, child: customRoundedContainer()),
            const SizedBox(
              height: 10,
            ),
            Expanded(flex: 2, child: designerRowCreation()),
            const SizedBox(
              height: 10,
            ),
            Expanded(flex: 1, child: customRoundedContainer()),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

Widget designerRowCreation() {
  return Row(
    children: [
      Expanded(
        flex: 2,
        child: customRoundedContainer(
            //width: 250,
            //height: 200,
            ),
      ),
      const SizedBox(
        width: 10,
      ),
      Expanded(
        flex: 1,
        child: customRoundedContainer(),
      ),
    ],
  );
}

Widget customRoundedContainer() {
  return Container(
    decoration: BoxDecoration(
      color: Colors.blueGrey,
      borderRadius: BorderRadius.circular(
        25,
      ),
    ),
  );
}
// */
/*
//Notes and reminder
import 'package:flutter/material.dart';

Container roundedSquare({
  double width = double.infinity,
  double height = 70,
  required Color bgColor,
  required Color textColor,
  required String text1,
  required String text2,
  required String text3,
  required double border_width,
  required Color border_Color,
}) {
  //A. As the container's vertical(top and bottom) padding is already set and height is hardcoded to 70, so the text1, text(" "), text2, because of their fontsize is able to occupy all the availabe space inside container, and  so no crossAxisAlisgment is needed.
  //B. Because the Container(parent) padding is already set, so container's child cannot go beyond the set padding - in this case vertical padding(top and bottom) also manAxisAlignment will not work because Row's crossAxisAligment is already set to start.
  return Container(
    // height: 70,
    // padding: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
    width: double.infinity,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start, //B
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(text1),
            Text(" "),
            Text(text2),
          ],
        ),
        Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(text3),
          ],
        ),
      ],
    ),
    margin: EdgeInsets.symmetric(horizontal: 10.0),
    decoration: BoxDecoration(
      color: bgColor,
      borderRadius: BorderRadius.circular(border_width),
      border: Border.all(color: border_Color),
    ),
  );
}

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            //mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(width: double.infinity),
              SizedBox(
                height: 20,
              ),
              roundedSquare(
                textColor: Colors.black,
                bgColor: Colors.teal,
                text1: ("23/05/22"),
                text2: ("Fetch milk from the market"),
                text3: ("Monday"),
                border_width: 30.0,
                border_Color: Colors.yellow,
              ),
              SizedBox(
                height: 20,
              ),
              roundedSquare(
                text1: ("24/05/22"),
                text2: ("Pay electricity bills"),
                text3: ("Tuesday"),
                bgColor: Colors.teal,
                textColor: Colors.black,
                border_width: 30.0,
                border_Color: Colors.yellow,
              ),
              SizedBox(
                height: 20,
              ),
              roundedSquare(
                bgColor: Colors.teal,
                textColor: Colors.black,
                text1: ("24/05/22"),
                text2: ("Complete flutter assignment"),
                text3: ("Tuesday"),
                border_width: 30.0,
                border_Color: Colors.yellow,
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
*/