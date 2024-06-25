part of 'blood_request.dart';

class _SearchCityAndStateState extends State<_SearchCityAndState> {
  List<String> _filteredCities = ProjectConstants.cityDistricts.keys.toList();
  List<String> _filteredDistricts = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (!widget.isSearchCity && widget.city != null) {
      _filteredDistricts = ProjectConstants.cityDistricts[widget.city]!;
      _searchController.addListener(() {
        filterDistricts();
      });
    } else {
      _searchController.addListener(() {
        filterCities();
      });
    }
  }

  void filterCities() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredCities = ProjectConstants.cityDistricts.keys.where((city) => city.toLowerCase().contains(query)).toList();
    });
  }

  void filterDistricts() {
    final query = _searchController.text.toLowerCase();
    print("quesry: $query");
    setState(() {
      _filteredDistricts =
          ProjectConstants.cityDistricts[widget.city]!.where((district) => district.toLowerCase().contains(query)).toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.deviceHeight * 0.85,
      child: Column(
        children: [
          Padding(
            padding: PaddingBorderConstant.paddingAllHigh,
            child: SearchBar(
              controller: _searchController,
              hintText:
                  "${widget.isSearchCity ? 'Şehir' : 'İlçe'} adı girin ${!widget.isSearchCity ? '(${widget.city})' : ''}",
              trailing: const [Icon(Icons.search)],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.isSearchCity ? _filteredCities.length : _filteredDistricts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(widget.isSearchCity ? _filteredCities[index] : _filteredDistricts[index]),
                  onTap: () {
                    setState(() {
                      if (widget.isSearchCity) {
                        widget.selectedCity!.call(_filteredCities[index]);
                      } else {
                        widget.selectedDistrict!.call(_filteredDistricts[index]);
                      }
                      Navigator.pop(context);
                      _searchController.clear();
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

Widget _textField({required TextEditingController controller, TextInputType? keyboardType, int? maxLines}) {
  return Padding(
    padding: PaddingBorderConstant.paddingOnlyLeftHigh,
    child: TextField(
      controller: controller,
      keyboardType: keyboardType,
      textInputAction: TextInputAction.next,
      maxLines: maxLines ?? 1,
      decoration: const InputDecoration(hintText: "- - - -", border: InputBorder.none),
    ),
  );
}

class _SearchCityAndState extends StatefulWidget {
  final Function(String? selectedCity)? selectedCity;
  final Function(String? selectedDistrict)? selectedDistrict;
  final bool isSearchCity;
  final String? city;

  const _SearchCityAndState({this.selectedCity, this.selectedDistrict, required this.isSearchCity, this.city});

  @override
  State<_SearchCityAndState> createState() => _SearchCityAndStateState();
}

class RequestBloodField extends StatelessWidget {
  const RequestBloodField({
    super.key,
    required this.fieldTitle,
    required this.field,
  });
  final String fieldTitle;
  final Widget field;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingBorderConstant.paddingVerticalHigh,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _formTitle(context, fieldTitle),
          Card(
              elevation: 7,
              margin: PaddingBorderConstant.paddingOnlyTopLow,
              child: SizedBox(width: context.deviceWidth, child: field)),
        ],
      ),
    );
  }
}

Padding _formTitle(BuildContext context, String title) {
  return Padding(
    padding: PaddingBorderConstant.paddingOnlyLeft,
    child: Text(
      title,
      style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold, color: Colors.grey.shade600),
    ),
  );
}
