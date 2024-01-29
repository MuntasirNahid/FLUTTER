//we want to read the json file as a string, so we created this file

import 'dart:io';

String fixture(String name) => File('test/fixtures/$name').readAsStringSync();
