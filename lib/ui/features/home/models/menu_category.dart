/// One distinct menu-category name found across nearby restaurants (e.g.
/// "Starters", "Main Course"), plus which restaurant IDs have it on their
/// menu — used to filter the Home restaurant list client-side when a chip
/// is tapped.
class MenuCategoryChip {
  final String name;
  final Set<String> restaurantIds;

  const MenuCategoryChip({required this.name, required this.restaurantIds});
}