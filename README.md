# Flutter E-Commerce Order Insights App

This Flutter application provides insights into e-commerce order data using a local JSON file. It displays key metrics about user purchases and visualizes order trends over time.

## Features

- **Order Metrics Screen**:
  - Displays total order count, average order price, and number of returns.

- **Order Graph Screen**:
  - A graph showing the number of orders (Y-axis) over time (X-axis).

- **User-Friendly Design**:
  - Modern, clean, and intuitive user interface.

## Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (version 3.0 or later)
- [Dart SDK](https://dart.dev/get-dart)
- IDE with Flutter and Dart plugins (e.g., [Visual Studio Code](https://code.visualstudio.com/) or [Android Studio](https://developer.android.com/studio))
- Emulator or physical device for testing (Android/iOS)

## Getting Started

### 1. Clone the Repository

Clone this repository to your local machine:

```bash
git clone https://github.com/ziad4347/shop_kpi.git
```

### 2. Install Dependencies

Navigate to the project folder and install the required dependencies:

```bash
cd shop_kpi
flutter pub get
```

### 3. Set Up the JSON File

Place the `ORDERS.JSON` file in the `assets/` directory of the project. Update the `pubspec.yaml` file to include the asset:

```yaml
flutter:
  assets:
    - assets/ORDERS.JSON
```

### 4. Run the App

Run the app on your preferred platform (Android, iOS, or Web):

```bash
flutter run
```

For specific platforms:
- **Android**: `flutter run -d android`
- **iOS (macOS only)**: `flutter run -d ios`
- **Web**: `flutter run -d chrome`

### 5. App Usage

- **Order Metrics Screen**: Displays total orders, average price, and returns.
- **Order Graph Screen**: Shows a date-wise graph of order trends.

### 6. Testing

Test the app on Android, iOS, and Web to ensure compatibility.

## Code Structure

```
lib/
├── config/                     # Configuration files for app settings and routing
│   ├── app_config.dart         # Defines static configuration values like app name
│   ├── app_routes.dart         # Manages routing configuration using GoRouter
├── models/                     # Data models for the app
│   ├── order_metric_model.dart # Structure for order metrics
│   ├── order_model.dart        # Structure for order data with JSON serialization
├── pages/                      # UI components and screens of the app
│   ├── graph/                  # Graph screen and its widgets
│   │   ├── graph_screen.dart   # Displays the graph of orders
│   │   ├── widgets/orders_chart.dart # Chart widget for displaying order data
│   ├── layout/                 # Layout components like sidebars and top bars
│   │   ├── layout_screen.dart  # Manages the app layout
│   │   ├── widgets/side_bar.dart  # Sidebar widget
│   │   ├── widgets/top_bar.dart   # Top bar widget
│   │   ├── widgets/side_bar_items/ # Sidebar item models and widgets
│   │       ├── siderbar_item_model.dart # Sidebar item structure
│   │       ├── side_bar_items.dart      # Sidebar item widgets
│   ├── order_metrics/          # Order metrics screen and widgets
│   │   ├── orders_metrics_screen.dart # Displays order metrics
│   │   ├── widgets/metric_card.dart    # Metric card widget
│   ├── not_found_view.dart     # "Not found" screen for invalid routes
├── providers/                  # State management classes
│   ├── orders_provider.dart    # Manages order data and state
├── theme/                      # Theme-related files for styling the app
│   ├── app_color.dart          # Defines app-wide color constants
│   ├── app_status_bar.dart     # Manages the status bar style
│   ├── app_text_styles.dart    # Defines text styles for the app
│   ├── app_theme.dart          # Configures the overall app theme
├── main.dart                   # Entry point of the application
assets/
├── ORDERS.JSON                 # E-commerce order data
pubspec.yaml                    # Configuration for dependencies and assets
```

## Libraries & Packages Used

- [`provider`](https://pub.dev/packages/provider): For state management.
- [`go_router`](https://pub.dev/packages/go_router): For navigation and deep linking.
- [`responsive_framework`](https://pub.dev/packages/responsive_framework) & [`responsive_grid`](https://pub.dev/packages/responsive_grid): For building responsive layouts.
- [`fl_chart`](https://pub.dev/packages/fl_chart): For graph visualization.

## License

This project is open source and available under the [MIT License](https://opensource.org/licenses/MIT).
