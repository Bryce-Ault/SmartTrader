# SmartTrader

A World of Warcraft addon that automatically blocks incoming trade requests and notifies the other player with a whisper.

## Features

- Automatically enables trade blocking when entering a battleground
- Cancels incoming trade windows and whispers the other player
- Toggle trade blocking on or off at any time with a slash command

## Installation

Copy the `SmartTrader` folder into your `Interface/AddOns` directory.

## Commands

| Command | Description |
|---------|-------------|
| `/st help` | Show available commands |
| `/st trade` | Toggle trade blocking on/off |

## Usage

Trade blocking is **off by default** and **automatically enables when you enter a battleground**. When blocked, incoming trades will be cancelled and the other player receives a whisper: *"I'm not trading right now, thank you."*

You can manually toggle blocking at any time with `/st trade`, including turning it off during a battleground if needed.
