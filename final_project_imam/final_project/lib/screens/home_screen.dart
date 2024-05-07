// ignore_for_file: unnecessary_string_interpolations

import 'package:final_project/data/plant.dart';
import 'package:final_project/models/plant_model.dart';
import 'package:final_project/screens/details_screen.dart';
import 'package:final_project/screens/user_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.userName});
  final List<Map<String, dynamic>> userName;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Plant> result = [];

  @override
  void initState() {
    for (var element in plantsData) {
      result.add(Plant.fromJson(element));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffb7c099),
        title: Text('Welcome ${widget.userName[0]['name']}'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UserScreen()));
              },
              icon: const Icon(Icons.person_2))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(33),
        child: ListView(
          children: [
            for (int i = 0; i < result.length; i++) ...{
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                                plant: result[i],
                              )));
                },
                child: Container(
                  margin: const EdgeInsets.all(10),
                  width: 300,
                  height: 277,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 4,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        )
                      ],
                      border: Border.all(width: 0.3),
                      color: const Color(0xffE2E2E2),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(25))),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        '${result[i].name}',
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 13,
                      ),
                      Expanded(
                        child: ClipOval(
                          child: Image.network(
                            '${result[i].image}',
                            width: 188,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 13,
                      ),
                      Text(
                        'rating : ${result[i].rating}',
                        style: const TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 22),
                      )
                    ],
                  ),
                ),
              )
            }
          ],
        ),
      ),
    );
  }
}
