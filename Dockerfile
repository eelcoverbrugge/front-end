FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# output of the code above is in /app/build

FROM nginx
# copy the output from the builder fase above
COPY --from=builder /app/build /usr/share/nginx/html