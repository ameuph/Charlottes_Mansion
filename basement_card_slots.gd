extends Node2D 

var next_scene = "res://node_2d.tscn"
var basement_scene = "res://basement.tscn"
@onready var diamond_card: Sprite2D = $AceOfDiamonds
@onready var club_card: Sprite2D = $AceOfClubs
@onready var label: Label = $Label
@onready var label2: Label = $Label2
@onready var label3: Label = $Label3

func _ready():
	diamond_card.visible = false
	club_card.visible = false
	label.visible = true
	label2.visible = true
	label3.visible = false
	
func _process(_delta):
	if Input.is_action_just_pressed("click or drag"):
		if GameState.has_diamond and not GameState.has_clubs:
			GlobalHotbar.item_used("Diamond Card")
			GameState.diamond_card = true
		
		elif GameState.has_clubs:
			GlobalHotbar.item_used("Club Card")
			GameState.club_card = true
		
	if GameState.diamond_card:
		diamond_card.visible = true
		
	if GameState.club_card:
		club_card.visible = true
		label.visible = false
		label2.visible = false
		label3.visible = true

	if Input.is_action_just_pressed("interact"):
		get_tree().change_scene_to_file(next_scene)
