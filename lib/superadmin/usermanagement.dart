import 'package:flutter/material.dart';

class UserManagementScreen extends StatefulWidget {
  const UserManagementScreen({super.key});

  @override
  State<UserManagementScreen> createState() => _UserManagementScreenState();
}

class _UserManagementScreenState extends State<UserManagementScreen> {
  List<Map<String, String>> users = [
    {'Email': 'kenneth@email.coms', 'Password': '12345678'},
    {'Email': 'asa@email.com', 'Password': '12345678'},
  ];

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isConfirmPasswordHidden = true;
  bool isPasswordHidden = true;

  void _addUser() {
    isPasswordHidden = true; // Reset state before showing dialog

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder:
              (context, setStateDialog) => AlertDialog(
                backgroundColor: Colors.grey[300],
                title: Text(
                  "Create New Account",
                  style: TextStyle(
                    color: Colors.brown[800],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                content: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.brown.shade800,
                              width: 2,
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.grey[300],
                        ),
                      ),

                      SizedBox(height: 5),

                      TextField(
                        controller: _passwordController,
                        obscureText: isPasswordHidden,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          suffixIcon: IconButton(
                            icon: Icon(
                              isPasswordHidden
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () {
                              // Use the dialog's setState!
                              setStateDialog(() {
                                isPasswordHidden = !isPasswordHidden;
                              });
                            },
                          ),
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.brown.shade800,
                              width: 2,
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.grey[300],
                        ),
                      ),
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      _emailController.clear();
                      _passwordController.clear();
                      Navigator.pop(context);
                    },
                    child: Text("Cancel", style: TextStyle(color: Colors.grey)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_emailController.text.isNotEmpty &&
                          _passwordController.text.isNotEmpty) {
                        setState(() {
                          users.add({
                            'Email': _emailController.text,
                            'Password': _passwordController.text,
                          });
                        });
                        _emailController.clear();
                        _passwordController.clear();
                        Navigator.pop(context);
                      }
                    },
                    child: Text(
                      "Create",
                      style: TextStyle(color: Colors.brown[800]),
                    ),
                  ),
                ],
              ),
        );
      },
    );
  }

  void _deleteUser(int index) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            backgroundColor: Colors.grey[300],
            title: const Text("Confirm Delete"),
            content: Text(
              "Are you sure you want to delete this admin account ${users[index]['Email']}?",
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Cancel", style: TextStyle(color: Colors.grey)),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent[700],
                ),
                onPressed: () {
                  setState(() {
                    users.removeAt(index);
                  });
                  Navigator.pop(context);
                },
                child: Text("Delete", style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.grey.shade300,
        title: Text(
          "Admin Accounts",
          style: TextStyle(
            color: Colors.brown.shade800,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addUser,
        backgroundColor: Colors.white,
        child: Icon(Icons.add, color: Colors.brown),
      ),
      body:
          users.isEmpty
              ? const Center(child: Text("No users found."))
              : ListView.builder(
                itemCount: users.length,
                padding: const EdgeInsets.all(16),
                itemBuilder: (context, index) {
                  final user = users[index];
                  return Card(
                    elevation: 3,
                    margin: const EdgeInsets.only(bottom: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      title: Text(user['Email']!),
                      subtitle: Text(user['Password']!),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => _deleteUser(index),
                      ),
                    ),
                  );
                },
              ),
    );
  }
}
