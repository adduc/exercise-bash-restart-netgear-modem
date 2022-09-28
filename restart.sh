#!/bin/bash
##
# Restart modem: Netgear Nighthawk Cable Modem CM1200
##

# Load environment variables
. ".env"

# This modem requires a cookie to be set for all interactions. 
# Fetch and store cookie information to use in subsequent requests.
COOKIES=$(curl "${ROUTER_URL}/" -o /dev/null -s -c -)

# The reboot functionality uses a token to prevent CSRF. We need to
# fetch the modem status page to extract the token.
HTML=$(echo "${COOKIES}" | curl "${ROUTER_URL}/RouterStatus.htm" --basic -u "${ROUTER_CREDENTIALS}" -s -b -)

# Extract the URL (including token) of the reboot action
REBOOT_URL=$(echo "${HTML}" | grep "/goform/RouterStatus?id=" | sed "s/.*'\(.*\)'.*/\1/")

# Request reboot
echo "${COOKIES}" | curl "${ROUTER_URL}${REBOOT_URL}" \
    --basic -u "${ROUTER_CREDENTIALS}" -b - \
    -H 'Content-Type: application/x-www-form-urlencoded' \
    --data-raw 'buttonSelect=2&wantype=dhcp&enable_apmode=0&curlang=English'
