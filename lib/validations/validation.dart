import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';

class TestValidation extends StatefulWidget {
  const TestValidation({super.key});

  @override
  State<TestValidation> createState() => _TestValidationState();
}

class _TestValidationState extends State<TestValidation> {
  final TextEditingController _controller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _validateAndSubmit() async {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Validation Passed!')),
      );
    } else {
      if (await Vibration.hasVibrator() ?? false) {
        Vibration.vibrate(duration: 500); 
      }
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter your name')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test Validation"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _controller,
                decoration: const InputDecoration(
                  labelText: "Enter your name",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Name cannot be empty!";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _validateAndSubmit,
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
