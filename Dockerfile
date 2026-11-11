FROM node:22-alpine

# Install the Yarn version used by this project.
RUN npm install --global yarn@1.22.22

WORKDIR /app

# Install dependencies first so Docker can reuse this layer when source files change.
COPY package.json yarn.lock ./
RUN yarn install --frozen-lockfile

COPY . .

EXPOSE 8080

CMD ["/bin/sh", "./start-iptv.sh"]
