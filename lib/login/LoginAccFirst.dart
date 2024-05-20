import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_app/static/UserClass.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginAccFirst extends StatelessWidget {
  final PageController pageController;
  final TextEditingController _emailController = TextEditingController();

  LoginAccFirst({required this.pageController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Stack(
        children: [
        Container(
        color: Colors.black,
      ),
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background 3.png'), // путь к вашему изображению
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'BAGGINS DRIVE',
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(height: 120),
              Text(
                'Войти в аккаунт',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: Colors.white),
              ),
              SizedBox(height: 10),
              Text(
                  'Введите gmail, чтобы войти в аккаунт',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.white),
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
                  controller: _emailController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'email@gmail.com',
                  ),
                ),
              ),
              SizedBox(height: 16),
              SizedBox(
                width: MediaQuery.of(context).size.width - 48,
                child: ElevatedButton(
                  onPressed: () {
                    if (_emailController.text.isNotEmpty) {
                      UserClass.email = _emailController.text;
                      pageController.animateToPage(
                        3, // Индекс страницы, на которую нужно перейти
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  child: Text('Продолжить'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black, // Цвет фона кнопки
                    foregroundColor: Colors.white, // Цвет текста кнопки
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                  ),
                ),
              ),
              SizedBox(height: 16),
              SizedBox(
                width: MediaQuery.of(context).size.width - 48,
                child: TextButton(
                  onPressed: () {
                    pageController.animateToPage(
                      0, // Индекс страницы, на которую нужно перейти
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: Text('У меня нет аккаунта'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black, // Цвет фона кнопки
                    foregroundColor: Colors.white, // Цвет текста кнопки
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                  ),
                ),
              ),
              SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.white,
                      thickness: 1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'или продолжить с',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.white,
                      thickness: 1,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              SizedBox(
                width: MediaQuery.of(context).size.width - 48,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    'assets/images/google_icon.svg', // путь к вашему файлу SVG
                    width: 24, // задайте желаемую ширину иконки
                    height: 24, // задайте желаемую высоту иконки
                  ),
                  label: Text('Google'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      side: BorderSide(color: Colors.black),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                  ),
                ),
              ),
              SizedBox(height: 24),
              Text.rich(
                TextSpan(
                  text: 'Нажимая продолжить, Вы соглашаетесь с ',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.white),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Условиями использования',
                      style: TextStyle(color: Color(0xFFA82230)),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // Действие при нажатии на ссылку Правилами Обслуживания
                          launchUrl(Uri.parse('https://policies.google.com/terms?hl=ru'));
                        },
                    ),
                    TextSpan(text: ' и '),
                    TextSpan(
                      text: 'Политикой конфиденциальности',
                      style: TextStyle(color: Color(0xFFA82230)),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // Действие при нажатии на ссылку Политикой Приватности
                          launchUrl(Uri.parse('https://policies.google.com/privacy?hl=ru'));
                        },
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ]),
    );
  }
}