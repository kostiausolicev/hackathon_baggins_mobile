import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'ProfileUser.dart';

class ViewUsers extends StatelessWidget {
  final PageController AdminPageController;

  ViewUsers({required this.AdminPageController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Список пользователей',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      // КОНТЕЙНЕР С ФАЙЛАМИ
      body: Column(
        children: [
          // TODO: Тут кнопка поиска нужно прикрутить поиск файлов в контейнере по введённым символам
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Поиск',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(color: Color(0xFFE4E4E4), width: 1.0),
                      ),
                      filled: false,
                      contentPadding: EdgeInsets.symmetric(vertical: 0),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                // TODO: Тут кнопка фильтра, если успеем
                IconButton(
                  icon: Icon(Icons.filter_list),
                  onPressed: () {},
                  color: Color(0xFFA82230),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Тип',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Text(
                    'Название',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),

          // TODO: Тут пользователи. Нужно считывать нажатия на них.
          // По идее при нажатии на пользователя мы должны его открыть.
          // Пока что мы ссылаемся через Navigator на статическую страницу Зrofile
          Expanded(
            child: ListView(
              children: [
                UserItem(AdminPageController: AdminPageController, name: 'Михаил Палыч', role: 'Admin', email: 'adress@domain.com', color: Color(0xFFA82230)),
                UserItem(AdminPageController: AdminPageController, name: 'Райан Гослинг', role: 'Admin', email: 'adress@domain.com', color: Color(0xFFA82230)),
                UserItem(AdminPageController: AdminPageController, name: 'Никита Артёмов', role: 'Admin', email: 'adress@domain.com'),
                UserItem(AdminPageController: AdminPageController, name: 'Антон Курганов', role: 'Admin', email: 'adress@domain.com'),
                UserItem(AdminPageController: AdminPageController, name: 'Ибрагим Марков', role: 'Admin', email: 'adress@domain.com'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class UserItem extends StatelessWidget {
  final PageController AdminPageController;
  final String name;
  final String role;
  final String email;
  final Color color; // Новый параметр для цвета фона

  UserItem({
    required this.AdminPageController,
    required this.name,
    required this.role,
    required this.email,
    this.color = Colors.white, // Значение по умолчанию
  });

  @override
  Widget build(BuildContext context) {
    // Определение цвета текста в зависимости от цвета фона
    Color textColor = color == Colors.white ? Colors.black : Colors.white;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        color: color, // Установка цвета фона
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // TODO: тут надо считать нажатие на кнопку и перекинуть на пользователя
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileUser(AdminPageController: AdminPageController)),
                );
              },
              child: SizedBox(
                width: 24,
                height: 24,
                child: SvgPicture.asset(
                  'assets/images/three_dots_icon.svg',
                  color: textColor,
                ),
              ),
            ),
            SizedBox(width: 8),
            Container(
              width: 125,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    role,
                    style: TextStyle(fontWeight: FontWeight.bold, color: textColor),
                  ),
                  SizedBox(height: 4),
                  Text(name, style: TextStyle(color: textColor)),
                ],
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: Text(email, style: TextStyle(color: textColor)),
            ),
          ],
        ),
      ),
    );
  }
}

