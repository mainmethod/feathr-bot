FROM node:18-alpine as build

WORKDIR /app

ARG REACT_APP_API_URL=https://feathr-bot-3giubdgjdq-uc.a.run.app
ENV REACT_APP_API_URL=https://feathr-bot-3giubdgjdq-uc.a.run.app

COPY package*.json ./
RUN npm install

COPY . .
RUN npm run build

FROM nginx:1.25.1-alpine

COPY --from=build /app/build /usr/share/nginx/html
COPY nginx/default.conf /etc/nginx/conf.d/default.conf

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
