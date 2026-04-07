extends Resource
class_name StatBuff

enum BuffType {
	MULTIPLY,
	ADD,
}

@export var stat: Stats.BuffableStats
@export var buff_ammount: float
@export var buff_type: BuffType


func _init(_stats: Stats.BuffableStats = Stats.BuffableStats.MAX_HEALTH, _buff_ammount: float = 1.0, _buff_type: BuffType = BuffType.MULTIPLY ) -> void:
	stat = _stats
	buff_ammount = _buff_ammount
	buff_type = _buff_type