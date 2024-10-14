# Weather Forecast App

The **Weather Forecast App** is a mobile application designed to provide users with real-time weather data, including current conditions and weekly forecasts for specific locations. Users can search for locations, view detailed weather information, and set preferences like theme (light/dark) and language. The app also includes onboarding to guide new users and integrates with location services for enhanced functionality.

## Features

- **Current and Weekly Forecasts**: Search for a location and view the weather forecast for today and the upcoming week.
- **Theme Selection**: Choose between light mode, dark mode, and system preferences.
- **Location Search**: Find the weather in any location using a search feature.
- **User Preferences**: Set language and theme preferences for a personalized experience.
- **Onboarding**: A guided introduction to help users navigate the app.
- **Geolocation**: Automatically detect the user's location for more accurate weather data.

## Project Structure

The project follows a feature-based folder structure for maintainability and scalability:
app/
├── docs/                   # Documentation files
├── lib/                    # Main app source code
│   ├── common/             # Shared utilities and components
│   │   ├── exceptions/     # Custom exception handling
│   │   ├── geolocator/     # Geolocation service integration
│   │   ├── routes/         # App navigation and route management
│   │   ├── service_locator/# Dependency injection and service locator
│   │   ├── services/       # Core services (API, storage, etc.)
│   │   ├── utils/          # Helper methods and utilities
│   │   ├── widgets/        # Shared UI components
│   ├── features/           # Feature-based organization
│   │   ├── home/           # Home feature (dashboard)
│   │   │   ├── data/       # Data layer (models, repositories)
│   │   │   ├── ui/         # UI components for the home feature
│   │   │   └── widgets/    # Widgets specific to the home feature
│   │   ├── initialization/ # Splash and Onboarding feature
│   │   ├── search/         # Search for locations
│   │   ├── settings/       # User preferences (theme, language)
design_system/              # Design system package (colors, fonts, widgets)
resources/                  # Shared resources (colors, fonts)
theme/                      # Application-wide theme management
widgets/                    # Global reusable widgets

### Core Features Breakdown

1. **Common Components**:
    - **Exceptions**: Handles custom exceptions and errors across the app.
    - **Geolocator**: Provides access to device geolocation services.
    - **Service Locator**: Handles dependency injection for services like weather APIs and local storage.
    - **Services**: Core services include API integrations and utility services like storage management.

2. **Features**:
    - **Home**:
        - **Data**: Handles data models and repository patterns for managing weather data.
        - **UI**: Contains the BLoC (Business Logic Component) and UI pages.
    - **Initialization**: Manages onboarding and splash screens.
    - **Search**: Allows users to search for specific locations.
    - **Settings**: Allows users to adjust preferences like language and theme.

3. **Design System**:
   A shared package for maintaining design consistency across the app, including colors, fonts, and reusable widgets.
