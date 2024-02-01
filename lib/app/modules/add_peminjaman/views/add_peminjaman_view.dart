import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_peminjaman_controller.dart';

class AddPeminjamanView extends GetView<AddPeminjamanController> {
  const AddPeminjamanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${Get.parameters['judul'].toString()}'),
        centerTitle: true,
      ),
      body:
      Form(
          key: controller.formKey,
          child: Column(
            children: [
              Text('Buku yang dipinjam : ${Get.parameters['judul']}'),
              // DateTimePicker
              TextFormField(
                controller: controller.tanggal_pinjamController,
                decoration: InputDecoration(
                  hintText: "Masukan Tanggal Pinjam",
                ),
                validator: (value) {
                  if (value!.length < 2) {
                    return "Tanggal pinjam tidak boleh kosong";
                  }
                  return null;
                },
              ),
              TextFormField(
                // obscureText: true,
                controller: controller.tanggal_kembaliController,
                decoration: InputDecoration(
                  hintText: "Masukan Tanggal Kembali",
                ),
                validator: (value) {
                  if (value!.length < 2) {
                    return " Tanggal kembali tidak boleh kosong";
                  }
                  return null;
                },
              ),
              Obx(() => controller.loading.value
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                  onPressed: () {
                    controller.addpinjam();
                  },
                  child: Text('Tambah'))),
            ],
          )),
    );
  }
}