import 'package:BuddeeUp/custom_widgets/app_grid_view.dart';
import 'package:BuddeeUp/providers/status_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../custom_widgets/custom_text.dart';

class DiscoveryPage extends StatelessWidget {
  const DiscoveryPage({
    super.key,
  });

  // final List<StatusData> statusData;

  @override
  Widget build(BuildContext context) {
    final statusData = Provider.of<Status>(context).statusData;

    return SafeArea(
      key: ValueKey('value1'),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomText(
                  text: "Discover",
                  color: Color(0XFFC420D2),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //travel pass text
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0XFF4E1753).withOpacity(.94),
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                              "assets/images/ri_compass-discover-fill.png"),
                          const SizedBox(
                            width: 5,
                          ),
                          const CustomText(
                            text: "Travel Pass",
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            fontSize: 14,
                          )
                        ],
                      ),
                    ),

                    Row(
                      children: [
                        Image.asset(
                          "assets/images/photo.png",
                          cacheWidth: 30,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Image.asset(
                          "assets/images/mi_filter.png",
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 90,
                  child: ListView.builder(
                    itemCount: statusData.length,
                    itemBuilder: (BuildContext context, int index) {
                      return StatusCard(
                        name: statusData[index].name,
                        image: statusData[index].imageUrl,
                      );
                    },
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ],
            ),
            const AppGridView(
              route: "/user_profile_info",
            )
          ],
        ),
      ),
    );
  }
}

class StatusCard extends StatelessWidget {
  const StatusCard({
    super.key,
    required this.name,
    required this.image,
  });

  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.only(right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 30,
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      Color(0XFFC420D2),
                      Color(0XFF0A84FF),
                    ],
                  ),
                ),
                child: Center(
                  child: Container(
                    margin: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            CustomText(
              text: name,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            )
          ],
        ),
      ),
      onTap: () {
        //chat screen
      },
    );
  }
}
