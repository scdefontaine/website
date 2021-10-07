# STEP 1 build static website
# FROM redhat/ubi8 as builder
# RUN apk update && apk add --no-cache make git

# Create app directory
# WORKDIR /app

# Install app dependencies
# COPY package.json package-lock.json  /app/
# RUN cd /app && npm set progress=false && npm install

# Copy project files into the docker image
# COPY . /app
# RUN cd /app && npm run build

# STEP 2 build a small nginx image with static website
FROM nginx:alpine

## Remove default nginx website
# RUN rm -rf /usr/share/nginx/html/*

## From 'builder' copy website to default nginx public folder
# COPY --from=builder /app/dist/notus-angular /usr/share/nginx/html
COPY ./dist/notus-angular /usr/share/nginx/html
COPY ./helm/files/nginx.conf /etc/nginx/conf.d/
# EXPOSE 80
# CMD ["nginx", "-g", "daemon off;"]