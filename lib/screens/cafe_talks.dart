import 'package:BuddeeUp/widgets/app_grid_view.dart';
import 'package:flutter/material.dart';

class CafeTalks extends StatelessWidget {
  const CafeTalks({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () { Navigator.pop(context); },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    'Cafe Talks',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  const Spacer(),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const AppGridView(route: "/cafe_talks_one"),
            ],
          ),
        ),
      ),
    );
  }
}
