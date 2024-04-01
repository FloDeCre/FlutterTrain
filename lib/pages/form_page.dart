import 'package:flutter/material.dart';
import 'package:renaudtest/services/liste_service.dart';

class FormPage extends StatefulWidget {

  const FormPage({
    super.key,
    required this.addItem,
  });
  final Function(Map<String, String>) addItem;

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  final titleNameController = TextEditingController();
  String selectedPicture = 'android';

  @override
  void dispose() {
    super.dispose();
    titleNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Formulaire"),
        backgroundColor: Colors.lightBlue,
      ),
      body: Container(
        margin: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 15.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Title',
                    hintText: 'Enter a title',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Required field';
                    } else {
                      return null;
                    }
                  },
                  controller: titleNameController,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 15.0),
                child: DropdownButtonFormField(
                  items: const [
                    DropdownMenuItem(
                      value: 'android',
                      child: Text('Android'),
                    ),
                    DropdownMenuItem(
                      value: 'flutter',
                      child: Text('Flutter'),
                    ),
                    DropdownMenuItem(
                      value: 'node',
                      child: Text('Node'),
                    ),
                  ],
                  decoration: const InputDecoration(
                    labelText: 'Picture',
                    hintText: 'Select a picture',
                    border: OutlineInputBorder(),
                  ),
                  value: selectedPicture,
                  onChanged: (value) => setState(() {
                    selectedPicture = value!;
                  }),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final title = titleNameController.text;
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Added to list'))
                      );
                      FocusScope.of(context).requestFocus(FocusNode());
                      widget.addItem({'title': title,'picture':selectedPicture});
                      Navigator.pop(context);
                    }
                  },
                  child: const Text(
                    'SAVE(.°..:°°::)',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//Utile : secureStorage (pour stocker token), block, http.
