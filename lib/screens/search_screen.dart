import 'package:flutter/material.dart';
import 'package:postcodes/widgets/place_list_tile.dart';

import '../models/place.dart';
import '../services/postcode_service.dart';
import '../styles/app_styles.dart';
import 'place_detail_screen.dart';

enum SearchState { initial, loading, results, notFound, error }

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();
  final PostcodeService postcodeService = PostcodeService();

  SearchState state = SearchState.initial;
  List<Place> places = [];
  String lastQuery = '';

  List<String> recentSearches = [];

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  Future<void> loadPlaces() async {
    final query = searchController.text.trim();
    if (query.isEmpty) return;

    lastQuery = query;
    state = SearchState.loading;
    setState(() {});

    try {
      places = await postcodeService.search(query);
      if (!mounted) return;
      state = places.isEmpty ? SearchState.notFound : SearchState.results;

      if (places.isNotEmpty) {
        recentSearches.remove(lastQuery);
        recentSearches.insert(0, lastQuery);
        if (recentSearches.length > 5) recentSearches.removeLast();
      }
    } catch (e) {
      if (!mounted) return;
      debugPrint(e.toString());
      state = SearchState.error;
    }

    setState(() {});
  }

  Widget _buildBody() {
    switch (state) {
      case SearchState.initial:
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Text(
              'Escriu un codi postal o el nom d\'una població per cercar.',
              textAlign: TextAlign.center,
              style: AppStyles.hint,
            ),
          ),
        );

      case SearchState.loading:
        return const Center(child: CircularProgressIndicator());

      case SearchState.results:
        return ListView.builder(
          itemCount: places.length,
          itemBuilder: (context, index) {
            final place = places[index];
            return PlaceListTile(
              place: place,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PlaceDetailScreen(place: place),
                ),
              ),
            );
          },
        );

      case SearchState.notFound:
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Text(
              'No hem trobat cap població per a «$lastQuery».',
              textAlign: TextAlign.center,
              style: AppStyles.hint,
            ),
          ),
        );

      case SearchState.error:
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'No s\'ha pogut connectar. Comprova la connexió.',
                  textAlign: TextAlign.center,
                  style: AppStyles.bodyText,
                ),
                AppStyles.smallSeparator,
                ElevatedButton(
                  onPressed: loadPlaces,
                  child: const Text('Tornar-ho a provar'),
                ),
              ],
            ),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Codis Postals')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              controller: searchController,
              textInputAction: TextInputAction.search,
              onSubmitted: (_) => loadPlaces(),
              style: AppStyles.bodyText,
              decoration: const InputDecoration(
                hintText: 'Codi postal o població',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          if (recentSearches.isNotEmpty)
            SizedBox(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                itemCount: recentSearches.length,
                itemBuilder: (context, index) {
                  final query = recentSearches[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ActionChip(
                      label: Text(query, style: AppStyles.placeSubtitle),
                      onPressed: () {
                        searchController.text = query;
                        loadPlaces();
                      },
                    ),
                  );
                },
              ),
            ),
          Expanded(child: _buildBody()),
        ],
      ),
    );
  }
}
