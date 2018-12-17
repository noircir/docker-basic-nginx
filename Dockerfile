# Build phase
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY ./ ./
CMD ["npm", "start"]

# Run phase
FROM nginx
# Explicitly instruct to expose port for AWS
EXPOSE 80   
COPY --from=builder /app/build /usr/share/nginx/html