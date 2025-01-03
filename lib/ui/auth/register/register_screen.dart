import 'package:flutter/material.dart';
import 'package:todo_app/ui/widgets/custom_text_form_field;.dart';
import 'package:todo_app/utils/email_validation.dart';

class RegisterScreen extends StatelessWidget {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController passContController = TextEditingController();
  @override
  var formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(elevation: 0,
        title: Center(child: const Text('Register Screen')),
      ),
      body: Form(
        key: formKey,
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

                SizedBox(
                  height: 15,
                ),
                CustomTextFormField(
                    label: const Text('Full Name'),
                    type: TextInputType.name,
                    controller: fullNameController,
                    validator: (input) {
                      if (input == null || input.trim().isEmpty) {
                        return 'please enter full name';
                      }
                      if (input is int) {
                        return 'sorry, in valid input';
                      }
                      return null;
                    }),
                CustomTextFormField(
                  label: const Text('User Name'),
                  type: TextInputType.name,
                  controller: userNameController,
                  validator: (input) {
                    if (input == null || input.trim().isEmpty) {
                      return 'please enter user name';
                    }
                    return null;
                  },
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
                CustomTextFormField(
                    label: const Text('re-password'),
                    type: TextInputType.visiblePassword,
                    controller: passContController,
                    isecureText: true,
                    validator: (input) {
                      if (input == null || input.trim().isEmpty) {
                        return 'please enter password';
                      }
                      if (input != passController.text) {
                        return 'password does not match';
                      }
                      return null;
                    }),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black45,
                  ),
                    onPressed: () {
                      register();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: const Text('Register'),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  void register() {
    if (formKey.currentState?.validate() == false) {
      return;
    }
  }
}
