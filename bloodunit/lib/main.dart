import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(title: 'Blood Bank'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(left: 15, right: 15),
            height: 200,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 221, 221, 221),
              // borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 30, top: 20),
                  width: 200,
                  height: 180,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Sarita",
                        style: TextStyle(fontSize: 32, color: Colors.white),
                      ),
                      const Text(
                        "Blood",
                        style: TextStyle(fontSize: 32, color: Colors.white),
                      ),
                      const Text(
                        "Bank",
                        style: TextStyle(fontSize: 32, color: Colors.white),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 221, 221, 221),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.green[800],
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Blood Group",
                      style: TextStyle(color: Colors.pink, fontSize: 18),
                    ),
                    const Text(
                      "B +ve",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 40),
                    const Text(
                      "Add Units",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.only(right: 5, left: 5),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: 160,
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Visibility(
                            maintainSize: true,
                            maintainState: true,
                            maintainAnimation: true,
                            visible: _counter > 0 ? true : false,
                            child: plusMinusButton(
                              onPressed: () {
                                setState(() {
                                  _decrementCounter();
                                });
                              },
                              icon: Icons.remove,
                            ),
                          ),
                          Text(
                            _counter.toString(),
                            style: const TextStyle(
                                fontSize: 35, fontWeight: FontWeight.w600),
                          ),
                          Visibility(
                            maintainAnimation: true,
                            maintainSize: true,
                            maintainState: true,
                            visible: _counter == 9 ? false : true,
                            child: plusMinusButton(
                              onPressed: () {
                                setState(() {
                                  _incrementCounter();
                                });
                              },
                              icon: Icons.add,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Visibility(
            maintainAnimation: true,
            maintainSize: true,
            maintainState: true,
            visible: _counter == 9 ? true : false,
            child: Container(
              padding: const EdgeInsets.only(bottom: 5),
              width: double.infinity,
              height: 50,
              color: const Color.fromARGB(255, 221, 221, 221),
              alignment: Alignment.center,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  "You have reached maximum unit limit",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white70,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget plusMinusButton(
    {required void Function() onPressed, required IconData icon}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      primary: const Color.fromARGB(255, 221, 221, 221),
      onPrimary: Colors.blue,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      minimumSize: const Size(40, 35),
      padding: EdgeInsets.zero,
    ),
    onPressed: onPressed,
    child: Icon(
      icon,
      color: Colors.black,
    ),
  );
}
