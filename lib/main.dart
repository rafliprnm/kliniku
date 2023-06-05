import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slider/carousel.dart';
import 'package:flutter_image_slider/indicator/Circle.dart';
import 'package:kliniku/artikelBeritaPage.dart';
import 'package:kliniku/detailBerita.dart';
import 'package:kliniku/firebase_options.dart';
import 'package:kliniku/jadwalDokterPage.dart';
import 'package:kliniku/konsultasiPage.dart';
import 'package:kliniku/notifikasiPage.dart';
import 'package:kliniku/riwayatPage.dart';
import 'package:kliniku/rumahSakitPage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const MyHomePage(title: 'kliniku'),
        '/jadwalDokter': (context) => const JadwalDokter(),
        '/rumahSakit': (context) => const RumahSakit(),
        '/konsultasi': (context) => const Konsultasi(),
        '/artikelBerita': (context) => const ArtikelBerita(),
        '/riwayat': (context) => const Riwayat(),
        '/notifikasi': (context) => const Notifikasi(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        // appBar: AppBar(
        //   title: Text(widget.title),
        // ),
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: size.height * 0.3,
                width: size.width,
                child: Carousel(
                  indicatorBarColor: Colors.transparent,
                  autoScrollDuration: Duration(seconds: 2),
                  animationPageDuration: Duration(milliseconds: 500),
                  activateIndicatorColor: Colors.black,
                  animationPageCurve: Curves.bounceInOut,
                  indicatorBarHeight: 0,
                  indicatorHeight: 0,
                  indicatorWidth: 0,
                  unActivatedIndicatorColor: Colors.grey,
                  autoScroll: true,
                  // widgets
                  items: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/poster1.jpg'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/poster2.jpg'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/poster1.jpg'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    )
                  ],
                )),
            Container(
              height: size.height * 0.5,
              width: size.width,
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 105,
                        width: 105,
                        child: InkWell(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                child: Image.asset(
                                  'assets/doctor.png',
                                  width: 55,
                                  height: 55,
                                ),
                                radius: 40,
                                backgroundColor: Colors.greenAccent,
                              ),
                              Text('Jadwal Dokter')
                            ],
                          ),
                          onTap: () {
                            Navigator.pushNamed(context, '/jadwalDokter');
                          },
                        ),
                      ),
                      Container(
                        height: 105,
                        width: 105,
                        child: InkWell(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                child: Image.asset(
                                  'assets/hospital-building.png',
                                  width: 55,
                                  height: 55,
                                ),
                                radius: 40,
                                backgroundColor: Colors.greenAccent,
                              ),
                              Text('Rumah Sakit')
                            ],
                          ),
                          onTap: () {
                            Navigator.pushNamed(context, '/rumahSakit');
                          },
                        ),
                      ),
                      Container(
                        height: 105,
                        width: 105,
                        child: InkWell(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                child: Image.asset(
                                  'assets/consultation.png',
                                  width: 55,
                                  height: 55,
                                ),
                                radius: 40,
                                backgroundColor: Colors.greenAccent,
                              ),
                              Text('Konsultasi')
                            ],
                          ),
                          onTap: () {
                            Navigator.pushNamed(context, '/konsultasi');
                          },
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 105,
                        width: 105,
                        child: InkWell(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                child: Image.asset(
                                  'assets/newspaper.png',
                                  width: 55,
                                  height: 55,
                                ),
                                radius: 40,
                                backgroundColor: Colors.greenAccent,
                              ),
                              Text('Artikel & Berita')
                            ],
                          ),
                          onTap: () {
                            Navigator.pushNamed(context, '/artikelBerita');
                          },
                        ),
                      ),
                      Container(
                        height: 105,
                        width: 105,
                        child: InkWell(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                child: Image.asset(
                                  'assets/medical-report.png',
                                  width: 55,
                                  height: 55,
                                ),
                                radius: 40,
                                backgroundColor: Colors.greenAccent,
                              ),
                              Text('Riwayat Daftar')
                            ],
                          ),
                          onTap: () {
                            Navigator.pushNamed(context, '/riwayat');
                          },
                        ),
                      ),
                      Container(
                        height: 105,
                        width: 105,
                        child: InkWell(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                child: Image.asset(
                                  'assets/mail.png',
                                  width: 55,
                                  height: 55,
                                ),
                                radius: 40,
                                backgroundColor: Colors.greenAccent,
                              ),
                              Text('Notifikasi')
                            ],
                          ),
                          onTap: () {
                            Navigator.pushNamed(context, '/notifikasi');
                          },
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: <Widget>[
                SizedBox(
                  width: double.infinity,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 10, left: 10),
                    child: Text(
                      'Promo Menarik',
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 5, right: 5),
                    height: 200,
                    width: 250,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/1.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5, right: 5),
                    height: 200,
                    width: 250,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/2.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5, right: 5),
                    height: 200,
                    width: 250,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/3.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
