import 'package:qbits/qbits.dart';

class SearchProvider extends ChangeNotifier {
  bool loader = false;
  TextEditingController searchController = TextEditingController();
  List<String> _history = [];

  List<String> get history => _history;

  SearchProvider() {
    init();
  }

  void init() async {
    loadHistory();
  }

  void loadHistory() {
    _history = PrefService.getStringList('search_history');
    notifyListeners();
  }

  Future<void> addQuery(String query) async {
    if (query.isEmpty) return;
    _history.remove(query);
    _history.insert(0, query);
    await PrefService.set('search_history', _history);
    notifyListeners();
  }

  Future<void> clearHistory() async {
    await PrefService.removeKey('search_history');
    _history.clear();
    notifyListeners();
  }
}
