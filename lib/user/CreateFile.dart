import 'package:flutter/material.dart';
import 'package:flutter_app/dto/drive/CreateItemDto.dart';
import 'package:flutter_app/http/DriveClient.dart';
import 'package:flutter_svg/svg.dart';

import '../enum/ItemType.dart';

class CreateFile extends StatefulWidget {
  final String parent;

  const CreateFile({Key? key, required this.parent}) : super(key: key);

  @override
  _CreateFileState createState() => _CreateFileState();
}

class _CreateFileState extends State<CreateFile> {
  final TextEditingController _nameController = TextEditingController();
  ItemType? _selectedItemType;

  void showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Ошибка'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text('ОК'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

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
                  const SizedBox(height: 16),
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
                      controller: _nameController,
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
                    child: DropdownButtonFormField<ItemType>(
                      value: _selectedItemType,
                      onChanged: (ItemType? newValue) {
                        setState(() {
                          _selectedItemType = newValue;
                        });
                      },
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      hint: Text(ItemType.FOLDER.toString()),
                      icon: Icon(Icons.arrow_drop_down_rounded),
                      iconSize: 32,
                      isExpanded: true,
                      items: ItemType.values.map((ItemType itemType) {
                        return DropdownMenuItem<ItemType>(
                          value: itemType,
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/images/folder_icon.svg',
                                width: 24,
                                height: 24,
                              ),
                              const SizedBox(width: 8),
                              Text(itemType.toString().split('.').last),
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
                SizedBox(
                  height: 65,
                  width: 165,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
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
                    onPressed: () async {
                      if (_nameController.text.isNotEmpty &&
                          _selectedItemType != null) {
                        final dto = CreateItemDto(
                          name: _nameController.text,
                          parent: widget.parent,
                          type: _selectedItemType ?? ItemType.UNKNOWN,
                        );
                        try {
                          await create(dto);
                        } catch (e) {
                          showErrorDialog('Ошибка входа в аккаунт');
                        }
                        Navigator.pop(context);
                      }
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
