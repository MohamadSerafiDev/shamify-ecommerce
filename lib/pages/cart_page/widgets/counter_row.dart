// // ignore_for_file: prefer_const_constructors

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:store/cubits/counter/counter_cubit.dart';
// import 'package:store/styles/assets.dart';
// import 'package:store/styles/constants.dart';
// import 'package:store/styles/text_styles.dart';

// class CounterRow extends StatelessWidget {
//   CounterRow({
//     super.key,
//   });
//   int i = 4;

//   @override
//   Widget build(BuildContext context) {
//     return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
//       InkWell(
//         onTap: () {
//           BlocProvider.of<CounterCubit>(context).decrement(i: i);
//           i--;
//         },
//         child: Container(
//           height: 30,
//           width: 30,
//           decoration: BoxDecoration(
//             color: Constants.buttoncolor,
//             borderRadius: BorderRadius.circular(20),
//           ),
//           child: Image.asset(
//             AppIcons.minus,
//             color: Constants.darkinsidecolor,
//             scale: 3,
//           ),
//         ),
//       ),
//       Text(
//         '$state.i',
//         style: TextStyles.textStyle18,
//       ),
//       InkWell(
//         onTap: () {
//           BlocProvider.of<CounterCubit>(context).increment(i: i);
//         },
//         child: Container(
//           height: 30,
//           width: 30,
//           decoration: BoxDecoration(
//             color: Constants.buttoncolor,
//             borderRadius: BorderRadius.circular(20),
//           ),
//           child: Image.asset(
//             AppIcons.plus,
//             color: Constants.darkinsidecolor,
//             scale: 3,
//           ),
//         ),
//       ),
//     ]);
//   }
// }
