import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../ViewModel/Body/SimpleTools/WalkerCounter/walk_counter_viewmodel.dart';

class WalkCounterView extends StatelessWidget {
  const WalkCounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      onViewModelReady: (model) => model.initPlatformState,
      viewModelBuilder: () => WalkCounterViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          body: Column(
            children: [
              Text(model.status),
              Text(model.stepCount.toString()),
            ],
          ),
        );
      },);
  }
}
