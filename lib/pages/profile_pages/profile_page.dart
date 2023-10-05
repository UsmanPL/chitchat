import 'package:chitchat/widgets/image_tile.dart';
import 'package:chitchat/widgets/native_button.dart';
import 'package:flutter/material.dart';

import '../../constants/globals.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(
                left: sizeConfig.width(.05),
              ),
              child: Text(
                "Profile",
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                vertical: sizeConfig.height(.02),
                horizontal: sizeConfig.width(.04),
              ),
              padding: EdgeInsets.symmetric(
                vertical: sizeConfig.height(.02),
                horizontal: sizeConfig.width(.04),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: const Offset(0, 1), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: [
                  ImageTile(
                    imageUrl: dummyImageURL,
                    size: sizeConfig.height(.2),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: sizeConfig.height(.02),
                    ),
                    child: Text(
                      "Syed Usman",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: sizeConfig.height(.01),
                      bottom: sizeConfig.height(.03),
                    ),
                    child: Text(
                      "usman.akhlaq@purelogics.net",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                  NativeButton(
                    child: const Text("Edit Profile"),
                    onTap: () {},
                  ),
                ],
              ),
            )
          ],
        ),
      );
}
