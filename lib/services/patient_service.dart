import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:patient/models/patient_model.dart';
import 'package:patient/services/address_service.dart';

import '../models/address_model.dart';
import '../models/ambulance_model.dart';
import '../models/hospital_model.dart';
import 'hospital_service.dart';

class PatientService {
  Future createPatient(PatientModel patientModel) async {
    final currentUser = FirebaseAuth.instance.currentUser;
    final db = FirebaseFirestore.instance;

    await db
        .collection("patient")
        .doc(currentUser!.uid)
        .set(patientModel.toJson());
  }

  Future<PatientModel> getPatient() async {
    final db = FirebaseFirestore.instance;
    final currentUser = FirebaseAuth.instance.currentUser;

    final patientCol = db.collection("patient").doc(currentUser!.uid);
    final patientDoc = await patientCol.get();

    return PatientModel.fromJson(patientDoc.data()!);
  }

  Future<void> orderAmbulance() async {
    final PatientModel patientModel = await getPatient();
    String addressId = patientModel.address ?? "";
    AddressService addressService = AddressService();
    AddressModel addressModel = await addressService.getAddress(addressId);

    HospitalService hospitalService = HospitalService();
    List<HospitalModel> hospitals = await hospitalService.getHospital();

    double smallestDistance = 1000;
    HospitalModel? hospitalModel;

    for (var hospital in hospitals) {
      String addressId = hospital.address ?? "";
      AddressModel hospitalAddress = await addressService.getAddress(addressId);
      double distance = _calculateDistance(
        addressModel.latitude,
        addressModel.longitude,
        hospitalAddress.latitude,
        hospitalAddress.longitude,
      );
      if (hospital.availableBeds! > 0) {
        if (distance < smallestDistance) {
          smallestDistance = distance;

          hospitalModel = hospital;
        }
      }
    }

    AmbulanceModel ambulanceModel = AmbulanceModel(
      patientId: patientModel.id,
      distance: smallestDistance,
      hospitalId: hospitalModel!.id,
    );

    final db = FirebaseFirestore.instance;
    await db.collection("ambulance").add(ambulanceModel.toJson());
  }

  double _calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var a = 0.5 -
        cos((lat2 - lat1) * p) / 2 +
        cos(lat1 * p) * cos(lat2 * p) * (1 - cos((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }
}
