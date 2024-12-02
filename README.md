# Flutter E-Commerce Order Insights App

This Flutter app provides insights from a local JSON file containing e-commerce order data. It displays key metrics about user purchases and visualizes the number of orders over time.

## Features

- **Order Metrics Screen**: Displays the following key metrics:
  - Total order count
  - Average order price
  - Number of returns

- **Order Graph Screen**: Displays a graph with:
  - Y-axis: Number of orders
  - X-axis: Time (with the data represented in a date-wise fashion)

The app is built to be user-friendly and simple to navigate, with a clean and modern design.

## Prerequisites

- Flutter SDK (version 3.0 or above)
- Dart SDK
- An IDE like Visual Studio Code or Android Studio with Flutter and Dart plugins
- Android/iOS Emulator or a physical device for testing

## Getting Started

1. **Clone the Repository**

   Clone this repository to your local machine using the following command:
   ```bash
   git clone https://github.com/ziad4347/shop_kpi.git   ```

2. **Install Dependencies**

   Navigate to the project folder and install the necessary dependencies:
   ```bash
   cd shop_kpi
   flutter pub get   ```

3. **Set Up the JSON File**

   Place the `ORDERS.JSON` file in the `assets/` directory of the project. Make sure the file path is set correctly in the `pubspec.yaml` file for asset loading:
   ```yaml
   flutter:
     assets:
       - assets/ORDERS.JSON   ```

4. **Run the App**

   To run the app on your preferred device (iOS, Android, or Web), use the following command:
   ```bash
   flutter run   ```

   You can choose a specific platform by running:

   - For Android:
     ```bash
     flutter run -d android     ```

   - For iOS (macOS only):
     ```bash
     flutter run -d ios     ```

   - For Web:
     ```bash
     flutter run -d chrome     ```

5. **App Usage**

   - **Order Metrics Screen**: Displays a summary of order-related statistics, including the total number of orders, average price, and number of returns.
   - **Order Graph Screen**: Shows a graphical representation of orders over time, with the number of orders on the Y-axis and time (date) on the X-axis.

6. **Testing the App**

   Test the app on both Android and iOS emulators, and also on the Web (in Chrome or your browser of choice) to ensure compatibility.

## Folder Structure

The `lib` directory is organized as follows:

- **config/**: Contains configuration files for the app.
  - `app_config.dart`: Defines static configuration values like the app name.
  - `app_routes.dart`: Manages the routing configuration using `GoRouter`.

- **models/**: Contains data models used in the app.
  - `order_metric_mode.dart`: Defines the structure for order metrics.
  - `order_model.dart`: Defines the structure for order data and includes methods for JSON serialization and deserialization.

- **pages/**: Contains the UI components and screens of the app.
  - **graph/**: Contains the graph screen and its widgets.
    - `graph_screen.dart`: Displays the graph of orders.
    - `widgets/orders_chart.dart`: Contains the chart widget for displaying order data.
  - **layout/**: Contains layout components like sidebars and top bars.
    - `layout_screen.dart`: Manages the layout of the app, including sidebars and top bars.
    - `widgets/side_bar.dart`: Defines the sidebar widget.
    - `widgets/top_bar.dart`: Defines the top bar widget.
    - **widgets/side_bar_items/**: Contains models and widgets for sidebar items.
      - `siderbar_item_model.dart`: Defines the structure for sidebar items.
      - `side_bar_items.dart`: Manages the sidebar items.
  - **order_metrics/**: Contains the order metrics screen and its widgets.
    - `orders_metrics_screen.dart`: Displays the order metrics.
    - `widgets/metric_card.dart`: Defines the metric card widget for displaying individual metrics.
  - `not_found_view.dart`: Displays a "not found" screen for invalid routes.

- **providers/**: Contains provider classes for state management.
  - `orders_provider.dart`: Manages the state and data for orders, including loading and processing order data.

- **theme/**: Contains theme-related files for styling the app.
  - `app_color.dart`: Defines color constants used throughout the app.
  - `app_status_bar.dart`: Manages the status bar style and visibility.
  - `app_text_styles.dart`: Defines text styles used throughout the app.
  - `app_theme.dart`: Configures the overall theme of the app.

- **main.dart**: The entry point of the application, setting up the app's theme, routes, and providers.
- `assets/`: Contains the `ORDERS.JSON` file.

- `pubspec.yaml`: Configuration file for dependencies and assets.

## Libraries & Packages Used

- `provider`: For state management across different screens.
- `go_router`: for simplify navigation and routing in applications, supporting deep linking and URL-based navigation.
- `responsive_framework` & `responsive_grid`: Helps in building responsive layouts that adapt to different screen sizes.
- `fl_chart`: For displaying the graph of orders over time.

## License

This project is open source and available under the MIT License.

---