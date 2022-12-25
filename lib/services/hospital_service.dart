import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/hospital_model.dart';

class HospitalService {
  Future<String> saveToFireStore(HospitalModel hospitalModel) async {
    final db = FirebaseFirestore.instance;
    final hospital =
        await db.collection("hospital").add(hospitalModel.toJson());
    return hospital.id;
  }

  Future<List<HospitalModel>> getHospital() async {
    final db = FirebaseFirestore.instance;

    final hospitalCol = db.collection("hospital");
    final hospitalDoc = await hospitalCol.get();

    List<HospitalModel> hospitals = [];
    for (var hospital in hospitalDoc.docs) {
      HospitalModel hospitalModel = HospitalModel.fromJson(hospital.data());

      HospitalModel hos = hospitalModel.copyWith(id: hospital.id);

      hospitals.add(hos);
    }

    return hospitals;
  }
}
