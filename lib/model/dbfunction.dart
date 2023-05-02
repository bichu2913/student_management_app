import 'package:hive/hive.dart';
import 'package:student_appdetail/model/database_model.dart';

late Box<StudentModel> model;
openStudentModel() async {
  model = await Hive.openBox('recentlyplayed');
}
