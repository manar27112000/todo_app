import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/core/app_routes.dart';
import 'package:todo_app/ui/widgets/custom_text_form_field;.dart';
import 'package:todo_app/utils/email_validation.dart';

class RegisterScreen extends StatefulWidget {

  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController fullNameController = TextEditingController();

  TextEditingController userNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passController = TextEditingController();

  TextEditingController re_passController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(elevation: 0,
        title: const Center(child: Text('Register Screen')),
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

                const SizedBox(
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
                    isecureText: false,
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
                    controller: re_passController,
                    isecureText: false,
                    validator: (input) {
                      if (input == null || input.trim().isEmpty) {
                        return 'please enter password';
                      }

                       if (input!= passController.text) {
                         print('passcontroller: ${passController.text}');
                         print('passcontroller: ${re_passController.text}');
                        return 'password does not match';

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
                    onPressed: ()  {
                  register(  emailController.text, passController.text);
                  print(emailController.text);
                  print(passController.text);
                  print(re_passController.text);
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text('Register'),
                    )),
                Row(
                  children: [

                    const Text('Already have account?',style: TextStyle(color: Colors.white,fontSize: 16)),
                    TextButton(onPressed: (){
                      Navigator.pushReplacementNamed(context, AppRoutes.login_route);
                    },
                        child: const Text('Sign in',style: TextStyle(color: Colors.white,
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

  Future<void> register(String emailController,String passController) async {
    if (formKey.currentState?.validate() == false) {
      return;
    }
    try {
      final credential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController,
        password: passController,
      );
      print('credential : ${credential.user?.uid}');
      Navigator.pushReplacementNamed(context, AppRoutes.login_route);

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }

  }
}
