import 'dart:io';

import 'package:BuddeeUp/custom_widgets/custom_text.dart';
import 'package:BuddeeUp/helpers/logger.dart';
import 'package:BuddeeUp/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class DottedImageCard extends StatefulWidget {
  DottedImageCard({
    Key? key,
    this.noPicture = false,
    required this.images,
  }) : super(key: key);
  bool noPicture;
  List<String> images;

  @override
  _DottedImageCardState createState() => _DottedImageCardState();
}

class _DottedImageCardState extends State<DottedImageCard> {
  File? selectedImageFile;
  late String fileLocation;

  late String url;

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 25,
    );

    if (pickedFile != null) {
      setState(() {
        selectedImageFile = File(pickedFile.path);
      });

      String fileName = DateTime.now()
          .millisecondsSinceEpoch
          .toString(); // Generate a unique filename
      fileLocation = fileName;
      Reference storageReference = FirebaseStorage.instance
          .ref()
          .child(FirebaseAuth.instance.currentUser!.uid)
          .child(fileName);
      UploadTask uploadTask = storageReference.putFile(File(pickedFile.path));
      // Wait for the upload to complete and get the download URL
      TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() {});
      String downloadURL = await taskSnapshot.ref.getDownloadURL();
      url = downloadURL;
      if (auth.currentUser != null) {
        try {
          // Reference the Firestore collection and document
          CollectionReference collection =
              FirebaseFirestore.instance.collection('users');
          DocumentReference docRef = collection.doc(auth.currentUser!.uid);

          // Get the current list of pictures from Firestore
          DocumentSnapshot doc = await docRef.get();
          List<String> currentPictures =
              List.from((doc.data() as Map)['pictures']);

          // Add the existing pictures to the current list
          currentPictures.addAll([url]);

          // Update the 'pictures' field in Firestore with the updated list
          await docRef.update({'pictures': currentPictures});
          logger.i('Picture list updated successfully');
        } catch (e) {
          logger.i('Error updating picture list: $e');
        }
      }
      widget.images.add(url);
      // Use downloadURL for your application needs (e.g., save it to a database)
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
                } else if (selectedImageFile != null) {
                  setState(() {
                    selectedImageFile = null;
                    widget.noPicture = !widget.noPicture;
                    widget.images.remove(url);
                  });
                  await FirebaseStorage.instance
                      .ref()
                      .child(FirebaseAuth.instance.currentUser!.uid)
                      .child(fileLocation)
                      .delete();

                  if (auth.currentUser != null) {
                    try {
                      // Reference the Firestore collection and document
                      CollectionReference collection = FirebaseFirestore
                          .instance
                          .collection('users');
                      DocumentReference docRef = collection.doc(auth.currentUser!.uid);

                      // Get the current list of pictures from Firestore
                      DocumentSnapshot doc = await docRef.get();
                      List<String> currentPictures =
                          List.from((doc.data() as Map)['pictures']);

                      // Remove the item from the list
                      currentPictures.remove(url);

                      // Update the 'pictures' field in Firestore with the updated list
                      await docRef.update({'pictures': currentPictures});
                      logger.i('Item removed from the list successfully');
                    } catch (e) {
                      logger.e('Error removing item from the list: $e');
                    }
                  }
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
