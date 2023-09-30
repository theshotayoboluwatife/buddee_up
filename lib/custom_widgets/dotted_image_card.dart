import 'dart:io';

import 'package:BuddeeUp/custom_widgets/custom_text.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class DottedImageCard extends StatefulWidget {
  DottedImageCard({
    Key? key,
    this.noPicture = false,
  }) : super(key: key);
  bool noPicture;

  @override
  _DottedImageCardState createState() => _DottedImageCardState();
}

class _DottedImageCardState extends State<DottedImageCard> {
  File? selectedImageFile;

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      setState(() {
        selectedImageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(2),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            child: DottedBorder(
              color: Colors.white,
              strokeWidth: 1,
              dashPattern: const [4, 6],
              borderType: BorderType.RRect,
              radius: const Radius.circular(10),
              child: Container(
                  width: size.width * 0.125,
                  height: 75,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: selectedImageFile == null
                          ? const BlankImage()
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.file(
                                selectedImageFile!,
                                fit: BoxFit.cover,
                              ),
                            )
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
                    widget.noPicture ? Colors.white : Colors.purpleAccent,
                foregroundColor:
                    widget.noPicture ? Colors.purpleAccent : Colors.white,
                child: Icon(
                  widget.noPicture ? Icons.clear : Icons.add,
                  size: 20,
                ),
              ),
              onPressed: () async {
                if (selectedImageFile == null) {
                  await pickImage();
                  setState(() {
                    widget.noPicture = !widget.noPicture;
                  });
                } else if (selectedImageFile != null){
                  setState(() {
                    selectedImageFile = null;
                    widget.noPicture = !widget.noPicture;
                  });
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class BlankImage extends StatelessWidget {
  const BlankImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xFF141416),
          borderRadius: BorderRadius.circular(10)),
      child: const Center(
        child: CustomText(
          text: "Private\nPhotos",
        ),
      ),
    );
  }
}
