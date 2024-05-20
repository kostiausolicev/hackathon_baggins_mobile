import 'package:flutter/material.dart';
import 'package:flutter_app/dto/user/UserDto.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../http/UserClient.dart';
import 'ProfileUser.dart';

class ViewUsers extends StatefulWidget {
  final PageController adminPageController;

  ViewUsers({required this.adminPageController});

  @override
  _ViewUsersState createState() => _ViewUsersState();
}

class _ViewUsersState extends State<ViewUsers> {
  bool _isLoading = true;
  List<UserDto> _users = [];
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchUsers();
  }

  Future<void> _fetchUsers() async {
    try {
      var users = await getAll();
      setState(() {
        _users = users;
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
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
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
                          onChanged: (value) {
                            setState(() {});
                          },
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
                Expanded(
                  child: ListView.builder(
                      itemCount: _users.length,
                      itemBuilder: (context, index) {
                        var user = _users[index];
                        return UserItem(
                          name: "${user.firstName} ${user.lastName}",
                          role: user.email,
                          email: user.email,
                          color: !user.isConform ? Color(0xFFA82230) : Colors.white,
                          AdminPageController: widget.adminPageController,
                        );
                      }),
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
                  MaterialPageRoute(
                      builder: (context) => ProfileUser(
                          AdminPageController: AdminPageController)),
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
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: textColor),
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
