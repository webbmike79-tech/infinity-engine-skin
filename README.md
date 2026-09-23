# Infinity Engine UI Skin for Godot 4

A Baldur's Gate / Icewind Dale–style UI skin for a Python D&D campaign app,
generated with Gemini and packaged for Godot Engine 4.

## Files

- `infinity_skin.tres` — Godot 4 Theme: dark fieldstone panels, aged-parchment
  insets, antique-brass buttons (normal, hover, pressed, disabled, and focus
  states), parchment/ink label colors.
- `hud_controller.gd` — HUD controller script: hero name, health bar, scrolling
  parchment combat log, and action-bar slots (attack, class ability, spells,
  rest). Node references are exported NodePaths (editable in the Inspector),
  and button signals are connected in `_ready()` so no editor wiring is needed.
  Override `load_character_data()` to pull live character data from your
  Python/SQLite backend instead of the sample dictionary.
- `hud.tscn` — ready-to-run scene with the full node tree the controller
  expects. Open it in Godot 4 and press Play.

## Quick start

1. Install [Godot Engine 4](https://godotengine.org/download) (free, open-source).
2. Copy the three files into a new Godot 4 project.
3. Open `hud.tscn` and press Play — the HUD populates from
   `active_character` and logs combat actions to the parchment console.
4. To use your own scene layout, adjust the exported NodePaths on the
   root Control in the Inspector.

## The Forgotten Realms flavor

Shops, taverns, quests, and the boss encounter are mapped to Sword Coast
locations (Sorcerous Sundries, Elfsong Tavern, the Cloakwood, Cult of the
Dragon) — see the raw-recovery README for the full conversion matrix.

Recovered verbatim from a Gemini chat; original code unmodified.
