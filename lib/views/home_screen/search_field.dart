import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/controllers/search_bloc/search_bloc.dart';

class SearchField extends StatefulWidget {
  const SearchField({super.key});
  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  late final TextEditingController _controller;

  String? _validateInput(String? input) {
    if (input == null || input.isEmpty) {
      return 'Please enter a value';
    }
    int? value = int.tryParse(input);
    if (value == null || value < 1 || value > 20) {
      return 'Please enter a number between 1 and 20';
    }
    return null;
  }

  void _validateSubmission(
      {required String value, required SearchBloc searchBloc}) {
    String? error = _validateInput(value);
    if (error != null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(error),
      ));
    } else {
      searchBloc.add(SearchByIdEvent(id: value));
    }
  }

  final OutlineInputBorder border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(30),
    borderSide: const BorderSide(color: Colors.transparent),
  );

  @override
  Widget build(BuildContext context) {
    final SearchBloc searchBloc = BlocProvider.of<SearchBloc>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextField(
        controller: _controller,
        cursorColor: Colors.grey,
        keyboardType: TextInputType.number,
        onSubmitted: (value) {
          _validateSubmission(value: value, searchBloc: searchBloc);
        },
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey.shade200,
          hintText: 'Enter Product Id (1-20)',
          prefixIcon: IconButton(
            icon: const Icon(Icons.search),
            splashColor: Colors.transparent,
            onPressed: () {
              _validateSubmission(
                value: _controller.text,
                searchBloc: searchBloc,
              );
            },
          ),
          enabledBorder: border,
          focusedBorder: border,
        ),
      ),
    );
  }
}
