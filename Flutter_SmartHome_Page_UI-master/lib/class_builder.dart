import 'package:flutter_smart_home_ui/profile.dart';
import 'package:flutter_smart_home_ui/home.dart';
import 'package:flutter_smart_home_ui/schedules.dart';
import 'package:flutter_smart_home_ui/settings.dart';
import 'package:flutter_smart_home_ui/Botons.dart';
import 'package:flutter_smart_home_ui/stats.dart';
import 'package:flutter_smart_home_ui/sql_lite.dart';
import 'package:flutter_smart_home_ui/BadeDades.dart';

typedef T Constructor<T>();

final Map<String, Constructor<Object>> _constructors =
    <String, Constructor<Object>>{};

void register<T>(Constructor<T> constructor) {
  _constructors[T.toString()] = constructor;
}

class ClassBuilder {
  static void registerClasses() {
    register<Home>(() => Home());
    register<Profile>(() => Profile());
    register<Botons>(() => Botons());
    register<Stats>(() => Stats());
    register<Schedules>(() => Schedules());
    register<Settings>(() => Settings());
    register<SqlLite>(() => SqlLite());
    register<BaseDades>(() => BaseDades());
  }

  static dynamic fromString(String type) {
    return _constructors[type]();
  }
}
