---
name: food_delivery_ui
description: Specialised skill for building the premium food delivery UI screens using a Zomato/Duolingo motivated Orange theme (#F7941D), Flutter, and Riverpod.
---

# 🍔 MK Foods - UI Implementation Skill

This skill provides pixel-perfect layout parameters, component hierarchies, spacing rules, and styling specs to reproduce the food delivery design mockups exactly as shown in the design image. It uses a Zomato/Duolingo-motivated layout style with the primary brand color set to `#F7941D`.

---

## 🎨 1. Design System & Theme Specifications

Ensure `lib/ui/core/theme/app_colors.dart` and `lib/ui/core/theme/app_theme.dart` are configured with the following design tokens:

### A. Color Palette
* **Primary Orange (Brand):** `0xFFF7941D` (Vibrant Foodie Orange for main buttons, primary branding)
* **Primary Shadow/Dark Orange:** `0xFFD87D0E` (Used for Duolingo-style 3D bottom borders/button shadows)
* **Primary Light (Background Tint):** `0xFFFFF5E9` (Soft peach/orange tint for selected item background fills)
* **Success Green (Duolingo Green):** `0xFF58CC02` (Used for healthy labels, open badges, checkmarks)
* **Alert/Cancel Red (Zomato Red):** `0xFFE23744` (Used for order cancellations, deletes, discount labels)
* **Interactive Info Blue (Duolingo Blue):** `0xFF1CB0F6` (Used for map tracking route highlights and dialog links)
* **Rating Gold (Duolingo Gold):** `0xFFFFC200` (Used for star ratings and reviews)
* **Charcoal Text (Duolingo Dark):** `0xFF3C3C3C` (Playful soft off-black for body copy and headings)
* **Card Border/Background:** `0xFFE5E5E5` / `0xFFF7F7F7` (Flat card grey borders and backgrounds)

### B. Structural Layout Rules (Zomato/Duolingo Motivated)
* **Screen Base Padding:** Left/Right `20.0` or `24.0` padding on all views to ensure clean alignment.
* **Border Radius System:**
  - **Outer App Screens & Floating Bottom Sheets:** `BorderRadius.circular(32)`
  - **Cards & Category Elements:** `BorderRadius.circular(16)` or `BorderRadius.circular(20)`
  - **Pill selectors (Sizes/Counters):** `BorderRadius.circular(20)`
  - **Small Badge Elements:** `BorderRadius.circular(8)`
* **Playful 3D Button Shadows (Duolingo Style):** 
  - Action buttons must use a flat bottom border offset instead of typical blur shadows. 
  - To achieve this, stack the button on top of a colored container: The main button uses `Primary Orange` and sits `4dp` higher than a background container of `Primary Shadow`.
* **Card Borders (Duolingo Style):**
  - Avoid heavy blurry shadows. Cards should have a flat `2dp` border of `0xFFE5E5E5` with a subtle bottom shadow offset of `2dp` (`0xFFD4D4D4`).

### C. Icon Usage Guidelines

> ⚠️ **STRICT RULE — NO Flutter Material Icons (`Icons.*`) anywhere in the codebase. They are heavy, blocky, and visually incompatible with the custom SVG icon set.**

* **Tier 1 — Asset SVGs (always preferred):** Render icons using `SvgPicture.asset('assets/icons/<name>.svg')` from `flutter_svg`. The full available set:
  - **Food / Category:** `fast food.svg`, `pizza.svg`, `donut.svg`, `coffee cup.svg`, `bread.svg`, `soft drink.svg`, `food.svg`, `food pack.svg`, `food tray.svg`, `french fries.svg`
  - **Logistics / Utility:** `location.svg`, `menu.svg`, `call.svg`, `payment.svg`, `delivery.svg`, `time.svg`, `order.svg`, `shop.svg`, `24 hour.svg`, `packaging.svg`, `plastic bag.svg`, `door delivery.svg`
  - **Vehicles:** `motorcycle.svg`, `bicycle.svg`, `delivery truck.svg`
* **Tier 2 — Lucide Icons (fallback only):** When no matching asset SVG exists, use the `lucide_icons` package exclusively. Lucide shares the same thin-stroke, round-cap aesthetic as the custom SVGs:
  - Search → `LucideIcons.search`
  - Notification bell → `LucideIcons.bell`
  - Heart / Favourite → `LucideIcons.heart`
  - Share → `LucideIcons.share2`
  - Back arrow → `LucideIcons.arrowLeft`
  - Plus / Minus counters → `LucideIcons.plus` / `LucideIcons.minus`
  - Trash → `LucideIcons.trash2`
  - Chat → `LucideIcons.messageCircle`
  - Checkmark → `LucideIcons.check`
  - Star rating → `LucideIcons.star`
  - Email field prefix → `LucideIcons.mail`
  - Lock / Password → `LucideIcons.lock`
  - Eye toggle → `LucideIcons.eye` / `LucideIcons.eyeOff`
  - User / Profile → `LucideIcons.user`
  - Home tab → `LucideIcons.home`
  - Settings → `LucideIcons.settings`
* **Never use** `Icons.*`, `CupertinoIcons.*`, or any other icon font that does not match the thin-stroke round-cap style of the assets.

---

## 📱 2. Screen-by-Screen Component Layout

### 🏠 A. Home Screen Layout
* **Header Bar (Height: 64dp):**
  - **Greeting Stack (Left):** "Hello 👋" in font size 12 (`Charcoal Text`, opacity 0.6) stacked above "Delisas Agency" in font size 16 (bold, `Charcoal Text`).
  - **Actions (Right):** Two circular button cards (size `44x44dp`). First button has a Search icon (Lucide outline), second button has a Notification Bell icon (Lucide outline).
* **Category Section (Horizontal List):**
  - List items are circular cards (`56x56dp`) with light grey background (`0xFFF7F7F7`).
  - Each contains a centered vector SVG icon from `assets/icons/` (e.g., `fast food.svg` for Fast Food, `soft drink.svg` for Drinks, `pizza.svg` for Pizza/Sushi, etc.).
  - A small title text (font size 11, bold, `Charcoal Text`) is centered below each circular container.
* **Promo Banner (Horizontal Aspect Ratio 2.2:1):**
  - Dark forest green background (`0xFF122C1A`) or Primary Orange.
  - Rounded container (`BorderRadius.circular(20)`).
  - Left Column: "New Year Offer / 30% OFF / 16 - 31 Dec" in high-contrast white text, with a small green rounded button CTA "Get Now".
  - Right Column: Hand-drawn style illustration of a courier on a scooter carrying a pizza.
* **Best Sellers Grid (2-Column):**
  - Grid cards with a thin border (`1dp solid #E5E5E5`).
  - Layout within each card:
    - Top: Rounded food item image (`BorderRadius.circular(12)`).
    - Middle: Title ("Melting Cheese Pizza") in bold, font size 13, followed by subtitle/price in green/orange text.
    - Info Bar: Row showing a calorie badge ("🔥 44 Calories") and a prep-time badge (using `assets/icons/time.svg` next to text "20 min") in small grey text (font size 10).
    - Bottom-Right: A square brand orange button (`32x32dp`, `BorderRadius.circular(8)`) containing a white `+` icon (Lucide outline).
* **Bottom Navigation Bar (Playful Floating Capsule):**
  - White container with `BorderRadius.circular(32)` resting above the screen bottom.
  - Tabs utilize asset icons (e.g., `assets/icons/shop.svg` for Home, `assets/icons/order.svg` for orders, `assets/icons/payment.svg` for billing) where applicable, or matching outline Lucide icons (home, heart, bell, user).
  - Active tab is highlighted with a rounded capsule container in light primary color (`Primary Light`) holding the active icon in `Primary Orange`.

### 🛒 B. Cart Screen Layout
* **Header Bar:** Center title "Cart" in bold, size 18. Right-aligned trash can icon for "delete all".
* **ListView Cart Items:**
  - Each item is a horizontal row (`Height: 90dp`).
  - Image Container (`76x76dp` with `BorderRadius.circular(12)`) on the left.
  - Text Stack (Center): Bold name (e.g. "Melting Cheese Pizza"), small grey subtitle (e.g. "Pizza Italiano"), and the price (e.g. "$11.88").
  - Counter Controls (Right): Custom green/orange horizontal pill container:
    - Left: Minus icon `-` (Lucide outline).
    - Center: Current count (bold text).
    - Right: Plus icon `+` (Lucide outline).
* **Promo Code Entry Panel:**
  - Row with a text field (`BorderRadius.circular(12)`) and an "Apply" button.
  - Input field background is soft grey (`0xFFF7F7F7`) with a custom coupon/promo SVG outline icon prefix (e.g., `assets/icons/packaging.svg` or Lucide fallback).
  - "Apply" button is a solid primary orange rounded card (`BorderRadius.circular(12)`).
* **Summary Rows:**
  - Subtotal and Delivery fees aligned horizontally with space-between.
  - "Total" row displays total price in brand primary color (`0xFFF7941D`).
* **Checkout Button:** Solid rounded button spanning full width, containing the text `Checkout • $26.43`.

### 🍕 C. Item Details Customisation Screen Layout
* **Header Stack:**
  - Large header image area (Aspect Ratio 1.2:1).
  - Floating circular buttons on top: Left arrow (Back), Heart outline (Favorite), Share icon.
* **Item Main Profile:**
  - Bold header title "Melting Cheese Pizza" in font size 24.
  - Sub-row: Restaurant Name ("Pizza Italiano") and Star rating widget (using Lucide star icon next to text `4.8 (2.2k) >`) in Duolingo Gold.
* **Horizontal Size Selector Grid:**
  - 3 equivalent pill cards side-by-side.
  - Card layout: Size label (e.g., `8" - Medium`) stacked above price (e.g., `$10.99`).
  - Active card state: Outlined in `Primary Orange` with a thickness of `2dp`, light background fill (`Primary Light`), and a small round radio dot selected inside.
  - Inactive card state: Outlined in grey (`0xFFE5E5E5`), white background.
* **Ingredient Checkbox List (Vertical):**
  - List item rows containing:
    - Left: Small food SVG icon (e.g., `assets/icons/food.svg` or `assets/icons/bread.svg`).
    - Center: Ingredient Name ("Chicken") and weight/price adjustment ("250 gm • +$1.40").
    - Right: Custom checkbox. Checkbox must be circular, turning solid green/orange with a white checkmark when checked, and showing an empty grey circle outline when unchecked.
* **Bottom Action Row:**
  - Left: Quantity pill selector (using trash bin or minus Lucide icon for decrement, count, and plus icon for increment) in a rounded grey container.
  - Right: Large Action Button: `Add to Cart • $11.88` with a 3D bottom shading look.

### 📍 D. Tracking Screen Layout
* **Background Map Component:** Full-width map covering the entire background.
* **Floating Header Overlay:** Rounded row containing a back button on the left, "Tracking" in center, and cancel trash icon on the right.
* **Floating Status Banner (Top-Center):**
  - Floating card at top-middle showing remaining duration: "20 min / Delivery / The courier is on the way".
  - Small vector image of a delivery courier (e.g., `assets/icons/delivery.svg`) on the right.
* **Driver Profile Panel (Bottom Floating Card):**
  - Elevated white card with `BorderRadius.circular(24)`.
  - Content: Driver avatar on the left, Driver Details in center ("John Smith / Driver • ⭐ 4.8").
  - Action buttons: Circular chat message button (Lucide outline) and telephone button (using `assets/icons/call.svg`) on the right.
* **Timeline Status Tracker:**
  - Vertical layout with a left progress line (`2dp` thick).
  - Active step has a colored dot (brand orange or Duolingo success green) and displays checkmark (Lucide check or `assets/icons/time.svg`).
  - Stages: "Order Accepted" (with timestamp, e.g., "06:20 PM"), "Cooking Food", "Food's on the Way", "Delivered to you".

### 🔔 E. Notification Screen Layout
* **ListView Feed:**
  - List of status notifications featuring a restaurant icon, notification text, and time stamp.
  - Actionable notification template: Includes inline pill buttons "Decline" (grey border/grey text) and "View Details" (solid primary orange/white text).

---

## 🛠️ 3. Shared Widget Snippets (Clean UI Patterns)

### 3D Playful Action Button
```dart
class App3dButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const App3dButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Stack(
        children: [
          // Background shadow container (3D effect)
          Container(
            height: 52,
            decoration: BoxDecoration(
              color: const Color(0xFFD87D0E), // Primary Shadow Orange
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          // Foreground interactive button
          Transform.translate(
            offset: const Offset(0, -4),
            child: Container(
              height: 52,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: const Color(0xFFF7941D), // Primary Brand Orange
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
```

### Playful Custom Checkbox
```dart
// Uses LucideIcons.check — never Icons.check
class PlayfulCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;

  const PlayfulCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          color: value ? const Color(0xFFF7941D) : Colors.transparent,
          border: Border.all(
            color: value ? const Color(0xFFF7941D) : const Color(0xFFE5E5E5),
            width: 2,
          ),
          shape: BoxShape.circle,
        ),
        child: value
            ? Icon(LucideIcons.check, size: 14, color: Colors.white)
            : null,
      ),
    );
  }
}
```

---

## 🔍 4. Verification Checklist

Ensure the final code structure conforms to these visual criteria:
- [ ] Theme primary color matches brand orange (`0xFFF7941D`) and shadow color matches (`0xFFD87D0E`).
- [ ] Screen layouts implement standard margins of `20.0dp` on all components.
- [ ] Category selectors are formatted in a clean circle (`56x56dp`) with icons and texts underneath.
- [ ] Item customisation sizes are rendered as side-by-side cards with checked indicators.
- [ ] Ingredients checklist uses circular checkboxes (`PlayfulCheckbox`) that toggle state visually.
- [ ] The order details view contains a horizontal bar representing the remaining minutes.
