import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moshaf_app/image_assets.dart';
import 'package:moshaf_app/shared/cubit/cubit/main_cubit.dart';
import 'package:moshaf_app/shared/cubit/cubit/main_state.dart';
import 'package:moshaf_app/shared/widget/reciters_widget.dart';

class RecitersScreen extends StatelessWidget {
  const RecitersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
      listener: (context, state) {},
      builder: (context, state) {
        MainCubit mainCubit = MainCubit.get(context);
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
          ),
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Assets.imagesBackground),
                fit: BoxFit.fill,
              ),
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              extendBody: true,
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: SvgPicture.asset(
                      Assets.imagesHelal,
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return RecitersWidget(
                          recitersModel: mainCubit.recitersModel!,
                          index: index,
                        );
                      },
                      itemCount: mainCubit.recitersModel!.reciters!.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          height: 60,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
