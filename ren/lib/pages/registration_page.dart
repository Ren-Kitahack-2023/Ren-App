import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ren/components/signin_button.dart';
import 'package:ren/components/login_textfield.dart';
import 'package:ren/components/square_tile.dart';
import 'package:google_fonts/google_fonts.dart';

class RegistrationPage extends StatefulWidget {

  final Function()? onTap;

  RegistrationPage({super.key, required this.onTap});


  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  // text editing controllers
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  // sign user in method
  void signUserUp() async {
    // loading animation thingy
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    // try to create a new user
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      // pop the loading animation thingy
      Navigator.pop(context);

    } on FirebaseAuthException catch (e) {
      // pop the loading animation thingy
      Navigator.pop(context);

      // the user tyes in the wrong email
      if (e.code == 'user-not-found' || e.code == 'invalid-email' || e.code == 'wrong-password' || e.message!.contains('The supplied auth credential is incorrect')) {
            print(e.code);
            displayWrongEmailorPasswordDialog(context);
          } else if (e.code == 'wrong-password' || e.message!.contains('The supplied auth credential is incorrect')) {
            print(e.code);
            displayWrongEmailorPasswordDialog(context);
          }
          }

  }

  // WRONG EMAIL DIALOG
  void displayWrongEmailorPasswordDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            title: Text('Wrong Email or Password'),
          );
        }
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFF132800),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
            
                // ren logo
                Image.asset(
                  'lib/images/ren_logo.png',
                  height: 75,
                  width: 75,
                ),
            
                const SizedBox(height: 10),
            
                // REN text
                Text(
                  'Ren',
                  style: GoogleFonts.roboto(
                    fontSize: 48, // increase the font size
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 2.0, // add some letter spacing
                    shadows: [
                      // add text shadows
                      Shadow(
                        blurRadius: 5.0,
                        color: Colors.black,
                        offset: Offset(3.0, 3.0),
                      ),
                    ],
                  ),
                ),
            
                const SizedBox(height: 35),
            
                // username textfield
                LoginTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),
            
                const SizedBox(height: 15),
            
                // password textfield
                LoginTextField(
                  controller: passwordController,
                  hintText: "Password",
                  obscureText: true,
                ),

                const SizedBox(height: 15),

                // Confirm password textfield
                LoginTextField(
                  controller: passwordController,
                  hintText: "Confirm Password",
                  obscureText: true,
                ),


            
                const SizedBox(height: 15),
            
                // forgot password?
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
            
                const SizedBox(height: 20),
            
                // sign in button
                SignInButton(
                  onTap: signUserUp,
                ),
            
                const SizedBox(height: 30),
            
                // or continue with
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Or continue with',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),
            
                const SizedBox(height: 20),
            
                // google + apple sign in buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    // google button
                    SquareTile(imagePath: 'lib/images/google.png'),
            
                    SizedBox(width: 25),
            
                    // apple button
                    SquareTile(imagePath: 'lib/images/apple.png')
                  ],
                ),
            
                const SizedBox(height: 20),
            
                // not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Login now',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
