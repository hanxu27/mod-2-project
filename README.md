# Volleyball Tryout Manger

Allows players to signup and then register for tryouts.
Allows coaches to evaluate players at tryouts and compare players across age group.
Allows coaches to add selected players onto teams.

# Datebase
#### Classes
#### Player
Holds player contact information
* Name
* Birthday
* Height
* hand hitting
* school
* Position 1
* Position 2
* Parent Name
* Parent Number
* Parent Address
* Playing Experience (40 word max)
* Additional Comments (50 word max)
* Upload Headshot (bonus)
#### PreTryout
* Tryout Number
* Forms (bonus)
* Paid
* Forms completed
* Age Group (dropdown)
* Reach
* Approach Jump
* Block Jump
* 3 point touch
* 30 feet dash
* belongs to a player
#### EvalTryout
* Coachability
* Athleticism
* Serve
* Serve Receive
* Passing
* Setting
* Hitting
* Communication
* Volleyball IQ
* Team (dropdown)
* Comments (text area)
#### Evaluate
* Make evalution
* Only 1 evaluation between a player and evaluator
* Look up a Player/PreTryout by number
* Add player name, age, all player within an age group to a waiting to evaluated list 
* List who I evaluated
* Take off players that I have evaluated from list
#### Decide
* order players by rating for each age group
* compare players
* look up player
* put player onto team
* shovel players into teams
* make teams
#### Teams
* player in teams as array or as a join team
