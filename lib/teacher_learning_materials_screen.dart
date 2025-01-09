import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class LearningMaterialsScreen extends StatefulWidget {
  @override
  _LearningMaterialsScreenState createState() =>
      _LearningMaterialsScreenState();
}

class _LearningMaterialsScreenState extends State<LearningMaterialsScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final List<Map<String, String>> _learningMaterials = [];
  int? _editingIndex;

  void _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'pptx', 'docx', 'txt'],
    );

    if (result != null) {
      PlatformFile file = result.files.first;
      print('Picked file: ${file.name}, path: ${file.path}'); // Debugging line
      if (file.path != null) {
        setState(() {
          _learningMaterials.add({
            'title': file.name,
            'description': 'File path: ${file.path}',
          });
        });
      } else {
        print('File path is null'); // Debugging line
      }
    } else {
      print('No file selected'); // Debugging line
    }
  }

  void _addOrUpdateMaterial() {
    if (_titleController.text.isNotEmpty ||
        _descriptionController.text.isNotEmpty) {
      setState(() {
        if (_editingIndex != null) {
          _learningMaterials[_editingIndex!] = {
            'title': _titleController.text,
            'description': _descriptionController.text,
          };
          _editingIndex = null;
        } else {
          _learningMaterials.add({
            'title': _titleController.text,
            'description': _descriptionController.text,
          });
        }
        _titleController.clear();
        _descriptionController.clear();
      });
    }
  }

  void _editMaterial(int index) {
    setState(() {
      _editingIndex = index;
      _titleController.text = _learningMaterials[index]['title']!;
      _descriptionController.text = _learningMaterials[index]['description']!;
    });
  }

  void _deleteMaterial(int index) {
    setState(() {
      _learningMaterials.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Learning Materials - Class 4A'),
        backgroundColor: Colors.red,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.red.shade100, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration:
                  InputDecoration(labelText: 'Title of Learning Material'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Additional Notes/Links'),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: _pickFile,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: Text('Upload File'),
                ),
                ElevatedButton(
                  onPressed: _addOrUpdateMaterial,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: Text(_editingIndex != null
                      ? 'Update Material'
                      : 'Add Material'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _learningMaterials.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: ListTile(
                      title: Text(_learningMaterials[index]['title']!),
                      subtitle: Text(_learningMaterials[index]['description']!),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () => _editMaterial(index),
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () => _deleteMaterial(index),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
