import 'package:shared_preferences/shared_preferences.dart';

class BookmarkService {
  static const key = "bookmarks";

  static Future<List<String>> getBookmarks() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(key) ?? [];
  }

  static Future<void> toggleBookmark(String title) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> bookmarks = prefs.getStringList(key) ?? [];

    if (bookmarks.contains(title)) {
      bookmarks.remove(title);
    } else {
      bookmarks.add(title);
    }

    await prefs.setStringList(key, bookmarks);
  }
}