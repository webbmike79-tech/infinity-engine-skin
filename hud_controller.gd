extends Control

# UI Element References
@onready var label_hero_name = $RightBar/HeroCard/VBox/LabelName
@onready var bar_health = $RightBar/HeroCard/VBox/HealthBar
@onready var text_combat_log = $BottomConsole/LogParchment/RichTextLabel
@onready var slot_ability = $BottomBar/ActionGrid/BtnAbility
@onready var slot_spells = $BottomBar/ActionGrid/BtnSpells

# Data ported directly from your DB / Python models
var active_character = {
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

func _ready():
	refresh_ui()
	log_message("[color=#4b2504]The journey along the Sword Coast begins...[/color]")

func refresh_ui():
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
	slot_spells.visible = active_character["class_name"] in ["Wizard", "Cleric", "Sorcerer", "Warlock", "Bard", "Druid", "Paladin", "Ranger"]

func log_message(msg: String):
	text_combat_log.append_text("\n" + msg)

# UI Action Signals
func _on_btn_attack_pressed():
	log_message("[b]" + active_character["name"] + "[/b] strikes with longsword!")

func _on_btn_ability_pressed():
	log_message("Activated class feature: [color=#8b1e0f]" + active_character["ability"] + "[/color]")

func _on_btn_rest_pressed():
	active_character["current_hp"] = active_character["max_hp"]
	refresh_ui()
	log_message("Party completed a rest. Vitals restored.")
