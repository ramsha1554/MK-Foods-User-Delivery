---
name: food_delivery_auth
description: Specialised skill for building the onboarding, sign-in, and sign-up authentication screens using the Zomato/Duolingo-motivated Orange theme (#F7941D) in Flutter.
---

# 🔐 MK Foods - Onboarding & Auth UI Implementation Skill

This skill provides layout configurations, visual specs, and styling parameters to implement the onboarding/welcome screen, login screen, and registration screen exactly as shown in the design image. It matches the color, border radius, and typography system defined in the core UI skill.

---

## 🎨 1. Core Theme & Layout Specifications

Make sure these screens reuse the exact design tokens established in the design system:

### A. Spacing & Spans
* **Base Margins:** Left/Right screen margin is exactly `24.0dp` to align form fields cleanly.
* **Vertical Gap Between Form Fields:** `16.0dp` for input boxes.
* **Vertical Gap Between Form & Button:** `24.0dp` or `32.0dp`.

### B. Element Corner Radii
* **Scaffold Screens:** `BorderRadius.circular(32)` (simulating modern rounded phone templates).
* **Input Text Fields:** `BorderRadius.circular(16)`.
* **3D Buttons:** `BorderRadius.circular(16)` with a `4dp` dark orange shadow offset (`0xFFD87D0E`).
* **Social Authentication Cards:** `BorderRadius.circular(16)` or circular button containers.

### C. Icon Usage Guidelines

> ⚠️ **STRICT RULE — NO Flutter Material Icons (`Icons.*`) anywhere in the codebase. They are heavy, blocky, and visually incompatible with the custom SVG icon set.**

* **Tier 1 — Asset SVGs (always preferred):** Render icons from `assets/icons/` using `flutter_svg`'s `SvgPicture.asset('assets/icons/<name>.svg')`. These are thin-stroke, round-capped vectors that define the visual language of the app.
* **Tier 2 — Lucide Icons (fallback only):** When no matching asset SVG exists, use the `lucide_icons` package exclusively. Lucide icons share the same thin-stroke, round-cap aesthetic as the custom SVGs. Examples:
  - Email field prefix → `LucideIcons.mail`
  - Password field prefix → `LucideIcons.lock`
  - Password visibility toggle → `LucideIcons.eye` / `LucideIcons.eyeOff`
  - Username field prefix → `LucideIcons.user`
  - Back navigation → `LucideIcons.arrowLeft`
  - Search → `LucideIcons.search`
  - Notification bell → `LucideIcons.bell`
  - Heart / Favourite → `LucideIcons.heart`
  - Share → `LucideIcons.share2`
  - Plus / Minus counters → `LucideIcons.plus` / `LucideIcons.minus`
  - Trash → `LucideIcons.trash2`
  - Chat → `LucideIcons.messageCircle`
  - Checkmark → `LucideIcons.check`
  - Star rating → `LucideIcons.star`
* **Never use** `Icons.*`, `CupertinoIcons.*`, or any other icon font that does not match the thin-stroke round-cap style of the assets.

---

## 📱 2. Screen-by-Screen Layout Specifications

### 🍔 A. Onboarding / Welcome Screen (Dark Theme)
* **Background:** Deep dark/off-black container (`0xFF121212`).
* **Brand Logo (Top):**
  - Text label "Burgerly" (or "MK Foods") in size 24, bold, colored in `Primary Orange` (`#F7941D`).
  - Top padding of `60.0dp`, centered horizontally.
* **Hero Image (Center):**
  - A large, high-definition centered graphic of a layered cheeseburger.
  - Sits on a subtle orange ambient background glow to give a premium, high-contrast effect.
* **Header Headlines:**
  - "Good Food" stacked above "Healthy Food" in bold white text (font size 32, height line spacing 1.2).
  - Left-aligned or centered according to layout.
* **Primary Call-To-Action (CTA):**
  - Playful 3D Orange Button labeled "Sign in" (or "Get Started").
  - Spans full container width with a `4dp` bottom shadow.
* **Onboarding Footer:**
  - Text link: "Don't have an Account? Sign up" in white.
  - The "Sign up" part is styled in bold, `Primary Orange`.

### 🔑 B. Log In Screen (Light Theme)
* **Background:** Clean solid white (`0xFFFFFFFF`).
* **Header Stack:**
  - **Title:** "Log In" in bold `Charcoal Text` (`0xFF3C3C3C`), font size 28, centered.
  - **Subtitle:** "Fill your details or Continue with social media" in light grey (size 14, centered).
* **Login Form Panel:**
  - **Email Field:** Rounded text field (`BorderRadius.circular(16)`) with light grey background fill (`0xFFF7F7F7`). Contains a leading mail outline icon (Lucide outline fallback) and placeholder text "Enter your email".
  - **Password Field:** Rounded text field with a leading lock outline icon (Lucide outline fallback), a trailing eye-visibility-toggle icon (Lucide outline), and placeholder text "Enter password".
* **Forgot Password Link:**
  - Right-aligned text button directly under the password field: "Forgot Password?".
  - Small grey font (size 12, font weight normal).
* **Sign In Action Button:**
  - Full-width solid `Primary Orange` 3D button. Labeled "Sign In" in white bold text.
* **Third-Party Social Login:**
  - Divider row: "Or Continue With" centered between two light grey horizontal lines.
  - Icons Row: Two rounded card button outlines (`BorderRadius.circular(16)`) holding Google and Facebook outline icons, aligned in the center.
* **Bottom Action Link:**
  - "New User? Create Account" centered text. The "Create Account" text is bold and colored in `Primary Orange`.
* **Footer Brand Label:**
  - Center-aligned orange text "Burgerly" (or "MK Foods") at the bottom of the canvas.

### 📝 C. Sign Up Screen (Light Theme)
* **Background:** Clean solid white (`0xFFFFFFFF`).
* **Header Stack:**
  - **Title:** "Sign Up" in bold `Charcoal Text`, font size 28, centered.
  - **Subtitle:** "Fill your details or Continue with social media" in light grey (size 14).
* **Registration Form Panel:**
  - **Username Field:** Rounded text field with leading user profile outline icon (Lucide outline fallback) and placeholder "Enter user name".
  - **Email Field:** Rounded text field with leading mail outline icon (Lucide outline fallback) and placeholder "Enter your email".
  - **Password Field:** Rounded text field with leading lock outline icon (Lucide outline fallback), trailing visibility eye icon (Lucide outline), and placeholder "Enter password".
* **Sign Up Action Button:**
  - Full-width solid `Primary Orange` 3D button. Labeled "Sign Up" in white bold text.
* **Social Authentication Row:**
  - Matches the "Or Continue With" and Facebook/Google buttons structure from the Log In screen.
* **Bottom Link:**
  - "Already have an account? Sign In" centered link. The "Sign In" text is bold and colored in `Primary Orange`.

---

## 🛠️ 3. Input Text Field Widget Snippet

Use this custom text field widget. **Prefix and suffix icons must be passed as `Widget` (not `IconData`) so that `SvgPicture.asset` or `Icon(LucideIcons.*)` can be used — never `Icons.*`.**

```dart
// pubspec.yaml must include:
// dependencies:
//   flutter_svg: ^2.0.0
//   lucide_icons: ^0.257.0

class AuthInputField extends StatelessWidget {
  final String hintText;
  final Widget prefixIcon;   // SvgPicture.asset(...) OR Icon(LucideIcons.*)
  final Widget? suffixIcon;  // SvgPicture.asset(...) OR Icon(LucideIcons.*)
  final bool obscureText;

  const AuthInputField({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF7F7F7),
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextField(
        obscureText: obscureText,
        style: const TextStyle(
          color: Color(0xFF3C3C3C),
          fontFamily: 'Outfit',
          fontSize: 15,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Color(0xFF9E9E9E)),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12),
            child: prefixIcon,
          ),
          prefixIconConstraints: const BoxConstraints(minWidth: 44, minHeight: 44),
          suffixIcon: suffixIcon != null
              ? Padding(
                  padding: const EdgeInsets.all(12),
                  child: suffixIcon,
                )
              : null,
          suffixIconConstraints: const BoxConstraints(minWidth: 44, minHeight: 44),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        ),
      ),
    );
  }
}

// ─── Usage examples ──────────────────────────────────────────────────────────
//
// Email field (Lucide fallback — no matching asset SVG):
// AuthInputField(
//   hintText: 'Enter your email',
//   prefixIcon: Icon(LucideIcons.mail, size: 20, color: Color(0xFF9E9E9E)),
// )
//
// Password field:
// AuthInputField(
//   hintText: 'Enter password',
//   prefixIcon: Icon(LucideIcons.lock, size: 20, color: Color(0xFF9E9E9E)),
//   suffixIcon: Icon(LucideIcons.eyeOff, size: 20, color: Color(0xFF9E9E9E)),
//   obscureText: true,
// )
//
// Username field:
// AuthInputField(
//   hintText: 'Enter user name',
//   prefixIcon: Icon(LucideIcons.user, size: 20, color: Color(0xFF9E9E9E)),
// )
```

---

## 🔍 4. Verification Checklist

Ensure the implemented code matches these specifications:
- [ ] Onboarding screen background uses off-black (`0xFF121212`) and features the brand logo "Burgerly" (or "MK Foods") in orange.
- [ ] Text inputs have a border radius of exactly `16.0` and utilize a soft grey fill (`0xFFF7F7F7`).
- [ ] Buttons use the 3D flat shadow offset layout (`App3dButton` from the UI skill).
- [ ] Navigation paths toggle appropriately between the "Sign up" link, "Log In" view, and "Create Account" routes.
- [ ] Input fields feature leading vector outline icons for username, email, and password properties.
