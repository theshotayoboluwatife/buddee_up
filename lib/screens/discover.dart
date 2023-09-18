import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../custom_widgets/custom_text.dart';
import '../providers/status_provider.dart';

class DiscoverPage extends StatelessWidget {
  DiscoverPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final statusData = Provider.of<Status>(context).statusData;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(
              child:

              Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start
                  ,
                  children: [
                    CustomText(
                      text: "Discover",
                      color: Color(0xFFDA3EE8),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //travel pass text
                        Container(
                          padding: EdgeInsets.all(6),
                          child: Row(children: [
                            Image.asset("assets/images/ri_compass-discover-fill.png"),
                            SizedBox(width: 5,),
                            CustomText(text: "Travel Pass", fontWeight: FontWeight.w700, fontSize: 14,)
                          ],),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color(0XFF1753F5)
                          ),
                        ),

                        Container(
                          child: Row(
                            children: [
                              Image.asset("assets/images/photo.png",),
                              SizedBox(width: 4,),
                              Image.asset("assets/images/mi_filter.png",),


                            ],
                          ),
                        ),
                      ],

                    ),
                    SizedBox(height: 10,),
                    Container(
                      width: double.infinity,
                      height: 120,
                      child: ListView.builder(
                        itemCount: statusData.length,
                        itemBuilder: (BuildContext context, int index){
                        return StatusCard(name: statusData[index].name, image: AssetImage(statusData[index].imageUrl),
                          
                        );
                      },
                      scrollDirection: Axis.horizontal),
                    ),
                  ],
                ),
              ),

            )
          ],
        ),
      ),

    );

  }
}

class StatusCard extends StatelessWidget {
  const StatusCard({
    super.key, required this.name, required this.image,
  });

  final String name;
  final ImageProvider image;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
               Positioned(child: Image.asset("assets/images/green status.png")),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Positioned(
                      child: Image(image: image),

                  ),
                )
              ],
            ),
          ),
          CustomText(text: name, fontSize: 12, fontWeight: FontWeight.w700,)
        ],
      ),
    );
  }
}
