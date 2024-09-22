
import 'dart:math';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';


class CustomeDropdown extends StatefulWidget {
  const CustomeDropdown({super.key});

  @override
  State<CustomeDropdown> createState() => _CustomeDropdownState();
}

class _CustomeDropdownState extends State<CustomeDropdown> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: const Text(
            'Custom Dropdown Example',
            style: TextStyle(color: Colors.white),
          ),
          bottom: const TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            labelStyle: TextStyle(fontSize: 18),
            unselectedLabelStyle: TextStyle(fontSize: 18),
            padding: EdgeInsets.all(2),
            tabs: [
              Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text(
                  'Single selection',
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text('Multi selection'),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                const SimpleDropdown(),
                const SizedBox(height: 16),
                const SearchDropdown(),
                const SizedBox(height: 16),
                // const SearchRequestDropdown(),
                // const SizedBox(height: 16),
                // const DecoratedDropdown(),
                // const SizedBox(height: 16),
                // ValidationDropdown(),
                // const SizedBox(height: 16),
                // const ControllerValidationDropdown(),
              ],
            ),
            ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                // const MultiSelectDropdown(),
                const SizedBox(height: 16),
                 MultiSelectSearchDropdown(),
                // const SizedBox(height: 16),
                // const MultiSelectSearchRequestDropdown(),
                // const SizedBox(height: 16),
                // const MultiSelectDecoratedDropdown(),
                // const SizedBox(height: 16),
                // MultiSelectValidationDropdown(),
                // const SizedBox(height: 16),
                // const MultiSelectControllerDropdown()
              ],
            ),
          ],
        ),
      ),
    );
  }
}



 List<String> _list = [
    'Developer',
    'Designer',
    'Consultant',
    'Student',
  ];

class SimpleDropdown extends StatelessWidget {
  const SimpleDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomDropdown<String>(
      hintText: 'Select job role',
      items: _list,
      initialItem: _list[0],
      onChanged: (value) {
        print('changing value to: $value');
      },
    );
  }
}









class SearchDropdown extends StatelessWidget {
  const SearchDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomDropdown.search(
      hintText: 'Select job role',
      items: _list,
      excludeSelected: false,
      onChanged: (value) {
        print('changing value to: $value');
      },
    );
  }
}

class MultiSelectSearchDropdown extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return CustomDropdown.multiSelectSearch(
      hintText: 'Select job role',
      items: _list,
      onListChanged: (value) {
        print('changing value to: $value');
      },
    );
  }
}