// ignore_for_file: prefer_const_constructors

import 'package:final_project/models/person_model.dart';
import 'package:final_project/services/services.dart';
import 'package:final_project/widgets/rich_text_widget.dart';
import 'package:flutter/material.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

List<Person> person = [];
List<Person> person1 = [];

Future<List<Person>> getData() async {
  person = await Services().getUser();
  for (var element in person) {
    person1.add(element);
  }

  // print(person);

  return person1;
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xffb7c099),
          title: const Text('Users'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: FutureBuilder(
            future: getData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Container(
                          width: 300,
                          height: 110,
                          decoration: const BoxDecoration(
                              color: Color(0xffE2E2E2),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25))),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichTextWidget(
                                  text1: 'name : ',
                                  text2: '${snapshot.data![index].name}',
                                  fun: () {},
                                  size1: 17,
                                  size2: 13,
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                RichTextWidget(
                                  text1: 'email : ',
                                  text2: '${snapshot.data![index].email}',
                                  fun: () {},
                                  size1: 17,
                                  size2: 13,
                                ),
                              ],
                            ),
                          ),
                        ),
                        trailing: IconButton(
                            onPressed: () {
                              person1.remove(snapshot.data![index]);
                              setState(() {});
                            },
                            icon: const Icon(Icons.delete)),
                      );
                    },
                  );
                }
              }
              return Container();
            },
          ),
        ));
  }
}
