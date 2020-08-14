# Build Phase
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN yarn
COPY . .
RUN yarn build

# Run Phase
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html