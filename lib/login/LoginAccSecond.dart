import 'package:flutter/material.dart';
import 'package:flutter_app/dto/user/AuthUserDto.dart';
import 'package:flutter_app/http/UserClient.dart';

import '../static/UserClass.dart';

class LoginAccSecond extends StatefulWidget {
  final PageController pageController;

  LoginAccSecond({required this.pageController});

  @override
  _LoginAccSecondState createState() => _LoginAccSecondState();
}

class _LoginAccSecondState extends State<LoginAccSecond> {
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  void showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Ошибка'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text('ОК'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.black,
          ),
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background 4.png'),
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
                  Text(
                    'BAGGINS DRIVE',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 120),
                  Text(
                    'Ещё немного',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Введите пароль, чтобы войти в аккаунт',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 24),
                  Container(
                    width: MediaQuery.of(context).size.width - 48,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Пароль',
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 48,
                    child: TextButton(
                      onPressed: () async {
                        if (_passwordController.text.isNotEmpty) {
                          final authDto = AuthUserDto(
                              email: UserClass.email,
                              password: _passwordController.text);
                          try {
                            await auth(authDto);
                          } catch (e) {
                            showErrorDialog('Ошибка входа в аккаунт');
                            widget.pageController.animateToPage(
                              0, // Индекс страницы, на которую нужно перейти
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                            );
                          }
                        }
                        //Navigator.push(context, MaterialPageRoute(builder: (context) => LoginAccFirst()),);
                      },
                      child: Text('Войти'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 15.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
