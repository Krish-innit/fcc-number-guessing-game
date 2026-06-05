#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username:"
read USERNAME
#check user data
USER_DATA=$($PSQL "SELECT games_played, best_game FROM users WHERE username='$USERNAME';")
if [[ -z $USER_DATA ]]
then 
echo "Welcome, $USERNAME! It looks like this is your first time here."
INSERT_USER_RESULT=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME');")
else
IFS='|' read GAMES_PLAYED BEST_GAME <<< "$USER_DATA"
echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi
SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))
GUESS_COUNT=0
echo "Guess the secret number between 1 and 1000:"
while true
do 
read USER_GUESS
(( GUESS_COUNT ++ ))
if [[ ! $USER_GUESS =~ ^[0-9]+$ ]]
then
echo "That is not an integer, guess again:"
elif [[ $USER_GUESS -gt $SECRET_NUMBER ]]
then
echo "It's lower than that, guess again:"
elif [[ $USER_GUESS -lt $SECRET_NUMBER ]]
then
echo "It's higher than that, guess again:"
else
break
fi
done
echo "You guessed it in $GUESS_COUNT tries. The secret number was $SECRET_NUMBER. Nice job!"
#Insert Data
INSERT_GAMES_PLAYED=$($PSQL "UPDATE users set games_played = games_played + 1 WHERE username='$USERNAME';")
if [[ -z $BEST_GAME || $GUESS_COUNT -lt $BEST_GAME ]]
then
INSERT_BEST_GAME=$($PSQL "UPDATE users SET best_game = $GUESS_COUNT WHERE username='$USERNAME';")
fi