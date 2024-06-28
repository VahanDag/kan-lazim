import 'package:flutter/material.dart';
import 'package:kan_lazim/core/colors.dart';
import 'package:kan_lazim/core/enums.dart';
import 'package:kan_lazim/core/extensions.dart';
import 'package:kan_lazim/core/padding_borders.dart';
import 'package:kan_lazim/models/request_model.dart';
import 'package:kan_lazim/services/firebase_service.dart';
import 'package:url_launcher/url_launcher.dart';

String trimToText(String text) {
  return text.trim();
}

Color getUgencyColor(String ugency) {
  if (ugency == BloodUgency.Acil.name) {
    return ColorsConstant.red;
  } else if (ugency == BloodUgency.Orta.name) {
    return Colors.yellow.shade700;
  } else if (ugency == BloodUgency.Bekleyebilir.name) {
    return Colors.green;
  } else {
    return Colors.grey;
  }
}

Future<void> browser(String url) async {
  if (!await launchUrl(Uri.parse(url))) {
    throw Exception('Could not launch $url');
  }
}

Container requestCard({required BuildContext context, required RequestModel item, required bool isOwnerPage, Function(bool state)? isRemoved}) {
  return Container(
    height: context.deviceHeight * 0.30,
    alignment: Alignment.center,
    decoration: BoxDecoration(borderRadius: PaddingBorderConstant.borderRadius, border: Border.all(color: getUgencyColor(item.ugency ?? ""))),
    // padding: PaddingBorderConstant.paddingAll,
    margin: PaddingBorderConstant.paddingVertical,

    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: PaddingBorderConstant.paddingOnlyTop,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: PaddingBorderConstant.paddingOnlyLeft,
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 100,
                      alignment: Alignment.center,
                      width: context.deviceWidth * 0.2,
                      decoration: BoxDecoration(color: Colors.red.shade100, borderRadius: PaddingBorderConstant.borderRadiusMedium),
                    ),
                    Column(
                      children: [
                        Text(
                          item.bloodType ?? "",
                          style: context.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold, color: ColorsConstant.red),
                        ),
                        Text(
                          "${item.unitAmount?.toInt()} Ünite",
                          style: context.textTheme.bodySmall?.copyWith(color: Colors.grey.shade800),
                        )
                      ],
                    ),
                    const Positioned(
                        top: -5,
                        left: -5,
                        child: Icon(
                          Icons.water_drop_rounded,
                          color: ColorsConstant.red,
                          size: 30,
                        )),
                  ],
                ),
              ),
              Expanded(
                child: ListTile(
                    title: Text(
                      item.title ?? "",
                      style: context.textTheme.titleMedium,
                    ),
                    subtitle: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.person_2_outlined,
                            size: 20,
                          ),
                          Expanded(
                            child: Text(
                              item.name ?? "",
                              style: context.textTheme.bodyMedium,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: PaddingBorderConstant.paddingVerticalLow,
                        child: Row(
                          children: [
                            const Icon(
                              Icons.location_on_outlined,
                              size: 20,
                            ),
                            Expanded(
                              child: Text(
                                "${item.city} / ${item.district}",
                                style: context.textTheme.bodyMedium,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.local_hospital_outlined,
                            size: 20,
                          ),
                          Expanded(
                            child: Text(
                              item.hospital ?? "",
                              style: context.textTheme.bodyMedium,
                            ),
                          ),
                        ],
                      )
                    ])),
              ),
              Padding(
                padding: PaddingBorderConstant.paddingOnlyRight,
                child: InkWell(
                    onTap: () async {
                      if (isOwnerPage) {
                        await FirebaseService().removeReques(item);
                        isRemoved?.call(true);
                      } else {
                        // PAYLAŞ
                      }
                    },
                    child: Icon(
                      isOwnerPage ? Icons.cancel_outlined : Icons.person_2_outlined,
                      color: isOwnerPage ? ColorsConstant.red : ColorsConstant.red,
                    )),
              )
            ],
          ),
        ),
        Padding(
          padding: PaddingBorderConstant.paddingAll,
          child: Text(maxLines: 2, overflow: TextOverflow.ellipsis, item.description ?? ""),
        ),
        const Spacer(),
        Container(
          height: 20,
          width: double.infinity,
          decoration: BoxDecoration(color: getUgencyColor(item.ugency ?? ""), borderRadius: PaddingBorderConstant.borderRadiusLow),
        )
      ],
    ),
  );
}
