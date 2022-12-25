import 'package:flutter/material.dart';
import 'package:patient/core/config/config.dart';
import 'package:patient/core/widgets/custom_button.dart';
import 'package:patient/services/auth_service.dart';

import '../services/patient_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(Sizes.defaultPadding),
                    width: double.maxFinite,
                    height: 300,
                    child: Image.asset("assets/images/app-logo.png"),
                  ),
                  GestureDetector(
                    onTap: () async {
                      final messenger = ScaffoldMessenger.of(context);
                      final theme = Theme.of(context);
                      setState(() => isLoading = true);

                      PatientService patientService = PatientService();
                      await patientService.orderAmbulance();

                      setState(() => isLoading = false);
                      final snackBar = SnackBar(
                        content: const Text('An ambulance will arrive soon'),
                        backgroundColor: theme.primaryColor,
                      );

                      messenger.showSnackBar(snackBar);
                    },
                    child: Container(
                      decoration: UI.boxDecoration(
                        Theme.of(context).colorScheme.primary,
                        .5,
                      ),
                      padding: const EdgeInsets.all(Sizes.defaultPadding),
                      child: const ListTile(
                        leading: Text("order ambulance"),
                        trailing: Icon(Icons.send),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      final messenger = ScaffoldMessenger.of(context);
                      final snackBar = SnackBar(
                        content:
                            const Text('This feature is not implemented yet'),
                        backgroundColor: Theme.of(context).errorColor,
                      );

                      messenger.showSnackBar(snackBar);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(Sizes.defaultPadding),
                      decoration: UI.boxDecoration(
                        Theme.of(context).colorScheme.secondary,
                        .5,
                      ),
                      child: const ListTile(
                        leading: Text("order doctor"),
                        trailing: Icon(Icons.send),
                      ),
                    ),
                  )
                ],
              ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(Sizes.defaultPadding),
        child: CustomButton(
          press: () {
            AuthService().logout();
          },
          name: "logout",
          color: Theme.of(context).errorColor,
          height: 40,
        ),
      ),
    );
  }
}
