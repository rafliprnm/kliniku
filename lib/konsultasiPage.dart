import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Konsultasi extends StatefulWidget {
  const Konsultasi({Key? key}) : super(key: key);

  @override
  _KonsultasiState createState() => _KonsultasiState();
}

class _KonsultasiState extends State<Konsultasi> {
  var db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     final doctor = <String, dynamic>{
        //       'nama': 'Dr. Kurnia',
        //       'spesialis': 'Jantung',
        //     };
        //     db
        //         .collection('konsultasi')
        //         .add(doctor)
        //         .then((DocumentReference doc) => print('Berhasil Upload'));
        //   },
        // ),
        appBar: AppBar(
          title: Text('Konsultasi'),
          backgroundColor: Colors.greenAccent,
        ),
        body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: db.collection('konsultasi').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return const Center(
                child: Text('Error'),
              );
            }
            var _data = snapshot.data!.docs;
            return ListView.builder(
              itemCount: _data.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.white,
                  elevation: 4,
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Image.asset(
                        'assets/doctor.png',
                        width: 40,
                        height: 40,
                      ),
                      backgroundColor: Colors.greenAccent,
                    ),
                    title: Text(_data[index].data()['nama'].toString()),
                    subtitle: Text(_data[index].data()['spesialis'].toString()),
                    trailing: Icon(Icons.message),
                  ),
                );
              },
            );
          },
        ));
  }
}
