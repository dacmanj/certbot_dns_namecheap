#!/bin/bash
docker-compose run certbot-dns-namecheap certonly \
  --non-interactive -a dns-namecheap \
  --dns-namecheap-credentials=/namecheap.ini \
  --agree-tos \
  --email "david@dcmanjr.com" \
  -d "baldy.gearstain.com"

docker-compose run openssl pkcs12  -export -out /gearstain.pfx -inkey /etc/letsencrypt/live/baldy.gearstain.com/privkey.pem -in /etc/letsencrypt/live/baldy.gearstain.com/cert.pem -certfile /etc/letsencrypt/live/baldy.gearstain.com/chain.pem
