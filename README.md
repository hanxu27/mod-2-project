# Volleyball Tryout Manger

Player Section: Allows players to signup and then register for tryouts.

Coach Section: Allows coaches to evaluate players at tryouts and compare players across age group.
Allows coaches to add selected players onto teams.

# Datebase
#### Classes
#### Player
Holds player contact information
* Name
* Birthday
* Height
* hand hitting :dropdown
* School
* Position 1 :dropdown
* Position 2 :dropdown
* Parent Name
* Parent Number
* Parent Address
* Playing Experience (40 word max)
* Additional Comments (50 word max)
* Upload Headshot (bonus)
* belongs_to team (optional)
#### Tryout
Signs player up for trying out
* Tryout Number
* Forms completed :boolean
* Paid :boolean
* Forms completed
* Age Group (dropdown)
* Reach
* Approach Jump
* Block Jump
* 3 point touch
* 30 feet dash
* belongs to a player
#### Evaluation
Tracking player rating during tryouts
* Coachability (1-10)
* Athleticism (1-10)
* Serve (1-10)
* Serve Receive (1-10)
* Passing (1-10)
* Setting (1-10)
* Hitting (1-10)
* Communication (1-10)
* Volleyball IQ (1-10)
* Team (dropdown)
* Comments (text area)
* flag (for adding to 'favoriate list')
#### Coach
Make evaluations and look up pretryout and player info
* Make evalution
* Only 1 evaluation between a player and evaluator
* Look up a Player/PreTryout by number
* Add player name, age, all player within an age group to a waiting to evaluated list 
* List who I evaluated
* Take off players that I have evaluated from list
#### Admin
Put players into team. Look at ratings, data analysis
* order players by rating for each age group
* compare players
* look up player
* put player onto team
* shovel players into teams
Admin functions
* make teams
* clear out teams
* make new tryouts, inheret from PreTryout
#### Teams
* has many players
