import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/pages/search_page/search_page.dart';
import 'package:store/styles/assets.dart';

class HomeSearchField extends StatelessWidget {
  const HomeSearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.68,
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          prefixIcon: Image.asset(
            AppIcons.search,
            color: Theme.of(context).iconTheme.color,
            scale: 2.5,
          ),
          hintText: "Search",
        ),
        onFieldSubmitted: (value) {
          //search backend
          Get.to(() => const SearchPage(), arguments: value);

          print(value);
        },
      ),
    );
  }
}

// FutureBuilder(
//               future: GetAllStores().getStores(),
//               builder: (context, snapshot) {
//                 if (snapshot.hasData) {
//                   return ListView(
//                     clipBehavior: Clip.none,
//                     scrollDirection: Axis.horizontal,
//                     children: [
//                       ...List.generate(
//                         snapshot.data!.length,
//                         (index) {
//                           return TopStoresListView(
//                             index: index,
//                             data: snapshot.data,
//                           );
//                         },
//                       )
//                     ],
//                   );
//                 } else {
//                   return ShimmerLoading();
//                 }
//               },
//             ),
