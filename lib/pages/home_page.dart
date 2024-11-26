import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/location_controller.dart';

class HomePage extends StatelessWidget {
  // Menggunakan controller dengan GetX
  final LocationController controller = Get.put(LocationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lokasi Pengguna'),
      ),
      body: Center(
        child: Obx(() {
          // Menunggu lokasi
          if (controller.currentLocation.value == null) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Menunggu lokasi...'),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: controller.checkPermissions,
                  child: Text('Dapatkan Lokasi'),
                ),
              ],
            );
          } else {
            // Lokasi sudah didapatkan
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Menampilkan latitude dan longitude
                Text(
                  'Latitude: ${controller.currentLocation.value!.latitude}',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  'Longitude: ${controller.currentLocation.value!.longitude}',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 20),
                // Menampilkan alamat
                Text(
                  'Alamat: ${controller.currentAddress.value}',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: controller.openGoogleMaps,
                  child: Text('Buka Google Maps'),
                ),
              ],
            );
          }
        }),
      ),
    );
  }
}
