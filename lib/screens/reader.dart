import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../services/murf_api.dart';
import '../widgets/app_bar.dart';
import '../widgets/nav_drawer.dart';

class Reader extends StatefulWidget {
  const Reader({super.key});

  @override
  State<Reader> createState() => _ReaderState();
}

class _ReaderState extends State<Reader> {

  final _readerController = TextEditingController();

  final _player = AudioPlayer();
  bool _isLoading = false; 

  Future<void> _readAloud(String text) async {
    setState(() => _isLoading = true);
    final audioUrl = await MurfApi.generateSpeech(text);
    setState(() => _isLoading = false);
    await _player.play(UrlSource(audioUrl));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Accessibility Reader"),
      drawer: NavDrawer(),
      body: ListView(
            padding: const EdgeInsets.all(32.0),
            children: [
              TextFormField(
                controller: _readerController,
                decoration: InputDecoration(
                  labelText: "Enter text: ",
                  prefixIcon: Icon(Icons.wysiwyg_outlined),
                  border: OutlineInputBorder(),
                ),
              ),
              Row(
                
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [ElevatedButton(
                  onPressed: () => _readAloud(_readerController.text) , 
                  child: _isLoading ? CircularProgressIndicator() : Text("Read Aloud"),
                  )],
              )],
          ),
      );
  }
}