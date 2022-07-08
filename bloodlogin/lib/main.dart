import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

extension PasswordValidator on String {
  bool isValidPassword() {
    return RegExp(
            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
        .hasMatch(this);
  }
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      home: MyHomePage(title: "Life Drop"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // resizeToAvoidBottomInset: false,
        backgroundColor: Colors.redAccent,
        body: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: const [
                  Text(
                    "Life Drop",
                    style: TextStyle(fontSize: 60, color: Colors.white),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "your blood can save lives",
                    style: TextStyle(color: Colors.white70, fontSize: 20),
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Email",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (input) =>
                            input!.isValidEmail() ? null : "Check your email",
                        style: const TextStyle(color: Colors.white),
                        onTap: () {},
                        controller: emailController,
                        cursorColor: Colors.white,
                        decoration: const InputDecoration(
                          hintText: "Enter Email",
                          hintStyle: TextStyle(color: Colors.white54),
                          focusColor: Colors.white,
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white60),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          enabled: true,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Password",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (input) => input!.isValidPassword()
                            ? null
                            : "Check your Password",
                        style: const TextStyle(color: Colors.white),
                        onTap: () {},
                        controller: passwordController,
                        cursorColor: Colors.white,
                        decoration: const InputDecoration(
                          hintText: "Enter Password",
                          hintStyle: TextStyle(color: Colors.white54),
                          focusColor: Colors.white,
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white60),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          enabled: true,
                        ),
                      ),
                      const SizedBox(height: 40),
                      Container(
                        alignment: Alignment.center,
                        child: ElevatedButton(
                          style:
                              ElevatedButton.styleFrom(primary: Colors.white),
                          child: const Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          onPressed: () {
                            setState(() {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DonatePage(
                                          emailText: emailController.text)));
                            });
                          },
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DonatePage extends StatefulWidget {
  final String emailText;
  const DonatePage({Key? key, required this.emailText}) : super(key: key);

  @override
  State<DonatePage> createState() => _DonatePageState();
}

class _DonatePageState extends State<DonatePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.redAccent,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 80),
                const Text(
                  "your blood can save lives",
                  style: TextStyle(fontSize: 35, color: Colors.white),
                ),
                const SizedBox(height: 20),
                Text(
                  "Logged in as ${widget.emailText}",
                  style: const TextStyle(fontSize: 15, color: Colors.white),
                ),
                const SizedBox(height: 200),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  child: const Text(
                    "Donate Blood",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    primary: Colors.white,
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  child: const Text(
                    "Get Blood",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
