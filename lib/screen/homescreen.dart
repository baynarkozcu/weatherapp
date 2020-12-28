import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/models/weathermodel.dart';
import 'package:weatherapp/services/weatherapi.dart';

class MyHomePage extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                      controller: controller,
                      decoration: InputDecoration(
                          labelText: "City :",
                          hintText: "Enter a City Name",
                          prefixIcon: Icon(Icons.location_city),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ))),
                ),
              ],
            ),
            controller.text.length == 0
                ? Padding(
                    padding: EdgeInsets.only(top: 25),
                    child: Center(
                      child: Container(
                        child: Text(
                          "Please Enter a City Name",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ),
                  )
                : Container(
                    height: MediaQuery.of(context).size.height / 2,
                    child: FutureBuilder(
                      future: Services.getWeather(controller.text.trim()),
                      builder: (context, AsyncSnapshot<WeatherModel> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          if (snapshot.hasData) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  snapshot.data.name,
                                  style: TextStyle(
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  getDate(),
                                  style: TextStyle(fontSize: 13),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.wb_sunny_sharp,
                                      size: 25,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(snapshot.data.weather[0].main,
                                        style: TextStyle(fontSize: 20))
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  snapshot.data.weather[0].description,
                                  style: TextStyle(fontSize: 25),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  snapshot.data.main.temp.toString() + " °C",
                                  style: TextStyle(fontSize: 25),
                                ),
                              ],
                            );
                          } else {
                            return Center(
                              child: Text("Search city was not found"),
                            );
                          }
                        }
                      },
                    ),
                  ),
            Container(
              height: MediaQuery.of(context).size.height / 3,
            )
          ],
        ));
  }

  String getDate() {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('dd.MM.yyyy');
    final String formatted = formatter.format(now);
    getTime();
    return formatted;
  }

  String getTime() {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('HH:mm');
    final String formatted = formatter.format(now);
    debugPrint("Saat" + formatted);
    //return formatted;
  }
}
