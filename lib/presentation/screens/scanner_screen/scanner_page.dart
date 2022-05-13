import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vending_machine/logic/cubit/scanner_cubit/scanner_cubit.dart';

import '../../router/app_router.dart';

class ScannerPage extends StatefulWidget {
  const ScannerPage({Key? key}) : super(key: key);

  @override
  State<ScannerPage> createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {
  Future scan() => Future.delayed(const Duration(seconds: 2)).then((value) =>
      BlocProvider.of<ScannerCubit>(context).scanned(deviceId: "123"));
  @override
  Widget build(BuildContext context) {
    scan();
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: BlocListener<ScannerCubit, ScannerState>(
          listener: (context, state) {
            if (state is ScannerSucceed) {
              Navigator.pushNamedAndRemoveUntil(
                context,
                AppRouter.homePage,
                (route) => false,
                arguments: state.deviceId,
              );
            }
          },
          child: const Text("Scanning..."),
        ),
      )),
    );
  }
}
