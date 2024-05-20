import 'package:flutter/material.dart';
import 'package:flutter_app/admin/ViewUsers.dart';

class ProfileUser extends StatelessWidget {
  final PageController AdminPageController;

  ProfileUser({required this.AdminPageController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO: всталять переменную  firstname
      appBar: AppBar(
        title: Text('Михаил Палыч'style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  const Text(
                    'Дать доступ',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  const SizedBox(height: 24),
                  Container(
                    width: MediaQuery.of(context).size.width - 48,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    // TODO: выбор элементов combobox
                    child: DropdownButton<String>(
                      hint: Text('Harleyquin'),
                      value: null, // Значение выбранного элемента
                      icon: Icon(Icons.arrow_drop_down_rounded), // Иконка открытия списка
                      iconSize: 32, // Размер иконки
                      isExpanded: true, // Расширение комбо-бокса по ширине
                      onChanged: (String? newValue) {
                        // Обработчик изменения выбранного элемента
                      },
                      items: <String>['Admin', 'Tech', 'Harleyquin']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  // TODO: выбор в checkbox
                  const SizedBox(height: 16),
                  CheckboxListTile(
                    title: Text('Разрешить редактировать доступ'), // Текст рядом с чекбоксом
                    controlAffinity: ListTileControlAffinity.trailing, // Положение чекбокса справа от текста
                    value: false, // Значение чекбокса (true/false)
                    onChanged: (bool? value) {
                      // Обработчик изменения состояния чекбокса
                    },
                  ),
                  const SizedBox(height: 16),
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
                        MaterialPageRoute(builder: (context) => ViewUsers(AdminPageController: AdminPageController)),
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
                    child: const Text('Отклонить'),
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
                        MaterialPageRoute(builder: (context) => ViewUsers(AdminPageController: AdminPageController)),
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
                    child: const Text('Подтвердить'),
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
