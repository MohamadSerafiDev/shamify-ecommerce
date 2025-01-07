import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:store/cubits/category/fetch_category_cubit.dart';
import 'package:store/pages/product_page/widgets/bottom_row_buttons.dart';
import 'package:store/pages/product_page/widgets/product_images_carousel_slider.dart';
import 'package:store/pages/product_page/widgets/related_procuts_cubit.dart';
import 'package:store/services/stores/get_specific_store_products.dart';
import 'package:store/styles/text_styles.dart';

class ProductPage extends HookWidget {
  final ProductModel product;

  const ProductPage({super.key, required this.product});
  @override
  Widget build(BuildContext context) {
    useEffect(() {
      BlocProvider.of<FetchCategoryCubit>(context)
          .getCategories(product.id, category: product.category);
      return null;
    }, []);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          product.name,
          overflow: TextOverflow.ellipsis,
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.78,
              child: ListView(
                clipBehavior: Clip.none,
                children: [
                  ProductImagesCarouselSlider(
                    imgUrl: product.imageURL,
                  ),
                  const Gap(16),
                  Text(product.name, style: TextStyles.textStyle22),
                  const Gap(8),
                  Text(
                    'Price : \$${product.price}',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.green,
                    ),
                  ),
                  const Divider(
                    color: Colors.grey,
                  ),
                  const Gap(12),
                  Text(
                    'category : ${product.category}',
                    style: TextStyles.textStyle18,
                  ),
                  const Gap(16),
                  const Text(
                    'description :',
                    style: TextStyles.textStyle18,
                  ),
                  const Gap(12),
                  Text(
                    product.description,
                    style: TextStyles.textStyle14,
                  ),
                  const Gap(24),
                  const Divider(
                    color: Colors.grey,
                  ),
                  const Gap(24),
                  const Text(
                    'related products >>',
                    style: TextStyles.textStyle22,
                  ),
                  const Gap(24),
                  const RelatedProcutsCubit(),
                  const Gap(32),
                ],
              ),
            ),
            BottomRowButtons(product: product),
          ],
        ),
      ),
    );
  }
}
