FROM node:alpine as builder
WORKDIR '/app'
COPY package.json . 
RUN npm install
COPY . . 
RUN npm run build

# second phase or block
FROM nginx
EXPOSE 80
# copy from other phase 
COPY --from=builder /app/build /usr/share/nginx/html
