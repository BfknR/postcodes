# MY NOTES
- Once imported the class postcodes response from quicktype, I changed the name of the result by places and created its own file (place)[place.dart] to keep it as a class.
- Handled results missing key exception manually on its own class with 
``` dart 
results: json["results"] == null ? [] : List<Place>.from(json["results"].map((x) => Place.fromJson(x)))
```
- Created an enum for different search_screen states (SearchState)
- The API was returning elevation as a double but quicktype sets it as an int. Manually modified it.
- Found out not setting as required the OnTap on Place_list_tile allows me to have it empty without adding the () {}.
- On the input bar the color was looking out of place when focusing on it. Had to change enabledBorder and focusedBorder.
- When generating WeatherResponse with quicktype, stripped unused fields (latitude, longitude, elevation, currentUnits, time, interval) and renamed Current → WeatherData. Also dropped CurrentUnits entirely since we only need temperature, weather_code and wind_speed.
- Used ActionChip instead of ChoiceChip for recent searches. ChoiceChip is for selecting between options (it has a selected state). ActionChip is for triggering an action on tap, which is what we want — tapping a recent search just re-runs it, there's nothing to "select".
- Extracted three widgets to keep screens clean: WeatherCard (owns the FutureBuilder + weather states), PostcodesWrap (Wrap + Chip list), RecentSearchesBar (horizontal ActionChip list). Each widget owns its own logic and styles so the screen files only handle navigation and state.