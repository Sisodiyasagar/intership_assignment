import 'package:flutter/material.dart';
import 'package:intership_assigment/models/item.dart';
import 'package:url_launcher/url_launcher.dart';

class ItemDetailScreen extends StatelessWidget {
  final Item item;

  ItemDetailScreen({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
        backgroundColor: Colors.teal,  // Updated color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: 'image-${item.id}',  // Same unique tag for the hero animation
              child: Material(
                borderRadius: BorderRadius.circular(12),
                clipBehavior: Clip.hardEdge,
                child: Image.network(
                  item.img,
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(Icons.error, size: 300);
                  },
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(item.name, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.teal)),
            SizedBox(height: 8),
            Text(item.descriptions, style: TextStyle(fontSize: 18, color: Colors.black87)),
            Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('back'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.teal,  // Updated color
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  textStyle: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
