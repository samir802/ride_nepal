import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ridenepal/controllers/change_profile_screen_controller.dart';
import 'package:ridenepal/widgets/customs/custom_textfield.dart';
import 'package:ridenepal/widgets/customs/elevated_button.dart';

class EmailPasswordChange extends StatelessWidget {
  EmailPasswordChange({super.key});

  final c = Get.put(ChangeProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("OTP Verification"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                        "We will send you a One Time Password on your email",
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
              CustomTextField(
                hint: "Enter you email",
                textInputAction: TextInputAction.done,
                textInputType: TextInputType.emailAddress,
                controller: c.email,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomLargeElevatedButton(
                title: "Get OTP",
                onTap: () {
                  c.sendEmail(c.email.text);
                },
              )
            ],
          ),
        )),
      ),
    );
  }
}
