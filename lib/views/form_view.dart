import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http_rest_api/base_client.dart';
import 'package:http_rest_api/model/Farmer.dart';

late final TextEditingController _nid;
late final TextEditingController _givenName;
late final TextEditingController _surname;
late final SingleValueDropDownController _gender;
// late final TextEditingController _dob;
late final SingleValueDropDownController _maritalStatus;
late final MultiValueDropDownController _language;
late final SingleValueDropDownController _profession;
late final TextEditingController _contact;
late final TextEditingController _email;
late final TextEditingController _street;
late final TextEditingController _district;
late final TextEditingController _city;
late final SingleValueDropDownController _country;
late final SingleValueDropDownController _continent;

List<String> selectedLanguages = [];

class FormView extends StatefulWidget {
  const FormView({super.key});

  @override
  State<FormView> createState() => _FormViewState();
}

class _FormViewState extends State<FormView> {
  late final FocusNode textFieldFocusNode;
  late final FocusNode searchFocusNode;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _nid = TextEditingController();
    _givenName = TextEditingController();
    _surname = TextEditingController();
    _gender = SingleValueDropDownController();
    // _dob = TextEditingController();
    _maritalStatus = SingleValueDropDownController();
    _language = MultiValueDropDownController();
    _profession = SingleValueDropDownController();
    _contact = TextEditingController();
    _email = TextEditingController();
    _street = TextEditingController();
    _district = TextEditingController();
    _city = TextEditingController();
    _country = SingleValueDropDownController();
    _continent = SingleValueDropDownController();

    textFieldFocusNode = FocusNode();
    searchFocusNode = FocusNode();

