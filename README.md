# website

# Install
Install the project dependencies.
    npm install

# How to run
Currently the dependencies are too large to containerize. Mainly due to slow application bundling.

To get around this, the project needs to built first by running

ng build --prod

Once this is complete, containerize the app

docker build -t website-image .

Push the image to your registry

docker push registry/image

Deploying helm charts

helm upgrade -i website ./helm --set app.host=DOMAIN.COM

