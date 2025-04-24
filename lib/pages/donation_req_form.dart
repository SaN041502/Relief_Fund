import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:relief_fund/firebase/database_service.dart';
import 'package:relief_fund/widgets/colors.dart';

import 'package:relief_fund/widgets/textfield.dart';

class RequestForm extends StatefulWidget {
  const RequestForm({super.key});

  @override
  State<RequestForm> createState() => _RequestFormState();
}

class _RequestFormState extends State<RequestForm> {
  final ImagePicker imagePicker = ImagePicker();
  List<XFile>? imageFileList = [];

  void selectImages() async {
    final List<XFile> selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages.isNotEmpty) {
      imageFileList!.addAll(selectedImages);
    }
    setState(() {});
  }

  bool isInformationTrue = false;
  bool allowVerification = false;

  final DatabaseService _databaseService = DatabaseService();

  //main part
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.primaryColor,
                AppColors.secondaryColor,
              ], 
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          'Relief Request Form',
          style: TextStyle(
            color: AppColors.backgroundColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.view_list_sharp, color: AppColors.backgroundColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: StreamBuilder(
            stream: _databaseService.getForm(),
            builder: (context, snapshot) {
              return Column(
                children: [
                  Column(
                    children: [
                      Text(
                        'Please Fill the form below to request for Relief',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      SizedBox(height: 3),
                      Text(
                        "Make sure to provide correct information and detailed explaination of your request so that we can reach out to you sooner.",
                        style: TextStyle(
                          fontSize: 15,
                          color: AppColors.textColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Textfield(text1: 'First Name: ', text2: 'First Name'),
                  SizedBox(height: 10),
                  Textfield(text1: 'Last Name: ', text2: 'Last Name'),
                  SizedBox(height: 10),
                  Textfield(text1: "Father's Name:  ", text2: "Father's Name"),
                  SizedBox(height: 10),
                  Textfield(text1: "Mother's Name: ", text2: "Mother's Name"),
                  SizedBox(height: 10),
                  Textfield(text1: 'Date of Birth: ', text2: 'Date of Birth'),
                  SizedBox(height: 10),
                  Textfield(
                    text1: 'NID number: ',
                    text2: 'NID number or Birth Certificate ',
                  ),
                  SizedBox(height: 10),
                  Textfield(text1: 'Phone Number: ', text2: 'Phone Number'),
                  SizedBox(height: 10),
                  Textfield(
                    text1: 'Email Address(optional): ',
                    text2: 'Email Address',
                  ),
                  SizedBox(height: 10),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Present Address:',
                      style: TextStyle(
                        fontSize: 15,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Textfield(
                    text1: 'Current address: ',
                    text2: 'Provide full address',
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: Textfield(
                          text1: 'District 1: ',
                          text2: 'District',
                        ),
                      ),
                      SizedBox(width: 3),
                      Expanded(
                        child: Textfield(
                          text1: 'Thana 1: ',
                          text2: 'Thana/Upazilla',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Textfield(text1: 'Postal Code 1: ', text2: 'Postal Code'),
                  SizedBox(height: 10),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Permanent Address:',
                      style: TextStyle(
                        fontSize: 15,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Textfield(
                    text1: 'Permanent address: ',
                    text2: 'Provide full address',
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: Textfield(
                          text1: 'District 2: ',
                          text2: 'District',
                        ),
                      ),
                      SizedBox(width: 3),
                      Expanded(
                        child: Textfield(
                          text1: 'Thana 2: ',
                          text2: 'Thana/Upazilla',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Textfield(text1: 'Postal Code 2: ', text2: 'Postal Code'),
                  SizedBox(height: 10),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Damages and Situation Details: ',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: AppColors.secondaryColor,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    height: 150,
                    child: TextFormField(
                      maxLines: null,
                      expands: true,
                      textAlignVertical: TextAlignVertical.top,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromARGB(50, 255, 168, 38),
                        hintText: 'Write detailed reason for request',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Please upload photos of damages: ',
                          style: TextStyle(
                            fontSize: 15,
                            color: AppColors.secondaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            shape: StadiumBorder(),
                            backgroundColor: const Color.fromARGB(
                              193,
                              255,
                              168,
                              38,
                            ),
                          ),
                          onPressed: selectImages,
                          icon: Icon(
                            Icons.add,
                            color: AppColors.backgroundColor,
                          ),
                          label: Text(
                            'Upload Image',
                            style: TextStyle(color: AppColors.backgroundColor),
                          ),
                        ),
                        SizedBox(height: 10),

                        if (imageFileList!.isNotEmpty)
                          ConstrainedBox(
                            constraints: BoxConstraints(
                              maxHeight: 300,
                              minHeight: 100,
                            ),
                            child: GridView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 4,
                                    mainAxisSpacing: 4,
                                  ),
                              itemCount: imageFileList!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Image.file(
                                  File(imageFileList![index].path),
                                  fit: BoxFit.cover,
                                );
                              },
                            ),
                          ),
                      ],
                    ),
                  ),

                  SizedBox(height: 10),
                  Textfield(
                    text1: 'Amount Needed: ',
                    text2: 'Amount you want to request',
                  ),
                  SizedBox(height: 10),
                  Textfield(
                    text1: 'Purpose of aid: ',
                    text2: ' e.g. house repair, medical, food, etc.',
                  ),
                  SizedBox(height: 10),

                  //Checkbox
                  ListTile(
                    title: const Text(
                      'I declare that the above information is true to the best of my knowledge.',
                      style: TextStyle(
                        fontSize: 15,
                        color: AppColors.secondaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    leading: Checkbox(
                      activeColor: AppColors.accentColor,
                      value: isInformationTrue,
                      onChanged: (value) {
                        setState(() {
                          isInformationTrue = value!;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  ListTile(
                    title: const Text(
                      'I allow ReliefAid to verify my data for aid approval.',
                      style: TextStyle(
                        fontSize: 15,
                        color: AppColors.secondaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    leading: Checkbox(
                      activeColor: AppColors.accentColor,
                      value: allowVerification,
                      onChanged: (value) {
                        setState(() {
                          allowVerification = value!;
                        });
                      },
                    ),
                  ),

                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.accentColor,
                    ),
                    child: Text(
                      'Submit',
                      style: TextStyle(color: AppColors.backgroundColor),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
