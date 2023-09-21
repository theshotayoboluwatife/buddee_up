import 'package:BuddeeUp/custom_widgets/app_grid_view.dart';
import 'package:BuddeeUp/custom_widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../custom_widgets/custom_text.dart';
import '../providers/status_provider.dart';

class DiscoverPage extends StatefulWidget {
  DiscoverPage({Key? key}) : super(key: key);

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  @override
  void initState() {
    super.initState();
    // getUsers();
  }

  @override
  Widget build(BuildContext context) {
    final statusData = Provider.of<Status>(context).statusData;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "Discover",
                      color: Color(0XFFC420D2),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //travel pass text
                        Container(
                          child: Row(
                            children: [
                              Image.asset(
                                  "assets/images/ri_compass-discover-fill.png"),
                              SizedBox(
                                width: 5,
                              ),
                              CustomText(
                                text: "Travel Pass",
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                fontSize: 14,
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0XFF4E1753).withOpacity(.94),
                          ),
                        ),

                        Container(
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/images/photo.png",
                                cacheWidth: 30,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Image.asset(
                                "assets/images/mi_filter.png",
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
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

                    //Remember to Remove these 2 widgets, for prototype sake only
                  ],
                ),
              ),
              AppGridView(),
              Center(
                child: CustomButton(text: 'Next screen',textColor: Colors.red, onpress: (){Navigator.pushNamed(context, "/cafe_talks_one");},),
              )
            ],
          ),
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
    return Container(
      margin: EdgeInsets.only(right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 30,
            child: Container(
              decoration: BoxDecoration(
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
                  margin: EdgeInsets.all(2),
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
          SizedBox(height: 5),
          CustomText(
            text: name,
            fontSize: 12,
            fontWeight: FontWeight.w700,
          )
        ],
      ),
    );
  }
}
