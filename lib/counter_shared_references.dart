import 'package:shared_preferences/shared_preferences.dart';

class CounterSharedReferences {
  static const _counterKey = 'counter';

  Future<void> setCounter(int value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(_counterKey, value);
  }

  Future<int> getCounter() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_counterKey) ?? 0;
  }
}
