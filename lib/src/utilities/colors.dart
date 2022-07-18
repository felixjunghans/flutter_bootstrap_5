part of flutter_bootstrap5;

class BootstrapColors {
  static const Color blue = Color(0xFF0d6efd);
  static const Color indigo = Color(0xFF6610f2);
  static const Color purple = Color(0xFF6f42c1);
  static const Color pink = Color(0xFFd63384);
  static const Color red = Color(0xFFdc3545);
  static const Color orange = Color(0xFFfd7e14);
  static const Color yellow = Color(0xFFffc107);
  static const Color green = Color(0xFF198754);
  static const Color teal = Color(0xFF20c997);
  static const Color cyan = Color(0xFF0dcaf0);
  static const Color white = Color(0xFFFFFFFF);
  static const Color gray100 = Color(0xFFf8f9fa);
  static const Color gray200 = Color(0xFFe9ecef);
  static const Color gray300 = Color(0xFFdee2e6);
  static const Color gray400 = Color(0xFFced4da);
  static const Color gray500 = Color(0xFFadb5bd);
  static const Color gray600 = Color(0xFF6c757d);
  static const Color gray700 = Color(0xFF495057);
  static const Color gray800 = Color(0xFF343a40);
  static const Color gray900 = Color(0xFF212529);
  static const Color gray90075 = Color(0xBF212529);
  static const Color black50 = Color(0x80000000);
  static const Color white50 = Color(0x80FFFFFF);
}

class FB5Colors {
  final Color primary;
  final Color secondary;
  final Color success;
  final Color danger;
  final Color warning;
  final Color info;
  final Color light;
  final Color dark;
  final Color body;
  final Color muted;
  final Color white;
  final Color black50;
  final Color white50;

  const FB5Colors({
    this.primary = BootstrapColors.blue,
    this.secondary = BootstrapColors.gray600,
    this.success = BootstrapColors.green,
    this.danger = BootstrapColors.red,
    this.warning = BootstrapColors.yellow,
    this.info = BootstrapColors.cyan,
    this.light = BootstrapColors.gray100,
    this.dark = BootstrapColors.gray900,
    this.body = BootstrapColors.gray900,
    this.muted = BootstrapColors.gray90075,
    this.white = BootstrapColors.white,
    this.black50 = BootstrapColors.black50,
    this.white50 = BootstrapColors.white50,
  });
}
