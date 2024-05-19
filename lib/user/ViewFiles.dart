import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'ViewFolder.dart';
import 'CreateFile.dart';


class ViewFiles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Просмотр',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      // КОНТЕЙНЕР С ФАЙЛАМИ
      body: Column(
        children: [
          // TO DO: Тут кнопка поиска нужно прикрутить поиск файлов в контейнере по введённым символам
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
                // TO DO: Тут кнопка фильтра, если успеем
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

          // TO DO: Тут сами файлы нужно считывать нажатия на них.
          // По идее при нажатии на файл мы должны его открыть.
          // При нажатии на папку мы открываем её содержимое
          // Пока что мы ссылаемся через Navigator на статическую страницу ViewFolder
          Expanded(
            child: ListView(
              children: [
                FileItem(iconPath: 'assets/images/folder_icon.svg', name: 'НЕ ТРОГАТЬ ЭТО НА НОВЫЙ ГОД', isFolder: true),
                FileItem(iconPath: 'assets/images/google_sheets_icon.svg', name: 'Статистика кофеини'),
                FileItem(iconPath: 'assets/images/file_icon.svg', name: 'file.txt'),
                FileItem(iconPath: 'assets/images/google_docs_icon.svg', name: 'тезисыФиналТочноФинал(2)'),
                FileItem(iconPath: 'assets/images/presentation_icon.svg', name: 'Презентация Вред курения'),

              ],
            ),
          ),
        ],
      ),
      // TO DO: Кнопка для создания файла
      floatingActionButton: Container(
        width: 65.0,
        height: 65.0,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CreateFile()),
            );
          },
          child: Icon(Icons.add),
          backgroundColor: Color(0xFFA82230),
          foregroundColor: Colors.white,
        ),
      ),
    );
  }
}

class FileItem extends StatelessWidget {
  final String iconPath;
  final String name;
  final bool isFolder;

  FileItem({required this.iconPath, required this.name, this.isFolder = false}); // По умолчанию файл не является папкой

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          Container(
            width: 24,
            height: 24,
            child: SvgPicture.asset(iconPath, color: Color(0xFFA82230)),
          ),
          SizedBox(width: 16),
          Expanded(
            child: isFolder ? GestureDetector( // Обертка в GestureDetector только если это папка
              onTap: () {
                // TO DO: Нормальную ссылку на содержимое
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ViewFolder()),
                );
              },
              child: Text(name),
            ) : Text(name), // Выводим текст без GestureDetector если это не папка
          ),
        ],
      ),
    );
  }
}
