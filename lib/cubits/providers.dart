import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:OrderBook/cubits/errorCubit.dart';
import 'package:OrderBook/cubits/transactionCubit.dart';

// All providers here.
class Providers extends StatelessWidget {
  final Widget child;

  Providers({
    @required this.child,
  });
  // For global providers
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ErrorCubit>.value(value: errorCubit),
        BlocProvider<BidTransationCubit>.value(value: bidTransationCubit),
        BlocProvider<AskTransactionCubit>.value(value: askTransactionCubit),
      ],
      child: child,
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return MultiBlocProvider(
  //     providers: [
  //       BlocProvider<ErrorCubit>(
  //         create: (context) => ErrorCubit(),
  //       ),
  //       BlocProvider<BidTransationCubit>(
  //         create: (context) => BidTransationCubit(),
  //       ),
  //       BlocProvider<AskTransactionCubit>(
  //         create: (context) => AskTransactionCubit(),
  //       ),
  //     ],
  //     child: child,
  //   );
  // }
}
