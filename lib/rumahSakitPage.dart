import 'package:flutter/material.dart';
import 'package:kliniku/detailRumahSakit.dart';

class RumahSakit extends StatefulWidget {
  const RumahSakit({Key? key}) : super(key: key);

  @override
  _RumahSakitState createState() => _RumahSakitState();
}

class _RumahSakitState extends State<RumahSakit> {
  final List<Map<String, dynamic>> _allHospital = [
    {"id": 1, "hospital": "Rumah Sakit Garuda", "lokasi": "Bandung"},
    {"id": 2, "hospital": "Rumah Sakit Trimitra", "lokasi": "Bandung"},
    {"id": 3, "hospital": "Rumah Sakit Advent", "lokasi": "Bandung"},
    {"id": 4, "hospital": "Rumah Sakit Al-Islam", "lokasi": "Bandung"},
    {"id": 5, "hospital": "Rumah Sakit Tenang", "lokasi": "Bandung"},
    {"id": 6, "hospital": "Rumah Sakit Aman", "lokasi": "Bandung"},
    {"id": 7, "hospital": "Rumah Sakit Sukahati", "lokasi": "Bandung"},
    {"id": 8, "hospital": "Rumah Sakit Indah", "lokasi": "Bandung"},
    {"id": 9, "hospital": "Rumah Sakit Berkah", "lokasi": "Bandung"},
    {"id": 10, "hospital": "Rumah Sakit Amanah", "lokasi": "Bandung"},
  ];

  // This list holds the data for the list view
  List<Map<String, dynamic>> _foundUsers = [];
  @override
  initState() {
    _foundUsers = _allHospital;
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _allHospital;
    } else {
      results = _allHospital
          .where((user) => user["hospital"]
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rumah Sakit'),
        backgroundColor: Colors.greenAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            TextField(
              onChanged: (value) => _runFilter(value),
              decoration: const InputDecoration(
                  labelText: 'Search', suffixIcon: Icon(Icons.search)),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: _foundUsers.isNotEmpty
                  ? ListView.builder(
                      itemCount: _foundUsers.length,
                      itemBuilder: (context, index) => Card(
                        key: ValueKey(_foundUsers[index]["id"]),
                        color: Colors.white,
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(vertical: 10),
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
                          title: Text(_foundUsers[index]['hospital'],
                              style: TextStyle(color: Colors.black)),
                          subtitle: Text(_foundUsers[index]['lokasi'],
                              style: TextStyle(color: Colors.grey)),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const DetailRumahSakit()),
                            );
                          },
                        ),
                      ),
                    )
                  : const Text(
                      'No results found',
                      style: TextStyle(fontSize: 24),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
