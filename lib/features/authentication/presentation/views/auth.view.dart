import 'package:flutter/material.dart';

import '../widgets/auth.textfield.dart';

class AuthView extends StatefulWidget {
  const AuthView({super.key});

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  bool _isSignIn = true;

  void _toggleAuthMode() {
    setState(() {
      _isSignIn = !_isSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(
              Icons.note,
              size: 60,
              // color: Colors.blue, // Set icon color
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .08,
              child: Card(
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: _toggleAuthMode,
                        child: Container(
                          height: MediaQuery.of(context).size.height,
                          // color: Colors.red[400],
                          child: const Center(child: Text('Sign In')),
                        ),
                      ),
                    ),
                    const VerticalDivider(
                      thickness: 5,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: _toggleAuthMode,
                        child: Container(
                          height: MediaQuery.of(context).size.height,
                          // color: Colors.red,
                          child: const Center(child: Text('Sign  Up')),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            AuthTextFields(
              key: widget.key,
              labelText: 'Email',
            ),
            const SizedBox(height: 8),
            AuthTextFields(
              key: widget.key,
              labelText: 'Password',
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .06,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  _isSignIn ? 'Sign In' : 'Sign Up',
                  style: const TextStyle(fontSize: 20), // Set button text color
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
