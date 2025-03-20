import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:store/cubits/navigation/navigation_cubit.dart';
import 'package:store/pages/home_page/widgets/bottom_nav_bar.dart';
import 'package:store/styles/assets.dart';
import 'package:store/styles/constants.dart';

class MainHomePage extends HookWidget {
  const MainHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      setupFirebaseMessaging();
      print('setup done');
      return null;
    });
    return Scaffold(
      extendBody: true,
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

//set up firebase notification here
void setupFirebaseMessaging() async {
  // Handle foreground notifications
  FirebaseMessaging.onMessage.listen(
    (RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        // Display the notification
        Get.snackbar(
          notification.title!,
          notification.body!,
          leftBarIndicatorColor: Constants.buttoncolor,
          isDismissible: true, 
          icon: Image.asset(
            AppImages.bell,
            height: 30,
            width: 30,
          ),
        );
        print(
            "Notification received: ${notification.title}, ${notification.body}");
      }
    },
  );
}
