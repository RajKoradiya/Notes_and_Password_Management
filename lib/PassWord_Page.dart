import 'package:flutter/material.dart';

void main() {
  runApp(PassWordPage());
}

class PassWordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Password Manager',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PasswordListPage(),
    );
  }
}

class PasswordListPage extends StatefulWidget {
  @override
  _PasswordListPageState createState() => _PasswordListPageState();
}

class _PasswordListPageState extends State<PasswordListPage> {
  List<Map<String, dynamic>> passwords = [];
  bool hidePasswords = true;

  void addPassword() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String newSiteName = '';
        String newPassword = '';
        Color selectedColor = Colors.blue;

        return AlertDialog(
          title: Text('Add Password'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Site Name'),
                onChanged: (value) {
                  newSiteName = value;
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Password'),
                onChanged: (value) {
                  newPassword = value;
                },
              ),
              SizedBox(height: 16),
              Text('Select Color:'),
              Wrap(
                children: [
                  ColorOption(
                    color: Colors.blue,
                    isSelected: selectedColor == Colors.blue,
                    onTap: () {
                      setState(() {
                        selectedColor = Colors.blue;
                      });
                    },
                  ),
                  ColorOption(
                    color: Colors.green,
                    isSelected: selectedColor == Colors.green,
                    onTap: () {
                      setState(() {
                        selectedColor = Colors.green;
                      });
                    },
                  ),
                  ColorOption(
                    color: Colors.red,
                    isSelected: selectedColor == Colors.red,
                    onTap: () {
                      setState(() {
                        selectedColor = Colors.red;
                      });
                    },
                  ),
                  // Add more color options as needed
                ],
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: Text('Add'),
              onPressed: () {
                if (newSiteName.isNotEmpty && newPassword.isNotEmpty) {
                  setState(() {
                    passwords.add({
                      'siteName': newSiteName,
                      'password': newPassword,
                      'color': selectedColor,
                    });
                  });

                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  void deletePassword(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Password'),
          content: Text('Are you sure you want to delete this password?'),
          actions: [
            ElevatedButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: Text('Delete'),
              onPressed: () {
                setState(() {
                  passwords.removeAt(index);
                });

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
        title: Text('Password Manager'),
      ),
      body: ListView.builder(
        itemCount: passwords.length,
        itemBuilder: (BuildContext context, int index) {
          final passwordEntry = passwords[index];
          final siteName = passwordEntry['siteName'];
          final password = passwordEntry['password'];
          final color = passwordEntry['color'];

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(
                siteName!,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: hidePasswords
                  ? Text(
                '******',
                style: TextStyle(
                  color: Colors.white,
                ),
              )
                  : Text(
                password!,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              tileColor: color,
              trailing: IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
                onPressed: () => deletePassword(index),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: addPassword,
      ),
      persistentFooterButtons: [
        IconButton(
          icon: Icon(
            hidePasswords ? Icons.visibility_off : Icons.visibility,
            color: Colors.blue,
          ),
          onPressed: () {
            setState(() {
              hidePasswords = !hidePasswords;
            });
          },
        ),
      ],
    );
  }
}

class ColorOption extends StatelessWidget {
  final Color color;
  final bool isSelected;
  final VoidCallback onTap;

  const ColorOption({
    required this.color,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 32,
        height: 32,
        margin: EdgeInsets.all(4),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
          border: isSelected ? Border.all(color: Colors.white, width: 2) : null,
        ),
      ),
    );
  }
}
