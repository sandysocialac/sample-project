FROM node:14
# Setting working directory. All the path will be relative to WORKDIR
WORKDIR /usr/src/app
# Installing dependencies
ARG NPM_TOKEN

COPY .npmrc .npmrc  
COPY package.json package.json  
RUN npm install  
RUN rm -rf .npmrc

# Copying source files
COPY . .
# Building app
RUN npm run build
EXPOSE 80
# Running the app
CMD [ "npm", "start" ]