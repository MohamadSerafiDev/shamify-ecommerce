// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:store/cubits/favourite/favourite_cubit.dart';
import 'package:store/services/stores/get_specific_store_products.dart';
import 'package:store/styles/assets.dart';

class FavButton extends StatelessWidget {
  const FavButton({
    super.key,
    required this.data,
  });

  final ProductModel data;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouriteCubit, FavouriteState>(
      builder: (context, state) {
        return SizedBox(
          child: IconButton(
            icon: Image.asset(
              data.isFavorite ? AppIcons.isfav : AppIcons.notfav,
              width: 28,
              color: data.isFavorite
                  ? Colors.red
                  : Theme.of(context).iconTheme.color,
            ),
            onPressed: () async {
              data.isFavorite = !data.isFavorite;
              String message = await BlocProvider.of<FavouriteCubit>(context)
                  .toggleFavourite(id: data.id);

              Get.snackbar(
                duration: const Duration(seconds: 1),
                'Success',
                message,
                snackPosition: SnackPosition.BOTTOM,
              );
            },
          ),
        );
      },
    );
  }
}
