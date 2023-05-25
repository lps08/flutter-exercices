class BMICalcularor {
  String? gender;
  int _height = 170;
  int _weight = 70;
  int _age = 20;

  BMICalcularor();

  String? get getGender => gender;
  set setGender(String gender) {
    this.gender = gender;
  }

  int get getHeight => _height;
  set setHeight(int height) {
    _height = height;
  }

  int get getWeight => _weight;
  set setWeight(int weight) {
    _weight = weight;
  }

  int get getAge => _age;
  set setAge(int age) {
    _age = age;
  }

  double result() {
    return _weight / ((_height / 100) * (_height / 100));
  }

  String bmiStatus() {
    if (result() < 18.5) {
      return "Underweight";
    } else if (result() < 25) {
      return "Heathy";
    } else if (result() < 30) {
      return "Overweight";
    } else {
      return "Obesity";
    }
  }

  String bmiOutcome() {
    if (result() < 18.5) {
      return "You're in the underweight range!";
    } else if (result() < 25) {
      return "You're in the healthy weight range.";
    } else if (result() < 30) {
      return "You're in the overweight range!";
    } else {
      return "You're in the obese range!!";
    }
  }

  @override
  String toString() {
    return "gender: $gender \nheight: $_height \nweight: $_weight \nage: $_age \nresult: ${result()}";
  }
}
