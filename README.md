# 🐧 Codis Postals

Flutter app that lets you search Spanish localities by postal code or name, using the Open-Meteo geocoding API.

**Course:** Desenvolupament d'Aplicacions Mòbils per iOS i Android amb Flutter  
**Activity:** A1.4 — Una app amb API

---

## What it does

- Enter a postal code → see which localities it belongs to
- Enter a locality name → see where it is
- Tap a locality → see full details (province, autonomous community, population, coordinates, all postal codes)
- Bonus: current weather at the selected locality

## API

Data comes from the [Open-Meteo geocoding API](https://open-meteo.com/) — free, no key required, results in Catalan.

```
https://geocoding-api.open-meteo.com/v1/search?name=17820&language=ca&countryCode=ES
```

Weather data (challenge level):

```
https://api.open-meteo.com/v1/forecast?latitude=42.11667&longitude=2.76667&current=temperature_2m,weather_code,wind_speed_10m
```

Data source: Open-Meteo (CC BY 4.0), based on GeoNames.

## Project structure

```
lib/
├── main.dart
├── models/       # SearchResponse, Place, WeatherResponse
├── screens/      # SearchScreen, PlaceDetailScreen
├── widgets/      # Reusable UI components
└── styles/       # AppStyles (colors, spacing)
```

## Levels

| Level | Description |
|-------|-------------|
| **Base** (required) | Search screen with all states: initial, loading, results, not found, error |
| **Ampliació** | Detail screen with full place data and postal code chips |
| **Repte** | Live weather on detail + recent searches list |

## Reflection

*(To be filled in once the app is complete.)*

---

*Adrián Jaime Pastor*
