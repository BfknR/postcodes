import 'package:flutter/material.dart';
import '../styles/app_styles.dart';

class RecentSearchesBar extends StatelessWidget {
  const RecentSearchesBar({
    super.key,
    required this.searches,
    required this.onSelected,
  });

  final List<String> searches;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    if (searches.isEmpty) return const SizedBox.shrink();
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        itemCount: searches.length,
        itemBuilder: (context, index) {
          final query = searches[index];
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: ActionChip(
              label: Text(query, style: AppStyles.placeSubtitle),
              onPressed: () => onSelected(query),
            ),
          );
        },
      ),
    );
  }
}
