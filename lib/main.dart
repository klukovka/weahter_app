import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;

Future<void> main() async {
 await DotEnv.dotenv.load(fileName: '.env');
}
