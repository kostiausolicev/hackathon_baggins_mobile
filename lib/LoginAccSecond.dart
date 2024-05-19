import 'package:flutter/material.dart';

import 'SignUpAccFirst.dart';
import 'SignUpAccSecond.dart';
import 'LoginAccFirst.dart';
import 'LoginAccSecond.dart';

class LoginAccSecond extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background 4.png'), // путь к вашему изображению
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'BAGGINS DRIVE',
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                SizedBox(height: 120),
                Text(
                  'Ещё немного',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: Colors.white),
                ),
                SizedBox(height: 20),
                Text(
                  'Введите пароль, чтобы войти в аккаунт',
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
                    onPressed: () {
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
      ),
    );
  }
}
