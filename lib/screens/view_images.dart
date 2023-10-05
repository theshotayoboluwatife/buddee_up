
import 'package:flutter/material.dart';

class ViewImage extends StatelessWidget {
  const ViewImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String imageUrl = ModalRoute.of(context)!.settings.arguments as String;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 80,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.navigate_before,
              size: 45,
            )),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: Colors.red,
            child: Image.network(
              imageUrl,
              width: double.infinity,
              height: size.height * 0.6,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
         
        ],
      ),
    );
  }
}
