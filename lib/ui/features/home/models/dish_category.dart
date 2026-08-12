/// One distinct menu-item name found across nearby restaurants, plus
/// which restaurant IDs actually serve it — used to filter the Home
/// restaurant list client-side when a chip is tapped.
class DishCategory {
  final String name;
  final Set<String> restaurantIds;

  const DishCategory({required this.name, required this.restaurantIds});
}