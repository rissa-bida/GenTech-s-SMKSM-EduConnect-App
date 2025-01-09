import 'package:flutter/material.dart';

class Announcement {
  String title;
  String description;

  Announcement({required this.title, required this.description});
}

class AnnouncementScreen extends StatefulWidget {
  const AnnouncementScreen({super.key});

  @override
  _AnnouncementScreenState createState() => _AnnouncementScreenState();
}

class _AnnouncementScreenState extends State<AnnouncementScreen> {
  final List<Announcement> _announcements = [];
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  int? _editingIndex;

  void _addOrUpdateAnnouncement() {
    if (_titleController.text.isNotEmpty &&
        _descriptionController.text.isNotEmpty) {
      setState(() {
        if (_editingIndex != null) {
          _announcements[_editingIndex!] = Announcement(
            title: _titleController.text,
            description: _descriptionController.text,
          );
          _editingIndex = null;
        } else {
          _announcements.add(Announcement(
            title: _titleController.text,
            description: _descriptionController.text,
          ));
        }
        _titleController.clear();
        _descriptionController.clear();
      });
    }
  }

  void _editAnnouncement(int index) {
    setState(() {
      _editingIndex = index;
      _titleController.text = _announcements[index].title;
      _descriptionController.text = _announcements[index].description;
    });
  }

  void _deleteAnnouncement(int index) {
    setState(() {
      _announcements.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Announcements - Class 4A'),
        backgroundColor: Colors.red, // Set the AppBar color here
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
              decoration: InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _descriptionController,
              maxLines: 5,
              decoration: InputDecoration(
                labelText: 'Announcement Description',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addOrUpdateAnnouncement,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: Text(_editingIndex != null
                  ? 'Update Announcement'
                  : 'Add Announcement'),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _announcements.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: ListTile(
                      title: Text(_announcements[index].title),
                      subtitle: Text(_announcements[index].description),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () => _editAnnouncement(index),
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () => _deleteAnnouncement(index),
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
