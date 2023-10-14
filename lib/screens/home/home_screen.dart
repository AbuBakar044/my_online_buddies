import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_online_buddies/constants/constants.dart';
import 'package:my_online_buddies/controllers/home/home_controller.dart';
import 'package:my_online_buddies/screens/add_friends/add_friends.dart';
import 'package:my_online_buddies/utils/colors.dart';
import 'package:my_online_buddies/widgets/custom_appbar.dart';
import 'package:my_online_buddies/widgets/my_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CollectionReference reference =
      FirebaseFirestore.instance.collection('buddies');
  bool isDataReceived = false;
  QuerySnapshot? querySnapshot;
  List data = [];
  String? image;

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final homeCtrl = Get.put<HomeController>(HomeController());
    return Scaffold(
      appBar: const CustomAppBar(
        text: 'Home Screen',
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => const AddFriendsScreen());
        },
        backgroundColor: Colors.blue,
        child: const Icon(
          Icons.add_circle_sharp,
          color: kWhiteColor,
        ),
      ),
      drawer: Drawer(
        child: Center(
          child: TextButton(
            onPressed: () {
              homeCtrl.logoutUser();
            },
            child: const MyText(text: 'Logout'),
          ),
        ),
      ),
      body: SizedBox(
          height: Get.height,
          width: Get.width,
          child: data.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    if (data[index].toString().contains('image')) {
                      image = data[index]['image'];
                    }
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: image == null
                            ? const CircleAvatar(
                                backgroundImage: AssetImage(kGallery),
                              )
                            : CircleAvatar(
                                backgroundImage: NetworkImage(image!),
                              ),
                        tileColor: Colors.yellow,
                        title: MyText(text: data[index]['name']),
                        subtitle: MyText(text: data[index]['number']),
                      ),
                    );
                  })),
    );
  }

  Future<void> getData() async {
    querySnapshot =
        await FirebaseFirestore.instance.collection('buddies').get();
    setState(() {
      data = querySnapshot!.docs;
    });
  }
}
