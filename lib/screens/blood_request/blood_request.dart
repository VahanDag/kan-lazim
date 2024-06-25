// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:kan_lazim/core/colors.dart';
import 'package:kan_lazim/core/constants.dart';
import 'package:kan_lazim/core/custom_button.dart';
import 'package:kan_lazim/core/enums.dart';
import 'package:kan_lazim/core/extensions.dart';
import 'package:kan_lazim/core/padding_borders.dart';
import 'package:kan_lazim/screens/global_widgets.dart';

part 'request_widgets.dart';

class BloodRequest extends StatefulWidget {
  const BloodRequest({super.key});

  @override
  State<BloodRequest> createState() => _BloodRequestState();
}

class _BloodRequestState extends State<BloodRequest> {
  String? _selectedBloodType;
  final Map<BloodUgency, Color> _bloodUgency = {
    BloodUgency.Acil: ColorsConstant.red,
    BloodUgency.Orta: Colors.amber,
    BloodUgency.Bekleyebilir: Colors.green
  };
  BloodUgency _selectedUgency = BloodUgency.Orta;

  final List<String> _bloodTypes = ['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', '0+', '0-'];
  String? _selectedCity;
  String? _selectedDistrict;
  late final _nameController;
  late final _bloodUnitController;
  late final _hospitalController;
  late final _titleController;
  late final _descriptionController;

  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void initState() {
    _nameController = TextEditingController();
    _bloodUnitController = TextEditingController();
    _hospitalController = TextEditingController();
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              bloodTopContainer(
                context: context,
                child: Expanded(
                  child: ListTile(
                    title: Text(
                      "Kan İhtiyaç Duyurusu",
                      style: context.textTheme.titleLarge?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      "Kan ihtiyacını duyurmak için formu doldur",
                      style: context.textTheme.titleSmall?.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: context.deviceWidth * 0.9,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      RequestBloodField(
                          fieldTitle: "İsim (İhtiyaç sahibi kim?)", field: _textField(controller: _nameController)),
                      RequestBloodField(
                        fieldTitle: "Kan Grubu",
                        field: DropdownButton<String>(
                          underline: const SizedBox.shrink(),
                          isExpanded: true,
                          padding: PaddingBorderConstant.paddingHorizontalHigh,
                          icon: const Icon(Icons.water_drop, color: ColorsConstant.red),
                          alignment: Alignment.center,
                          hint: const Text('Kan Grubu Seçin'),
                          value: _selectedBloodType,
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedBloodType = newValue;
                            });
                          },
                          items: _bloodTypes.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                      RequestBloodField(
                          fieldTitle: "Kaç Ünite Lazım?",
                          field: _textField(keyboardType: TextInputType.number, controller: _bloodUnitController)),
                      Padding(
                        padding: PaddingBorderConstant.paddingVertical,
                        child: Column(
                          children: [
                            Padding(
                              padding: PaddingBorderConstant.paddingVertical,
                              child: Text(
                                "Aciliyet",
                                style: context.textTheme.titleMedium
                                    ?.copyWith(fontWeight: FontWeight.bold, color: Colors.grey.shade600),
                              ),
                            ),
                            Row(
                                children: _bloodUgency.entries.map(
                              (e) {
                                return _bloodUgencySelection(
                                  ugencyName: e.key,
                                  ugencyColor: e.value,
                                  selectedUgency: (ugency) {
                                    setState(() {
                                      _selectedUgency = ugency;
                                    });
                                  },
                                );
                              },
                            ).toList())
                          ],
                        ),
                      ),
                      RequestBloodField(
                          fieldTitle: "İl",
                          field: Padding(
                            padding: PaddingBorderConstant.paddingAllMedium,
                            child: GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                  isScrollControlled: true,
                                  context: context,
                                  builder: (context) {
                                    return _SearchCityAndState(
                                      isSearchCity: true,
                                      selectedDistrict: (selectedDistrict) {},
                                      selectedCity: (selectedCity) => setState(() {
                                        _selectedCity = selectedCity;
                                      }),
                                    );
                                  },
                                );
                              },
                              child: Text(_selectedCity ?? "- - - -"),
                            ),
                          )),
                      RequestBloodField(
                        fieldTitle: "İlçe",
                        field: Padding(
                          padding: PaddingBorderConstant.paddingAllMedium,
                          child: GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                isScrollControlled: true,
                                context: context,
                                builder: (context) {
                                  return _SearchCityAndState(
                                    isSearchCity: false,
                                    city: _selectedCity,
                                    selectedDistrict: (selectedDistrict) {
                                      setState(() {
                                        _selectedDistrict = selectedDistrict;
                                      });
                                    },
                                  );
                                },
                              );
                            },
                            child: Text(_selectedDistrict ?? "- - - -"),
                          ),
                        ),
                      ),
                      RequestBloodField(fieldTitle: "Hastane", field: _textField(controller: _hospitalController)),
                      RequestBloodField(fieldTitle: "Başlık", field: _textField(controller: _titleController)),
                      RequestBloodField(
                          fieldTitle: "Açıklama", field: _textField(maxLines: 4, controller: _descriptionController)),
                      CustomMainButton(
                          margin: PaddingBorderConstant.paddingVerticalHigh,
                          onPressed: () {},
                          text: "Yayınla",
                          buttonWidth: 0.75)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Expanded _bloodUgencySelection(
      {required BloodUgency ugencyName, required Color ugencyColor, required Function(BloodUgency ugency) selectedUgency}) {
    return Expanded(
        child: GestureDetector(
      onTap: () {
        selectedUgency.call(ugencyName);
      },
      child: Container(
        margin: PaddingBorderConstant.paddingHorizontal,
        height: 70,
        decoration: BoxDecoration(borderRadius: PaddingBorderConstant.borderRadius, border: Border.all(color: ugencyColor)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (_selectedUgency == ugencyName) Icon(Icons.water_drop, color: ugencyColor),
            Text(ugencyName.name),
            Container(
              height: 10,
              margin: PaddingBorderConstant.paddingOnlyTopLow,
              decoration: BoxDecoration(color: ugencyColor, borderRadius: PaddingBorderConstant.borderRadius),
            ),
          ],
        ),
      ),
    ));
  }
}
