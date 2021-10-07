FROM strapi/base:14-alpine

# All .ENV variables
ARG DATABASE_CLIENT
ARG DATABASE_NAME
ARG DATABASE_HOST
ARG DATABASE_PORT
ARG DATABASE_USERNAME
ARG DATABASE_PASSWORD

# Asign .ENV variables
ENV PORT=1337
ENV NODE_ENV production
ENV DATABASE_CLIENT=$DATABASE_CLIENT
ENV DATABASE_NAME=$DATABASE_NAME
ENV DATABASE_HOST=$DATABASE_HOST
ENV DATABASE_PORT=$DATABASE_PORT
ENV DATABASE_USERNAME=$DATABASE_USERNAME
ENV DATABASE_PASSWORD=$DATABASE_PASSWORD

# Create app directory
RUN mkdir -p /srv/app
WORKDIR /srv/app

COPY ./package.json ./

RUN yarn install

COPY . .

RUN yarn build

EXPOSE 1337

CMD ["yarn", "start"]