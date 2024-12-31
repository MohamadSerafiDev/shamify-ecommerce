import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:store/cubits/search/search_cubit.dart';
import 'package:store/styles/assets.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          prefixIcon: Image.asset(
            AppIcons.search,
            color: Colors.white,
            scale: 2.5,
          ),
          hintText: Get.arguments,
        ),
        onFieldSubmitted: (value) {
          //search backend
          BlocProvider.of<SearchCubit>(context).search(query: value);
        },
      ),
    );
  }
}
