class SubjectClass {
  List<Classess>? classess;

  SubjectClass({this.classess});

  SubjectClass.fromJson(Map<String, dynamic> json) {
    if (json['classess'] != null) {
      classess = <Classess>[];
      json['classess'].forEach((v) {
        classess!.add(Classess.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (classess != null) {
      data['classess'] = classess!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Classess {
  String? standard;
  List<Subjects>? subjects;

  Classess({this.standard, this.subjects});

  Classess.fromJson(Map<String, dynamic> json) {
    standard = json['standard'];
    if (json['subjects'] != null) {
      subjects = <Subjects>[];
      json['subjects'].forEach((v) {
        subjects!.add(Subjects.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['standard'] = standard;
    if (subjects != null) {
      data['subjects'] = subjects!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Subjects {
  String? subjectName;
  String? subjectImage;

  Subjects({this.subjectName, this.subjectImage});

  Subjects.fromJson(Map<String, dynamic> json) {
    subjectName = json['subject_name'];
    subjectImage = json['subject_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['subject_name'] = subjectName;
    data['subject_image'] = subjectImage;
    return data;
  }
}
