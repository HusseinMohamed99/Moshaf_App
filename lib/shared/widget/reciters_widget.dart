import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moshaf_app/image_assets.dart';
import 'package:moshaf_app/model/reciters_model.dart';
import 'package:moshaf_app/screens/RecitersScreen/reciters_details.dart';
import 'package:moshaf_app/shared/Colors/color_manager.dart';
import 'package:moshaf_app/shared/components/navigator.dart';

class RecitersWidget extends StatelessWidget {
  const RecitersWidget({
    super.key,
    required this.recitersModel,
    required this.index,
  });
  final RecitersModel recitersModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigateTo(
          context,
          RecitersDetailsScreen(
            number: index,
            recitersModel: recitersModel,
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(17, 32, 149, 100),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          border: Border.all(
            color: ColorsManager.kBlueColor,
          ),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Row(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  SvgPicture.asset(Assets.imagesIconMuslim),
                  Text(
                    recitersModel.reciters![index].letter ?? '',
                    style: const TextStyle(
                      color: ColorsManager.kWhiteColor,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Text(
                  recitersModel.reciters![index].name ?? '',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: ColorsManager.kWhiteColor,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
