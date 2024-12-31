import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:store/styles/constants.dart';
import 'package:store/styles/text_styles.dart';

class SearchLoadingDoubleBounce extends StatelessWidget {
  const SearchLoadingDoubleBounce({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: SpinKitDoubleBounce(
            color: Constants.buttoncolor,
            size: 100,
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Text('Loading ...', style: TextStyles.textStyle22),
      ],
    );
  }
}
