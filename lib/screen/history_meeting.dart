import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import '../resources/firestore_method.dart';

class HistoryMeetingScreen extends StatelessWidget {
  const HistoryMeetingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirestoreMethods().meetingsHistory,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return ListView.builder(
          itemCount: (snapshot.data! as dynamic).docs.length,
          itemBuilder: (context, index) => ListTile(
            title: SizedBox(
              height: 70,
              width: 100,
              child: Text(
                'Room Name: ${(snapshot.data! as dynamic).docs[index]['meetingName']}',
                style: TextStyle(color: Colors.black),
              ),
            ),
            subtitle: SizedBox(
              height: 70,
              width: 100,
              child: Text(
                'Joined on ${DateFormat.yMMMd().format((snapshot.data! as dynamic).docs[index]['createdAt'].toDate())}',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        );
      },
    );
  }
}
