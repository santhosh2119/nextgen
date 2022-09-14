import 'package:flutter/material.dart';
import 'package:nextgen/models/anitvirus_model.dart';
import 'package:nextgen/providers/service_completed_provider.dart';
import 'package:nextgen/screens/anti_virus/widgets/all_antivirus.dart';
import 'package:nextgen/screens/widgets/loading.dart';
import 'package:provider/provider.dart';

class AnitVirusScreen extends StatefulWidget {
  const AnitVirusScreen({Key? key}) : super(key: key);

  @override
  State<AnitVirusScreen> createState() => _AnitVirusScreenState();
}

class _AnitVirusScreenState extends State<AnitVirusScreen> {
  late List<AntiVirus> antivirus;

  bool _loading = false;
  @override
  void didChangeDependencies() async {
    setState(() {
      _loading = true;
    });
    final data =
        await Provider.of<ServiceProvider>(context, listen: false).antiVirus();
    setState(() {
      antivirus = data;
      _loading = false;
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _loading
          ? const LoadingScreen()
          : AllAntiVirus(
              data: antivirus,
              title: "Anti Virus",
              status: "All",
            ),
    );
  }
}
