import 'package:chitchat/constants/globals.dart';
import 'package:chitchat/pages/chat_pages/chat_page.dart';
import 'package:chitchat/widgets/image_tile.dart';
import 'package:flutter/material.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

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
                "Chats",
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                vertical: sizeConfig.height(.02),
                horizontal: sizeConfig.width(.05),
              ),
              child: TextField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      width: 2,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  prefixIcon: const Icon(Icons.search),
                  hintText: "Search chats",
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) =>
                    const _ChatListTile(),
              ),
            ),
          ],
        ),
      );
}

class _ChatListTile extends StatelessWidget {
  const _ChatListTile();

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () => _goToChatPage(context),
        child: Container(
          margin: EdgeInsets.symmetric(
            vertical: sizeConfig.height(.02),
            horizontal: sizeConfig.width(.05),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageTile(
                imageUrl: dummyImageURL,
                size: sizeConfig.height(.08),
              ),
              SizedBox(
                width: sizeConfig.width(.03),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: sizeConfig.width(.65),
                    child: Text(
                      "Syed Usman",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                  SizedBox(
                    height: sizeConfig.height(.005),
                  ),
                  SizedBox(
                    width: sizeConfig.width(.65),
                    child: Text(
                      "I will be waiting for the update from you. In the mean time I will look for the document.",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );

  // Functions
  void _goToChatPage(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const ChatPage(),
        ),
      );
}
