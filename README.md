# SmartTrader

A World of Warcraft addon that automatically manages the in-game Block Trades setting based on your current instance.

## Features

- Automatically enables Block Trades when entering a battleground
- Automatically disables Block Trades when leaving a battleground
- Does not activate in arenas — only battlegrounds
- Toggle trade blocking manually at any time with a slash command

## Installation

Copy the `SmartTrader` folder into your `Interface/AddOns` directory.

## Commands

| Command | Description |
|---------|-------------|
| `/st help` | Show available commands |
| `/st trade` | Toggle trade blocking on/off |

## Usage

Trade blocking is managed through the game's built-in Block Trades setting. SmartTrader **automatically enables** it when you enter a battleground and **automatically disables** it when you leave. Arenas are excluded.

You can manually toggle blocking at any time with `/st trade`.
