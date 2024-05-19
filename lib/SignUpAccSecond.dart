import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_app/dto/user/CreateUserDto.dart';
import 'package:flutter_app/static/UserClass.dart';

import 'http/UserClient.dart';

class SignUpAccSecond extends StatelessWidget {
  final PageController pageController;
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repeatPasswordController =
      TextEditingController();

  SignUpAccSecond({super.key, required this.pageController});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          color: Colors.black,
        ),
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background 2.png'),
              // путь к вашему изображению
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'BAGGINS DRIVE',
                  style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(height: 120),
                const Text(
                  'Ещё немного',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Введите свой gmail, чтобы создать аккаунт',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.white),
                ),
                const SizedBox(height: 24),
                Container(
                  width: MediaQuery.of(context).size.width - 48,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(
                    controller: _firstNameController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Имя',
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  width: MediaQuery.of(context).size.width - 48,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(
                    controller: _lastNameController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Фамилия',
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  width: MediaQuery.of(context).size.width - 48,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Пароль',
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  width: MediaQuery.of(context).size.width - 48,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(
                    controller: _repeatPasswordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Повторите пароль',
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 48,
                  child: TextButton(
                    onPressed: () async {
                      if (_firstNameController.text.isNotEmpty &&
                          _lastNameController.text.isNotEmpty &&
                          _passwordController.text.isNotEmpty &&
                          _repeatPasswordController.text.isNotEmpty) {
                        final createUserDto = CreateUserDto(
                            email: UserClass.email,
                            firstName: _firstNameController.text,
                            lastName: _lastNameController.text,
                            password: _passwordController.text,
                            repeatPassword: _repeatPasswordController.text);
                        try {
                          await register(createUserDto);
                        } catch (ex) {}
                      }

                      //Navigator.push(context, MaterialPageRoute(builder: (context) => LoginAccFirst()),);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                    ),
                    child: const Text('Создать аккаунт'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
