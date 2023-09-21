import 'package:chatview/chatview.dart';

class Data {
  static const profileImage =
      "https://raw.githubusercontent.com/SimformSolutionsPvtLtd/flutter_showcaseview/master/example/assets/simform.png";


  static final messageList = [
    Message(
      id: '2',
      message:
          "Hi Jake, how are you? I saw on the app that we’ve crossed paths several times this week 😄",
      createdAt: DateTime.now(),
      sendBy: '2', // userId of who sends the message
      status: MessageStatus.read,
    ),
    Message(
      id: '2',
      message:
          "Haha truly! Nice to meet you Grace! What about a cup of coffee today evening? ☕️ ",
      createdAt: DateTime.now(),
      sendBy: '1', // userId of who sends the message
      status: MessageStatus.read,
    ),
    Message(
      id: '1',
      message:
          "Great I will write later the exact time and place. See you soon!",
      createdAt: DateTime.now(),
      sendBy: '1', // userId of who sends the message
      status: MessageStatus.read,
    ),
    Message(
      id: '2',
      message: "https://deih43ym53wif.cloudfront.net/large_florence-italy-shutterstock_592336670_ccaf07e157.jpeg",
      createdAt: DateTime.now(),
      messageType: MessageType.image,
      sendBy: '2',
      status: MessageStatus.read,
    ),
    Message(
      id: '1',
      message:
          "It would be nice to see you",
      createdAt: DateTime.now(),
      sendBy: '1', // userId of who sends the message
      status: MessageStatus.read,
    ),
  ];
}
