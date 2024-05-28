import 'package:firebase/page/database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

void uploadData(BuildContext context) async {
  Map<String, dynamic> uploadDataUser = {
    'FirstName': firstNameController.text,
    'LastName': lastNameController.text,
    'Age': ageController.text,
  };

  try {
    await DatabaseMethods().addUserDetails(uploadDataUser);
    Fluttertoast.showToast(
      msg: "Data Uploaded Successfully",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
    Navigator.pop(context);
  } catch (e) {
    Fluttertoast.showToast(
      msg: "Error: $e",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}

TextEditingController firstNameController = TextEditingController();
TextEditingController lastNameController = TextEditingController();
TextEditingController ageController = TextEditingController();

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Firebase CRUD',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 30.0),
                child: Text(
                  'First Name',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 3.0,
                  horizontal: 20.0,
                ),
                margin: const EdgeInsets.symmetric(horizontal: 20.0),
                decoration: BoxDecoration(
                  color: const Color(0xFF4c59a5),
                  borderRadius: BorderRadius.circular(22),
                ),
                child: TextField(
                  controller: firstNameController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Your First Name',
                    hintStyle: TextStyle(
                      color: Colors.white60,
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 30.0),
                child: Text(
                  'Last Name',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 3.0,
                  horizontal: 20.0,
                ),
                margin: const EdgeInsets.symmetric(horizontal: 20.0),
                decoration: BoxDecoration(
                  color: const Color(0xFF4c59a5),
                  borderRadius: BorderRadius.circular(22),
                ),
                child: TextField(
                  controller: lastNameController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Your Last Name',
                    hintStyle: TextStyle(
                      color: Colors.white60,
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 30.0),
                child: Text(
                  'Age',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 3.0,
                  horizontal: 20.0,
                ),
                margin: const EdgeInsets.symmetric(horizontal: 20.0),
                decoration: BoxDecoration(
                  color: const Color(0xFF4c59a5),
                  borderRadius: BorderRadius.circular(22),
                ),
                child: TextField(
                  controller: ageController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Your Age Name',
                    hintStyle: TextStyle(
                      color: Colors.white60,
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 90),
              GestureDetector(
                onTap: () {
                  uploadData(context);
                },
                child: Center(
                  child: Container(
                    width: 150,
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        'Create',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
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
