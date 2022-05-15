import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:vending_machine/data/models/vm_user.dart';
import 'package:vending_machine/logic/cubit/scanner_cubit/scanner_cubit.dart';

import '../../router/app_router.dart';

class ScannerPage extends StatefulWidget {
  final VMUser vmUser;
  const ScannerPage({
    Key? key,
    required this.vmUser,
  }) : super(key: key);

  @override
  State<ScannerPage> createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {
  VMUser get vmUser => widget.vmUser;
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
                arguments: {"deviceId": state.deviceId, "vmUser": vmUser},
              );
            }
          },
          child: const Text("Scanning..."),
        ),
      )),
    );
  }
}
