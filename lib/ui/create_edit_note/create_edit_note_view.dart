import 'package:flutter/material.dart';
import 'package:flutterappstackednotepad/models/note.dart';
import 'package:flutterappstackednotepad/ui/create_edit_note/create_edit_note_view_model.dart';
import 'package:stacked/stacked.dart';

class CreateEditNoteView extends StatefulWidget {
  final Note note;
  CreateEditNoteView({@required this.note});

  @override
  _CreateEditNoteViewState createState() => _CreateEditNoteViewState();
}

class _CreateEditNoteViewState extends State<CreateEditNoteView> {
  var _titleController;
  var _textController;

  @override
  void initState() {
    super.initState();
    final note = widget.note;
    _titleController = TextEditingController(text: note.title);
    _textController = TextEditingController(text: note.text);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreateEditNoteViewModel>.reactive(
      viewModelBuilder: () => CreateEditNoteViewModel(note: widget.note),
      builder: (context, model, child) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Text(model.isEdit ? 'Edit' : 'Create'),
          ),
          body: SingleChildScrollView(
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: _titleController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Title',
                    ),
                  ),
                  SizedBox(height: 20.0),
                  TextField(
                    maxLines: 10,
                    controller: _textController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Text',
                    ),
                  ),
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              final title = _titleController.text;
              final text = _textController.text;
              model.saveNote(title, text);
              FocusScope.of(context).unfocus();
            },
            child: Icon(Icons.save),
          ),
          bottomNavigationBar: BottomAppBar(
            shape: CircularNotchedRectangle(),
            clipBehavior: Clip.antiAlias,
            notchMargin: 5.0,
            child: Container(
              color: Theme.of(context).primaryColor,
              height: 200.0,
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        );
      },
    );
  }
}
