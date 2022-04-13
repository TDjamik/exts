extension IntExtension on int{
  int isFibonacci(){
    if (this == 0 || this == 1){
      return this;
    }
    int f1 = 0;
    int f2 = 1;
    int res = 0;
    
    for(int i = 2;i <= this; i++){
      res  = f2 + f1;
      f1 = f2;
      f2 = res;
    }
    return res;
  }
}

extension StringExtension on String {
  String capitalize() {
    return this
        .trim()
        .split(" ")
        .where((e) => e.trim().isNotEmpty)
        .map((e) => "${e[0].toUpperCase()}"
            "${e.length > 1 ? e.substring(1).toLowerCase() : ""}")
        .join(" ");
  }

  String capitalizeFirst() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  static bool isUpperCase(String s) {
    return s == s.toUpperCase();
  }

//to'g'ri ishlamayapti
  String camelCase() {
    var sb = StringBuffer();
    var first = true;
    this.runes.forEach((int rune) {
      var char = String.fromCharCode(rune);
      if (isUpperCase(char) && !first) {
        if (char != '_') {
          sb.write('_');
        }
        sb.write(char.toLowerCase());
      } else {
        first = false;
        sb.write(char.toLowerCase());
      }
    });
    return sb.toString();
  }

  bool isAlphabetOnly() {
    return RegExp(r'^[a-zA-Z]+$').hasMatch(this);
  }

  bool isAudioFileName() {
    final ext = this.toLowerCase();

    return ext.endsWith(".mp3") ||
        ext.endsWith(".wav") ||
        ext.endsWith(".wma") ||
        ext.endsWith(".amr") ||
        ext.endsWith(".ogg");
  }

  bool isBool() {
    if (this.isNotEmpty) {
      return false;
    }
    return (this == 'true' || this == 'false');
  }

  bool isEmail() {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(this);
  }

  bool isPalindrom() {
    final cleanString = this
        .toLowerCase()
        .replaceAll(RegExp(r"\s+"), '')
        .replaceAll(RegExp(r"[^0-9a-zA-Z]+"), "");
    for (var i = 0; i < cleanString.length; i++) {
      if (cleanString[i] != cleanString[cleanString.length - i - 1]) {
        return false;
      }
    }
    return true;
  }

  bool isURL() {
    String pattern =
        r'(http|https)://[\w-]+(\.[\w-]+)+([\w.,@?^=%&amp;:/~+#-]*[\w@?^=%&amp;/~+#-])?';
    RegExp regExp = RegExp(pattern);
    if (this.length == 0) {
      return false;
    } else if (regExp.hasMatch(this)) {
      return true;
    }
    return false;
  }

  bool isPhoneNumber() {
    String phone;
    phone = this.replaceAll(RegExp('[0-9]'), "x");
    return "(xxx) xxx-xxxx" == phone || "xxx-xxx-xxxx" == phone;
  }
}

void main() {
  print('abuabdulaziz3031@gmail.com'.isEmail());
  print("test salom".capitalize());
  print("test salom".capitalizeFirst());
  print("test salom".camelCase());
  print("testsalom".isAlphabetOnly());
  print("test salom.mp3".isAudioFileName());
  print("987-758-6595".isPhoneNumber());
  print("https://stackoverflow.com/".isURL());
  print("test salom".isBool());
  print("test salom".isPalindrom());

}
