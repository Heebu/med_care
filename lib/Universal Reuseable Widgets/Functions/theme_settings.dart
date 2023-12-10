import 'package:event_bus/event_bus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

class ThemeChangedEvent {}

class ThemeService extends ReactiveViewModel {
  static final ThemeService _instance = ThemeService._internal();

  factory ThemeService() => _instance;

  ThemeService._internal();

  final EventBus _eventBus = EventBus();

  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  Future<void> init() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isDarkMode = prefs.getBool('isDarkMode') ?? false;
  }

  void onData(data) {
    // Listen to theme changes
    _eventBus.on<ThemeChangedEvent>().listen((event) {
      _isDarkMode = ThemeService().isDarkMode;
      notifyListeners();
    });

    // Initialize theme mode
    _isDarkMode = ThemeService().isDarkMode;
    notifyListeners();
  }

  Future<void> toggleTheme() async {
    await ThemeService().toggleTheme();
  }

  // Register a listener for theme changes
  void addThemeChangedListener(Function() listener) {
    _eventBus.on<ThemeChangedEvent>().listen((event) {
      listener();
    });
  }

  @override
  List<ReactiveServiceMixin> get reactiveServices => [];
}
