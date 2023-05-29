import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kliniku/notificationService.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class DetailDokter extends StatelessWidget {
  final String nama;
  final String spesialis;
  final String lokasi;
  final String tanggal;
  final String waktu;
  const DetailDokter(
      {Key? key,
      required this.nama,
      required this.spesialis,
      required this.lokasi,
      required this.tanggal,
      required this.waktu})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dokter'),
        backgroundColor: Colors.greenAccent,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 200,
              color: Colors.greenAccent,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      child: Image.asset(
                        'assets/doctor.png',
                        width: 65,
                        height: 65,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('$nama',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Text('$spesialis')
                  ],
                ),
              ),
            ),
            Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Jadwal Dokter',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.11,
                          child: Row(
                            children: [
                              CircleAvatar(backgroundColor: Colors.white),
                              Expanded(
                                  flex: 3,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '$tanggal',
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text('$lokasi'),
                                      Text('$waktu'),
                                    ],
                                  )),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ElevatedButton(
                                      style: const ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll<Color>(
                                                Colors.greenAccent),
                                      ),
                                      child: const Text(
                                        'Daftar',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            final controller_nama =
                                                TextEditingController();
                                            final controller_nama_dokter =
                                                TextEditingController();
                                            final controller_lokasi =
                                                TextEditingController();
                                            final controller_tanggal =
                                                TextEditingController();
                                            final controller_waktu =
                                                TextEditingController();
                                            return AlertDialog(
                                              scrollable: true,
                                              title: Text('Daftar'),
                                              content: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Form(
                                                  child: Column(
                                                    children: <Widget>[
                                                      TextField(
                                                        controller:
                                                            controller_nama,
                                                        decoration:
                                                            InputDecoration(
                                                          labelText: 'Nama',
                                                          icon: Icon(Icons
                                                              .account_box),
                                                        ),
                                                      ),
                                                      TextField(
                                                        controller:
                                                            controller_nama_dokter,
                                                        decoration:
                                                            InputDecoration(
                                                          labelText:
                                                              'Nama Dokter',
                                                          icon: Icon(Icons
                                                              .medical_information),
                                                        ),
                                                      ),
                                                      TextField(
                                                        controller:
                                                            controller_lokasi,
                                                        decoration:
                                                            InputDecoration(
                                                          labelText: 'Lokasi',
                                                          icon: Icon(Icons
                                                              .location_city),
                                                        ),
                                                      ),
                                                      TextField(
                                                        controller:
                                                            controller_tanggal,
                                                        decoration:
                                                            InputDecoration(
                                                          labelText: 'Tanggal',
                                                          icon: Icon(Icons
                                                              .calendar_month),
                                                        ),
                                                      ),
                                                      TextField(
                                                        controller:
                                                            controller_waktu,
                                                        decoration:
                                                            InputDecoration(
                                                          labelText: 'Waktu',
                                                          icon: Icon(
                                                              Icons.schedule),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              actions: [
                                                ElevatedButton(
                                                  onPressed: () {
                                                    Map<String, dynamic>
                                                        dataToSave = {
                                                      'nama':
                                                          controller_nama.text,
                                                      'nama_dokter':
                                                          controller_nama_dokter
                                                              .text,
                                                      'lokasi':
                                                          controller_lokasi
                                                              .text,
                                                      'tanggal':
                                                          controller_tanggal
                                                              .text,
                                                      'waktu':
                                                          controller_waktu.text
                                                    };
                                                    FirebaseFirestore.instance
                                                        .collection('riwayat')
                                                        .add(dataToSave);
                                                    Navigator.pop(context);
                                                    final snackBar = SnackBar(
                                                      content: const Text(
                                                          'Berhasil Mendaftar'),
                                                    );
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(snackBar);
                                                  },
                                                  child: Text('Submit'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
