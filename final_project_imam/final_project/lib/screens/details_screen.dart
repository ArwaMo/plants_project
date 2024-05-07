import 'package:final_project/models/plant_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.plant});
  final Plant plant;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffb7c099),
        title: const Text('Plant Details'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Image.network(
                plant.image,
                width: 213,
              ),
              const SizedBox(
                height: 13,
              ),
              Text(
                plant.name,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                plant.type,
                style: const TextStyle(
                    color: Color(0xff878686),
                    fontSize: 18,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 13,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Image.asset('assets/star.png'),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        '${plant.rating}',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        '${plant.price} S.R',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400),
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                plant.description,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
              )
            ],
          ),
        ),
      ),
    );
  }
}
