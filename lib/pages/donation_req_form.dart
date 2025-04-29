import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:relief_fund/pages/homepage.dart';
import 'package:relief_fund/widgets/colors.dart';

import 'package:relief_fund/widgets/textfield.dart';

class RequestForm extends StatefulWidget {
  const RequestForm({super.key});

  @override
  State<RequestForm> createState() => _RequestFormState();
}

class _RequestFormState extends State<RequestForm> {
  final ImagePicker imagePicker = ImagePicker();

  final _firstnameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _fathernameController = TextEditingController();
  final _mothernameController = TextEditingController();
  final _nidController = TextEditingController();
  final _phoneController = TextEditingController();
  final _birthdateController = TextEditingController();
  final _presentAddressController = TextEditingController();
  final _permanentAddressController = TextEditingController();
  final _district1Controller = TextEditingController();
  final _district2Controller = TextEditingController();
  final _thana1Controller = TextEditingController();
  final _thana2Controller = TextEditingController();
  final _postalCode1Controller = TextEditingController();
  final _postalCode2Controller = TextEditingController();
  final _emailController = TextEditingController();
  final _situationDetailsController = TextEditingController();
  final _purposeController = TextEditingController();
  final _amountController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _firstnameController.dispose();
    _lastnameController.dispose();
    _fathernameController.dispose();
    _mothernameController.dispose();
    _nidController.dispose();
    _phoneController.dispose();
    _birthdateController.dispose();
    _presentAddressController.dispose();
    _permanentAddressController.dispose();
    _district1Controller.dispose();
    _district2Controller.dispose();
    _thana1Controller.dispose();
    _thana2Controller.dispose();
    _postalCode1Controller.dispose();
    _postalCode2Controller.dispose();
    _emailController.dispose();
    _situationDetailsController.dispose();
    _purposeController.dispose();
    _amountController.dispose();
  }

  Future addRequestInfo(
    String firstname,
    String lastname,
    String fathername,
    String mothername,
    int nid,
    int phone,
    String birthdate,
    String presentAddress,
    String permanentAddress,
    String district1,
    String district2,
    String thana1,
    String thana2,
    int postalCode1,
    int postalCode2,
    String email,
    String situationDetails,
    String purpose,
    int amount,
  ) async {
    await FirebaseFirestore.instance.collection('form').add({
      'First Name': firstname,
      'Last Name': lastname,
      "Father's Name": fathername,
      "Mother's Name": mothername,
      'NID number': nid,
      'Phone Number': phone,
      'Date of Birth': birthdate,
      'Present Address': presentAddress,
      'Permanent Address': permanentAddress,
      'District 1': district1,
      'District 2': district2,
      'Thana 1': thana1,
      'Thana 2': thana2,
      'Postal Code 1': postalCode1,
      'Postal Code 2': postalCode2,
      'Email Address': email,
      'Situation Details': situationDetails,
      'Purpose of aid': purpose,
      'Amount Needed': amount,
    });
  }

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

  //main part
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.primaryColor, AppColors.secondaryColor],
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
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Homepage()),
            );
          },
          icon: Icon(Icons.arrow_back, color: AppColors.backgroundColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
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
                    style: TextStyle(fontSize: 15, color: AppColors.textColor),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Textfield(
                text1: 'First Name: ',
                text2: 'First Name',
                controller: _firstnameController,
              ),
              SizedBox(height: 10),
              Textfield(
                text1: 'Last Name: ',
                text2: 'Last Name',
                controller: _lastnameController,
              ),
              SizedBox(height: 10),
              Textfield(
                text1: "Father's Name:  ",
                text2: "Father's Name",
                controller: _fathernameController,
              ),
              SizedBox(height: 10),
              Textfield(
                text1: "Mother's Name: ",
                text2: "Mother's Name",
                controller: _mothernameController,
              ),
              SizedBox(height: 10),
              Textfield(
                text1: 'Date of Birth: ',
                text2: 'Date of Birth',
                controller: _birthdateController,
              ),
              SizedBox(height: 10),
              Textfield(
                text1: 'NID number: ',
                text2: 'NID number or Birth Certificate ',
                controller: _nidController,
              ),
              SizedBox(height: 10),
              Textfield(
                text1: 'Phone Number: ',
                text2: 'Phone Number',
                controller: _phoneController,
              ),
              SizedBox(height: 10),
              Textfield(
                text1: 'Email Address(optional): ',
                text2: 'Email Address',
                controller: _emailController,
              ),
              SizedBox(height: 10),
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  'Present Address:',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Textfield(
                text1: 'Current address: ',
                text2: 'Provide full address',
                controller: _presentAddressController,
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: Textfield(
                      text1: 'District 1: ',
                      text2: 'District',
                      controller: _district1Controller,
                    ),
                  ),
                  SizedBox(width: 3),
                  Expanded(
                    child: Textfield(
                      text1: 'Thana 1: ',
                      text2: 'Thana/Upazilla',
                      controller: _thana1Controller,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Textfield(
                text1: 'Postal Code 1: ',
                text2: 'Postal Code',
                controller: _postalCode1Controller,
              ),
              SizedBox(height: 10),
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  'Permanent Address:',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Textfield(
                text1: 'Permanent address: ',
                text2: 'Provide full address',
                controller: _permanentAddressController,
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: Textfield(
                      text1: 'District 2: ',
                      text2: 'District',
                      controller: _district2Controller,
                    ),
                  ),
                  SizedBox(width: 3),
                  Expanded(
                    child: Textfield(
                      text1: 'Thana 2: ',
                      text2: 'Thana/Upazilla',
                      controller: _thana2Controller,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Textfield(
                text1: 'Postal Code 2: ',
                text2: 'Postal Code',
                controller: _postalCode2Controller,
              ),
              SizedBox(height: 10),
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  'Damages and Situation Details: ',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                height: 150,
                child: TextFormField(
                  controller: _situationDetailsController,
                  maxLines: null,
                  expands: true,
                  textAlignVertical: TextAlignVertical.top,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromARGB(255, 219, 218, 218),
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
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                        backgroundColor: AppColors.primaryColor,
                      ),
                      onPressed: selectImages,
                      icon: Icon(Icons.add, color: AppColors.backgroundColor),
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
                controller: _amountController,
              ),
              SizedBox(height: 10),
              Textfield(
                text1: 'Purpose of aid: ',
                text2: ' e.g. house repair, medical, food, etc.',
                controller: _purposeController,
              ),
              SizedBox(height: 10),

              //Checkbox
              ListTile(
                title: const Text(
                  'I declare that the above information is true to the best of my knowledge.',
                  style: TextStyle(
                    fontSize: 15,
                    color: AppColors.textColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Checkbox(
                  activeColor: AppColors.primaryColor,
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
                    color: AppColors.textColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Checkbox(
                  activeColor: AppColors.primaryColor,
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
                onPressed: () {
                  addRequestInfo(
                    _firstnameController.text.trim(),
                    _lastnameController.text.trim(),
                    _fathernameController.text.trim(),
                    _mothernameController.text.trim(),
                    int.parse(_nidController.text.trim()),
                    int.parse(_phoneController.text.trim()),
                    _birthdateController.text.trim(),
                    _presentAddressController.text.trim(),
                    _permanentAddressController.text.trim(),
                    _district1Controller.text.trim(),
                    _district2Controller.text.trim(),
                    _thana1Controller.text.trim(),
                    _thana2Controller.text.trim(),
                    int.parse(_postalCode1Controller.text.trim()),
                    int.parse(_postalCode2Controller.text.trim()),
                    _emailController.text.trim(),
                    _situationDetailsController.text.trim(),
                    _purposeController.text.trim(),
                    int.parse(_amountController.text.trim()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                ),
                child: Text(
                  'Submit',
                  style: TextStyle(color: AppColors.backgroundColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
