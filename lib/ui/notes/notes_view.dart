import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterappstackednotepad/ui/notes/notes_view_model.dart';
import 'package:stacked/stacked.dart';

class NotesView extends StatelessWidget {
  final int categoryId;
  NotesView({@required this.categoryId});

  @override
  Widget build(BuildContext context) {
    print('test');
    return ViewModelBuilder<NotesViewModel>.reactive(
      viewModelBuilder: () => NotesViewModel(categoryId: categoryId),
      onModelReady: (model) => model.loadNotes(categoryId),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text('Notes'),
        ),
        body: model.isBusy
            ? Center(child: CircularProgressIndicator())
            : NoteList(),
        floatingActionButton: FloatingActionButton(
          onPressed: model.navigateToCreateEditNote,
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
      ),
    );
  }
}

class NoteList extends ViewModelWidget<NotesViewModel> {
  @override
  Widget build(BuildContext context, NotesViewModel model) {
    return Container(
      child: GridView.builder(
        padding:
            EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0, bottom: 30.0),
        itemCount: model.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          final note = model.notes[index];
          return Dismissible(
            key: Key('${note.id}'),
            onDismissed: (_) async {
              await model.deleteNote(note.id);
            },
            child: Container(
              margin: const EdgeInsets.all(5.0),
              child: InkWell(
                onTap: () => model.navigateToCreateEditNote(note),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  elevation: 10.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(left: 5.0),
                        alignment: Alignment.centerLeft,
                        height: 40.0,
                        color: Theme.of(context).primaryColor,
                        child: Text(
                          note.title,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Text(note.text),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
