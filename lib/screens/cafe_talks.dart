import 'package:BuddeeUp/custom_widgets/app_grid_view.dart';
import 'package:flutter/material.dart';

class CafeTalks extends StatelessWidget {
  const CafeTalks({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 24,
                  ),
                  Spacer(),
                  Text(
                    'Cafe Talks',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  Spacer(),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              AppGridView(route: "/cafe_talks_one"),
            ],
          ),
        ),
      ),
    );
  }
}
