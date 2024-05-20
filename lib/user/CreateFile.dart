import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'ViewFiles.dart';

class CreateFile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Создание файла',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.topCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 16), // Отступ сверху
                  Container(
                    width: MediaQuery.of(context).size.width - 48,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: Color(0xFFE4E4E4),
                        width: 1.0,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: TextField(
                      // TODO: Контроллер засунь на считывание имени папки
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Имя',
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Container(
                    width: MediaQuery.of(context).size.width - 48,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: Color(0xFFE4E4E4),
                        width: 1.0,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    // TODO: выбор элементов combobox
                    child: DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      hint: Text('Папка'),
                      value: null, // Значение выбранного элемента
                      icon: Icon(Icons.arrow_drop_down_rounded), // Иконка открытия списка
                      iconSize: 32, // Размер иконки
                      isExpanded: true, // Расширение комбо-бокса по ширине
                      onChanged: (String? newValue) {
                        // Обработчик изменения выбранного элемента
                      },
                      items: <String>['Google doc', 'Google sheet', 'Папка', 'Презентация', 'Текстовый файл']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/images/folder_icon.svg', // путь к вашему файлу SVG
                                width: 24, // задайте желаемую ширину иконки
                                height: 24, // задайте желаемую высоту иконки
                              ),
                              const SizedBox(width: 8),
                              Text(value),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // TODO: логика отклонения
                SizedBox(
                  height: 65,
                  width: 165,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ViewFiles()),
                      );
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
                // TODO: логика подтверждения
                SizedBox(
                  height: 65,
                  width: 165,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ViewFiles()),
                      );
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
        ],
      ),
    );
  }
}
