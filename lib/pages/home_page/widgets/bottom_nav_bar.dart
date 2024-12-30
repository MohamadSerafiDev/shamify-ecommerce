import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/cubits/navigation/navigation_cubit.dart';
import 'package:store/custom_icons.dart';
import 'package:store/styles/constants.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBarCubit, NavigationBarState>(
      builder: (context, state) {
        return CrystalNavigationBar(
          currentIndex: state.selectedIndex,
          selectedItemColor: Constants.buttoncolor,
          unselectedItemColor: Theme.of(context).iconTheme.color,
          items: [
            CrystalNavigationBarItem(
              icon: CustomIcons.home_1,
            ),
            CrystalNavigationBarItem(
              icon: Icons.shopping_bag,
            ),
            CrystalNavigationBarItem(
              icon: CustomIcons.orders,
            ),
            CrystalNavigationBarItem(
              icon: CustomIcons.profile,
            ),
          ],
          backgroundColor: Colors.grey.withOpacity(0.1),
          enableFloatingNavBar: true,
          boxShadow: [
            BoxShadow(
                blurRadius: 10,
                color: Colors.grey.withOpacity(0.3),
                blurStyle: BlurStyle.inner,
                offset: const Offset(0, 2)),
          ],
          duration: const Duration(seconds: 1),
          enablePaddingAnimation: true,
          paddingR: const EdgeInsets.symmetric(horizontal: 10),
          onTap: (selected) {
            context.read<NavigationBarCubit>().selectTab(selected);
          },
        );
      },
    );
  }
}
