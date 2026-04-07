extends Resource
class_name Status_Buff

enum BuffType {
	MULTIPLY,
	ADD,
}

@export var stat: Stats.BuffableStats
@export var buff_ammount: float
@export var buff_type: BuffType


func _init(_status: Stats.BuffableStats = Stats.BuffableStats.MAX_HEALTH, _buff_ammount: float = 1.0, _buff_type: BuffType = BuffType.MULTIPLY ) -> void:
	stat = _status
	buff_ammount = _buff_ammount
	buff_type = _buff_type
