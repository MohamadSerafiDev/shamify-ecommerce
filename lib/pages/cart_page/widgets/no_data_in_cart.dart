import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:store/cubits/navigation/navigation_cubit.dart';
import 'package:store/styles/assets.dart';
import 'package:store/styles/text_styles.dart';

class NoDataInCart extends StatelessWidget {
  const NoDataInCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppImages.parcel,
            width: 200,
          ),
          const Gap(
            30,
          ),
          const Text(
            'No products in your Cart',
            style: TextStyles.textStyle18,
          ),
          const Gap(
            30,
          ),
          ElevatedButton(
              onPressed: () {
                context.read<NavigationBarCubit>().selectTab(0);
              },
              child: const Text('Shop Now >>', style: TextStyles.textStyle18)),
        ],
      ),
    );
  }
}
