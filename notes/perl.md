## Remove emojis from file
```bash
  perl -CS -pe 's/(?[ \p{Emoji} - [\001 - \377] ])//g' filename
```
