import 'package:business/module_business.dart';
import 'package:business/state_manager.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:simple_state_management/list_page.dart';
import 'package:simple_state_management/product_list_item_model.dart';

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
  late final StateManager _stateManager;

  @override
  void initState() {
    super.initState();
    _stateManager = GetIt.I.get<StateManager>();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<StateManager>(
        create: (_) => _stateManager,
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const MyHomePage(title: 'Simple state management Home Page'),
        ));
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Consumer<StateManager>(
        builder: (context, state, child) {
          if (!state.isLoaded) {
            return const CircularProgressIndicator();
          } else {
            return ListPage(
              products: state.products
                  .map((product) => product.toProductListItemModel())
                  .toList(),
              addedToCart: (ProductListItemModel item) {
                state.addToCart(item.id);
              },
            );
          }
        },
      ),
    );
  }
}
