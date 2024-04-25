import 'package:apphelper/apphelpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:web/control/managstate.dart';
import 'package:web/model/custom_field.dart';
import 'package:web/model/neo_container.dart';

class MobilForm extends StatefulWidget {
  @override
  MobilFormState createState() {
    return MobilFormState();
  }
}

class MobilFormState extends State<MobilForm> {
  int _currentStep = 0;
  final _formKey = GlobalKey<FormState>();
  List<Uint8List> files=[];
  late ManagState state;
  @override
  void initState() {
    state =AppHelpers.getState<ManagState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Kendaraan'),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Stepper(
              currentStep: _currentStep,
              onStepContinue: () async {
                if (_formKey.currentState!.validate()) {
                  if (_currentStep >= 2) {
                    return await AppHelpers.showProgress(text: 'Menyimpan');
                  };
                  setState(() {
                    _currentStep ++;
                  });
                }
              },
              onStepCancel: () {
                if (_currentStep <= 0) return;
                setState(() {
                  _currentStep--;
                });
              },
              steps: <Step>[
                const Step(
                  title: Text('Informasi Umum dan Spesifikasi Teknis'),
                  content: Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          children: <Widget>[
                           CTextField( label: 'Nama Model'),
                           CTextField( label: 'Merek'),
                           CTextField( label: 'Tahun Produksi'),
                           CTextField( label: 'Jenis Mobil'),
                            CTextField( label: 'Kondisi'),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: <Widget>[
                           CTextField( label: 'Jenis Mesin'),
                           CTextField( label: 'Kapasitas Mesin'),
                           CTextField( label: 'Tenaga Kuda'),
                           CTextField( label: 'Tipe Bahan Bakar'),
                           CTextField( label: 'Transmisi'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Step(
                  title: Text('Informasi Penjualan dan Pemeliharaan'),
                  content: Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          children: <Widget>[
                           CTextField( label: 'Harga'),
                           CTextField( label: 'Tanggal Penjualan'),
                           CTextField( label: 'ID Penjual'),
                           CTextField( label: 'ID Pembeli'),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: <Widget>[
                           CTextField( label: 'Riwayat Servis'),
                           CTextField( label: 'Riwayat Perbaikan'),
                           CTextField( label: 'Fitur'),
                           CTextField( label: 'Warna'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Step(
                    title: const Text('Upload Image'), content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if(files.isNotEmpty)
                      SizedBox(
                        height: 300,
                        child: ListView.builder(
                          itemCount: files.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return NeoCon(
                                height: 200,
                                width: 250,
                                child: Image.memory(files[index],fit: BoxFit.fitWidth,));
                          },
                        ),
                      ),
                    MaterialButton(
                      onPressed: () async {
                        Uint8List?  result= await state.pickImage();
                        if (result != null) {
                           files.add(result);
                           setState(() {

                           });
                        } else {
                          // User canceled the picker
                        }
                        },
                      child: NeoCon(
                          width: 200,
                          height: 70,
                          radius: 10,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(5),
                          margin: const EdgeInsets.all(10),
                          child: const Text('Upload Gambar'))
                    ),
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

