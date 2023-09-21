import 'package:BuddeeUp/custom_widgets/custom_text.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class DottedImageCard extends StatelessWidget {
  const DottedImageCard(
      {Key? key, required this.image, this.isAddedMedia = true})
      : super(key: key);
  final String image;
  final bool isAddedMedia;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: Stack(children: [
        Container(
          padding: const EdgeInsets.all(8),
          child: DottedBorder(
            color: Colors.white,
            strokeWidth: 1,
            dashPattern: const [4, 6],
            borderType: BorderType.RRect,
            radius: const Radius.circular(10),
            child: Container(
              width: 55,
              height: 75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: isAddedMedia
                  ? Center(
                      child: Container(
                          color: const Color(0xFF141416),
                          child: const CustomText(text: "Private\nPhotos")))
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        image,
                        fit: BoxFit.cover,
                      ),
                    ),
            ),
          ),
        ),
        Positioned(
          right: -10,
          bottom: -10,
          child: IconButton(
            iconSize: 10,
            icon: CircleAvatar(
                minRadius: 12,
                backgroundColor:
                    isAddedMedia ? Colors.purpleAccent : Colors.white,
                foregroundColor:
                    isAddedMedia ? Colors.white : Colors.purpleAccent,
                child: Icon(
                  isAddedMedia ? Icons.add : Icons.clear,
                  size: 20,
                )),
            onPressed: () {},
          ),
        ),
      ]),
    );
  }
}
