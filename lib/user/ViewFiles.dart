import 'package:flutter/material.dart';
import 'package:flutter_app/dto/drive/ItemDto.dart';
import 'package:flutter_app/enum/ItemType.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../http/DriveClient.dart';
import 'CreateFile.dart';

class ViewFiles extends StatefulWidget {
  @override
  _ViewFilesState createState() => _ViewFilesState();
}

class _ViewFilesState extends State<ViewFiles> {
  late List<String> _previousStack;
  TextEditingController _searchController = TextEditingController();
  List<ItemDto> _files = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _previousStack = [];
    _fetchFiles();
  }

  void _returnBack() {
    if (_previousStack.isNotEmpty) {
      setState(() {
        _isLoading = false;
        _previousStack.removeLast();
      });
      String? previousFolderId =
          _previousStack.isNotEmpty ? _previousStack.last : null;
      _fetchFiles(previousFolderId);
    }
  }

  void _openFolder(FileItem item) {
    setState(() {
      _isLoading = false;
      _previousStack.add(item.id);
    });
    _fetchFiles(item.id);
  }

  Future<void> _fetchFiles([String? id]) async {
    try {
      // Предположим, что getAll возвращает Future<List<dynamic>> с данными о файлах
      var files = await getAll(folderId: id);
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
                      GestureDetector(
                        onTap: () {
                          _returnBack(); // Вызываем метод возврата назад
                        },
                        child: Icon(Icons.arrow_back,
                            color: Colors.black), // Иконка кнопки "назад"
                      ),
                      Expanded(
                        child: TextField(
                          controller: _searchController,
                          decoration: InputDecoration(
                            hintText: 'Поиск',
                            prefixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide(
                                color: Color(0xFFE4E4E4),
                                width: 1.0,
                              ),
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
                        state: this,
                        id: file.id,
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
            if (_previousStack.length > 0) {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        CreateFile(parent: _previousStack.last)),
              );
            }
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
  final _ViewFilesState state;
  final String iconPath;
  final String name;
  final String id;
  final bool isFolder;

  FileItem(
      {required this.iconPath,
      required this.name,
      this.isFolder = false,
      required this.id,
      required this.state});

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
                      state._openFolder(this);
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
