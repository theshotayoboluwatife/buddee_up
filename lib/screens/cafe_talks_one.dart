import 'package:BuddeeUp/custom_widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CafeTalksOne extends StatefulWidget {
  const CafeTalksOne({Key? key}) : super(key: key);

  @override
  State<CafeTalksOne> createState() => _CafeTalksOneState();
}

class _CafeTalksOneState extends State<CafeTalksOne> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        height: double.infinity,
        child: Stack(
          children: [
            Container(
                height: size.height * 0.4,
                decoration: const BoxDecoration(
                  color: Colors.purpleAccent,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(40),
                      bottomLeft:
                          Radius.circular(40)), // Adjust the radius as needed
                )),
            Positioned(
              top: 60,
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  iconSize: 35,
                  icon: const Icon(
                    Icons.clear,
                    color: Colors.white,
                  )),
            ),
            Positioned(
                top: 60,
                left: size.width / 2.8,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.purpleAccent[100],
                      borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.all(16),
                  child: const CustomText(
                    text: "Cafe Talks",
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                )),
            Positioned(
                top: 150,
                left: 30,
                child: SizedBox(
                    width: size.width * 0.85,
                    height: size.height * 0.75,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        "assets/images/cafetalksImage.png",
                        fit: BoxFit.cover,
                        width: 60,
                        height: size.height * 0.8,
                      ),
                    ))),
            Positioned(
                top: 160,
                left: 40,
                child: IconButton(
                  icon: const Icon(Icons.more_horiz, color: Colors.white),
                  onPressed: () => showAdaptiveDialog(context: context, builder: (_) => 
                  
                  
                  
                  
                  
                  
                  
                  
                   Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.height * 0.45,
                ),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          padding: const EdgeInsets.all(22),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: const CustomText(
                        text: "REPORT RACHEAL",
                        fontWeight: FontWeight.w400,
                        color: Colors.purpleAccent,
                      ),
                    )),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: ()=> Navigator.of(context).pop(),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          padding: const EdgeInsets.all(22),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: const CustomText(
                        text: "CANCEL",
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    )),
              ],
            ),
                  
                  
                  
                  
                  
                  
                  
                  
                  ),
                  iconSize: 35,
                )),
            Positioned(
              bottom: size.height * 0.06,
              left: 20,
              child: Container(
                padding: const EdgeInsets.all(10),
                width: size.width * 0.9,
                decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(width: 1, color: Colors.white),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(children: [
                      CustomText(
                        text: "Rohini   22",
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.verified,
                        color: Colors.purpleAccent,
                      )
                    ]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CustomText(
                          text: "10 miles away",
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.purple),
                          child: const CustomText(
                            text: "Join now",
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                    const Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.circle, color: Colors.green, size: 10),
                          SizedBox(
                            width: 2,
                          ),
                          CustomText(
                            text: "recently active",
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                          ),
                        ]),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
