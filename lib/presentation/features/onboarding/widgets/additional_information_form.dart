import 'package:allworkpro/business_logic/helpers.dart';
import 'package:allworkpro/constants/string_contants.dart';
import 'package:allworkpro/constants/theme.dart';
import 'package:allworkpro/infrastructure/api_calls.dart';
import 'package:allworkpro/presentation/core/select_option_field.dart';
import 'package:flutter/material.dart';

class AdditionalInformationForm extends StatefulWidget {
  const AdditionalInformationForm();

  @override
  State<AdditionalInformationForm> createState() =>
      _AdditionalInformationFormState();
}

Map<String, dynamic> data = <String, dynamic>{};

class _AdditionalInformationFormState extends State<AdditionalInformationForm> {
  final List<String> educationList = <String>[
    'High School',
    'Diploma',
    "Asscociate's degree",
    "Undergraduate's Degree",
    "Maters's Degree",
    'PHD',
  ];

  final GlobalKey<FormState> formKey = GlobalKey();
  String? highestEducationLevel;
  String? occupation;
  final List<String> occupationList = <String>[
    'Mechanical',
    'Plumbing',
    'Electical',
  ];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                decoration: inputDecoration.copyWith(labelText: 'ID number'),
                style: const TextStyle(fontSize: 14),
                keyboardType: TextInputType.number,
                validator: (String? number) =>
                    validateIDNumber(number.toString().trim()),
                onSaved: (String? v) => data['name'] = v.toString().trim(),
              ),
              const SizedBox(height: 20),
              const Text('What is your highest level of education'),
              const SizedBox(height: 10),
              Container(
                decoration: addItemContainerDecoration,
                child: SelectOptionField(
                  dropDownInputKey: const Key('key'),
                  value: highestEducationLevel,
                  options: educationList,
                  hintText: 'Highest education level',
                  onChanged: (String? v) {
                    setState(() {
                      highestEducationLevel = v;
                    });
                    data['highestEducationLevel'] = highestEducationLevel;
                  },
                ),
              ),
              const SizedBox(height: 20),
              const Text('What is your area of expertise'),
              const SizedBox(height: 10),
              Container(
                decoration: addItemContainerDecoration,
                child: SelectOptionField(
                  dropDownInputKey: const Key('key'),
                  value: occupation,
                  hintText: 'Occupation',
                  options: occupationList,
                  onChanged: (String? v) {
                    setState(() {
                      occupation = v;
                    });
                    data['occupation'] = occupation;
                  },
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    await addExtraInformation(
                      data: data,
                      context: context,
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.15,
                    vertical: 15,
                  ),
                ),
                child: const Text(
                  proceed,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
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
