import 'package:contacts_01/ui/new_note_page.dart';

///import 'package:contacts_01/ui/weatherui.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/Weather.dart';
import 'models/api.dart';
import 'models/current.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Car App',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Weather'),
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
  late Future<Weather> futureWeather;

  @override
  void initState() {
    super.initState();
    futureWeather = FetchAPi().fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.menu,
                size: 30,
                color: Colors.white,
              ),
            )
            // Container(
            //       child: SvgPicture.asset(
            //     'images/menu.svg',
            //     height: 30,
            //   ))
            ),
        body: Center(
            child: FutureBuilder<Weather>(
                future: futureWeather,
                builder: (context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return const Center(child: Text("Something Went Wrong"));
                  } else {
                    return Container(
                      child: Stack(children: [
                        Image.asset(
                          'images/final-winter.jpg',
                          fit: BoxFit.cover,
                          height: double.infinity,
                          width: double.infinity,
                        ),
                        Container(
                            decoration:
                                const BoxDecoration(color: Colors.black54)),
                        Container(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                SizedBox(height: 120),
                                Center(
                                  child: Text(
                                    snapshot.data.cityName,
                                    style: TextStyle(
                                        fontSize: 40,
                                        fontFamily: 'Arial',
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(13.0),
                                  child: Center(
                                    child: Text(
                                        "${snapshot.data.temp.toInt()}" + ' °C',
                                        style: TextStyle(
                                            fontSize: 40,
                                            fontFamily: 'Arial',
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white)),
                                  ),
                                ),
                                Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.network(
                                        "https:" + snapshot.data.Icon,
                                        height: 50,
                                        width: 50,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(snapshot.data.IconText,
                                            style: TextStyle(
                                                fontSize: 19,
                                                fontFamily: 'Arial',
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white)),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(13.0),
                                  child: Center(
                                    child: Column(
                                      children: [
                                        Text("Last Update:",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontFamily: 'Arial',
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white)),
                                        Text(snapshot.data.lastUpdate,
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontFamily: 'Arial',
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white))
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 100,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 0.3, color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(35)),
                                      child: Column(
                                        children: [
                                          Text(
                                            "23 " + "\u00B0" + ' C',
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Image(
                                            image: NetworkImage(
                                                "https:" + snapshot.data.Icon),
                                            width: 50,
                                            height: 50,
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            "Sat",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.grey),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 50,
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 0.3, color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(35)),
                                      child: Column(
                                        children: [
                                          Text(
                                            "23 " + "\u00B0" + ' C',
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Image(
                                            image: NetworkImage(
                                                "https:" + snapshot.data.Icon),
                                            width: 50,
                                            height: 50,
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            "Sun",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.grey),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 50,
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 0.3, color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(35)),
                                      child: Column(
                                        children: [
                                          Text(
                                            "23 " + "\u00B0" + ' C',
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Image(
                                            image: NetworkImage(
                                                "https:" + snapshot.data.Icon),
                                            width: 50,
                                            height: 50,
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            "Mon",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.grey),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ))
                      ]),
                    );
                    //////////
                  }
                })),
      ),
    );
  }
}