    super.initState();
  }

  @override
  void dispose() {
    _nid.dispose();
    _givenName.dispose();
    _surname.dispose();
    _gender.dispose();
    // _dob.dispose();
    _maritalStatus.dispose();
    _language.dispose();
    _profession.dispose();
    _contact.dispose();
    _email.dispose();
    _street.dispose();
    _district.dispose();
    _city.dispose();
    _country.dispose();
    _continent.dispose();

    textFieldFocusNode.dispose();
    searchFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Farmer Identity'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 16,
              ),
              child: Column(
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is required';
                      }
                      return null;
                    },
                    controller: _nid,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'National ID / Passport ID',
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is required';
                      }
                      return null;
                    },
                    controller: _givenName,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Given Name',
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is required';
                      }
                      return null;
                    },
                    controller: _surname,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Surname',
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    // controller: _dob,
                    keyboardType: TextInputType.datetime,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Date of Birth',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  DropDownTextField(
                    controller: _maritalStatus,
                    textFieldDecoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Marital Status',
                    ),
                    clearOption: false,
                    textFieldFocusNode: textFieldFocusNode,
                    // searchFocusNode: searchFocusNode,
                    // searchAutofocus: true,
                    dropDownItemCount: 6,
                    searchShowCursor: false,
                    // enableSearch: true,
                    // searchKeyboardType: TextInputType.number,
                    dropDownList: const [
                      DropDownValueModel(
                        name: 'Married',
                        value: "married",
                      ),
                      DropDownValueModel(
                          name: 'Single',
                          value: "single",
                          toolTipMsg:
                              "DropDownButton is a widget that we can use to select one unique value from a set of values"),
                      DropDownValueModel(
                        name: 'Divorced',
                        value: "divorced",
                      ),
                      DropDownValueModel(
                          name: 'Widow',
                          value: "widow",
                          toolTipMsg:
                              "DropDownButton is a widget that we can use to select one unique value from a set of values"),
                      DropDownValueModel(
                        name: 'Widower',
                        value: "widower",
                      ),
                      DropDownValueModel(name: 'Prefer not to', value: "null"),
                    ],
                    onChanged: (val) {
                      debugPrint("Marital Status: $val");
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  DropDownTextField(
                    controller: _gender,
                    textFieldDecoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Gender',
                    ),
                    clearOption: false,
                    textFieldFocusNode: textFieldFocusNode,
                    // searchFocusNode: searchFocusNode,
                    // searchAutofocus: true,
                    dropdownRadius: 12,
                    dropDownItemCount: 2,
                    searchShowCursor: false,
                    // enableSearch: true,
                    // searchKeyboardType: TextInputType.number,
                    dropDownList: const [
                      DropDownValueModel(
                        name: 'Male',
                        value: "male",
                      ),
                      DropDownValueModel(
                        name: 'Female',
                        value: "female",
                      ),
                    ],
                    onChanged: (val) {
                      debugPrint("Genger Selected: $val");
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  DropDownTextField.multiSelection(
                    controller: _language,
                    submitButtonText: null,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is required';
                      } else {
                        return null;
                      }
                    },
                    textFieldDecoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Language',
                    ),
                    // initialValue: const ["English"],
                    dropDownList: const [
                      DropDownValueModel(
                        name: 'English',
                        value: "english",
                      ),
                      DropDownValueModel(
                        name: 'French',
                        value: "french",
                        toolTipMsg: "Some Hint",
                      ),
                      DropDownValueModel(
                        name: 'Kinyarwanda',
                        value: "kinyarwanda",
                      ),
                      DropDownValueModel(
                        name: 'Swahili',
                        value: "swahili",
                        toolTipMsg: "Some Hint",
                      ),
                    ],
                    onChanged: (val) {
                      debugPrint("Value Selected: $val");
                      debugPrint(_language.dropDownValueList.toString());
                      setState(() {
                        //set the value to the controller here
                        // debugPrint(val[0].value.toString());
                        convertToListOfString(val);
                      });
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  DropDownTextField(
                    controller: _profession,
                    textFieldDecoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Profession',
                    ),
                    clearOption: false,
                    textFieldFocusNode: textFieldFocusNode,
                    // searchFocusNode: searchFocusNode,
                    // searchAutofocus: true,
                    dropdownRadius: 12,
                    dropDownItemCount: 5,
                    searchShowCursor: false,
                    enableSearch: true,
                    // searchKeyboardType: TextInputType.number,
                    dropDownList: const [
                      DropDownValueModel(
                        name: 'Farmer',
                        value: "Farmer",
                      ),
                      DropDownValueModel(
                        name: 'Student',
                        value: "Student",
                      ),
                      DropDownValueModel(
                        name: 'House Wife',
                        value: "House Wife",
                      ),
                      DropDownValueModel(
                        name: 'Entrepreneur',
                        value: "Entrepreneur",
                      ),
                      DropDownValueModel(
                        name: 'Agriculturist',
                        value: "Agriculturist",
                      ),
                    ],
                    onChanged: (val) {
                      debugPrint("Value Selected: $val");
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: _contact,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Contact',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: _email,
                    keyboardType: TextInputType.emailAddress,
                    autocorrect: false,
                    enableSuggestions: false,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: _street,
                    keyboardType: TextInputType.streetAddress,
                    autocorrect: false,
                    enableSuggestions: false,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Street',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: _district,
                    autocorrect: false,
                    enableSuggestions: false,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'District',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: _city,
                    keyboardType: TextInputType.emailAddress,
                    autocorrect: false,
                    enableSuggestions: false,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'City',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  DropDownTextField(
                    controller: _country,
                    textFieldDecoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Country',
                    ),
                    clearOption: false,
                    textFieldFocusNode: textFieldFocusNode,
                    // searchFocusNode: searchFocusNode,
                    // searchAutofocus: true,
                    dropdownRadius: 12,
                    dropDownItemCount: 5,
                    searchShowCursor: false,
                    enableSearch: true,
                    // searchKeyboardType: TextInputType.number,
                    dropDownList: const [
                      DropDownValueModel(
                        name: 'Liberia',
                        value: "Liberia",
                      ),
                      DropDownValueModel(
                        name: 'Rwanda',
                        value: "Rwanda",
                      ),
                      DropDownValueModel(
                        name: 'Morroco',
                        value: "Morroco",
                      ),
                      DropDownValueModel(
                        name: 'Senegal',
                        value: "Senegal",
                      ),
                      DropDownValueModel(
                        name: 'Guinea',
                        value: "Guinea",
                      ),
                    ],
                    onChanged: (val) {
                      debugPrint("Value Selected: $val");
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Validate returns true if the form is valid, or false otherwise.
                      if (_formKey.currentState!.validate()) {
                        // If the form is valid, display a snackbar. In the real world,
                        // you'd often call a server or save the information in a database.
                        save();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void save() async {
  var farmer = Farmer(
    names: _givenName.text,
    surname: _surname.text,
    dob: DateTime.utc(2003, 06, 29),
    nid: _nid.text,
    maritalStatus: _maritalStatus.dropDownValue?.value,
    gender: _gender.dropDownValue?.value,
    // languages: getValues(_language.dropDownValueList),
    languages: selectedLanguages,
    profession: _profession.dropDownValue?.value,
    contacts: _contact.text,
    email: _email.text,
    address: Address(
        city: _city.text,
        country: _country.dropDownValue?.value,
        street: _street.text,
        district: _district.text,
        continent: _continent.dropDownValue?.value,
        region: "East Africa"),
  );
  // debugPrint(_language.dropDownValueList?.length.toString());
  debugPrint("Selected Languages : $selectedLanguages");
  var data = await BaseClient()
      .post(
    'farmer',
    farmer,
  )
      .catchError((e) {
    debugPrint(e.code);
  });
  debugPrint(data);
  // debugPrint(_language.dropDownValueList?.length.toString());
  // debugPrint(_language.dropDownValueList?.single.value[0]);
  // debugPrint(getValues(_language.dropDownValueList).toString());
  debugPrint(farmer.languages.toString());
}

// List<String>? getValues(List<DropDownValueModel>? inputValues) {
//   List<String> selectedValues = [];
//   // var map = inputValues?.asMap().entries.map((e) {
//   //   int key = e.key;
//   //   String value = e.value.value;
//   //   debugPrint('key: $key & value: $value');
//   //   selectedValues.add(value);
//   // });
//   var list = List<String>.from(_language.dropDownValueList!.map((e) {
//     selectedValues.add(e.value);
//   }));
//   // debugPrint(map?.toList().toString());
//   debugPrint(selectedValues.toString());
//   debugPrint("List: $list");
//   return selectedValues;
// }

void convertToListOfString(dynamic val) {
  selectedLanguages = [];
  for (int i = 0; i < val.length; i++) {
    selectedLanguages.add(val[i].value);
  }
}
