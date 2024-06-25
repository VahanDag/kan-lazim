import 'package:flutter/material.dart';
import 'package:kan_lazim/core/colors.dart';
import 'package:kan_lazim/core/extensions.dart';
import 'package:kan_lazim/core/padding_borders.dart';
import 'package:kan_lazim/screens/global_widgets.dart';

class BloodDoners extends StatefulWidget {
  const BloodDoners({super.key});

  @override
  State<BloodDoners> createState() => _BloodDonersState();
}

class _BloodDonersState extends State<BloodDoners> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            bloodTopContainer(
                context: context,
                child: Expanded(
                    child: ListTile(
                  title: Text(
                    "Istanbul",
                    style: context.textTheme.titleLarge?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  leading: const Icon(
                    Icons.share_location,
                    size: 40,
                    color: Colors.white,
                  ),
                ))),
            Expanded(
              child: SizedBox(
                width: context.deviceWidth * 0.9,
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: context.deviceHeight * 0.30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: PaddingBorderConstant.borderRadius, border: Border.all(color: ColorsConstant.red)),
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
                                        decoration: BoxDecoration(
                                            color: Colors.red.shade100,
                                            borderRadius: PaddingBorderConstant.borderRadiusMedium),
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            "AB+",
                                            style: context.textTheme.titleLarge
                                                ?.copyWith(fontWeight: FontWeight.bold, color: ColorsConstant.red),
                                          ),
                                          Text(
                                            "0.3 Ünite",
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
                                        "Acil kan lazım!",
                                        style: context.textTheme.titleMedium,
                                      ),
                                      subtitle: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.person_2_outlined,
                                              size: 20,
                                            ),
                                            Text(
                                              "Ahmet Çakar",
                                              style: context.textTheme.bodyMedium,
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
                                              Text(
                                                "İstanbul",
                                                style: context.textTheme.bodyMedium,
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
                                            Text(
                                              "Battalgazi Devlet Hastanesi",
                                              style: context.textTheme.bodyMedium,
                                            ),
                                          ],
                                        )
                                      ])),
                                ),
                                Padding(
                                  padding: PaddingBorderConstant.paddingOnlyRight,
                                  child: InkWell(onTap: () {}, child: const Icon(Icons.share)),
                                )
                              ],
                            ),
                          ),
                          const Padding(
                            padding: PaddingBorderConstant.paddingAll,
                            child: Text(
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                "Anim sit est do sit occaecat veniam esse occaecat cupidatat consectetur consectetur proident. Laborum tempor nisi tempor commodo cupidatat consequat sint aute amet mollit sint et dolor. Lorem quis eu sunt laboris ad duis aute irure laborum laborum Lorem sunt eu anim."),
                          ),
                          const Spacer(),
                          Container(
                            height: 20,
                            width: double.infinity,
                            decoration:
                                BoxDecoration(color: Colors.red, borderRadius: PaddingBorderConstant.borderRadiusLow),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
