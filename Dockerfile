FROM node:lts-alpine

WORKDIR /app

COPY package.json ./
COPY pnpm-workspace.yaml ./
COPY pnpm-lock.yaml ./
COPY packages/prisma ./packages/prisma
COPY packages/typescript-config ./packages/typescript-config
COPY packages/eslint-config ./packages/eslint-config


RUN npm install -g pnpm
RUN pnpm install    

COPY . .

ARG DATABASE_URL
ENV DATABASE_URL=$DATABASE_URL

RUN cd packages/prisma && pnpm prisma generate

EXPOSE 3000
CMD [ "pnpm", "dev" ]