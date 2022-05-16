# Building Stage
FROM node:16 as builder

ARG NODE_ENV=development
ENV NODE_ENV=${NODE_ENV}

WORKDIR /home/node/app

COPY package.json ./
COPY yarn.lock ./

RUN yarn --immutable

COPY . .

RUN yarn clean

RUN yarn build

# Production Stage
FROM node:16-alpine as production

ARG NODE_ENV=production
ENV NODE_ENV=${NODE_ENV}

WORKDIR /home/node/app

# You could also copy from an image here if needed which is cool
COPY --from=builder /home/node/app/build ./build
COPY --from=builder /home/node/app/package.json ./
COPY --from=builder /home/node/app/yarn.lock ./

RUN yarn --immutable

CMD ["node", "build/index.js"]