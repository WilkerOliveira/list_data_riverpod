import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:list_data_riverpod/core/di/find_properties_di.dart';
import 'package:list_data_riverpod/modules/properties/presentation/pages/list_properties_page.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  FindPropertiesDi.setup();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const ListPropertiesPage(),
    );
  }
}
