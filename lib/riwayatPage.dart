import 'package:flutter/material.dart';

class Riwayat extends StatefulWidget {
  const Riwayat({Key? key}) : super(key: key);

  @override
  _RiwayatState createState() => _RiwayatState();
}

class _RiwayatState extends State<Riwayat> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: Text('Riwayat Daftar'),
            backgroundColor: Colors.greenAccent,
            bottom: const TabBar(tabs: [
              Tab(
                text: 'Pendaftaran Dokter',
              ),
              Tab(
                text: 'Pendaftaran Konsultasi',
              )
            ]),
          ),
          body: SafeArea(
              child: TabBarView(
            children: [
              Column(
                children: [
                  Container(
                    height: 100,
                    child: Row(
                      children: [
                        const Expanded(
                            child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.greenAccent,
                          child: Icon(
                            Icons.account_circle,
                            size: 60,
                            color: Colors.white,
                          ),
                        )),
                        Expanded(
                            flex: 2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Rafli',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text('Dr. Andy'),
                                Text('Akupuntur'),
                                Text('Rs. Garuda'),
                              ],
                            )),
                        Expanded(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [Text('21-12-2022'), Text('09.00 - 11.45')],
                        )),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    height: 100,
                    child: Row(
                      children: [
                        const Expanded(
                            child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.greenAccent,
                          child: Icon(
                            Icons.account_circle,
                            size: 60,
                            color: Colors.white,
                          ),
                        )),
                        Expanded(
                            flex: 2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Rafli',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text('Dr. Andy'),
                                Text('Akupuntur'),
                                Text('Konsultasi'),
                              ],
                            )),
                        Expanded(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [Text('21-12-2022'), Text('09.00 - 11.45')],
                        )),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ))),
    );
  }
}
