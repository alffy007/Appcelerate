import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List toDos = [];
  final controller = TextEditingController();
  Widget listContainer() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: toDos.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: ((context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Container(
              height: 80,
              width: 220,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(197, 42, 42, 42)),
              child: Padding(
                padding: const EdgeInsets.only(top: 16, left: 20),
                child: Text(
                  toDos[index],
                  style: const TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20, top: 15),
              child: Row(
                children: [
                  Text(
                    'Hi, Alfred ',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 160,
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      openDialog();
                    },
                    backgroundColor: Color.fromARGB(255, 13, 5, 60),
                    child: Icon(Icons.add),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Welcome',
                style: TextStyle(
                    color: Color.fromARGB(248, 255, 7, 7), fontSize: 40),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset('assets/images/planet.webp')),
            ),
            Expanded(child: listContainer())
          ],
        ),
      ),
    );
  }

  Future openDialog() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Create ToDo'),
            content: TextField(
              controller: controller,
              autofocus: true,
              decoration: const InputDecoration(hintText: 'Enter here'),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    setState(() {
                      toDos.add(controller.text);
                      controller.text = '';
                    });
                    goBack();
                  },
                  child: const Text('Submit'))
            ],
          );
        });
  }

  void goBack() {
    Navigator.of(context).pop();
  }
}
