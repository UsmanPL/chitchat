final class Message {
  final String id;
  final String text;
  final String? attachmentURL;
  final DateTime dateTime;

  Message(this.id, this.text, this.attachmentURL, this.dateTime);
}
