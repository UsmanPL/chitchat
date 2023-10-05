import 'package:chitchat/constants/globals.dart';
import 'package:chitchat/pages/authentication_pages/login_page.dart';
import 'package:chitchat/utils/size_config.dart';
import 'package:chitchat/utils/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() => runApp(
      const ProviderScope(
        child: ChitChat(),
      ),
    );

class ChitChat extends StatefulWidget {
  const ChitChat({super.key});

  @override
  State<ChitChat> createState() => _ChitChatState();
}

class _ChitChatState extends State<ChitChat> {
  @override
  void didChangeDependencies() {
    sizeConfig = SizeConfig.init(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: MaterialApp(
          title: 'Chit Chat',
          theme: AppTheme.data(),
          home: const LoginPage(),
        ),
      );
}
