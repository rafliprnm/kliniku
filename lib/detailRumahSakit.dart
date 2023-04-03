import 'package:flutter/material.dart';

class DetailRumahSakit extends StatefulWidget {
  const DetailRumahSakit({Key? key}) : super(key: key);

  @override
  _DetailRumahSakitState createState() => _DetailRumahSakitState();
}

class _DetailRumahSakitState extends State<DetailRumahSakit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rumah Sakit'),
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
                        'assets/hospital-building.png',
                        width: 65,
                        height: 65,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Nama Rumah Sakit',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
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
                    'Informasi',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          height: 70,
                          child: Row(
                            children: [
                              CircleAvatar(backgroundColor: Colors.white),
                              Expanded(
                                  flex: 2,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Lokasi',
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                          'Jl. Cihampelas No.161, Cipaganti, Kecamatan Coblong, Kota Bandung, Jawa Barat 40131'),
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
                                      child: Icon(Icons.directions),
                                      onPressed: () {
                                        // ...
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 70,
                          child: Row(
                            children: [
                              CircleAvatar(backgroundColor: Colors.white),
                              Expanded(
                                  flex: 2,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Telepon',
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text('(022) 2034386-9'),
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
                                      child: Icon(Icons.call),
                                      onPressed: () {
                                        // ...
                                      },
                                    ),
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
