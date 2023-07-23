import 'package:flutter_dotenv/flutter_dotenv.dart';

final String? apiKey = dotenv.env['apiKey'];
const String newApiBaseURL = "https://newsapi.org/v2";

const String countryQuery = 'us';
const String categoryQuery = 'general';
