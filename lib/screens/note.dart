import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import '../services/murf_api.dart';
import '../widgets/app_bar.dart';
import '../widgets/nav_drawer.dart';

class Note extends StatefulWidget {
  const Note({super.key});

  @override
  State<Note> createState() => _NoteState();
}

class _NoteState extends State<Note> {

  bool _isLoading = false; 
  final _noteController = TextEditingController();

  Future<void> _download(String text, BuildContext context) async {
    setState(() => _isLoading = true);
    final audioUrl = await MurfApi.generateSpeech(text);
    setState(() => _isLoading = false);

    final dir = await getDownloadsDirectory();
  final filePath = '${dir!.path}/murf_audio_${DateTime.now().millisecondsSinceEpoch}.mp3';

  try {
    await Dio().download(audioUrl, filePath);
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Downloaded to $filePath")),
    );
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Download failed: $e")),
      );
  }
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Voice Notes"),
      drawer: NavDrawer(),
      body: ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              TextFormField(
                controller: _noteController,
                decoration: InputDecoration(
                  labelText: "Enter text: ",
                  prefixIcon: Icon(Icons.wysiwyg_outlined),
                  border: OutlineInputBorder(),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [ElevatedButton(
                  onPressed: () =>  (_download(_noteController.text, context)), 
                  child: _isLoading ? CircularProgressIndicator() : Text("Download"),
                  )],
              )],
          ),
    );
  }
}