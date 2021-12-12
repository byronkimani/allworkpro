import 'package:allworkpro/constants/theme.dart';
import 'package:allworkpro/presentation/features/home/widgets/home_drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage();

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CollectionReference<Object?> users =
      FirebaseFirestore.instance.collection('serviceRequests');

  @override
  void initState() {
    super.initState();
  }

  void saveServiceRequest() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: accentColor,
      ),
      drawer: Container(
        color: whiteColor,
        width: 255,
        child: const HomeDrawer(),
      ),
      body: Container(),
    );
  }
}
