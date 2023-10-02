import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showModalBottomSheet(
        context: context,
        builder: (context) => FilterItem(
          size: size,
        ),
      ),
      child: Image.asset(
        "assets/images/mi_filter.png",
      ),
    );
  }
}

class FilterItem extends StatefulWidget {
  const FilterItem({
    super.key,
    required this.size,
  });
  final Size size;

  @override
  State<FilterItem> createState() => _FilterItemState();
}

class _FilterItemState extends State<FilterItem> {
  double _distanceSliderValue = 0.0;

  double _endValue = 65;
  double _startValue = 18;

  String country = "United Kingdom";
  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Container(
        height: widget.size.height / 1.5,
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Spacer(),
                const Text(
                  'Filters',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: const Text(
                    'Clear',
                    style: TextStyle(
                      color: Color(0XFFC420D2),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            const Text(
              'Intrested in',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 112,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: Color(0XFFC420d2),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Male',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 112,
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                  ),
                  child: const Center(
                    child: Text(
                      'Trans Female',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 112,
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Trans Male',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              'Location',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border:
                    Border.all(width: 1, color: Colors.grey.withOpacity(0.5)),
              ),
              padding: const EdgeInsets.all(2.0),
              child: Row(
                children: [
                  CountryCodePicker(
                    initialSelection: "United Kingdom",
                    onChanged: (value) {
                      setState(() {
                        country = value.name!;
                      });
                      print(value.name);
                    },
                    showCountryOnly: true,
                    hideMainText: true,
                    showOnlyCountryWhenClosed: false,
                    alignLeft: false,
                  ),
                  Text(country),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Text(
                  'Distance',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text('${_distanceSliderValue.toInt()}km'),
              ],
            ),
            Slider(
              min: 0,
              activeColor: const Color(0XFFc420d2),
              thumbColor: const Color(0XFFc420d2),
              max: 80,
              value: _distanceSliderValue,
              onChanged: (value) {
                setState(() {
                  _distanceSliderValue = value;
                  print(_distanceSliderValue);
                });
              },
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Text(
                  'Age',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                    '${_startValue.toInt().toString()} - ${_endValue.toInt().toString()}'),
              ],
            ),
            RangeSlider(
              values: RangeValues(_startValue, _endValue),
              onChanged: (RangeValues newValues) {
                setState(() {
                  _startValue = newValues.start;
                  _endValue = newValues.end;
                });
              },
              min: 0.0,
              max: 100.0,
              divisions: 100,
              labels: RangeLabels(
                  _startValue.toInt().toString(), _endValue.toInt().toString()),
              activeColor: Colors.purpleAccent,
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                      Color(0XFFc420d2),
                    ),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ))),
                onPressed: () => Navigator.of(context).pop(),
                child: const Text(
                  'Continue',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
