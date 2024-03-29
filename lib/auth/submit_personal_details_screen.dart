import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import '../utils/file_collection.dart';

class SubmitPersonalDetailsScreen extends StatefulWidget {
  const SubmitPersonalDetailsScreen({Key? key}) : super(key: key);

  @override
  State<SubmitPersonalDetailsScreen> createState() =>
      _SubmitPersonalDetailsScreenState();
}

class _SubmitPersonalDetailsScreenState
    extends State<SubmitPersonalDetailsScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController? _dateOfBirthController;
  TextEditingController? _timeOfBirthController;
  TextEditingController? _placeOfBirthController;

  List genderList = [
    'Male',
    'Female',
  ];

  // Gender? _selectedGender;

  String? _selectedGender;
  DateTime? dateSelected = DateTime.now();
  Duration? timeSelected = const Duration();

  @override
  void initState() {
    super.initState();
    _dateOfBirthController = TextEditingController();
    _timeOfBirthController = TextEditingController();
    _placeOfBirthController = TextEditingController();
  }

  @override
  void dispose() {
    _dateOfBirthController!.dispose();
    _timeOfBirthController!.dispose();
    _placeOfBirthController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: rubyRed,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBar(
            backgroundColor: backgroundColor,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: textColor,
              ),
              onPressed: () {
                context.pop(context);
              },
            ),
          ),
          body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Personal Info',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),

                  const SizedBox(height: 20),

                  // const SizedBox(height: defaultPadding),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'Gender',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: double.infinity,
                        height: 52,
                        // padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey)),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              // _selectedGender == 'Male'
                              //     ? const Icon(Icons.male_rounded)
                              //     : const Icon(Icons.female_rounded),
                              // const SizedBox(
                              //   width: defaultPadding,
                              // ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 0),
                                  child: ButtonTheme(
                                    alignedDropdown: true,
                                    child: DropdownButtonFormField(
                                      decoration: const InputDecoration(
                                        // prefixIcon:    Icon(Icons.male_rounded),
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                      ),
                                      icon: const Icon(
                                          Icons.keyboard_arrow_down_rounded),
                                      elevation: 1,
                                      hint: const Text('Select Gender'),
                                      isDense: true,
                                      // menuMaxHeight: 100,
                                      borderRadius: BorderRadius.circular(10),
                                      isExpanded: true,
                                      value: _selectedGender,
                                      onChanged: (newValue) {
                                        setState(() {
                                          _selectedGender = newValue;
                                        });
                                      },
                                      items:
                                          // genderList.map((option) {
                                          //   return DropdownMenuItem(
                                          //     value: option.toString(),
                                          //     child: Row(
                                          //       children: [
                                          //         Text(option),
                                          //       ],
                                          //     ),
                                          //   );
                                          // }).toList(),
                                          const [
                                        DropdownMenuItem(
                                          value: 'Male',
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.male_rounded,
                                                size: 22,
                                              ),
                                              SizedBox(width: 10),
                                              Text('Male'),
                                            ],
                                          ),
                                        ),
                                        DropdownMenuItem(
                                          value: 'Female',
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.female_rounded,
                                                size: 22,
                                              ),
                                              SizedBox(width: 10),
                                              Text('Female'),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: <Widget>[
                  //     Padding(
                  //       padding: const EdgeInsets.symmetric(horizontal: 15),
                  //       child: Text(
                  //         'Gender :',
                  //         style: Theme.of(context).textTheme.titleMedium,
                  //       ),
                  //     ),
                  //     // const SizedBox(
                  //     //   height: defaultPadding / 2,
                  //     // ),
                  //     Row(
                  //       children: [
                  //         Expanded(
                  //           child: RadioListTile(
                  //             contentPadding: EdgeInsets.zero,
                  //             activeColor: Theme.of(context).primaryColor,
                  //             title: Row(
                  //               children: [
                  //                 const Icon(Icons.male_rounded, size: 22),
                  //                 const SizedBox(width: 5),
                  //                 Text(
                  //                   'Male',
                  //                   style:
                  //                       Theme.of(context).textTheme.labelLarge,
                  //                 )
                  //               ],
                  //             ),
                  //             value: 'Male',
                  //             groupValue: _selectedGender,
                  //             onChanged: (value) {
                  //               setState(() {
                  //                 _selectedGender = value;
                  //                 log('$_selectedGender');
                  //               });
                  //             },
                  //           ),
                  //         ),
                  //         // SizedBox(width: defaultPadding,),
                  //         Expanded(
                  //           child: RadioListTile(
                  //             contentPadding: EdgeInsets.zero,
                  //             activeColor: Theme.of(context).primaryColor,
                  //             title: Row(
                  //               children: [
                  //                 const Icon(Icons.female_rounded, size: 22),
                  //                 const SizedBox(width: 5),
                  //                 Text(
                  //                   'Female',
                  //                   style:
                  //                       Theme.of(context).textTheme.labelLarge,
                  //                 ),
                  //               ],
                  //             ),
                  //             value: 'Female',
                  //             groupValue: _selectedGender,
                  //             onChanged: (value) {
                  //               setState(() {
                  //                 _selectedGender = value;
                  //                 log('$_selectedGender');
                  //               });
                  //             },
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ],
                  // ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                    onTap: () {
                      showIosDatePicker(context);
                    },
                    readOnly: true,
                    controller: _dateOfBirthController!,
                    prefixIcon: const Icon(Icons.calendar_month_rounded),
                    labelText: 'Date of birth :',
                    hintText: 'Select your date of birth',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please select your date of birth';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormField(
                    onTap: () {
                      _showIOS_TimePicker(context);
                    },
                    readOnly: true,
                    controller: _timeOfBirthController!,
                    prefixIcon: const Icon(Icons.watch_later_outlined),
                    labelText: 'Time of birth :',
                    hintText: 'Select your time of birth',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please select your time of birth';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormField(
                    controller: _placeOfBirthController!,
                    prefixIcon: const Icon(Icons.place_rounded),
                    labelText: 'Place of birth :',
                    hintText: 'Select your place of birth',
                    onChanged: (value) async {
                      // if (value!.isNotEmpty && value.length > 3) {
                      //   _placeOfBirthController!.text = await Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //         builder: (context) => SelectPlaceOfBirthScreen(
                      //             searchText: _placeOfBirthController!.text),
                      //       ));
                      // } else {
                      //   // if (destinationpredictions.length > 3 &&
                      //   //     mounted) {
                      //   //   setState(() {
                      //   //     destinationpredictions = [];
                      //   //   });
                      //   // }
                      // }
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your place of birth';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 40,
                  ),

                  buttonSizedBox(rubyRed, 'Submit', () {
                    if (!_formKey.currentState!.validate()) {
                      // Submit form
                      log('Form is not valid');
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => const Dashboard(),
                      //     ));
                    }
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showIosDatePicker(ctx) {
    showCupertinoModalPopup(
      context: ctx,
      builder: (_) => Container(
        height: 300,
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: Colors.red.shade50.withOpacity(0.6),
              child: TextButton(
                  style: TextButton.styleFrom(
                      foregroundColor: Theme.of(context).primaryColor),
                  onPressed: () {
                    setState(() {
                      final date =
                          DateFormat.yMMMMd('en_US').format(dateSelected!);
                      log(date);
                      _dateOfBirthController!.text = date;
                    });
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Submit',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                  )),
            ),
            Expanded(
              child: SizedBox(
                height: 250,
                child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.date,
                    minimumYear: DateTime.now().year - 100,
                    maximumYear: DateTime.now().year,
                    // maximumDate: DateTime.now(),
                    initialDateTime: dateSelected,
                    onDateTimeChanged: (val) {
                      setState(() {
                        dateSelected = val;
                      });
                    }),
              ),
            ),
          ],
        ),
      ),
      // CupertinoActionSheet(
      //   actions: [
      //     Container(
      //       height: 230,
      //       color: const Color.fromARGB(255, 255, 255, 255),
      //       child: Column(
      //         children: [
      //           SizedBox(
      //             height: 180,
      //             child: CupertinoDatePicker(
      //                 // use24hFormat: true,
      //                 mode: CupertinoDatePickerMode.date,
      //                 maximumYear: DateTime.now().year,
      //                 // maximumDate: DateTime.now(),
      //                 initialDateTime: dateSelected,
      //                 onDateTimeChanged: (val) {
      //                   setState(() {
      //                     dateSelected = val;
      //                   });
      //                 }),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ],
      //
      //   cancelButton: CustomButton(
      //       text: 'Done',
      //       onPressed: () {
      //         setState(() {
      //           final date =
      //               DateFormat.yMMMMd('en_US').format(dateSelected!);
      //           log(date);
      //           _dateOfBirthController.text = date;
      //         });
      //         Navigator.pop(context);
      //       }),
      // )
    );
  }

  void _showIOS_TimePicker(ctx) {
    showCupertinoModalPopup(
      context: ctx,
      builder: (_) => Container(
        height: 300,
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: Colors.red.shade50.withOpacity(0.6),
              child: TextButton(
                  style: TextButton.styleFrom(
                      foregroundColor: Theme.of(context).primaryColor),
                  onPressed: () {
                    setState(() {
                      final time = timeSelected
                          .toString()
                          .split('.')
                          .first
                          .padLeft(8, "0");
                      log(time);
                      _timeOfBirthController!.text = time;
                    });
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Submit',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                  )),
            ),
            SizedBox(
              height: 250,
              child: CupertinoTimerPicker(
                  // use24hFormat: true,
                  mode: CupertinoTimerPickerMode.hms,
                  // maximumYear: DateTime.now().year,
                  initialTimerDuration: timeSelected!,
                  onTimerDurationChanged: (val) {
                    setState(() {
                      timeSelected = val;
                    });
                  }),
            ),
          ],
        ),
      ),
      // CupertinoActionSheet(
      //   actions: [
      //     Container(
      //       height: 230,
      //       color: const Color.fromARGB(255, 255, 255, 255),
      //       child: Column(
      //         children: [
      //           Row(
      //             children: [
      //               Spacer(),
      //               TextButton(onPressed: () {
      //                 setState(() {
      //                   _timeOfBirthController.text = timeSelected!.toString();
      //                 });
      //                 Navigator.pop(context);
      //               }, child: Text('Submit'))
      //             ],
      //           ),
      //           SizedBox(
      //             height: 180,
      //             child: CupertinoTimerPicker(
      //                 // use24hFormat: true,
      //                 mode: CupertinoTimerPickerMode.hms,
      //                 // maximumYear: DateTime.now().year,
      //                 initialTimerDuration: timeSelected!,
      //                 onTimerDurationChanged: (val) {
      //                   setState(() {
      //                     timeSelected = val;
      //                   });
      //                 }),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ],
      //   cancelButton: CustomButton(
      //       text: 'Done',
      //       onPressed: () {
      //         setState(() {
      //           final time = DateFormat.Hm().format(timeSelected!);
      //           log(time);
      //           _timeOfBirthController.text = time;
      //         });
      //         Navigator.pop(context);
      //       }),
      // )
    );
  }

// void _showPlaceOfBirthDialog(context) {
//   showDialog(
//     context: context,
//     builder: (context) => AlertDialog(
//       scrollable: true,
//       // actionsPadding: EdgeInsets.all(defaultPadding),
//       title: const Text('Select your place of birth'),
//       content: Column(
//         children: [
//           CustomField(
//             labelText: 'Country',
//             widget1: Container(),
//           ),
//           const SizedBox(
//             height: defaultPadding,
//           ),
//           CustomField(
//             labelText: 'State',
//             widget1: Container(),
//           ),
//           const SizedBox(
//             height: defaultPadding,
//           ),
//           CustomField(
//             labelText: 'City',
//             widget1: Container(),
//           ),
//         ],
//       ),
//       actions: [
//         CustomButton(
//           text: 'Done',
//           onPressed: () {},
//         )
//       ],
//     ),
//   );
// }
}
