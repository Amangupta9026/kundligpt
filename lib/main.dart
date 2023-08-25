import 'package:firebase_core/firebase_core.dart';
import 'package:kundligpt/router/app_route.dart';
import 'package:kundligpt/utils/file_collection.dart';
import 'package:kundligpt/utils/theme.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Prefs.init();
  runApp(const MyApp());
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Kundli GPT',
      theme: themeData,
      routerConfig: appRoute,
      builder: EasyLoading.init(),
    );
  }
}
