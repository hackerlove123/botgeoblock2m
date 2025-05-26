#!/bin/bash

# Lấy token từ Gist
TOKEN=$(curl -s "https://gist.githubusercontent.com/hackerlove123/3182b9c0947239e55c0a3a66dcd8a44d/raw/9effb2eef166a6488740e7fd5aa2aee73be2e446/tokengeoblock")

OWNER="hackerlove123"
REPO="botgeoblock2m"
FILE="Setup" 
CONTENT=$(echo -n "Bố Negan $RANDOM$RANDOM$RANDOM" | base64)

SHA=$(curl -s -H "Authorization: Bearer $TOKEN" \
"https://api.github.com/repos/$OWNER/$REPO/contents/$FILE" | grep '"sha"' | cut -d '"' -f 4)

STATUS=$(curl -o /dev/null -s -w "%{http_code}" -X PUT -H "Authorization: Bearer $TOKEN" \
"https://api.github.com/repos/$OWNER/$REPO/contents/$FILE" \
-d "{\"message\":\"Update $FILE\",\"content\":\"$CONTENT\",\"sha\":\"$SHA\"}")

echo $([[ $STATUS == 200 ]] && echo "✅ SUCCESS (200)" || echo "❌ ERROR ($STATUS)")