import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:store/cubits/category/fetch_category_cubit.dart';
import 'package:store/pages/global_widgets/error_dialog.dart';
import 'package:store/pages/store_products_page/widgets/product_card.dart';
import 'package:store/styles/constants.dart';

class RelatedProcutsCubit extends StatelessWidget {
  const RelatedProcutsCubit({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FetchCategoryCubit, FetchCategoryState>(
      listener: (context, state) {
        if (state is FetchCategoryFailure) {
          errorDialog(context,
              title: 'Error',
              message: state.errormessage,
              contentType: ContentType.failure);
        }
      },
      builder: (context, state) {
        if (state is FetchCategoryLoading) {
          return const SpinKitThreeBounce(
            color: Constants.buttoncolor,
          );
        } else if (state is FetchCategorySuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            child: ListView.builder(
              itemCount: state.products.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return SizedBox(
                  width: 200,
                  child: ProductCard(
                    index: index,
                    data: state.products[index],
                  ),
                );
              },
            ),
          );
        } else {
          return const Center(
            child: Text('No related products'),
          );
        }
      },
    );
  }
}
