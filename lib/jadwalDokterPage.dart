import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:kliniku/detailDokter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class JadwalDokter extends StatefulWidget {
  const JadwalDokter({Key? key}) : super(key: key);

  @override
  _JadwalDokterState createState() => _JadwalDokterState();
}

class _JadwalDokterState extends State<JadwalDokter> {
  var db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     final doctor = <String, dynamic>{
        //       'nama': 'Dr. Ara',
        //       'spesialis': 'Telinga',
        //       'lokasi': 'Rumah Sakit Bandung',
        //       'tanggal': '21 Desember 2022',
        //       'waktu': '08.00 - 10.00'
        //     };
        //     db
        //         .collection('doctor')
        //         .add(doctor)
        //         .then((DocumentReference doc) => print('Berhasil Upload'));
        //   },
        // ),
        appBar: AppBar(
          title: Text('Jadwal Dokter'),
          backgroundColor: Colors.greenAccent,
        ),
        body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: db.collection('doctor').snapshots(),
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
                var nama_dokter = _data[index].data()['nama'];
                var spesialis_dokter = _data[index].data()['spesialis'];
                var lokasi_dokter = _data[index].data()['lokasi'];
                var tanggal_dokter = _data[index].data()['tanggal'];
                var waktu_dokter = _data[index].data()['waktu'];
                print(tanggal_dokter);
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
                    trailing: Text(_data[index].data()['lokasi'].toString()),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailDokter(
                                nama: nama_dokter,
                                spesialis: spesialis_dokter,
                                lokasi: lokasi_dokter,
                                tanggal: tanggal_dokter,
                                waktu: waktu_dokter)),
                      );
                    },
                  ),
                );
              },
            );
          },
        ));
  }
}
