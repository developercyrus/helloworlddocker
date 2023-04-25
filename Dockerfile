# from official image
FROM ubuntu:latest

# install package
RUN apt-get update
RUN apt-get install -y curl sudo
RUN curl -sL https://deb.nodesource.com/setup_18.x | sudo -E bash -
RUN apt-get install -y nodejs

# set working directory to /app
WORKDIR /app

# copy index.js from current directory into the container at /app
COPY . /app

# install need packages specified in package.json
RUN npm install

# expose port 3000 for acessing the app
EXPOSE 3000

# run app when container launches
CMD ["node", "app.js"]
