import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:relief_fund/firebase/form.dart';

const String TODO_COLLECTION_REF = 'form';

class DatabaseService {
  final _firestore = FirebaseFirestore.instance;

  late final CollectionReference _formref;

  DatabaseService() {
    _formref = _firestore
        .collection(TODO_COLLECTION_REF)
        .withConverter<Form>(
          fromFirestore: (snapshots, _) => Form.fromJson(snapshots.data()!),
          toFirestore: (form, _) => form.toJson(),
        );
  }

  Stream<QuerySnapshot> getForm() {
    return _formref.snapshots();
  }

  void addForm(Form form) async {
    _formref.add(form);
  }
}
