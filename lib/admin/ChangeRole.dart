import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'ViewFolderChange.dart';
import 'ViewRoles.dart';

class ChangeRole extends StatelessWidget {
  //final PageController AdminPageController;

  //ChangeRole({required this.AdminPageController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          //TODO: Имя папки
          'Изменить роль',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // TODO: Тут кнопка поиска нужно прикрутить поиск файлов в контейнере по введённым символам
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    // controller: _searchController, // Комментируем, чтобы избежать ошибки
                    decoration: InputDecoration(
                      hintText: 'Поиск',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(
                            color: Color(0xFFE4E4E4), width: 1.0),
                      ),
                      filled: false,
                      contentPadding: EdgeInsets.symmetric(vertical: 0),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                IconButton(
                  icon: Icon(Icons.filter_list),
                  onPressed: () {},
                  color: Color(0xFFA82230),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                SizedBox(
                  width: 50, // Занимает 50 пикселей слева
                  child: Text(
                    'Тип',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Название',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
                SizedBox(
                  width: 60, // Занимает 40 пикселей справа
                  child: Text(
                    'Статус',
                    style: TextStyle(color: Colors.grey),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
        ],
      ),
      // Кнопки внизу экрана
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 65,
              width: 165,
              child: ElevatedButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => ViewFiles()),
                  // );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFE4E4E4),
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                ),
                child: const Text('Отмена'),
              ),
            ),
            SizedBox(
              height: 65,
              width: 165,
              child: ElevatedButton(
                onPressed: () {
                  //Navigator.push(
                  //  context,
                  //  MaterialPageRoute(builder: (context) => ViewRoles(AdminPageController: AdminPageController)),
                  //);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFA82230),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                ),
                child: const Text('Создать'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
