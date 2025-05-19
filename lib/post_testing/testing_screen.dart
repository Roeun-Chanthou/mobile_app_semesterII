import 'package:flutter/material.dart';

import 'post_api_service.dart';
import 'post_model.dart';

class TestingScreen extends StatefulWidget {
  const TestingScreen({super.key});

  @override
  State<TestingScreen> createState() => _TestingScreenState();
}

class _TestingScreenState extends State<TestingScreen> {
  final _titleController = TextEditingController();
  final _bodyController = TextEditingController();
  final _userid = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String _result = "";
  bool _isLoading = false;

  @override
  void dispose() {
    _titleController.dispose();
    _bodyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('API Testing Post')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _userid,
                decoration: const InputDecoration(
                  labelText: 'User ID',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a User ID';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _bodyController,
                decoration: const InputDecoration(
                  labelText: 'Body',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a body';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildAddButton(),
                  _buildEditButton(),
                  _buildDeleteButton(),
                ],
              ),
              const SizedBox(height: 16),
              _buildResult(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAddButton() {
    return ElevatedButton.icon(
      onPressed: _isLoading ? null : _handleAdd,
      icon: const Icon(Icons.add),
      label: const Text('Add'),
    );
  }

  Widget _buildEditButton() {
    return ElevatedButton.icon(
      onPressed: _isLoading ? null : _handleEdit,
      icon: const Icon(Icons.edit),
      label: const Text('Edit'),
    );
  }

  Widget _buildDeleteButton() {
    return ElevatedButton.icon(
      onPressed: _isLoading ? null : _handleDelete,
      icon: const Icon(Icons.delete),
      label: const Text('Delete'),
    );
  }

  Widget _buildResult() {
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.data_array, size: 20),
              const SizedBox(width: 8),
              Text(
                'Result',
              ),
            ],
          ),
          const SizedBox(height: 12),
          if (_isLoading)
            const Center(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: CircularProgressIndicator(),
              ),
            )
          else
            Container(
              padding: const EdgeInsets.all(12),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: _result.startsWith('Error')
                      ? Colors.red.shade200
                      : Colors.green.shade200,
                ),
              ),
              child: Text(
                _result.isEmpty ? 'No result yet' : _result,
                style: TextStyle(
                  color: _result.startsWith('Error')
                      ? Colors.red.shade700
                      : Colors.green.shade700,
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Future<void> _handleAdd() async {
    if (!_formKey.currentState!.validate()) return;

    await _handleApiCall(() {
      final item = PostModel(
        userId: _userid.text.isNotEmpty ? int.parse(_userid.text) : 1,
        id: 100,
        title: _titleController.text,
        body: _bodyController.text,
      );
      return PostApiService().insertPost(item);
    });
  }

  Future<void> _handleEdit() async {
    if (!_formKey.currentState!.validate()) return;

    await _handleApiCall(() {
      final item = PostModel(
        userId: _userid.text.isNotEmpty ? int.parse(_userid.text) : 1,
        id: 100,
        title: _titleController.text,
        body: _bodyController.text,
      );
      return PostApiService().updatePost(item);
    });
  }

  Future<void> _handleDelete() async {
    await _handleApiCall(() {
      final item = PostModel(
        userId: _userid.text.isNotEmpty ? int.parse(_userid.text) : 1,
        id: 100,
        title: _titleController.text,
        body: _bodyController.text,
      );
      return PostApiService().deletePost(item);
    });
  }

  Future<void> _handleApiCall(Future<String> Function() apiCall) async {
    try {
      setState(() {
        _isLoading = true;
        _result = '';
      });

      final result = await apiCall();

      setState(() {
        _result = result;
      });
    } catch (e) {
      setState(() {
        _result = 'Error: ${e.toString()}';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
}
