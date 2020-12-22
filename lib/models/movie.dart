import 'package:cloud_firestore/cloud_firestore.dart';

class Movie {
  final String wallpaper, posterURL, review, title, year;
  final List<dynamic> category, uid;
  final int rating;

  final DocumentReference reference;

  Movie.fromMap(Map<String, dynamic> map, {this.reference})
      : wallpaper = map["Wallpaper"],
        posterURL = map["posterURL"],
        review = map["review"],
        title = map["title"],
        rating = map["rating"],
        year = map["year"],
        category = map["category"],
        uid = map["uid"];

  Movie.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);
}
