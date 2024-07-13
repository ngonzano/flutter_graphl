import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:project_graphql/constante.dart';

import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHiveForFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    HttpLink link = HttpLink(Constante.ipGraphql);
    ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(
        link: link,
        cache: GraphQLCache(
          store: HiveStore(),
        ),
      ),
    );
    final theme = Theme.of(context).textTheme;
    return GraphQLProvider(
      client: client,
      child: CacheProvider(
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.lightBlue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            textTheme: theme,
            appBarTheme: const AppBarTheme(
              iconTheme: IconThemeData(color: Colors.black87),
            ),
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
            useMaterial3: false,
          ),
          home: const HomeScreen(),
        ),
      ),
    );
  }
}
