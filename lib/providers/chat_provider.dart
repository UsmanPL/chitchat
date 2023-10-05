import 'package:chitchat/models/message.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatNotifier extends StateNotifier<List<Message>> {
  ChatNotifier() : super([]);

  void addMessage(Message message) {
    state = [...state, message];
  }
}

final chatProvider = StateNotifierProvider<ChatNotifier, List<Message>>(
  (ref) => ChatNotifier(),
);
