FROM node:alpine

# Install Yarn because the startup script uses `yarn` commands.
RUN npm install --global yarn@1.22.22

WORKDIR /app
COPY . /app

EXPOSE 8080

CMD [ "/bin/sh", "./start-iptv.sh" ]
