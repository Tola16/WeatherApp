import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/customs/customfield.dart';
import 'package:weatherapp/providers/authprovider.dart';
import 'package:weatherapp/screens/homepage.dart';

class SignupScreen extends StatelessWidget {
  final TextEditingController email = TextEditingController();
  final TextEditingController userName = TextEditingController();
  final TextEditingController passWord = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final GlobalKey<FormState> gkey = GlobalKey();

  SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.read<Authprovider>();

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Form(
          key: gkey,
          child: Center(
            child: Column(
              children: [
                Text(
                  "Welcome",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: 40),
                Customfield(
                  label: "UserName",
                  controller: userName,
                  ob: false,
                  icon: Icons.person,
                ),
                SizedBox(height: 10),
                Customfield(
                  ob: false,
                  label: "Email",
                  controller: email,
                  icon: Icons.email,
                ),
                SizedBox(height: 10),
                Customfield(
                  label: "PassWord",
                  controller: passWord,
                  icon: Icons.lock,
                  ob: true,
                ),
                SizedBox(height: 10),
                Customfield(
                  label: "Phone",
                  controller: phone,
                  icon: Icons.phone,
                  ob: false,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (gkey.currentState?.validate() != true) return;

                    final succes = await provider.Regesiter(
                      PassWord: passWord.text,
                      Email: email.text,
                      Phone: phone.text,
                      UserName: userName.text,
                    );

                    if (!context.mounted) return;

                    final message =
                        provider.auth?.msg ??
                        'Registration failed. Please try again.';

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(message),
                        backgroundColor: succes ? Colors.green : Colors.red,
                      ),
                    );

                    if (succes) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    }
                  },
                  child: Text("SignUp"),
                ),
                SizedBox(height: 10),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Already Have An Account"),
                      SizedBox(width: 8),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
                        },
                        child: Text("Home Page"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
