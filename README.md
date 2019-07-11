# rest-rtt
Simple rest api for getting rtt to remote IP address

## Example
for get rtt from the rest-rtt host (rest-rtt.contaner) to the remote IP (8.8.8.8), just send:
```
curl -X GET -H "X-RTT-IP: 8.8.8.8" http://rest-rtt.contaner/ping
```

