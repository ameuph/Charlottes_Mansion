extends Area2D

@onready var player = null  
@onready var hotbar = get_node("/root/living_room/UI/Hotbar")  
@onready var gamestate = get_node("/root/GameState")

# Function called when the scene is ready
func _ready():
	$Label.visible = false
	var grandparent = get_parent().get_parent()
	player = grandparent.get_node("Alex")
	
	if GameState.has_book:
		queue_free()

# Function called when something enters the area (the player)
func _on_body_entered(body: Node2D) -> void:
	if body.name == "Alex" and GameState.diamond_card: 
		$Label.visible = true 

# Function called when something exits the area (the player)
func _on_body_exited(body: Node2D) -> void:
		if body.name == "Alex": 
			$Label.visible = false  # Make the label invisible when the player leaves

# Function to process player input (e.g., picking up the book)
func _process(_delta):
	if Input.is_action_just_pressed("interact"):  
		if $Label.visible:  
			pick_up_book()

# Function to handle the book being picked up
func pick_up_book():
	if not gamestate.has_book:
		GlobalHotbar.add_item_to_slot("Book", preload("res://assets/puzzle_objects/fire_book.png"))
		GameState.d_fire_book = true
		GameState.spawn_2_enem = true
		#gamestate.books_picked_up[name] = true	
		gamestate.has_book = true
		queue_free() 
