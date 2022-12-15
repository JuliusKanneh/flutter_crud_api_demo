import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http_rest_api/base_client.dart';
import 'package:http_rest_api/components/app_button.dart';
import 'package:http_rest_api/model/Farmer.dart';
import 'package:http_rest_api/views/form_view.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const FlutterLogo(
                size: 72,
              ),
              AppButton(
                operation: 'GET',
                operationColor: Colors.lightGreen,
                description: 'Fetch users',
                onPressed: () async {
                  var response = await BaseClient().get('farmer');
                  var type = response.runtimeType;
                  debugPrint('Type: $type');
                  if (response == null) {
                    debugPrint('Error');
                    debugPrint(response.length.toString());
                    return;
                  }
                  debugPrint('Successfully made request!');
                  debugPrint('Response Body: $response');

                  debugPrint('Famer Details: $response');
                  var farmerLength = response.length.toString();
                  debugPrint('Farmer count: $farmerLength');
                },
              ),
              AppButton(
                operation: 'POST',
                operationColor: Colors.lightBlue,
                description: 'Add user',
                onPressed: () async {
                  var farmer = Farmer(
                    names: "Mathew Ballah",
                    surname: "Kollie III",
                    dob: DateTime.utc(2003, 06, 29),
                    nid: "nid-210920378045",
                    maritalStatus: "single",
                    gender: "male",
                    languages: ["english", "french"],
                    profession: "Farmer",
                    contacts: "0886555444",
                    email: "mathew@gmail.com",
                    address: Address(
                        city: "Kigali",
                        country: "Rwanda",
                        street: "kk3",
                        district: "Remera",
                        continent: "Africa",
                        region: "East Africa"),
                  );
                  var post = await BaseClient()
                      .post(
                    'farmer',
                    farmer,
                  )
                      .catchError((e) {
                    debugPrint(e.toString());
                  });
                  debugPrint(post);
                },
              ),
              AppButton(
                operation: 'PUT',
                operationColor: Colors.orangeAccent,
                description: 'Edit user',
                onPressed: () async {
                  var farmer = Farmer(
                    names: "Mathew B",
                    nid: "nid-210925558045",
                    surname: "Kollie III",
                    dob: DateTime.utc(2003, 06, 29),
                    gender: "male",
                    maritalStatus: "single",
                  );
                  var response = await BaseClient()
                      .put("farmer/6395fd17a1159b382082957e", farmer);
                  debugPrint(response);
                },
              ),
              AppButton(
                operation: 'DEL',
                operationColor: Colors.red,
                description: 'Delete user',
                onPressed: () async {
                  var response =
                      await BaseClient().del("farmer/6395fd17a1159b382082957e");
                  debugPrint(response);
                },
              ),
              AppButton(
                operation: 'Open',
                operationColor: const Color.fromARGB(255, 7, 7, 7),
                description: 'Open Form',
                onPressed: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const FormView(),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
