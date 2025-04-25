class UserForm {
  String firstname;
  String lastname;
  String fathername;
  String mothername;
  int nid;
  int phone;
  String birthdate;
  String presentAddress;
  String permanentAddress;
  String district1;
  String district2;
  String thana1;
  String thana2;
  int postalCode1;
  int postalCode2;
  String email;
  String situationDetails;
  String purpose;
  int amount;

  UserForm({
    required this.firstname,
    required this.lastname,
    required this.fathername,
    required this.mothername,
    required this.nid,
    required this.phone,
    required this.birthdate,
    required this.presentAddress,
    required this.permanentAddress,
    required this.district1,
    required this.district2,
    required this.thana1,
    required this.thana2,
    required this.postalCode1,
    required this.postalCode2,
    required this.email,
    required this.situationDetails,
    required this.purpose,
    required this.amount,
  });

  UserForm.fromJson(Map<String, Object?> json)
    : this(
        firstname: json['First Name']! as String,
        lastname: json['First Name']! as String,
        fathername: json["Father's Name"]! as String,
        mothername: json["Mother's Name"]! as String,
        nid: json['NID number']! as int,
        phone: json['Phone Number']! as int,
        birthdate: json['Date of Birth']! as String,
        presentAddress: json['Present Address']! as String,
        permanentAddress: json['Permanent Address']! as String,
        district1: json['District 1']! as String,
        district2: json['District 2']! as String,
        thana1: json['Thana 1']! as String,
        thana2: json['Thana 2']! as String,
        postalCode1: json['Postal Code 1']! as int,
        postalCode2: json['Postal Code 2']! as int,
        email: json['Email Address']! as String,
        situationDetails: json['Situation Details']! as String,
        purpose: json['Purpose of aid']! as String,
        amount: json['Amount Needed']! as int,
      );

  UserForm copyWith({
    String? firstname,
    String? lastname,
    String? fathername,
    String? mothername,
    int? nid,
    int? phone,
    String? birthdate,
    String? presentAddress,
    String? permanentAddress,
    String? district1,
    String? district2,
    String? thana1,
    String? thana2,
    int? postalCode1,
    int? postalCode2,
    String? email,
    String? situationDetails,
    String? purpose,
    int? amount,
  }) {
    return UserForm(
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      fathername: fathername ?? this.fathername,
      mothername: mothername ?? this.mothername,
      nid: nid ?? this.nid,
      phone: phone ?? this.phone,
      birthdate: birthdate ?? this.birthdate,
      presentAddress: presentAddress ?? this.presentAddress,
      permanentAddress: permanentAddress ?? this.permanentAddress,
      district1: district1 ?? this.district1,
      district2: district2 ?? this.district2,
      thana1: thana1 ?? this.thana1,
      thana2: thana2 ?? this.thana2,
      postalCode1: postalCode1 ?? this.postalCode1,
      postalCode2: postalCode2 ?? this.postalCode2,
      email: email ?? this.email,
      situationDetails: situationDetails ?? this.situationDetails,
      purpose: purpose ?? this.purpose,
      amount: amount ?? this.amount,
    );
  }

  Map<String, Object?> toJson() {
    return {
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
    };
  }
}
