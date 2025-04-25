import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:relief_fund/firebase/form.dart';

const String FORM_COLLECTION_REF = 'form';

class DatabaseService {
  final _firestore = FirebaseFirestore.instance;

  late final CollectionReference _formref;

  DatabaseService() {
    _formref = _firestore
        .collection(FORM_COLLECTION_REF)
        .withConverter<UserForm>(
          fromFirestore: (snapshots, _) => UserForm.fromJson(snapshots.data()!),
          toFirestore: (form, _) => form.toJson(),
        );
  }

  Stream<QuerySnapshot> getForm() {
    return _formref.snapshots();
  }

  void addForm(UserForm form) async {
    _formref.add(form);
  }

  void updateForm(String formID, UserForm form) {
    _formref.doc(formID).update(form.toJson());
  }
}
