import 'package:flutter/material.dart';

class CalculateScreen extends StatefulWidget {
  @override
  _CalculateScreenState createState() => _CalculateScreenState();
}

class _CalculateScreenState extends State<CalculateScreen> {
  final TextEditingController dataController = TextEditingController();
  final TextEditingController anakLakiLakiController = TextEditingController();
  final TextEditingController ayahController = TextEditingController();
  final TextEditingController suamiController = TextEditingController();
  final TextEditingController slaController = TextEditingController();
  final TextEditingController sliController = TextEditingController();
  final TextEditingController anakPerempuanController = TextEditingController();
  final TextEditingController ibuController = TextEditingController();
  final TextEditingController istriController = TextEditingController();
  final TextEditingController spaController = TextEditingController();
  final TextEditingController spiController = TextEditingController();
  final TextEditingController cucuController = TextEditingController();

  List<String> daftarHasil = [];

  void tampilkan() {
    if (_validateInputs()) {
      setState(() {
        daftarHasil = calculateInheritance();
      });

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(daftarHasil: daftarHasil),
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Invalid Input'),
          content: Text('Please enter valid numbers in all fields.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  bool _validateInputs() {
    return _isNumeric(dataController.text);
  }

  bool _isNumeric(String str) {
    if (str.isEmpty) {
      return false;
    }
    final number = num.tryParse(str);
    return number != null;
  }

  int _parseToInt(String str) {
    if (str.isEmpty) {
      return 0;
    }
    return int.tryParse(str) ?? 0;
  }

  List<String> calculateInheritance() {
    double nominal = double.parse(dataController.text);
    int anakLakiLaki = _parseToInt(anakLakiLakiController.text);
    int anakPerempuan = _parseToInt(anakPerempuanController.text);
    int ayah = _parseToInt(ayahController.text);
    int ibu = _parseToInt(ibuController.text);
    int suami = _parseToInt(suamiController.text);
    int istri = _parseToInt(istriController.text);
    int saudaraLakiSeayah = _parseToInt(slaController.text);
    int saudaraLakiSeibu = _parseToInt(sliController.text);
    int saudaraPerempuanSeayah = _parseToInt(spaController.text);
    int saudaraPerempuanSeibu = _parseToInt(spiController.text);
    int cucu = _parseToInt(cucuController.text);

    double totalShares = 0.0;
    Map<String, double> shares = {};

    if (suami == 1) {
      shares['Suami'] =
          (anakLakiLaki + anakPerempuan > 0) ? nominal * 0.25 : nominal * 0.5;
      totalShares += shares['Suami']!;
    }

    if (istri > 0) {
      shares['Istri'] = (anakLakiLaki + anakPerempuan > 0)
          ? nominal * 0.125 * istri
          : nominal * 0.25 * istri;
      totalShares += shares['Istri']!;
    }

    if (ayah == 1) {
      shares['Ayah'] = nominal * 0.1667;
      totalShares += shares['Ayah']!;
    }

    if (ibu == 1) {
      shares['Ibu'] = (anakLakiLaki + anakPerempuan > 0 ||
              saudaraLakiSeayah +
                      saudaraLakiSeibu +
                      saudaraPerempuanSeayah +
                      saudaraPerempuanSeibu >
                  2)
          ? nominal * 0.1667
          : nominal * 0.3333;
      totalShares += shares['Ibu']!;
    }

    if (anakLakiLaki + anakPerempuan > 0) {
      double remaining = nominal - totalShares;
      shares['Anak Laki-Laki'] =
          remaining * (2 / (2 * anakLakiLaki + anakPerempuan)) * anakLakiLaki;
      shares['Anak Perempuan'] =
          remaining * (1 / (2 * anakLakiLaki + anakPerempuan)) * anakPerempuan;
    }

    List<String> result = [];
    shares.forEach((key, value) {
      result.add('$key: \nRp.${value.toStringAsFixed(0)}');
    });

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          // Top Menu Image
          Positioned(
            top: MediaQuery.of(context).size.height * 0.05,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/topmenu.png',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width / 2,
              fit: BoxFit.cover,
            ),
          ),
          // Text Perhitungan Image
          Positioned(
            top: 70,
            left: MediaQuery.of(context).size.width * 0.25,
            right: MediaQuery.of(context).size.width * 0.25,
            child: Image.asset(
              'assets/textperhitungan.png',
              fit: BoxFit.cover,
            ),
          ),
          // Label Nominal Image
          Positioned(
            top: 150,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/labelnominal.png',
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
          ),
          // Data Input Field
          Positioned(
            top: 185,
            left: 50,
            right: 30,
            child: Container(
              height: 80,
              child: TextFormField(
                controller: dataController,
                decoration: InputDecoration(
                  helperText: "Masukkan Hanya Angka Tanpa Titik",
                  helperStyle: TextStyle(color: Colors.green),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  labelStyle: TextStyle(color: Colors.green),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                ),
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          // Bottom Menu Image
          Positioned(
            bottom: -150,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/menubuttom.png',
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
          ),
          // Keluarga Image
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/keluarga.png',
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.45,
            left: MediaQuery.of(context).size.width * 0.4,
            child: buildFamilyMemberField(
              anakLakiLakiController,
              'Anak Laki-Laki',
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.52,
            left: MediaQuery.of(context).size.width * 0.4,
            child: buildFamilyMemberField(
              ayahController,
              'Ayah',
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.585,
            left: MediaQuery.of(context).size.width * 0.4,
            child: buildFamilyMemberField(
              suamiController,
              'Suami',
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.66,
            left: MediaQuery.of(context).size.width * 0.4,
            child: buildFamilyMemberField(
              slaController,
              'SLA',
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.725,
            left: MediaQuery.of(context).size.width * 0.4,
            child: buildFamilyMemberField(
              sliController,
              'SLI',
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.79,
            left: MediaQuery.of(context).size.width * 0.4,
            child: buildFamilyMemberField(
              cucuController,
              'Cucu',
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.45,
            left: MediaQuery.of(context).size.width * 0.89,
            child: buildFamilyMemberField(
              anakPerempuanController,
              'Anak Perempuan',
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.52,
            left: MediaQuery.of(context).size.width * 0.89,
            child: buildFamilyMemberField(
              ibuController,
              'Ibu',
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.585,
            left: MediaQuery.of(context).size.width * 0.89,
            child: buildFamilyMemberField(
              istriController,
              'Istri',
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.66,
            left: MediaQuery.of(context).size.width * 0.89,
            child: buildFamilyMemberField(
              spaController,
              'SPA',
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.725,
            left: MediaQuery.of(context).size.width * 0.89,
            child: buildFamilyMemberField(
              spiController,
              'SPI',
            ),
          ),
          // Button Result
          Positioned(
            bottom: 40,
            left: 15,
            right: 15,
            child: GestureDetector(
              onTap: tampilkan,
              child: Image.asset(
                'assets/buttonresult.png',
                width: MediaQuery.of(context).size.width * 0.7,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Back Button
          // Positioned(
          //   bottom: -5,
          //   right: MediaQuery.of(context).size.width * 0.21,
          //   child: GestureDetector(
          //     onTap: () {
          //       Navigator.pop(context); // Navigate back to previous screen
          //     },
          //     child: Image.asset(
          //       'assets/back3.png',
          //       width: MediaQuery.of(context).size.width * 0.3,
          //       fit: BoxFit.cover,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget buildFamilyMemberField(
      TextEditingController controller, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Container(
        width: 27,
        height: 32,
        child: TextFormField(
          controller: controller,
          maxLength: 1,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            counterText: '',
            contentPadding: EdgeInsets.all(8),
          ),
          style: TextStyle(fontSize: 9),
          keyboardType: TextInputType.number,
        ),
      ),
    );
  }
}

class ResultScreen extends StatelessWidget {
  final List<String> daftarHasil;

  ResultScreen({required this.daftarHasil});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Container(
          child: ListView(
            children: [
              // Top Menu Image
              Image.asset(
                'assets/topmenu.png',
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.contain,
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Hasil Pembagian",
                    style: TextStyle(
                      color: Color(0xFF898989),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: daftarHasil.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        title: Text(
                          daftarHasil[index],
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: "assets/Product.ttf",
                            color: Color(0xFF898989),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Divider(
                        height: 0.0,
                        color: Colors.transparent,
                      ),
                    ],
                  );
                },
              ),
              SizedBox(
                height: 50,
              ),
              // Back Button Image
              GestureDetector(
                onTap: () {
                  Navigator.pop(context); // Navigate back to previous screen
                },
                child: Image.asset(
                  'assets/back3.png',
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.height * 0.05,
                  fit: BoxFit.contain,
                ),
              ),
              // Bottom Menu Image
              Image.asset(
                'assets/menubuttom.png',
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.contain,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
