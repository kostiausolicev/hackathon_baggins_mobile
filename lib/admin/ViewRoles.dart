import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class ViewRoles extends StatelessWidget {
  final PageController AdminPageController;

  ViewRoles({required this.AdminPageController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Просмотр ролей',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: /*_isLoading
          ? Center(child: CircularProgressIndicator())
          :*/ Column(
        children: [
          // TODO: Тут кнопка поиска нужно прикрутить поиск файлов в контейнере по введённым символам
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    //controller: _searchController,
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

          // TODO: Тут должны быть чсито имена ролей икноки подтягивать не надо.Ну и это должны быть кнопки кидающие на ChangeRole
          // По идее при нажатии на файл мы должны его открыть.
          // При нажатии на папку мы открываем её содержимое
          // Пока что мы ссылаемся через Navigator на статическую страницу ViewFolder
          /*Expanded(
            child: ListView.builder(
              //itemCount: _files.length,
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
          ),*/
        ],
      ),
      floatingActionButton: Container(
        width: 65.0,
        height: 65.0,
        child: FloatingActionButton(
          onPressed: () {
            //if (_previousStack.length > 0) {
             // Navigator.push(
               // context,
               // MaterialPageRoute(
                   // builder: (context) =>
                        //CreateFile(parent: _previousStack.last)),
             // );
            //}
          },
          child: Icon(Icons.add),
          backgroundColor: Color(0xFFA82230),
          foregroundColor: Colors.white,
        ),
      ),
    );
  }
}
