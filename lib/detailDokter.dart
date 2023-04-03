import 'package:flutter/material.dart';

class DetailDokter extends StatefulWidget {
  const DetailDokter({Key? key}) : super(key: key);

  @override
  _DetailDokterState createState() => _DetailDokterState();
}

class _DetailDokterState extends State<DetailDokter> {

  
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
                    Text('Nama Dokter',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Text('Spesialis')
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
                          height: 100,
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
                                        '21 Desember 2022',
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text('Rumah Sakit Bandung'),
                                      Text('08:00 - 10:00'),
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
                                            return AlertDialog(
                                              scrollable: true,
                                              title: Text('Daftar'),
                                              content: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Form(
                                                  child: Column(
                                                    children: <Widget>[
                                                      TextFormField(
                                                        decoration:
                                                            InputDecoration(
                                                          labelText: 'Nama',
                                                          icon: Icon(Icons
                                                              .account_box),
                                                        ),
                                                      ),
                                                      TextFormField(
                                                        decoration:
                                                            InputDecoration(
                                                          labelText: 'No.KTP',
                                                          icon: Icon(Icons
                                                              .credit_card),
                                                        ),
                                                      ),
                                                      TextFormField(
                                                        decoration:
                                                            InputDecoration(
                                                          labelText:
                                                              'Nomor Telepon',
                                                          icon:
                                                              Icon(Icons.call),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          context, 'Cancel'),
                                                  child: const Text('Cancel',
                                                      style: TextStyle(
                                                          color: Colors
                                                              .greenAccent)),
                                                ),
                                                ElevatedButton(
                                                  style: const ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStatePropertyAll<
                                                                Color>(
                                                            Colors.greenAccent),
                                                  ),
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          context, 'OK'),
                                                  child: const Text(
                                                    'Submit',
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  ),
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
