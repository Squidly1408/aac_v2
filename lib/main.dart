import 'package:aac_v2/utils/user_colour_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await userColourPreferences.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double pitch = 1.8; // pitch from 0.5 - 2.0
  double volume = 1.0; // volume from 0.0 - 1.0
  double rate = 0.755; // rate from 0.0 - 1.

  double newPitch = 1.8; // pitch from 0.5 - 2.0
  double newVolume = 1.0; // volume from 0.0 - 1.0
  double newRate = 0.755; // rate from 0.0 - 1.0

  FlutterTts flutterTts = FlutterTts();
  speak(String text) async {
    await flutterTts.setLanguage('en-AU');
    await flutterTts.setPitch(pitch);
    await flutterTts.setVolume(volume);
    await flutterTts.setSpeechRate(rate);
    await flutterTts.speak('a $text');
  }

  var button1Icon = Icons.accessibility;
  var button2Icon = Icons.accessibility;
  var button3Icon = Icons.accessibility;
  var button4Icon = Icons.accessibility;
  var button5Icon = Icons.accessibility;
  var button6Icon = Icons.accessibility;

  var newButton1Icon = Icons.accessibility;
  var newButton2Icon = Icons.accessibility;
  var newButton3Icon = Icons.accessibility;
  var newButton4Icon = Icons.accessibility;
  var newButton5Icon = Icons.accessibility;
  var newButton6Icon = Icons.accessibility;

  var newButton1Text = TextEditingController();
  var newButton2Text = TextEditingController();
  var newButton3Text = TextEditingController();
  var newButton4Text = TextEditingController();
  var newButton5Text = TextEditingController();
  var newButton6Text = TextEditingController();

  String button1Text = 'App1';
  String button2Text = 'App2';
  String button3Text = 'App3';
  String button4Text = 'App4';
  String button5Text = 'App5';
  String button6Text = 'App6';

  Color mainColour = const Color(0xffdbb301);
  Color newColour1 = const Color(0xffdbb301);
  changeMainColour(Color color) {
    setState(() {
      newColour1 = color;
    });
   
  }




  Color subColour = const Color(0x94000000);
  Color newColour2 = const Color(0x94000000);
  changeSubColour(Color color) {
    setState(() {
      newColour2 = color;
    });
  }

  Future<void> appSettings(context) async {
    return showDialog<void>(
        barrierColor: const Color(0x99000000),
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('App Settings'),
            content: const Center(child: Text('Under Progress')),
            actions: <Widget>[
              TextButton(
                child: const Text('Done'),
                onPressed: () {
                  setState(() {});
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  Future<void> colourPicker1(context) async {
    return showDialog<void>(
        barrierColor: const Color(0x99000000),
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            child: Scaffold(
              appBar: AppBar(
                title: const Text('Main Colour Picker'),
                automaticallyImplyLeading: false,
                backgroundColor: mainColour,
              ),
              body: SlidePicker(
                pickerColor: newColour1,
                onColorChanged: changeMainColour,
                colorModel: ColorModel.rgb,
                enableAlpha: true,
                displayThumbColor: false,
                showParams: true,
                showIndicator: true,
                indicatorBorderRadius:
                    const BorderRadius.vertical(top: Radius.circular(25)),
              ),
              floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      mainColour = newColour1;
                    });
                    Navigator.of(context).pop();
                  },
                  backgroundColor: mainColour,
                  child: const Icon(Icons.system_update_tv)),
            ),
          );
        });
  }

  Future<void> colourPicker2(context) async {
    return showDialog<void>(
        barrierColor: const Color(0x99000000),
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            child: Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: mainColour,
                title: const Center(child: Text('Sub Colour Picker')),
              ),
              body: SlidePicker(
                pickerColor: newColour2,
                onColorChanged: changeSubColour,
                colorModel: ColorModel.rgb,
                enableAlpha: true,
                displayThumbColor: false,
                showParams: true,
                showIndicator: true,
                indicatorBorderRadius:
                    const BorderRadius.vertical(top: Radius.circular(25)),
              ),
              floatingActionButton: FloatingActionButton(
                backgroundColor: mainColour,
                child: const Icon(Icons.system_update_tv),
                onPressed: () {
                  setState(() {
                    subColour = newColour2;
                  });
                  Navigator.of(context).pop();
                },
              ),
            ),
          );
        });
  }

  Future<void> appEditor(context) async {
    return showDialog<void>(
      barrierColor: const Color(0x99000000),
      context: context,
      builder: (BuildContext context) {
        return Dialog(
            child: DefaultTabController(
          length: 6,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: mainColour,
              bottom: TabBar(
                tabs: [
                  Tab(
                    icon: Center(child: Icon(button1Icon)),
                  ),
                  Tab(
                    icon: Center(child: Icon(button2Icon)),
                  ),
                  Tab(
                    icon: Center(child: Icon(button3Icon)),
                  ),
                  Tab(
                    icon: Center(child: Icon(button4Icon)),
                  ),
                  Tab(
                    icon: Center(child: Icon(button5Icon)),
                  ),
                  Tab(
                    icon: Center(child: Icon(button6Icon)),
                  ),
                ],
              ),
              title: const Center(child: Text('Tabs Demo')),
              automaticallyImplyLeading: false,
            ),
            body: TabBarView(
              children: [
                Column(
                  children: [
                    Icon(button1Icon,
                        color: Colors.white,
                        size: MediaQuery.of(context).size.width * 0.25),
                    TextFormField(
                      decoration: InputDecoration(labelText: button1Text),
                      controller: newButton1Text,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Icon(button2Icon,
                        color: Colors.white,
                        size: MediaQuery.of(context).size.width * 0.25),
                    TextFormField(
                      decoration: InputDecoration(labelText: button2Text),
                      controller: newButton2Text,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Icon(button3Icon,
                        color: Colors.white,
                        size: MediaQuery.of(context).size.width * 0.25),
                    TextFormField(
                      decoration: InputDecoration(labelText: button3Text),
                      controller: newButton3Text,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Icon(button4Icon,
                        color: Colors.white,
                        size: MediaQuery.of(context).size.width * 0.25),
                    TextFormField(
                      decoration: InputDecoration(labelText: button4Text),
                      controller: newButton4Text,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Icon(button5Icon,
                        color: Colors.white,
                        size: MediaQuery.of(context).size.width * 0.25),
                    TextFormField(
                      decoration: InputDecoration(labelText: button5Text),
                      controller: newButton5Text,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Icon(button6Icon,
                        color: Colors.white,
                        size: MediaQuery.of(context).size.width * 0.25),
                    TextFormField(
                      decoration: InputDecoration(labelText: button6Text),
                      controller: newButton6Text,
                    ),
                  ],
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: mainColour,
              onPressed: () {
                setState(() {
                  if (newButton1Text.text.toString() == '') {
                  } else {
                    button1Text = newButton1Text.text.toString();
                  }

                  if (newButton2Text.text.toString() == '') {
                  } else {
                    button2Text = newButton2Text.text.toString();
                  }

                  if (newButton3Text.text.toString() == '') {
                  } else {
                    button3Text = newButton3Text.text.toString();
                  }

                  if (newButton4Text.text.toString() == '') {
                  } else {
                    button4Text = newButton4Text.text.toString();
                  }

                  if (newButton5Text.text.toString() == '') {
                  } else {
                    button5Text = newButton5Text.text.toString();
                  }

                  if (newButton6Text.text.toString() == '') {
                  } else {
                    button6Text = newButton6Text.text.toString();
                  }
                });
                newButton1Text.clear();
                newButton2Text.clear();
                newButton3Text.clear();
                newButton4Text.clear();
                newButton5Text.clear();
                newButton6Text.clear();
                Navigator.of(context).pop();
              },
              child: const Icon(Icons.system_update_tv),
            ),
          ),
        ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: subColour,
      appBar: AppBar(
        backgroundColor: subColour,
        shadowColor: subColour,
        title: Row(
          children: [
            IconButton(
              onPressed: () {
                appSettings(context);
              },
              icon: Icon(
                Icons.menu,
                color: mainColour,
              ),
            ),
            IconButton(
              onPressed: () {
                colourPicker1(context);
              },
              icon: Icon(
                Icons.color_lens_outlined,
                color: mainColour,
              ),
            ),
            IconButton(
              onPressed: () {
                colourPicker2(context);
              },
              icon: Icon(
                Icons.color_lens_outlined,
                color: mainColour,
              ),
            ),
            IconButton(
              onPressed: () {
                appEditor(context);
              },
              icon: Icon(
                Icons.architecture_outlined,
                color: mainColour,
              ),
            ),
          ],
        ),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'AAC_v2',
                style:
                    TextStyle(color: mainColour, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
      body: Center(
        child: GridView.count(
          shrinkWrap: true,
          crossAxisCount: 2,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                onPressed: () => {speak(button1Text)},
                color: mainColour,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(button1Icon,
                        color: Colors.white,
                        size: MediaQuery.of(context).size.width * 0.25),
                    Text(button1Text,
                        style: const TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                onPressed: () => {speak(button2Text)},
                color: mainColour,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(button2Icon,
                        color: Colors.white,
                        size: MediaQuery.of(context).size.width * 0.25),
                    Text(button2Text,
                        style: const TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                onPressed: () => {speak(button3Text)},
                color: mainColour,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(button3Icon,
                        color: Colors.white,
                        size: MediaQuery.of(context).size.width * 0.25),
                    Text(button3Text,
                        style: const TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                onPressed: () => {speak(button4Text)},
                color: mainColour,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(button4Icon,
                        color: Colors.white,
                        size: MediaQuery.of(context).size.width * 0.25),
                    Text(button4Text,
                        style: const TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                onPressed: () => {speak(button5Text)},
                color: mainColour,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(button5Icon,
                        color: Colors.white,
                        size: MediaQuery.of(context).size.width * 0.25),
                    Text(button5Text,
                        style: const TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                onPressed: () => {speak(button6Text)},
                color: mainColour,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(button6Icon,
                        color: Colors.white,
                        size: MediaQuery.of(context).size.width * 0.25),
                    Text(button6Text,
                        style: const TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: subColour,
        child: Row(),
      ),
    );
  }
}
