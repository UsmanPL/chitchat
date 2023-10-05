import 'package:chitchat/constants/globals.dart';
import 'package:chitchat/widgets/image_tile.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              ImageTile(
                imageUrl: dummyImageURL,
                size: sizeConfig.height(.06),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                "Syed Usman",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
        ),
        body: ListView.builder(
          itemCount: 100,
          itemBuilder: (BuildContext context, int index) => Text("Hello world"),
        ),
        bottomSheet: Container(
          color: Colors.teal,
          height: 100,
        ),
      );
}
