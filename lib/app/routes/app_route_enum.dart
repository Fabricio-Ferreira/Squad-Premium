enum AppRoutes {
  home('/home'),
  login('/login'),
  initial('/initial'),
  register('/register');

  final String path;

  const AppRoutes(this.path);
}
