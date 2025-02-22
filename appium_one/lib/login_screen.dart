import 'package:flutter/material.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); // Key for validation

  bool isValidEmail(String email) {
    final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return emailRegex.hasMatch(email);
  }

  void login() {
    if (_formKey.currentState!.validate()) {
      if (emailController.text == "test@appium.com" &&
          passwordController.text == "123456") {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreenPage(username: 'User',)),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Invalid credentials", style: TextStyle(color: Colors.red)),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Welcome Back!",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey, // Assign form key
          child: Column(
            children: [
              const SizedBox(height: 25),
              TextFormField(
                key: const Key("emailField"),
                controller: emailController,
                decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(color: Colors.blue, width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(color: Colors.green, width: 2.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(color: Colors.purple, width: 2.0),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(color: Colors.grey, width: 2.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Email cannot be empty";
                  } else if (!isValidEmail(value)) {
                    return "Enter a valid email address";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 25),
              TextFormField(
                //key: const Key("passwordField"),
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(color: Colors.blue, width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(color: Colors.green, width: 2.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(color: Colors.purple, width: 2.0),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(color: Colors.grey, width: 2.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Password cannot be empty";
                  } else if (value.length < 6) {
                    return "Password must be at least 6 characters";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

               Container(
                 //width: 100,
                 padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                 decoration: BoxDecoration(
                   color: Colors.grey.withOpacity(0.1),
                     borderRadius: BorderRadius.circular(10)
                 ),

                 child: Row(
                   mainAxisSize: MainAxisSize.min,
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Icon(Icons.person),

                     SizedBox( width:0 ,),
                     
                     TextButton(onPressed: (){
                 
                       Navigator.push(
                           context,
                         MaterialPageRoute(builder: (context) => HomeScreenPage(username: 'Guest',)
                       ),
                       );

                     },
                         child: Text("Guest",style: TextStyle(color: Colors.black),)),
                   ],
                 ),
               ),

              const SizedBox(height: 20),

              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      key: const Key("loginButton"),
                      onPressed: login,
                      child: const Text(
                        "Login",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
