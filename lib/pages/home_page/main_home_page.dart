import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/cubits/navigation/navigation_cubit.dart';
import 'package:store/pages/home_page/widgets/bottom_nav_bar.dart';

class MainHomePage extends StatelessWidget {
  const MainHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      //top search
      // appBar: AppBarComponants(
      //   searchcontroller: searchcontroller,
      // ),
      bottomNavigationBar: const BottomNavBar(),
      body: BlocBuilder<NavigationBarCubit, NavigationBarState>(
        builder: (context, state) {
          return AnimatedSwitcher(
            duration: const Duration(
              milliseconds: 300,
            ),
            transitionBuilder: (Widget child, Animation<double> animation) =>
                FadeTransition(opacity: animation, child: child),
            child: BlocProvider.of<NavigationBarCubit>(context).pages[
                BlocProvider.of<NavigationBarCubit>(context).currentIndex],
          );
        },
      ),
    );
  }
}
