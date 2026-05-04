import 'package:flutter/material.dart';
import '../models/bab.dart';
import '../services/bookmark_service.dart';

class DetailScreen extends StatefulWidget {
  final Bab bab;

  DetailScreen({required this.bab});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool isBookmarked = false;

  @override
  void initState() {
    super.initState();
    loadBookmark();
  }

  void loadBookmark() async {
    final list = await BookmarkService.getBookmarks();
    setState(() {
      isBookmarked = list.contains(widget.bab.judul);
    });
  }

  void toggle() async {
    await BookmarkService.toggleBookmark(widget.bab.judul);
    loadBookmark();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.bab.judul),
        actions: [
          IconButton(
            icon: Icon(isBookmarked
                ? Icons.bookmark
                : Icons.bookmark_border),
            onPressed: toggle,
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              widget.bab.arab,
              style: TextStyle(fontSize: 26),
              textAlign: TextAlign.right,
            ),
            SizedBox(height: 20),
            Text(widget.bab.arti),
          ],
        ),
      ),
    );
  }
}