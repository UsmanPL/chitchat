import 'package:chitchat/constants/globals.dart';
import 'package:chitchat/models/message.dart';
import 'package:chitchat/providers/chat_provider.dart';
import 'package:chitchat/utils/extensions/date_time_extensions.dart';
import 'package:chitchat/widgets/image_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatPage extends ConsumerStatefulWidget {
  const ChatPage({super.key});

  @override
  ChatPageState createState() => ChatPageState();
}

class ChatPageState extends ConsumerState<ChatPage> {
  bool isShowSearch = false;
  CrossFadeState appBarState = CrossFadeState.showFirst;

  @override
  void initState() {
    ref.read(chatProvider);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: const Color(0xFFF4F7FA),
        appBar: AppBar(
          title: AnimatedCrossFade(
            firstChild: Row(
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
            secondChild: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 5,
              ),
              height: sizeConfig.height(.05),
              child: const TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  fillColor: Color(0xFFF4F7FA),
                  hintText: "Search messages..",
                ),
              ),
            ),
            crossFadeState: appBarState,
            duration: const Duration(milliseconds: 150),
          ),
          actions: [
            IconButton(
              icon: AnimatedCrossFade(
                firstChild: const Icon(
                  Icons.search,
                ),
                secondChild: const Icon(
                  Icons.close,
                ),
                crossFadeState: appBarState,
                duration: const Duration(milliseconds: 150),
              ),
              onPressed: _updateAppBarState,
            )
          ],
        ),
        body: Consumer(
          builder: (context, ref, child) {
            final messages = ref.watch(chatProvider);
            return ListView.builder(
              padding: EdgeInsets.only(
                bottom: sizeConfig.height(.2),
              ),
              itemCount: messages.length,
              itemBuilder: (BuildContext context, int index) => _ChatBubble(
                index: index,
                message: messages[index],
              ),
            );
          },
        ),
        bottomSheet: const _MessageBar(),
      );

  // Functions
  void _updateAppBarState() {
    isShowSearch = !isShowSearch;
    setState(() => appBarState =
        isShowSearch ? CrossFadeState.showSecond : CrossFadeState.showFirst);
  }
}

class _ChatBubble extends StatelessWidget {
  final Message message;
  final int index;

  const _ChatBubble({required this.index, required this.message});

  @override
  Widget build(BuildContext context) => Align(
        alignment:
            index % 2 == 0 ? Alignment.centerRight : Alignment.centerLeft,
        child: UnconstrainedBox(
          child: Row(
            children: [
              if (index % 2 == 0)
                Text(
                  message.dateTime.toFormattedTime,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: sizeConfig.height(.005),
                  horizontal: sizeConfig.width(.04),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: sizeConfig.height(.01),
                  horizontal: sizeConfig.width(.02),
                ),
                // alignment: index % 2 == 0
                //     ? Alignment.centerLeft
                //     : Alignment.centerRight,
                constraints: BoxConstraints(
                  maxWidth: sizeConfig.width(.65),
                ),
                decoration: BoxDecoration(
                  color: index % 2 == 0
                      ? Theme.of(context).colorScheme.primary
                      : Colors.white,
                  borderRadius: index % 2 == 0
                      ? const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(0),
                        )
                      : const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(10),
                        ),
                ),
                child: Column(
                  children: [
                    Text(
                      message.text,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: index % 2 == 0 ? Colors.white : Colors.black,
                          ),
                    ),
                    if (message.attachmentURL != null)
                      ImageTile(
                        imageUrl: message.attachmentURL!,
                        size: sizeConfig.height(.3),
                        borderRadius: 0,
                      ),
                  ],
                ),
              ),
              if (index % 2 != 0)
                Text(
                  message.dateTime.toFormattedTime,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
            ],
          ),
        ),
      );
}

class _MessageBar extends ConsumerStatefulWidget {
  const _MessageBar();

  @override
  _MessageBarState createState() => _MessageBarState();
}

class _MessageBarState extends ConsumerState<_MessageBar> {
  late final TextEditingController _textController;

  @override
  void initState() {
    _textController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Container(
        padding: EdgeInsets.only(
          top: sizeConfig.height(.02),
          bottom: sizeConfig.safeArea.bottom + sizeConfig.height(.01),
          left: sizeConfig.width(.03),
          right: sizeConfig.width(.03),
        ),
        color: Colors.white,
        child: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.attachment_outlined,
                color: Colors.grey,
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 5,
                ),
                height: sizeConfig.height(.075),
                child: TextField(
                  controller: _textController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    fillColor: Color(0xFFF4F7FA),
                    hintText: "Type here...",
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: () => _addMessage(ref),
              icon: Icon(
                Icons.send_rounded,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ],
        ),
      );

  // Functions
  void _addMessage(WidgetRef ref) {
    ref.read(chatProvider.notifier).addMessage(
          Message(
            DateTime.now().millisecondsSinceEpoch.toString(),
            _textController.text,
            "https://images.unsplash.com/photo-1635898445837-65c066642d81?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1740&q=80",
            DateTime.now(),
          ),
        );
    _textController.clear();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}
