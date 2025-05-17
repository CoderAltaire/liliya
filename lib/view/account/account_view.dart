import 'dart:io';

import 'package:com.example.liliya/hive_helper/hive_names.dart';
import 'package:com.example.liliya/models/user_data.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../common/color_extenstion.dart';
import '../../common_widget/your_review_row.dart';

class AccountView extends StatefulWidget {
  const AccountView({super.key});

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  List purArr = ["assets/img/p1.jpg", "assets/img/p2.jpg", "assets/img/p3.jpg"];

  List sResultArr = [
    {
      "img": "assets/img/p1.jpg",
      "description":
          "A must read for everybody. This book taught me so many things about...",
      "rate": 5.0,
    },
    {
      "img": "assets/img/p2.jpg",
      "description":
          "#1 international bestseller and award winning history book.",
      "rate": 4.0,
    },
  ];
  final userdata = HiveBoxes.userdatas.values;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios, color: TColor.primary),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${userdata.first.firstname ?? "Ayyubxon"} ${userdata.first.lastname ?? "Ahmadjonov"}',
                          style: TextStyle(
                            color: TColor.text,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "Constantly travelling and keeping up to date with business related books.",
                          style: TextStyle(
                            color: TColor.subTitle,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(35),
                    child: Image.asset(
                      "assets/img/u1.png",
                      width: 70,
                      height: 70,
                    ),
                  ),
                  const SizedBox(width: 15),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                children: [
                  Icon(Icons.near_me_sharp, color: TColor.subTitle, size: 15),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "Newcastle - Australia",
                      style: TextStyle(color: TColor.subTitle, fontSize: 13),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    height: 30.0,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: TColor.button),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: TColor.primary,
                          blurRadius: 2,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      onPressed: () async {
                        bool? updated = await showMiniProfileDialog(
                          context,
                          firstname: userdata.first.firstname,
                          lastname: userdata.first.lastname,
                        );
                        if (updated == true) {
                          setState(() {}); // Rebuild the AccountView
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                      ),
                      child: const Text(
                        'Edit Profile',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "21",
                        style: TextStyle(
                          color: TColor.subTitle,
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Books",
                        style: TextStyle(color: TColor.subTitle, fontSize: 11),
                      ),
                    ],
                  ),
                  const SizedBox(width: 30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "5",
                        style: TextStyle(
                          color: TColor.subTitle,
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Reviews",
                        style: TextStyle(color: TColor.subTitle, fontSize: 11),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
              child: Text(
                "Your purchases (21)",
                style: TextStyle(
                  color: TColor.subTitle,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Stack(
              alignment: Alignment.centerLeft,
              children: [
                Container(
                  height: media.width * 0.4,
                  width: media.width * 0.45,
                  decoration: const BoxDecoration(
                    color: Color(0xffFF5957),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children:
                        purArr.map((iName) {
                          var isFirst = purArr.first == iName;
                          var isLast = purArr.last == iName;
                          return Container(
                            margin: const EdgeInsets.symmetric(
                              vertical: 2,
                              horizontal: 12,
                            ),

                            padding:
                                isFirst
                                    ? const EdgeInsets.only(left: 25)
                                    : (isLast
                                        ? const EdgeInsets.only(right: 25)
                                        : null),
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 2),

                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 2,
                                    offset: Offset(0, 1),
                                  ),
                                ],
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.asset(
                                  iName,
                                  height: media.width * 0.5,
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
              child: Text(
                "Your reviews (7)",
                style: TextStyle(
                  color: TColor.subTitle,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 25),
              itemCount: sResultArr.length,
              itemBuilder: (context, index) {
                var rObj = sResultArr[index] as Map? ?? {};
                return YourReviewRow(sObj: rObj);
              },
            ),
          ],
        ),
      ),
    );
  }

  /// Displays a dialog allowing the user to edit their profile information.
  ///
  /// Opens an AlertDialog that contains fields to update the first name,
  /// last name, and profile image. The profile image can be selected from
  /// the gallery. The updated information is saved to Hive storage when
  /// the "Save" button is pressed.
  ///
  /// - Parameters:
  ///   - context: The BuildContext in which the dialog is displayed.
  ///   - firstname: The current first name to display in the dialog.
  ///   - lastname: The current last name to display in the dialog.
  Future<bool?> showMiniProfileDialog(
    BuildContext context, {
    required String? firstname,
    required String? lastname,
  }) async {
    final firstnameController = TextEditingController(text: firstname);
    final lastnameController = TextEditingController(text: lastname);
    String? imagePath;

    return showDialog<bool>(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              title: const Text("Edit Profile"),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        final picked = await ImagePicker().pickImage(
                          source: ImageSource.gallery,
                        );
                        if (picked != null) {
                          setState(() {
                            imagePath = picked.path;
                          });
                        }
                      },
                      child: CircleAvatar(
                        radius: 40,
                        backgroundImage:
                            imagePath != null
                                ? FileImage(File(imagePath!))
                                : const AssetImage("assets/img/u1.png")
                                    as ImageProvider,
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: firstnameController,
                      decoration: const InputDecoration(
                        labelText: 'First Name',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: lastnameController,
                      decoration: const InputDecoration(
                        labelText: 'Last Name',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: const Text("Cancel"),
                ),
                ElevatedButton(
                  onPressed: () {
                    String first = firstnameController.text.trim();
                    String last = lastnameController.text.trim();
                    HiveBoxes.userdatas.put("user", UserData(first, last));
                    Navigator.pop(
                      context,
                      true,
                    ); // Return true to indicate save
                  },
                  child: const Text("Save"),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
