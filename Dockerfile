# Build phase
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY ./ ./
CMD ["npm", "start"]

# Run phase
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html