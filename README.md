# UniStore - Flutter E-commerce App

UniStore is a modern e-commerce application built with Flutter, offering a seamless shopping experience with a beautiful user interface and robust functionality with nice UI and animations.

## Features

-   🎨 Beautiful and intuitive user interface
-   🌙 Dark/Light theme support
-   🔔 Push notifications integration
-   📱 Responsive design
-   🖼️ Image upload functionality
-   💾 Local data persistence
-   🔄 State management with BLoC pattern
-   🌐 RESTful API integration

## Getting Started

### Prerequisites

-   Flutter SDK (^3.5.4)
-   Dart SDK
-   Android Studio / VS Code
-   Firebase project setup

### Installation

1. Clone the repository
2. Install dependencies:
    ```bash
    flutter pub get
    ```
3. Run the app:
    ```bash
    flutter run
    ```

## Dependencies

### State Management & UI

-   **bloc** (^8.1.4) - Predictable state management library
-   **flutter_bloc** (^8.1.6) - Flutter widgets for bloc state management
-   **get** (^4.6.6) - Route management and dependency injection
-   **flutter_hooks** (^0.20.5) - React-like hooks for Flutter

### UI Components & Styling

-   **animated_theme_switcher** (^2.0.10) - Animated theme switching
-   **awesome_snackbar_content** (^0.1.4) - Beautiful snackbar notifications
-   **card_loading** (^0.3.2) - Loading card animations
-   **carousel_slider** (^5.0.0) - Image carousel widget
-   **crystal_navigation_bar** (^1.0.2) - Modern navigation bar
-   **flutter_spinkit** (^5.2.1) - Loading indicators collection
-   **gap** (^3.0.1) - Spacing widgets
-   **google_fonts** (^6.2.1) - Google Fonts integration
-   **modal_bottom_sheet** (^3.0.0) - Modal bottom sheets

### Firebase & Services

-   **firebase_core** (^3.9.0) - Firebase core functionality
-   **firebase_messaging** (^15.1.6) - Push notifications
-   **http** (^1.2.2) - HTTP requests
-   **image_picker** (^1.1.2) - Image selection
-   **shared_preferences** (^2.3.3) - Local data storage

### Development

-   **flutter_lints** (^4.0.0) - Recommended lints for Flutter apps

## Screenshots

Below are screenshots of the application in both light and dark themes.

### Authentication Page

#### Light Theme

![Auth - Light Theme](screenshots/auth%20page%20-%20light.png)
![Signup - Light Theme](screenshots/signup%20page%20-%20light.png)
![SignIn - Light Theme](screenshots/login%20page%20-%20light.png)

#### Dark Theme

![Auth- Dark Theme](screenshots/auth%20page%20-dark.png)
![Signup - Dark Theme](screenshots/signup%20page%20-%20dark.png)
![SignIn - Dark Theme](screenshots/login%20page%20-%20dark.png)

### Home Page

#### Light Theme

![Home - Light Theme](screenshots/home%20page%20-%20light.png)

#### Dark Theme

![Home - Dark Theme](screenshots/home%20page1%20-dark.png)
![Home - Dark Theme](screenshots/home%20page2%20-dark.png)

### Cart Page

#### Light Theme

![Cart - Light Theme](screenshots/cart%20page%20-%20light.png)

#### Dark Theme

![Empty Cart - Dark Theme](screenshots/empty%20cart%20page%20-%20dark.png)
![Cart - Dark Theme](screenshots/full%20cart%20page%20-%20dark.png)
![Checkout Cart - Dark Theme](screenshots/checkout%20page%20-%20dark.png)
![Placeorder Cart - Dark Theme](screenshots/place%20order%20-dark.png)

### Pending and Fullfilled Orders Page

#### Light Theme

![Orders - Light Theme](screenshots/orders%20page%20-%20light.png)

#### Dark Theme

![Orders - Dark Theme](screenshots/orders%20page%20-%20dark.png)

### Profile Page

#### Light Theme

![Profile - Light Theme](screenshots/profile%20page%20-%20light.png)

#### Dark Theme

![Profile - Dark Theme](screenshots/profile%20page%20-dark.png)

### Product Page

#### Light Theme

![Product - Light Theme](screenshots/product%20page%20-%20light.png)

#### Dark Theme

![Product - Dark Theme](screenshots/product%20page%20-%20dark.png)

### Favourites Page

#### Light Theme

![Fav - Light Theme](screenshots/fav%20page%20-light.png)

#### Dark Theme

![Fav - Dark Theme](screenshots/fav%20page%20-dark.png)

### Search For Stores and Products Page

#### Dark Theme

![Search - Light Theme](screenshots/search%20page%20-%20dark.png)

## Assets

The app includes the following asset directories:

-   `assets/images/` - Image assets
-   `assets/icons/` - Icon assets

## Security

Sensitive configuration files are excluded from version control:

-   Firebase configuration files
-   API keys and environment variables
-   Keystore files

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.
