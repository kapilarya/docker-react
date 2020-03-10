FROM node:alpine as builder
WORKDIR '/app'
COPY package.json . 
RUN npm install
COPY . . 
RUN npm run build

# second phase or block
FROM nginx
# copy from other phase 
COPY --from=builder /app/build /usr/share/nginx/html
