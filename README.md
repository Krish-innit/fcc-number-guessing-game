# fcc-number-guessing-game

A command-line number guessing game built with Bash and PostgreSQL. This project is part of the freeCodeCamp Relational Database curriculum, demonstrating interactive scripting, regex validation, and database state management.

## Features

- **User Persistence**: Automatically detects returning users and tracks their game history.
- **Welcome Messages**: Greets new users uniquely and displays career stats (total games played and best/lowest guess count) for returning players.
- **Input Validation**: Ensures only valid integers count as guesses, gracefully handling alphabetical inputs or symbols without penalizing the player.
- **Updating Leaderboard Stats**: Automatically updates database records upon a successful game completion.

## Database Schema

The project utilizes a PostgreSQL database named `number_guess` with a `users` table structured as follows:

| Column | Type | Description |
| :--- | :--- | :--- |
| `user_id` | `SERIAL` | Primary key, auto-incrementing identifier. |
| `username` | `VARCHAR(22)` | Unique identifier for the player (max 22 characters). |
| `games_played` | `INT` | Total number of games completed (Defaults to `0`). |
| `best_game` | `INT` | The minimum number of guesses taken to win a game (`NULL` initially). |

## How to Set Up and Run

**Pro Tip* : Make sure you are running these commands inside a Linux/Unix **Bash terminal** (or WSL/Git Bash if you are on Windows).

- Step 1: **Log in postgresql**
          psql --username=postgres
- Step 2: **Create database number_guess**
          CREATE DATABASE number_guess; 
- Step 3: **Connect to the database using \c**
          \c number_guess
- Step 4: **Create table as mentioned above**
          CREATE TABLE users(
          user_id SERIAL PRIMARY KEY,
          username VARCHAR(22) UNIQUE NOT NULL,
          games_played INT DEFAULT 0,
          best_game INT
          );
- Step 5: **Give executable permission to .sh file**
          chmod +x number_guess.sh
- Step 6: Run and Ejoy!

