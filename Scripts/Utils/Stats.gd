class_name Stats
extends Resource

#region Signals
signal health_depleted
signal health_changed(cur_health: float, max_health: float)
#endregion

#region Enums
enum BuffableStats {
	MAX_HEALTH,
	MAX_STAMINA,
	ATTACK_POWER,
	DEFENSE_POWER
}
#endregion

#region Constants
const BASE_LVL_XP : float = 100
const STAT_CURVES : Dictionary[BuffableStats, Curve] = {
	BuffableStats.MAX_HEALTH: preload("uid://btcc70irkanch"),
	BuffableStats.MAX_STAMINA: preload("uid://byb7b88okcnto"),
	BuffableStats.ATTACK_POWER: preload("uid://co08dn8fipuqi"),
	BuffableStats.DEFENSE_POWER: preload("uid://dl3k6t03fb30h")
}
#endregion

#region Status
@export var base_max_health : float
@export var base_max_stamina: float
@export var base_attack_power : float
@export var base_defense_power : float
@export var experience : float : set = _on_experience_set
#endregion

#region Private Variables
var health : float = 0 : set = _on_health_set
var level : float = 1 : 
	get(): return floor(max(1.0,sqrt(experience / BASE_LVL_XP )+ 0.5))
var current_max_health : float
var current_max_stamina: float
var current_attack_power : float
var current_defense_power : float
var stats_buffs: Array[StatBuff]
#endregion

#region Public Methods
func _init()-> void :
	setup_stats.call_deferred()
	
func setup_stats()->void :
	recalculate_stats()
	health = base_max_health

func add_buff(buff: StatBuff)-> void:
	stats_buffs.append(buff)
	recalculate_stats.call_deferred()

func remove_buff(buff: StatBuff)-> void:
	stats_buffs.erase(buff)
	recalculate_stats.call_deferred()

func recalculate_stats()-> void:

	var stat_multipliers : Dictionary = {}
	var stat_addends : Dictionary = {}

	for buff in stats_buffs:
		var stat_name : String = BuffableStats.keys()[buff.stat].to_lower()
		match buff.buff_type:
			StatBuff.BuffType.ADD:
				if not stat_addends.has(stat_name):
					stat_addends[stat_name] = 0.0
				stat_addends[stat_name] += buff.buff_ammount

			StatBuff.BuffType.MULTIPLY:
				if not stat_multipliers.has(stat_name):
					stat_multipliers[stat_name] = 1.0
				stat_multipliers[stat_name] *= buff.buff_ammount

				if stat_multipliers[stat_name] < 0.0:
					stat_multipliers[stat_name] = 0.0

	var stat_sample_position : float = (float(level) / 100.0) - 0.01
	current_max_health = base_max_health + STAT_CURVES[BuffableStats.MAX_HEALTH].sample(stat_sample_position)
	current_max_stamina = base_max_stamina + STAT_CURVES[BuffableStats.MAX_STAMINA].sample(stat_sample_position)
	current_attack_power = base_attack_power + STAT_CURVES[BuffableStats.ATTACK_POWER].sample(stat_sample_position)
	current_defense_power = base_defense_power + STAT_CURVES[BuffableStats.DEFENSE_POWER].sample(stat_sample_position)

	for stat_name in stat_multipliers:
		var current_property_name : String = str("current_" + stat_name)
		set(current_property_name, get(current_property_name) * stat_multipliers[stat_name])
	for stat_name in stat_addends:
		var current_property_name : String = str("current_" + stat_name)
		set(current_property_name, get(current_property_name) + stat_addends[stat_name])

#endregion	

#region Private Methods
func _on_health_set(new_health_value : float) -> void:
	health = clampf(new_health_value, 0, current_max_health)
	health_changed.emit(health, current_max_health)
	if health <=0:
		health_depleted.emit()

func _on_experience_set(new_experience_value : float) -> void :
	var old_level : float = level
	experience =new_experience_value
	if not old_level == level:
		recalculate_stats()

func _on_level_set(new_level_value : float)-> void:
	level = max(1.0, new_level_value)
	recalculate_stats()

#endregion
