import 'package:flutter/material.dart';

class ChangPassword extends StatefulWidget {
  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}
class _ChangePasswordPageState extends State<ChangPassword> {
  bool _showCurrentPassword = false;
  bool _showNewPassword = false;
  bool _showConfirmPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left, color: Colors.blue),
          onPressed: () {
            Navigator.pushNamed(context, '/security');  // Navigate to the security page
          },
        ),
        title: const Text('Alterar Senha', style: TextStyle(color: Colors.blue)),
        centerTitle: false,
      ),
      backgroundColor: Colors.black, // Set the background color to black
      body: SingleChildScrollView(
        child: Container(
          color: Colors.black,
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildPasswordField('Senha Atual', _showCurrentPassword, (value) {
                setState(() {
                  _showCurrentPassword = value;
                });
              }),
              _buildPasswordField('Nova Senha', _showNewPassword, (value) {
                setState(() {
                  _showNewPassword = value;
                });
              }),
              _buildPasswordField('Confirmar Nova Senha', _showConfirmPassword, (value) {
                setState(() {
                  _showConfirmPassword = value;
                });
              }),
              SizedBox(height: 30.0),
              ElevatedButton(
                onPressed: () {
                  // Implement password change logic here
                },
                child: Text('Alterar Senha'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  textStyle: TextStyle(fontSize: 16.0),
                ),
              ),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }

  // Helper function to build password fields
  Widget _buildPasswordField(String label, bool showPassword, Function(bool) onVisibilityChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 10.0),
        TextField(
          obscureText: !showPassword,
          decoration: InputDecoration(
            hintText: 'Digite sua $label',
            hintStyle: TextStyle(
              color: Colors.grey,
            ),
            suffixIcon: IconButton(
              icon: Icon(
                showPassword ? Icons.visibility : Icons.visibility_off,
                color: Colors.black,
              ),
              onPressed: () {
                onVisibilityChanged(!showPassword);
              },
            ),
            filled: true,
            fillColor: Colors.grey[800],
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        SizedBox(height: 20.0),
      ],
    );
  }
}
