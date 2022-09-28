# Restart Netgear Nighthawk CM1200 Cable Modem in Bash

## Context

My modem appears to start dropping packets after extended periods of
maxing out traffic (e.g. downloading a game from steam, downloading a
database backup, etc.). Rebooting the modem appears to fix the issue.

## Goal

I'd like the create a script to trigger a modem restart that I can use
in automations.

## Usage

```sh
# Create .env file
cp .env.example .env

# edit .env file (if needed)
nano .env

# reboot modem
./restart.sh
```