# Infinity Engine UI Skin for Godot 4

A Baldur's Gate / Icewind Dale–style UI skin for a Python D&D campaign app,
generated with Gemini and packaged for Godot Engine 4.

## Files

- `infinity_skin.tres` — Godot 4 Theme: dark fieldstone panels, aged-parchment
  insets, antique-brass buttons, parchment/ink label colors.
- `hud_controller.gd` — HUD controller script: hero name, health bar, scrolling
  parchment combat log, and action-bar slots (attack, class ability, spells,
  rest) driven by a character dictionary ported from the app's data models.

## Quick start

1. Install [Godot Engine 4](https://godotengine.org/download) (free, open-source).
2. Create a new project and a Control-layout scene with the node paths the
   script expects:
   - `$RightBar/HeroCard/VBox/LabelName`
   - `$RightBar/HeroCard/VBox/HealthBar`
   - `$BottomConsole/LogParchment/RichTextLabel`
   - `$BottomBar/ActionGrid/BtnAbility`
   - `$BottomBar/ActionGrid/BtnSpells`
3. Import `infinity_skin.tres` as a Theme resource (or set the styles in the
   inspector) and attach `hud_controller.gd` to the root interface node.
4. Run the scene — the HUD populates from `active_character` and logs combat
   actions to the parchment console.

## The Forgotten Realms flavor

Shops, taverns, quests, and the boss encounter are mapped to Sword Coast
locations (Sorcerous Sundries, Elfsong Tavern, the Cloakwood, Cult of the
Dragon) — see the raw-recovery README for the full conversion matrix.

Recovered verbatim from a Gemini chat; original code unmodified.
