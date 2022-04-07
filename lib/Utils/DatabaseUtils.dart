import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:the_bug_chasers/User/Profile.dart';
import 'CalendarUtils.dart';

Future<DocumentReference<Object?>?> getOrCreateJournalRef(
    String uid, DateTime date) async {
  date = removeTimeFromDate(date);
  var instance = FirebaseFirestore.instance;
  var doc = await instance
      .collection('Users')
      .doc(uid)
      .collection('Journals')
      .where('Date', isEqualTo: Timestamp.fromDate(date))
      .get();

  DocumentReference<Map<String, dynamic>> docRef;
  if (doc.docs.isNotEmpty) {
    docRef = doc.docs.first.reference;
  } else {
    docRef = await instance
        .collection('Users')
        .doc(uid)
        .collection('Journals')
        .add({'Date': date});
  }

  return docRef;
}

Future<List<String>> getUserMoods(uid) async {
  await FirebaseFirestore.instance
      .collection('Users')
      .doc(uid)
      .get()
      .then((value) {
    Map<String, dynamic> moodMap = value.data()!['Moods'];

    return moodMap.keys.toList();
  });

  return [];
}
