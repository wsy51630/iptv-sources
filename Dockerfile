FROM node:22-alpine

# Use Corepack's Yarn 1 version; the Node image already provides the Yarn shim.
RUN corepack enable && corepack prepare yarn@1.22.22 --activate

WORKDIR /app

# Install dependencies first so Docker can reuse this layer when source files change.
COPY package.json yarn.lock ./
RUN yarn install --frozen-lockfile

COPY . .

EXPOSE 8080

CMD ["/bin/sh", "./start-iptv.sh"]
