import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHomePage2 extends StatefulWidget {
  @override
  _MyHomePage2State createState() => _MyHomePage2State();
}

class _MyHomePage2State extends State<MyHomePage2> {
  ThemeMode _themeMode = ThemeMode.system;

  @override
  Widget build(BuildContext context) {
    print('${MediaQuery.of(context).platformBrightness}');
    print('${Theme.of(context).brightness}');
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Text(
              'System Brightness: ${Get.mediaQuery.platformBrightness.toString()}',
              style: TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(height: 24),
          Center(
            child: Text(
              'Theme Brightness: ${Get.theme.brightness.toString()}',
              style: TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(height: 24),
          Text(
            'ThemeMode',
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.left,
          ),
          RadioListTile(
            title: Text('system'),
            value: ThemeMode.system,
            groupValue: _themeMode,
            onChanged: (value) {
              setState(() {
                _themeMode = value;
                Get.changeThemeMode(_themeMode); //STEP 3 - change themes
              });
            },
          ),
          RadioListTile(
            title: Text('dark'),
            value: ThemeMode.dark,
            groupValue: _themeMode,
            onChanged: (value) {
              setState(() {
                _themeMode = value;
                Get.changeThemeMode(_themeMode);
              });
            },
          ),
          RadioListTile(
            title: Text('light'),
            value: ThemeMode.light,
            groupValue: _themeMode,
            onChanged: (value) {
              setState(() {
                _themeMode = value;
                Get.changeThemeMode(_themeMode);
              });
            },
          ),
        ],
      ),
    );
  }
}
