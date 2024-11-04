extends Node

var player_health = 9
var current_health = 9
var books_picked_up: Dictionary = {}

#ace of diamonds variables
var has_teacup: bool = false
var has_water: bool = false
var got_code: bool = false
var sink_interacted: bool = false
var vanity_interacted: bool = false
var jewelry_box_open: bool = false
var code: String = "4710" 
var has_diamond: bool = false 

var has_bottle: bool = false
var has_recipe_book: bool = false
var has_book: bool = false
var book_used_in_fireplace: bool = false
var has_clover: bool = false

#basement door variables
var diamond_card: bool = false
# Function to decrease health
func decrease_health(amount):
	player_health -= amount
	player_health = max(player_health, 0)

#steps for ace of diamonds puzzle
func _on_teacup_picked_up():
	grab_teacup()

func grab_teacup():
	if not has_teacup:
		has_teacup = true
		print("You grabbed the teacup.")
		
func _on_filled_cup_picked_up():
	fill_teacup()

func fill_teacup():
	if has_teacup and not has_water:
		has_water = true
		print("You filled the teacup with water.")

func throw_water_on_mirror():
	if has_water and not got_code:
		got_code = true
		print("You threw water on the vanity mirror. It got foggy.")
		# Show code somehow, e.g., via UI
		show_code_to_player(code)

func show_code_to_player(code: String):
	print("The code is: " + code)

#steps for ace of clubs puzzle
func reset_books():
	books_picked_up.clear()
	
func _on_book_picked_up():
	grab_book()

func grab_book():
	if not has_book:
		has_book=true
		print("You grabbed the book")
		
func _on_book_thrown():
	if has_book and not book_used_in_fireplace:
		book_used_in_fireplace = true
		has_book = false  
		has_clover=true
		print("The book was thrown into the fireplace.")
		
#steps for ace of hearts puzzle
func _on_recipe_book_picked_up():
	grab_recipe_book()
	
func grab_recipe_book():
	if not has_recipe_book:
		has_recipe_book = true
		print("You grabbed the recipe book.")
		
#steps for ace of spades puzzle
func _on_bottle_picked_up():
	grab_bottle()
	
func grab_bottle():
	if not has_bottle:
		has_bottle = true
		print("You grabbed the bottle.")
