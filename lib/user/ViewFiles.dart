import 'package:flutter/material.dart';
import 'package:flutter_app/dto/drive/ItemDto.dart';
import 'package:flutter_app/enum/ItemType.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../http/DriveClient.dart';
import 'ViewFolder.dart';
import 'CreateFile.dart';

class ViewFiles extends StatefulWidget {
  @override
  _ViewFilesState createState() => _ViewFilesState();
}

class _ViewFilesState extends State<ViewFiles> {
  TextEditingController _searchController = TextEditingController();
  List<ItemDto> _files = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchFiles();
  }

  Future<void> _fetchFiles() async {
    try {
      // Предположим, что getAll возвращает Future<List<dynamic>> с данными о файлах
      var files = await getAll();
      setState(() {
        _files = files.items;
        _isLoading = false;
      });
    } catch (e) {
      // Обработка ошибки
      print("Ошибка при получении файлов: $e");
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Просмотр',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
        children: [
          // TODO: Тут кнопка поиска нужно прикрутить поиск файлов в контейнере по введённым символам
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
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
                Expanded(
                  child: Text(
                    'Тип',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                Expanded(
                  flex: 12,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Название',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // TODO: Тут сами файлы нужно считывать нажатия на них.
          // По идее при нажатии на файл мы должны его открыть.
          // При нажатии на папку мы открываем её содержимое
          // Пока что мы ссылаемся через Navigator на статическую страницу ViewFolder
          Expanded(
            child: ListView.builder(
              itemCount: _files.length,
              itemBuilder: (context, index) {
                var file = _files[index];
                return FileItem(
                  iconPath: switch (file.type) {
                    ItemType.FOLDER => 'assets/images/folder_icon.svg',
                    ItemType.SHEETS =>
                    'assets/images/google_sheets_icon.svg',
                    ItemType.FILE => 'assets/images/file_icon.svg',
                    ItemType.DOC => 'assets/images/google_docs_icon.svg',
                    ItemType.PRESENTATION =>
                    'assets/images/presentation_icon.svg',
                    _ => throw UnimplementedError()
                  },
                  name: file.name,
                  isFolder: file.type == ItemType.FOLDER,
                );
              },
            ),
          ),
        ],
      ),
      // TODO: Кнопка для создания файла
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

  FileItem({required this.iconPath, required this.name, this.isFolder = false});

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
            child: isFolder
                ? GestureDetector(
              onTap: () {
                // TODO: Нормальную ссылку на содержимое
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ViewFolder()),
                );
              },
              child: Text(name),
            )
                : Text(name),
          ),
        ],
      ),
    );
  }
}
