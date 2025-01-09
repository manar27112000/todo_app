
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/core/app_routes.dart';
import 'package:todo_app/ui/widgets/custom_text_form_field;.dart';
import 'package:todo_app/utils/email_validation.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController1 = TextEditingController();

  TextEditingController passController1 = TextEditingController();
  var formKey2 = GlobalKey<FormState>();

  @override

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
                    controller: emailController1,
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
                    controller: passController1,
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
                      login(emailController1.text,passController1.text);
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text('Login'),
                    )),
                Row(
                  children: [

                    Text('Do not have account?',style: TextStyle(color: Colors.white,fontSize: 16)),
                    TextButton(onPressed: (){
                      Navigator.pushReplacementNamed(context, AppRoutes.register_route);
                    },
                        child: Text('Create Account .',style: TextStyle(color: Colors.white,
                            fontSize: 14,decoration: TextDecoration.underline),))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> login( String emailAddress,String password) async {
    if (formKey2.currentState?.validate() == false) {
      return;
    }
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailAddress,
          password: password
      );
      print('credential : ${credential.user?.uid}');
      Navigator.pushReplacementNamed(context, AppRoutes.home_route);

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
}
