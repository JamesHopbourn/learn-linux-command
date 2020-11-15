#### GitHub curl API
```
curl https://api.github.com/repos/JamesHopbourn/shortcuts-with-travis/contents/shortcuts.txt|jq .sha|sed 's/"//g'|pbcopy

curl -u "JamesHopbourn:token" -X PUT 'https://api.github.com/repos/JamesHopbourn/shortcuts-with-travis/contents/shortcuts.txt' -d '{"message": "update file & commit form curl",  "committer": {"name": "James Hopbourn", "email": "jameshopbourn@gmail.com" }, "content": "dGhpcyBpcyBhIHRlc3QK", "sha": "0c4097d5fec9b84b42361b0f1e0246b20f53deda"'
```