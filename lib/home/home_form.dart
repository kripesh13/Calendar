import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:test/home/home_state.dart';

class HomeForm extends StatelessWidget {
  const HomeForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Form'),
      ),
      body: Consumer<HomeState>(
        builder: (context, value, _) {
          return Stack(
            children: [
              AbsorbPointer(
                absorbing:
                    value.onSubmitLoading, // Block interactions when loading
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: value.nameController,
                        decoration: InputDecoration(
                          labelText: 'Enter some text',
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: value.onSubmitLoading
                            ? null
                            : () async {
                                // Show loading indicator
                                value.onSumit();
                              },
                        child: Text('Change Text with Loading'),
                      ),
                    ],
                  ),
                ),
              ),
              if (value.onSubmitLoading)
                Container(
                  color: Colors.black.withOpacity(0.5), // Dim the background
                ),
            ],
          );
        },
      ),
    );
  }
}
