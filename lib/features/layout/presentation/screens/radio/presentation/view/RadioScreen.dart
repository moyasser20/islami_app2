import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app2/core/extensions/extensions.dart';
import 'package:islami_app2/core/theme/app_colors.dart';
import 'package:islami_app2/features/layout/presentation/screens/radio/presentation/view/widgets/custome_tab_button.dart';
import 'package:islami_app2/features/layout/presentation/screens/radio/presentation/view/widgets/radio_container_widget.dart';
import '../../../../../../../core/constants/app_assets.dart';
import '../viewmodel/radio_cubit.dart';
import '../viewmodel/radio_states.dart';

class RadioScreen extends StatefulWidget {
  const RadioScreen({super.key});

  @override
  State<RadioScreen> createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen> {
  int selectedRadio = 0;

  @override
  void initState() {
    super.initState();
    context.read<RadioCubit>().getRadioData();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.RadioTabBg),
          fit: BoxFit.fill,
        ),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 12),
              Image.asset(
                "assets/images/islami_image.png",
                height: size.height * 0.15,
              ).setHorizontalPadding(context, 0.15),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTabButton(
                    title: "Radio",
                    isSelected: selectedRadio == 0,
                    onTap: () => setState(() => selectedRadio = 0),
                    selectedColor: AppColors.primaryColor,
                    unselectedColor: AppColors.secondaryColor.withOpacity(0.7),
                  ),
                  CustomTabButton(
                    title: "Reciters",
                    isSelected: selectedRadio == 1,
                    onTap: () => setState(() => selectedRadio = 1),
                    selectedColor: AppColors.primaryColor,
                    unselectedColor: AppColors.secondaryColor.withOpacity(0.7),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              BlocConsumer<RadioCubit, RadioState>(
                listener: (context, state) {
                  if (state is RadioErrorState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.message)),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is RadioLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is RadioSuccessState) {
                    if (selectedRadio == 0) {
                      final radios = state.radios;
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: radios.length,
                        itemBuilder: (context, index) {
                          final radio = radios[index];
                          return RadioContainerWidget(
                            radioName: radio.name,
                            radioUrl: radio.url ?? "",
                          );
                        },
                      );
                    } else {
                      final reciters = state.reciters;
                      return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            final reciter = reciters[index];
                            return RadioContainerWidget(
                                radioName: reciter.name,
                                radioUrl: reciter.moshaf.first.server ?? "");
                          },
                          itemCount: reciters.length);
                    }
                  } else if (state is RadioErrorState) {
                    return Center(
                      child: Text(
                        "Error: ${state.message}",
                        style: const TextStyle(color: Colors.red),
                      ),
                    );
                  }
                  return const SizedBox();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
