extends Control
## Baldur's Gate / Icewind Dale style HUD controller.
##
## Node references are exported NodePaths so the script survives scene-tree
## renames — set them in the Inspector or leave the defaults, which match
## hud.tscn shipped alongside this script. Button signals are connected in
## code so the HUD works without editor-wired connections.

# UI element references (defaults match hud.tscn)
@export var hero_name_path: NodePath = ^"RightBar/HeroCard/VBox/LabelName"
@export var health_bar_path: NodePath = ^"RightBar/HeroCard/VBox/HealthBar"
@export var combat_log_path: NodePath = ^"BottomConsole/LogParchment/RichTextLabel"
@export var ability_button_path: NodePath = ^"BottomBar/ActionGrid/BtnAbility"
@export var spells_button_path: NodePath = ^"BottomBar/ActionGrid/BtnSpells"
@export var attack_button_path: NodePath = ^"BottomBar/ActionGrid/BtnAttack"
@export var rest_button_path: NodePath = ^"BottomBar/ActionGrid/BtnRest"

@onready var label_hero_name: Label = get_node(hero_name_path)
@onready var bar_health: ProgressBar = get_node(health_bar_path)
@onready var text_combat_log: RichTextLabel = get_node(combat_log_path)
@onready var slot_ability: Button = get_node(ability_button_path)
@onready var slot_spells: Button = get_node(spells_button_path)
@onready var btn_attack: Button = get_node(attack_button_path)
@onready var btn_rest: Button = get_node(rest_button_path)

const CASTER_CLASSES := ["Wizard", "Cleric", "Sorcerer", "Warlock", "Bard", "Druid", "Paladin", "Ranger"]

# Active character data. Replace the sample below by overriding
# load_character_data() to pull from your Python/SQLite game database.
var active_character := {
	"name": "Gorion's Ward",
	"race": "Elf",
	"class_name": "Fighter",
	"level": 1,
	"current_hp": 12,
	"max_hp": 12,
	"gold": 35,
	"ac": 16,
	"ability": "Second Wind"
}

func _ready() -> void:
	# Portable signal wiring (no editor connections required)
	btn_attack.pressed.connect(_on_btn_attack_pressed)
	slot_ability.pressed.connect(_on_btn_ability_pressed)
	btn_rest.pressed.connect(_on_btn_rest_pressed)
	load_character_data()
	refresh_ui()
	log_message("[color=#4b2504]The journey along the Sword Coast begins...[/color]")

func load_character_data() -> void:
	## Hook for live data: query your Python/SQLite backend here and
	## assign the result to active_character, then call refresh_ui().
	## The sample dictionary above is used until this is implemented.
	pass

func refresh_ui() -> void:
	# Name & Vitals
	label_hero_name.text = "%s\nLvl %d %s" % [
		active_character["name"],
		active_character["level"],
		active_character["class_name"]
	]

	bar_health.max_value = active_character["max_hp"]
	bar_health.value = active_character["current_hp"]

	# Action Bar Dynamic Slots
	slot_ability.text = active_character["ability"]
	slot_spells.visible = active_character["class_name"] in CASTER_CLASSES

func log_message(msg: String) -> void:
	text_combat_log.append_text("\n" + msg)

# UI Action Signals
func _on_btn_attack_pressed() -> void:
	log_message("[b]" + active_character["name"] + "[/b] strikes with longsword!")

func _on_btn_ability_pressed() -> void:
	log_message("Activated class feature: [color=#8b1e0f]" + active_character["ability"] + "[/color]")

func _on_btn_rest_pressed() -> void:
	active_character["current_hp"] = active_character["max_hp"]
	refresh_ui()
	log_message("Party completed a rest. Vitals restored.")
