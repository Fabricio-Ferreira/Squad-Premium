import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squad_premium_test/app/pages/login/login_controller.dart';
import 'package:squad_premium_test/app/pages/sign_up/sign_up_page.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: Container(
          padding: const EdgeInsets.all(20),
          height: double.infinity,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Image(
                  image: AssetImage('images/icon.jpg'),
                  height: 350,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 50),
                const Text(
                  'Bem Vindo ao Squad Premium',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 50),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    prefixIcon: Icon(Icons.email, color: Colors.grey),
                  ),
                  style: const TextStyle(fontSize: 18, color: Colors.black),
                  onChanged: print,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    prefixIcon: const Icon(Icons.lock_person, color: Colors.grey),
                    suffixIcon: IconButton(
                      icon: const Icon(
                        Icons.remove_red_eye,
                        color: Colors.grey,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  style: const TextStyle(fontSize: 18, color: Colors.black),
                  onChanged: print,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Login'),
                ),
                ElevatedButton(
                  onPressed: () => SignUpPage.navigateTo,
                  child: const Text('Cadastrar'),
                ),
              ],
            ),
          ),
        ),
      );
}
