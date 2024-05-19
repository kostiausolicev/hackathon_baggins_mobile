import 'package:flutter/material.dart';

import 'SignUpAccFirst.dart';
import 'SignUpAccSecond.dart';
import 'LoginAccFirst.dart';
import 'LoginAccSecond.dart';


class SignUpAccFirst extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Создать аккаунт',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text('Введите свой gmail, чтобы создать аккаунт'),
            TextField(
              decoration: InputDecoration(
                labelText: 'email@gmail.com',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpAccSecond()),
                );
              },
              child: Text('Зарегистрироваться с gmail'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginAccFirst()),
                );
              },
              child: Text('У меня уже есть аккаунт'),
            ),
            Divider(),
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.login),
              label: Text('Google'),
            ),
            SizedBox(height: 20),
            Text(
              'Нажимая продолжить, Вы соглашаетесь с Правилами Обслуживания и Политикой Приватности',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
