FROM node:16

WORKDIR /app
COPY package*.json ./
RUN npm ci

WORKDIR /app/example
COPY example/package.json ./
RUN npm install

WORKDIR /app
COPY . .
RUN npm run build

WORKDIR /app/example
#RUN npm run build
EXPOSE 3000
#CMD [ "npm", "run", "start" ]
ENTRYPOINT npm run start