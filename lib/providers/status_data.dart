import 'dart:core';

import 'package:flutter/material.dart';

class StatusData with ChangeNotifier {
  final String name;
  final String imageUrl;
  StatusData({
    required this.name,
    required this.imageUrl,
  });
}