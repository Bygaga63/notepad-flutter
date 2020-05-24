import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'categories_view_model.dart';

class CategoriesView extends StatefulWidget {
  @override
  _CategoriesViewState createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  final _newCategoryController = TextEditingController();

  @override
  void dispose() {
    _newCategoryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CategoriesViewModel>.reactive(
      viewModelBuilder: () => CategoriesViewModel(),
      onModelReady: (model) => model.loadCategories(),
      builder: (context, model, children) => Scaffold(
        appBar: AppBar(
          title: Text('Choose category'),
          centerTitle: true,
        ),
        body: model.isBusy
            ? Center(child: CircularProgressIndicator())
            : _CategoryList(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) => Dialog(
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              'Create',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Divider(),
                            TextField(
                              autofocus: true,
                              controller: _newCategoryController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'New Category',
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerRight,
                              child: RaisedButton(
                                color: Theme.of(context).primaryColor,
                                onPressed: () {
                                  model.createCategory(
                                      _newCategoryController.text);
                                  _newCategoryController.clear();
                                },
                                child: Text(
                                  'Create',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ));
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

class _CategoryList extends ViewModelWidget<CategoriesViewModel> {
  @override
  Widget build(BuildContext context, CategoriesViewModel model) {
    return ListView.builder(
      itemCount: model.length,
      itemBuilder: (BuildContext context, int index) {
        final category = model.data[index];
        return Card(
          elevation: 3.0,
          child: ListTile(
            onTap: () => model.navigateToNote(category.id),
            leading: Icon(
              category.icon,
              color: Colors.black,
            ),
            title: Text(category.title),
            trailing: Icon(Icons.arrow_right),
          ),
        );
      },
    );
  }
}
