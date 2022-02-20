import 'dart:io';

String grade(double grade) {
  if (grade > 70) {
    return 'A';
  } else if (grade > 40) {
    return 'B';
  } else if (grade > 0) {
    return 'C';
  } else {
    return '';
  }
}

void main() {
  print("Program Hitung Nilai");
  double nilai = 50;
  print("Nilai : '$nilai'");
  String hasilGrade = grade(nilai);
  print("Grade : '$hasilGrade");
}
