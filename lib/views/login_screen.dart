import 'package:flutter/material.dart';
import 'package:patient/core/config/config.dart';
import 'package:patient/core/widgets/widgets.dart';
import 'package:patient/services/address_service.dart';

import '../models/patient_model.dart';
import '../services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    TextEditingController phoneController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(Sizes.defaultPadding),
            child: isLoading
                ? const Center(child: CircularProgressIndicator())
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(Sizes.defaultPadding),
                        width: double.maxFinite,
                        height: 300,
                        child: Image.asset("assets/images/app-logo.png"),
                      ),
                      CustomTitle(
                        title: "Welcome here",
                        color: Theme.of(context).primaryColor,
                      ),
                      const SizedBox(height: Sizes.defaultPadding),
                      CustomTextField(
                        label: "name",
                        onChanged: (phone) {
                          nameController.text = phone;
                        },
                      ),
                      const SizedBox(height: Sizes.defaultPadding),
                      CustomTextField(
                        label: "email",
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (phone) {
                          emailController.text = phone;
                        },
                      ),
                      const SizedBox(height: Sizes.defaultPadding),
                      CustomTextField(
                        label: "phoneNumber",
                        keyboardType: TextInputType.phone,
                        onChanged: (phone) {
                          phoneController.text = phone;
                        },
                      ),
                    ],
                  ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(Sizes.defaultPadding),
        child: CustomButton(
          press: () async {
            setState(() {
              isLoading = true;
            });
            AddressService addressService = AddressService();
            final String addressId = await addressService.createAddress();

            PatientModel patientModel = PatientModel(
              name: nameController.text,
              email: emailController.text,
              address: addressId,
              phoneNumber: phoneController.text,
            );
            AuthService authService = AuthService();
            await authService.login(patientModel);

            setState(() {
              isLoading = false;
            });
          },
          name: "login",
        ),
      ),
    );
  }
}
