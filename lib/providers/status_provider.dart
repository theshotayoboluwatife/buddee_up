import 'package:BuddeeUp/providers/status_data.dart';
import 'package:flutter/material.dart';


class Status with ChangeNotifier {
  final List<StatusData> _statusData = [
    StatusData(name: "You", imageUrl: "assets/images/photo.png"),
    StatusData(name: "Emma", imageUrl: "assets/images/photo1.png"),
    StatusData(name: "Ava", imageUrl: "assets/images/photo2.png"),
    StatusData(name: "Sophia", imageUrl: "assets/images/photo3.png"),
    StatusData(name: "Amelia", imageUrl: "assets/images/photo4.png"),
  ];

  List <StatusData> get statusData {
    return  [..._statusData];
  }

}
