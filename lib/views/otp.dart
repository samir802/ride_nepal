import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ridenepal/controllers/change_profile_screen_controller.dart';
import 'package:ridenepal/widgets/customs/elevated_button.dart';

class OTPVerificationPage extends StatelessWidget {
  OTPVerificationPage({super.key});
  final c = Get.put(ChangeProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 200,
                      width: 200,
                      child: Image(
                        image: AssetImage('assets/images/emailOTP.png'),
                      ),
                    ),
                    Text(
                      "Verification",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    SizedBox(
                      width: 330,
                      child: Text(
                        "You will get a OTP via mail ",
                        style: TextStyle(fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              TextFormField(
                controller: c.otpController,
                keyboardType: TextInputType.number,
                maxLength: 6,
                decoration: InputDecoration(
                  labelText: 'Enter OTP',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomLargeElevatedButton(
                  title: "Verfiy",
                  onTap: () {
                    c.verifyOTP(c.otpController.text);
                  })
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     const Text("Didn't recieve the verfication OTP ?"),
              //     InkWell(
              //       onTap: () {
              //         c.sendEmail(email);
              //       },
              //       child: const Text("Resend"),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
