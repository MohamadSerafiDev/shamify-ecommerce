// ignore_for_file: prefer_const_constructors

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:store/cubits/search/search_cubit.dart';
import 'package:store/pages/global_widgets/error_dialog.dart';
import 'package:store/pages/home_page/widgets/app_bar_componants.dart';
import 'package:store/styles/assets.dart';
import 'package:store/styles/constants.dart';
import 'package:store/styles/text_styles.dart';

class SearchPage extends HookWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      BlocProvider.of<SearchCubit>(context).search(query: Get.arguments);
      return null;
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.darkbackgroundcolor,
        title: TextFormField(
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
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: BlocConsumer<SearchCubit, SearchState>(
          listener: (context, state) {
            if (state is SearchFailure) {
              errorDialog(context,
                  title: 'Error',
                  message: state.errormessage,
                  contentType: ContentType.failure);
            }
          },
          builder: (context, state) {
            if (state is Searchloading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is SearchSuccess) {
              //check cubit
              return Text(state.stores[0]['name']);
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Image.asset(
                      AppImages.search,
                      width: 200,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'No thing found',
                    style: TextStyles.textStyle22,
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
