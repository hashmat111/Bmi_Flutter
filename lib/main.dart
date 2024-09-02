import 'package:bmi_calculator/SplashScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'BMI',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a purple toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: SplashScreen() //(title: 'BMI'),
        );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();

  var result = "";

  bool isloading = true;

  //var show_result =Text("",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),);

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          // TRY THIS: Try changing the color here to a specific color (to
          // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
          // change color while the other colors stay the same.
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(
            widget.title,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 25, color: Colors.black),
          ),
          centerTitle:
              true, // it will make the bmi in center in the top of the app bar
        ),
        body:
            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.
            Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Color(0xffbc2eb),

              Color(0xffa6c1ee),
              //  Color(0xff88d3ce),
            ],
            begin: FractionalOffset(1.0, 1.0),
            end: FractionalOffset(1.0, 0.0),
            //  stops: [0.0,0.0,0.0]//if you have more then two color you put tow other 3 and so on
          )),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Text("BMI",style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold)),

                const SizedBox(
                  height: 20,
                ),

                TextField(
                  controller: wtController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "weight",
                    hintText: "Enter your weight",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                    prefixIcon: const Icon(Icons.fitness_center),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                  style: const TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),

                TextField(
                  controller: ftController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Height",
                    hintText: "Enter your height",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                    prefixIcon: const Icon(Icons.height),
                    filled:
                        true, //its text field background color by default it puts the color
                    fillColor: Colors.grey[200],
                  ),
                  style: const TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(
                  height: 20,
                ),

                TextField(
                  controller: inController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "hight in inch",
                    hintText: "Enter hight in inch",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                    prefixIcon: const Icon(Icons.height),
                    filled: true,
                    //this 200 is color range which start from 50 to 900 from lowest light to highest dark
                    fillColor: Colors.grey[200],
                  ),
                  style: const TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),


                ElevatedButton(
                  onPressed: () async {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Center(child: CircularProgressIndicator());
                      },
                    );
                    //Here, inController is a TextEditingController, but int.parse() expects a String. You need to first get the String from the TextEditingController using its text property.
                    var _weight = inController.text.toString();
                    var _heightFoot = ftController.text.toString();
                    var _heightInch = inController.text.toString();

                    await Future.delayed(Duration(
                        milliseconds:
                            1000)); // Optional delay for simulating async work

                    if (_weight != " " &&
                        _heightInch != "" &&
                        _heightFoot != "") {
                      var weightC = int.parse(_weight);
                      var foot_height = int.parse(_heightInch);
                      var inch_height = int.parse(_heightFoot);

                      var we = (foot_height * 12) + inch_height;
                      var tcm = inch_height * 2 + inch_height;
                      var tm = tcm / 100;

                      var bmi = weightC / (foot_height * foot_height);
                      setState(() {
                        result = "Your Bmi is : $bmi";
                      });
                    } else {
                      setState(() {
                        result = "please fill the required field !!";
                      });
                    }
                    // Dismiss the loading dialog
                    Navigator.of(context).pop();
                  },
                  style:
                      ElevB(), // calling the button we designed for ElevateButton

                  child: const Text(
                    "Calculate",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),

                Text(
                  result,
                  style: const TextStyle(fontSize: 20),
                ),
              ]),
        ));
  }
}

//Button style fun
ButtonStyle ElevB() {
  return ElevatedButton.styleFrom(
    foregroundColor: Colors.white,
    backgroundColor: Colors.blue, // Text color
    padding:
        const EdgeInsets.symmetric(horizontal: 32, vertical: 12), // Padding
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12), // Rounded corners
    ),
    elevation: 8, // Elevation (shadow)
  );
}
