import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kliniku/detailRumahSakit.dart';

class RumahSakit extends StatefulWidget {
  const RumahSakit({Key? key}) : super(key: key);

  @override
  _RumahSakitState createState() => _RumahSakitState();
}

class _RumahSakitState extends State<RumahSakit> {
  var db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     final doctor = <String, dynamic>{
        //       'nama': 'Rumah Sakit Garuda',
        //       'lokasi': 'Bandung',
        //       'alamat':
        //           'Jl. Cihampelas No.161, Cipaganti, Kecamatan Coblong, Kota Bandung, Jawa Barat 40131',
        //       'telpon': '(220) 2034386-9'
        //     };
        //     db
        //         .collection('rumahSakit')
        //         .add(doctor)
        //         .then((DocumentReference doc) => print('Berhasil Upload'));
        //   },
        // ),
        appBar: AppBar(
          title: Text('Rumah Sakit'),
          backgroundColor: Colors.greenAccent,
        ),
        body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: db.collection('rumahSakit').snapshots(),
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
                var nama_rs = _data[index].data()['nama'];
                var lokasi_rs = _data[index].data()['lokasi'];
                var alamat_rs = _data[index].data()['alamat'];
                var telpon_rs = _data[index].data()['telpon'];
                return Card(
                  color: Colors.white,
                  elevation: 4,
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Image.asset(
                        'assets/hospital-building.png',
                        width: 40,
                        height: 40,
                      ),
                      backgroundColor: Colors.greenAccent,
                    ),
                    title: Text(_data[index].data()['nama'].toString()),
                    subtitle: Text(_data[index].data()['lokasi'].toString()),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailRumahSakit(
                                nama: nama_rs,
                                lokasi: lokasi_rs,
                                alamat: alamat_rs,
                                telpon: telpon_rs)),
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
