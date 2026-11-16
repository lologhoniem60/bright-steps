# Project architecture

Follow the feature-based Flutter structure used by xRawash/movies_app on its development branch.

- Put every screen in its own directory and source file. Use lib/features/<feature>/<screen_name>/<screen_name>.dart.
- Keep shared widgets in lib/core/widgets/ and app theme/styles in lib/core/theme/.
- Keep a screen implementation in its own file; do not combine multiple screens in a shared screen file.
- Keep data, repositories, and view models in their corresponding top-level folders when those layers are needed.

This project note persists the requested architecture convention for future work in this project.
