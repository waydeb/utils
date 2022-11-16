inotifywait -q -m -e close_write --format '%w%f' /path/to/where/screenshots/saved | while read FILE; do { curl -s \
--header "Authorization: APIKEY" \
--header "domain: DOMAIN" \
-F file="@$FILE" \
https://api.tixte.com/v1/upload | jq -r '.data.direct_url'} done | while read IURL; do { echo -n "$IURL" | xclip -sel c} done &
