import 'package:flutter/material.dart';
import 'package:todo_app/ui/widgets/custom_text_form_field;.dart';
import 'package:todo_app/utils/email_validation.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  @override
  var formKey2 = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(elevation: 0,
        title: const Center(child: Text('Login Screen')),
      ),
      body: Form(
        key: formKey2,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset('lib/assets/images/person.png',
                  width: 150,
                  height: 150,
                  color: Colors.black45,
                  fit:BoxFit.contain,),

                const SizedBox(
                  height: 15,
                ),
                CustomTextFormField(
                    label: const Text('E-mail Address'),
                    type: TextInputType.emailAddress,
                    controller: emailController,
                    validator: (input) {
                      if (input == null || input.trim().isEmpty) {
                        return 'please enter email address';
                      }
                      if (!isValidEmail(input)) {
                        return 'sorry, in valid email';
                      }
                      return null;
                    }),
                CustomTextFormField(
                    label: const Text('Password'),
                    type: TextInputType.visiblePassword,
                    isecureText: true,
                    controller: passController,
                    validator: (input) {
                      if (input == null || input.trim().isEmpty) {
                        return 'please enter  password';
                      }
                      if (input.length < 8) {
                        return 'sorry, password should be at least 8 characters';
                      }
                      return null;
                    }),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black45,
                  ),
                    onPressed: () {
                      register();
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text('Login'),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  void register() {
    if (formKey2.currentState?.validate() == false) {
      return;
    }
  }
}
