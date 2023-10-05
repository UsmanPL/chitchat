import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../constants/globals.dart';
import '../models/country.dart';
import '../utils/mixins/validator_mixin.dart';

class PhoneTextField extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final FormFieldValidator<String> validator;

  const PhoneTextField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.validator,
  });

  @override
  State<PhoneTextField> createState() => _PhoneTextFieldState();
}

class _PhoneTextFieldState extends State<PhoneTextField> with ValidatorMixin {
  Country? _selectedCountry;

  @override
  Widget build(BuildContext context) => Form(
        // key: widget.formKey,
        child: Container(
          margin: EdgeInsets.symmetric(
            vertical: sizeConfig.height(.01),
            horizontal: sizeConfig.width(.04),
          ),
          child: TextFormField(
              controller: widget.controller,
              focusNode: widget.focusNode,
              keyboardType: TextInputType.phone,
              textInputAction: TextInputAction.next,
              onChanged: (value) {
                final String phoneNumber =
                    "${_selectedCountry?.dialCode}$value";
                print(phoneNumber);
              },
              decoration: InputDecoration(
                labelText: "Phone",
                labelStyle: Theme.of(context).textTheme.labelMedium?.copyWith(
                      fontSize: 14,
                      color: widget.focusNode.hasFocus
                          ? Theme.of(context).colorScheme.primary
                          : Colors.grey[600],
                    ),
                prefix: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: InkWell(
                    onTap: _goToCountriesPage,
                    child: Text(
                      _selectedCountry?.dialCode ?? "Code",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ),
              ),
              validator: (input) {
                return widget.validator(input);
              }),
        ),
      );

  // Functions
  void _goToCountriesPage() async {
    final Country? country = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => const CountriesPage(),
      ),
    ); //context.push<Country>("/registration/countries");
    if (country != null) {
      setState(() => _selectedCountry = country);
    }
  }
}

class CountriesPage extends StatefulWidget {
  const CountriesPage({super.key});

  @override
  State<CountriesPage> createState() => _CountriesPageState();
}

class _CountriesPageState extends State<CountriesPage> {
  List<Country> countries = [];

  @override
  void initState() {
    for (var element in countriesMap) {
      countries.add(
        Country.fromJSON(element),
      );
    }

    for (var element in countries) {
      if (kDebugMode) {
        print(element.toString());
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("Choose a country"),
        ),
        body: ListView.builder(
          itemCount: countries.length,
          itemBuilder: (BuildContext context, int index) => MaterialButton(
            onPressed: () => _selectCountry(countries[index]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: sizeConfig.width(.6),
                  child: Text(
                    countries[index].name,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                Text(
                  countries[index].dialCode,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
              ],
            ),
          ),
        ),
      );

  void _selectCountry(Country country) =>
      Navigator.pop(context, country); // context.pop(country);
}
