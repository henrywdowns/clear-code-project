extends Node
 
signal stat_change

var laser_ammo = 20:
	set(value):
		laser_ammo = value
		stat_change.emit()
		
var grenade_ammo = 5:
	set(value):
		grenade_ammo = value
		stat_change.emit()
		
var max_health = 100
var health = 60:
	set(value):
		if value > 100:
			health = 100
		else:
			health = value
		stat_change.emit()
