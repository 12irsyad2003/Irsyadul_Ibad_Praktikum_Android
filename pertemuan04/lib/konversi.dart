class Konversi {
  // Konversi nilai huruf ke angka skala (untuk IPK)
  double nilaiKeAngka(String grade) {
    if (grade == 'A') {
      return 4.0;
    } else if (grade == 'B+') {
      return 3.5;
    } else if (grade == 'B') {
      return 3.0;
    } else if (grade == 'C+') {
      return 2.5;
    } else if (grade == 'C') {
      return 2.0;
    } else if (grade == 'D') {
      return 1.0;
    } else {
      return 0.0; // E
    }
  }

  // Konversi nilai huruf ke angka SKS
  double sksMatkul(String grade, int sks) {
    if (grade == 'E') {
      return 0;
    } else if (grade == 'D') {
      return sks * 1;
    } else if (grade == 'C') {
      return sks * 1.5;
    } else if (grade == 'C+') {
      return sks * 2;
    } else if (grade == 'B') {
      return sks * 3;
    } else if (grade == 'B+') {
      return sks * 3.5;
    } else {
      return sks * 4; // A
    }
  }
}
