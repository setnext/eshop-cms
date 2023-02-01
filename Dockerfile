FROM node:16-alpine as BUILD_IMAGE
#RUN apt-get update && apt-get install libvips-dev -y
ARG NODE_ENV=production
ENV NODE_ENV=${NODE_ENV}
WORKDIR /opt/
COPY ./package.json ./
ENV PATH /opt/node_modules/ .bin:$PATH
RUN npm install
WORKDIR /opt/app
COPY ./ .
COPY ./public/uploads/ /public/uploads/
COPY ./src/api/ /src/api/
RUN npm run build

# Create new namespace for final Docker Image
FROM node:16-alpine

# Only copy your source code without system file
COPY --from=BUILD_IMAGE /opt /opt

ENV PATH /opt/node_modules/ .bin:$PATH

ARG NODE_ENV=production
ENV NODE_ENV=${NODE_ENV}

WORKDIR /opt/app

EXPOSE 1337

CMD ["npm","run", "develop"]
