extends CanvasLayer

# colors
var green: Color = Color('6bbfa3')
var red: Color = Color(0.9,0,0,1)

@onready var laser_label: Label = $AmmoCounter/VBoxContainer/Label
@onready var grenade_label: Label = $AmmoCounter2/VBoxContainer2/Label
@onready var laser_icon: TextureRect = $AmmoCounter/VBoxContainer/TextureRect
@onready var grenade_icon: TextureRect = $AmmoCounter2/VBoxContainer2/TextureRect

func _ready():
	update_laser_text()
	update_grenade_text()

func update_laser_text():
	laser_label.text = str(Globals.laser_ammo)
	update_color(Globals.laser_ammo,laser_label,laser_icon)

func update_grenade_text():
	grenade_label.text = str(Globals.grenade_ammo)
	update_color(Globals.grenade_ammo,grenade_label,grenade_icon)
		
func update_color(amount: int, label: Label, icon: TextureRect) -> void:
	if amount:
		label.modulate = green
		icon.modulate = green
	else:
		label.modulate = red
		icon.modulate = red
		
