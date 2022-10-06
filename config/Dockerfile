FROM node:16
RUN apt-get update && apt-get install libvips-dev -y
ARG NODE_ENV=production
ENV NODE_ENV=${NODE_ENV}
WORKDIR /opt/
COPY ./package.json
ENV PATH /opt/node_modules/ .bin:$PATH
RUN npm install
WORKDIR /opt/app
COPY ./seed/api/ /opt/app/api/
COPY ./seed/uploads/ /opt/public/uploads/
COPY ./ .
RUN npm build
EXPOSE 1337
CMD ["npm", "start"]