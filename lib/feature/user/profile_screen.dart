import 'package:flutter/material.dart';
import 'package:task/styles/colors.dart';

import '../../styles/text_styles.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: backGroundColor,
          appBar: AppBar(
            elevation: 1,
            backgroundColor: greenButtonColor,
            leading: InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back,
                color: whiteColor,
              ),
            ),
            titleSpacing: 0,
            title: Text(
              'Profile',
              style: appBarTitleTextStyle,
            ),
          ),
          body: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              const CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('assets/images/profile_pic.jpeg'),
              ),
              const SizedBox(height: 6),
              Text(
                'David',
                style: nameTextStyle,
              ),

              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: Card(
                  elevation: 1,
                  color: whiteColor,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(top: 10,bottom: 10,left: 20,right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'Email',
                          style: profileTitleTextStyle,
                        ),

                        const SizedBox(height: 5),

                        Text(
                            'ashnakanakaraj704@gmail.com',
                          style: profileDataTextStyle,
                        ),

                        const SizedBox(height: 5),

                         Divider(color: Colors.grey.shade300),

                        const SizedBox(height: 5),

                        Text(
                            'Date of Birth',
                          style: profileTitleTextStyle,
                        ),

                        const SizedBox(height: 5),

                        Text(
                            '30 Sep 2024',
                          style: profileDataTextStyle,
                        ),

                        const SizedBox(height: 5),

                        Divider(color: Colors.grey.shade300),

                        const SizedBox(height: 5),

                    Text(
                        'Phone Number',
                      style: profileTitleTextStyle,
                    ),

                    const SizedBox(height: 5),

                    Text(
                        '1572439578',
                      style: profileDataTextStyle,
                    ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}
