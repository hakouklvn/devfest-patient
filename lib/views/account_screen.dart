import 'package:flutter/material.dart';
import 'package:patient/core/config/config.dart';
import 'package:patient/core/widgets/widgets.dart';
import 'package:patient/models/patient_model.dart';
import 'package:patient/services/patient_service.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    PatientService patientService = PatientService();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.defaultPadding),
          child: FutureBuilder(
            future: patientService.getPatient(),
            builder: (_, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                PatientModel patientModel = snapshot.data;
                return Column(
                  children: [
                    Container(
                      decoration:
                          UI.boxDecoration(Theme.of(context).primaryColor, .5),
                      padding: const EdgeInsets.all(Sizes.defaultPadding),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Theme.of(context).primaryColor,
                            radius: 20,
                          ),
                          const SizedBox(width: Sizes.defaultPadding),
                          Text("${patientModel.name}"),
                        ],
                      ),
                    ),
                    const SizedBox(height: Sizes.defaultPadding),
                    CustomTextField(
                      label: "name",
                      value: "${patientModel.name}",
                    ),
                    const SizedBox(height: Sizes.defaultPadding),
                    CustomTextField(
                      label: "phoneNumber",
                      keyboardType: TextInputType.phone,
                      value: "${patientModel.phoneNumber}",
                    ),
                    const SizedBox(height: Sizes.defaultPadding),
                    CustomTextField(
                      label: "email",
                      value: "${patientModel.email}",
                    ),
                  ],
                );
              }
              return const Text("loading");
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: const Icon(Icons.gps_fixed),
        label: const Text("change address"),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(Sizes.defaultPadding),
        child: CustomButton(
          press: () {},
          name: "save",
        ),
      ),
    );
  }
}
