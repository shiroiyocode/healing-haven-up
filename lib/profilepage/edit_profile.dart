import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _LnameController = TextEditingController();
  final TextEditingController _FnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  String? _phoneNumber;

  bool _isNumeric(String s) => double.tryParse(s) != null;

  String? _validateName(String? value) {
    if (value == null || value.trim().isEmpty)
      return 'This field cannot be empty';
    if (_isNumeric(value.trim())) return 'Name cannot be a number';
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) return 'Email is required';
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value))
      return 'Enter a valid email';
    return null;
  }

  void _submit() {
    if (_formKey.currentState!.validate() && _phoneNumber != null) {
      showDialog(
        context: context,
        builder:
            (context) => AlertDialog(
              title: const Text("Confirm"),
              content: const Text(
                "Are you sure you want to save changes to your profile?",
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text("Cancel"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    _showSuccessDialog();
                  },
                  child: const Text("Yes"),
                ),
              ],
            ),
      );
    }
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            backgroundColor: Colors.grey.shade200,
            title: const Text(
              "Profile Changed",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            icon: const Icon(
              Icons.check_circle_rounded,
              color: Colors.green,
              size: 100,
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  'Back',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ),
            ],
          ),
    );
  }

  InputDecoration _buildDecoration(String label, Icon icon) {
    return InputDecoration(
      labelText: label,
      border: const OutlineInputBorder(),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.brown.shade800, width: 2),
      ),
      hintText: 'Enter your $label',
      prefixIcon: icon,
      filled: true,
      fillColor: Colors.grey[100],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade100,
      appBar: AppBar(
        title: const Text('Edit Profile'),
        backgroundColor: Colors.brown.shade100,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                TextFormField(
                  controller: _LnameController,
                  decoration: _buildDecoration(
                    'Last Name',
                    const Icon(Icons.person),
                  ),
                  validator: _validateName,
                ),
                const SizedBox(height: 16),

                TextFormField(
                  controller: _FnameController,
                  decoration: _buildDecoration(
                    'First Name',
                    const Icon(Icons.person),
                  ),
                  validator: _validateName,
                ),
                const SizedBox(height: 16),

                TextFormField(
                  controller: _emailController,
                  decoration: _buildDecoration(
                    'Email',
                    const Icon(Icons.email),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: _validateEmail,
                ),
                const SizedBox(height: 16),

                IntlPhoneField(
                  decoration: _buildDecoration(
                    'Phone Number',
                    const Icon(Icons.phone),
                  ),
                  initialCountryCode: 'PH',
                  onChanged: (phone) {
                    _phoneNumber = phone.completeNumber;
                  },
                  onSaved: (phone) {
                    _phoneNumber = phone?.completeNumber;
                  },
                  validator: (phone) {
                    if (phone == null || phone.number.isEmpty) {
                      return 'Phone number is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                ElevatedButton(
                  onPressed: _submit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown.shade800,
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 32,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Save Changes',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
