import 'package:flutter/material.dart';
import 'package:flutterappstackednotepad/ui/notes/notes_view_model.dart';
import 'package:stacked/stacked.dart';

class NotesView extends StatelessWidget {
  final int categoryId;
  NotesView({@required this.categoryId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ViewModelBuilder<NotesViewModel>.reactive(
        viewModelBuilder: () => NotesViewModel(categoryId: categoryId),
        onModelReady: (model) => model.loadNotes(categoryId),
        builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            title: Text('Notes'),
          ),
          body: model.isBusy
              ? Center(child: CircularProgressIndicator())
              : NoteList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        clipBehavior: Clip.antiAlias,
        notchMargin: 5.0,
        child: Container(
          color: Theme.of(context).primaryColor,
          height: 50.0,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class NoteList extends ViewModelWidget<NotesViewModel> {
  @override
  Widget build(BuildContext context, NotesViewModel model) {
    return Container(
      child: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          final note = model.notes[index];
          return Container(
            child: Card(
              child: Center(child: Text(note.title)),
            ),
          );
        },
      ),
    );
  }
}
