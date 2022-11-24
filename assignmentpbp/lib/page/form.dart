import 'package:flutter/material.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/page/data.dart';
import 'package:counter_7/page/mywatchlist_page.dart';

List<Data> daftarData = [];

class MyFormPage extends StatefulWidget {
    const MyFormPage({super.key});

    @override
    State<MyFormPage> createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  final _formKey = GlobalKey<FormState>();
  String? _judul;
  String? _nominal;
  String? _jenis;
  List<String> jenisKegiatan = ["Pemasukkan", "Pengeluaran"];


    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Form Budget'),
            ),
            // Menambahkan drawer menu
            drawer: Drawer(
                child: Column(
                  children: [
                    // Menambahkan clickable menu
                    ListTile(
                      title: const Text('counter_07'),
                      onTap: () {
                        // Route menu ke halaman utama
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const MyApp()),
                        );
                      },
                    ),
                    ListTile(
                      title: const Text('Tambah Budget'),
                      onTap: () {
                        // Route menu ke halaman form
                        Navigator.pop(
                          context,
                        );
                      },
                    ),
                    ListTile(
                      title: const Text('Data Budget'),
                      onTap: () {
                        // Route menu ke halaman form
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const MyDataPage()),
                        );
                      },
                    ),
                    ListTile(
                      title: const Text('Watchlist'),
                      onTap: () {
                        // Route menu ke halaman form
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const MyWatchlistPage()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            body: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Padding(
                          // Menggunakan padding sebesar 8 pixels
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                              decoration: InputDecoration(
                                  hintText: "Judul",
                                  // Menambahkan circular border agar lebih rapi
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                  ),
                              ),
                              // Menambahkan behavior saat nama diketik 
                              onChanged: (String? value) {
                                  setState(() {
                                      _judul = value!;
                                  });
                              },
                              // Menambahkan behavior saat data disimpan
                              onSaved: (String? value) {
                                  setState(() {
                                      _judul = value!;
                                  });
                              },
                              // Validator sebagai validasi form
                              validator: (String? value) {
                                  if (value == null || value.isEmpty) {
                                      return 'Judul tidak boleh kosong!';
                                  }
                                  return null;
                              },
                          ),
                      ),
                      Padding(
                          // Menggunakan padding sebesar 8 pixels
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                              decoration: InputDecoration(
                                  hintText: "Nominal",
                                  // Menambahkan circular border agar lebih rapi
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                  ),
                              ),
                              // Menambahkan behavior saat nama diketik 
                              onChanged: (String? value) {
                                  setState(() {
                                      _nominal = value!;
                                  });
                              },
                              // Menambahkan behavior saat data disimpan
                              onSaved: (String? value) {
                                  setState(() {
                                      _nominal = value!;
                                  });
                              },
                              // Validator sebagai validasi form
                              validator: (String? value) {
                                  if (value == null || value.isEmpty) {
                                      return 'Nominal tidak boleh kosong!';
                                  }
                                  return null;
                              },
                          ),
                      ),
                      DropdownButton(
                          value: _jenis,
                          hint: const Text("Pilih Jenis"),
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: jenisKegiatan.map((String items) {
                            return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                                _jenis = newValue!;
                            });
                          },
                      ),
      
                  ],
                  ),
                ),
              ),
            ),
            bottomNavigationBar: Padding(
              padding: EdgeInsets.all(8.0),
              child: SizedBox(
                height: 50,
                width: 10,
                child: TextButton(
                        child: const Text(
                          "Simpan",
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.blue),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            if (_jenis == "Pemasukkan") {
                              Data data = Data(_judul.toString(), _nominal.toString(), _jenis.toString());
                              daftarData.add(data);
                            } else if (_jenis == "Pengeluaran") {
                              Data data = Data(_judul.toString(), _nominal.toString(), _jenis.toString());
                              daftarData.add(data);
                            } else {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return Dialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    elevation: 15,
                                    child: Container(
                                      child: ListView(
                                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                                        shrinkWrap: true,
                                        children: <Widget>[
                                          Center(child: const Text('Jenis Kegiatan Belum Dipilih' + '\n',
                                             )),
                                          // TODO: Munculkan informasi yang didapat dari form
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text('Kembali'),
                                          ), 
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            }

                          }
                        },
                      ),
              )
            ),
        );
    }
}