import 'package:mysql1/mysql1.dart';

// Open a connection (scheshere should already exist)
var settings = new ConnectionSettings(
    host: 'localhost', port: 3306, user: 'root', db: 'scheshere');

var conn = MySqlConnection.connect(settings);
