ARG CERTBOT_TAG=arm64v8-latest

FROM certbot/certbot:${CERTBOT_TAG}

#COPY . src/certbot-dns-namecheap

#RUN pip install --no-cache-dir --editable src/certbot-dns-namecheap
#RUN pip install certbot-dns-namecheap==1.0.0
RUN pip uninstall -y enum34 && pip install certbot-dns-namecheap
