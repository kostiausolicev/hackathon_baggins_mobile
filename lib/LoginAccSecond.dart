import 'package:flutter/material.dart';

import 'SignUpAccFirst.dart';
import 'SignUpAccSecond.dart';
import 'LoginAccFirst.dart';
import 'LoginAccSecond.dart';


class SignUpAccSecond extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Ещё немного',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text('Введите своё ФИО и придумайте пароль'),
            TextField(
              decoration: InputDecoration(
                labelText: 'Имя',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Фамилия',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Отчество (если есть)',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Пароль',
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Text('Создать аккаунт'),
            ),
          ],
        ),
      ),
    );
  }
}