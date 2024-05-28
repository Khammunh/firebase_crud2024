import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/page/database.dart';
import 'package:firebase/page/home.dart';
import 'package:flutter/material.dart';

class ReadData extends StatefulWidget {
  const ReadData({super.key});

  @override
  State<ReadData> createState() => _ReadDataState();
}

class _ReadDataState extends State<ReadData> {
  String? firstName, lastName, age, id;
  TextEditingController textController = new TextEditingController();

  searchUser(String name) async {
    QuerySnapshot querySnapshot = await DatabaseMethods().gettingUserInfo(name);

    firstName = "${querySnapshot.docs[0]["FirstName"]}";
    lastName = "${querySnapshot.docs[0]["LastName"]}";
    age = "${querySnapshot.docs[0]["Age"]}";
    id = querySnapshot.docs[0].id;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Read Data'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20.0),
              const Padding(
                padding: EdgeInsets.only(left: 30.0),
                child: Text(
                  'Write User First Name',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
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
                  controller: textController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter First Name',
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 60),
              GestureDetector(
                onTap: () {
                  searchUser(textController.text);
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
                        'Search',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              GestureDetector(
                onTap: () async {
                  await DatabaseMethods().UpdateUserData('25', id!);
                  searchUser(textController.text);
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
                        'Update',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 90.0),
              firstName == null
                  ? Container()
                  : Center(
                      child: Text(
                        "FirstName : " + firstName!,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
              const SizedBox(height: 10.0),
              firstName == null
                  ? Container()
                  : Center(
                      child: Text(
                        "LastName : " + lastName!,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
              const SizedBox(height: 10.0),
              firstName == null
                  ? Container()
                  : Center(
                      child: Text(
                        "Age : " + age!,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
