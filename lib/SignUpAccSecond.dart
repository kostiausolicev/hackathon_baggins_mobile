import 'package:flutter/material.dart';


class SignUpAccSecond extends StatelessWidget {
  final PageController pageController;

  SignUpAccSecond({required this.pageController});

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
            image: AssetImage('assets/images/background 2.png'), // путь к вашему изображению
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
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                SizedBox(height: 120),
                Text(
                  'Ещё немного',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: Colors.white),
                ),
                SizedBox(height: 20),
                Text(
                  'Введите свой gmail, чтобы создать аккаунт',
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
                      hintText: 'Имя',
                    ),
                  ),
                ),
                SizedBox(height: 16),
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
                      hintText: 'Фамилия',
                    ),
                  ),
                ),
                SizedBox(height: 16),
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
                      hintText: 'Отчество (если есть)',
                    ),
                  ),
                ),
                SizedBox(height: 16),
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
                    child: Text('Создать аккаунт'),
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
      ]),
    );
  }
}
