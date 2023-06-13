import 'package:camera/camera.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class ScanDaftar extends StatefulWidget {
  const ScanDaftar({Key? key}) : super(key: key);

  @override
  _ScanDaftarState createState() => _ScanDaftarState();
}

class _ScanDaftarState extends State<ScanDaftar> {
  late CameraController controller;
  late Future<void> cameraInitializer;
  @override
  void initState() {
    super.initState();
    controller = CameraController(cameras[0], ResolutionPreset.medium);
    cameraInitializer = controller.initialize();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void takePicture() async {
    if (!controller.value.isInitialized) {
      return;
    }

    try {
      await cameraInitializer;
      final path = await controller.takePicture();
      print('Foto tersimpan di: ${path.path}');
    } catch (e) {
      print('Error saat mengambil foto: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text('Scan Konfirmasi Pendaftaran'),
          backgroundColor: Colors.greenAccent,
        ),
        body: FutureBuilder<void>(
          future: cameraInitializer,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return CameraPreview(controller);
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
        floatingActionButton: FloatingActionButton.large(
          child: Icon(Icons.camera),
          backgroundColor: Colors.greenAccent ,
          onPressed: takePicture,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
