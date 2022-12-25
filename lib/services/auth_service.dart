import 'package:firebase_auth/firebase_auth.dart';
import 'package:patient/models/patient_model.dart';

import 'patient_service.dart';

class AuthService {
  Future<void> login(PatientModel patientModel) async {
    PatientService patientService = PatientService();
    final auth = FirebaseAuth.instance;
    await auth.signInAnonymously();
    await patientService.createPatient(patientModel);
  }

  Future<void> logout() async {
    final auth = FirebaseAuth.instance;

    await auth.signOut();
  }
}
