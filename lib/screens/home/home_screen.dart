import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_online_buddies/constants/constants.dart';
import 'package:my_online_buddies/controllers/home/home_controller.dart';
import 'package:my_online_buddies/models/friend_model.dart';
import 'package:my_online_buddies/screens/add_friends/add_friends.dart';
import 'package:my_online_buddies/screens/home/single_view.dart';
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
  List<FriendModel> friendsModelList = [];
  String? image;
  String? name;
  String? desc;
  String? mobile;

  @override
  void initState() {
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
          child: GetBuilder<HomeController>(
            builder: (ctrl) {
              return StreamBuilder<QuerySnapshot>(
                  stream:
                      FirebaseFirestore.instance.collection('users').doc(ctrl.userID).collection('friends').snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      friendsModelList.clear();
                      for (var element in snapshot.data!.docs) {
                        FriendModel friendModel =
                            FriendModel.fromQuerySnapshot(element);

                        friendsModelList.add(friendModel);
                      }

                      return ListView.builder(
                          itemCount: friendsModelList.length,
                          itemBuilder: (context, index) {
                            image = friendsModelList[index].image;

                            print('..................${snapshot.data!.docs[index].id}');
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                onTap: () {
                                  Get.dialog(
                                    SingleFriendScreen(
                                      name: friendsModelList[index].name,
                                      number: friendsModelList[index].number,
                                      desc: friendsModelList[index].desc,
                                      friendKey: snapshot.data!.docs[index].id,
                                      image: friendsModelList[index].image,
                                    ),
                                  );
                                },
                                leading: image == null
                                    ? const CircleAvatar(
                                        backgroundImage: AssetImage(kGallery),
                                      )
                                    : CircleAvatar(
                                        backgroundImage: NetworkImage(image!),
                                      ),
                                tileColor: Colors.yellow,
                                title: MyText(text: friendsModelList[index].name),
                                subtitle:
                                    MyText(text: friendsModelList[index].number),
                              ),
                            );
                          });
                    }
                  });
            }
          )),
    );
  }
}
