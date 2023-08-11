import 'package:business/module_business.dart';
import 'package:business/products_notifier.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:simple_state_management/pages/my_home_page.dart';
import 'package:simple_state_management/pages/shopping_cart_page.dart';

void main() {
  initializeStateManager();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final ProductsNotifier _stateManager;

  @override
  void initState() {
    super.initState();
    _stateManager = GetIt.I.get<ProductsNotifier>();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProductsNotifier>(
        create: (_) => _stateManager,
        child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            initialRoute: MyHomePage.routeName,
            onGenerateRoute: (RouteSettings settings) {
              switch (settings.name) {
                case MyHomePage.routeName:
                  return MaterialPageRoute(builder: (BuildContext context) {
                    return const MyHomePage(
                        title: 'Simple state management Home Page');
                  });
                case ShoppingCartPage.routeName:
                  return MaterialPageRoute(builder: (BuildContext context) {
                    return const ShoppingCartPage(title: 'Shopping Cart');
                  });
                default: return MaterialPageRoute(builder: (BuildContext context) {
                  return const MyHomePage(
                      title: 'Simple state management Home Page');
                });
              }
            },
        ),
    );
  }
}
