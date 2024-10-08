# Use Node 20 as parent image
FROM node:20.11.1

# Change the working directory on the Docker image to /app
WORKDIR /app

# Copy package.json and yarn.lock to the /app directory
COPY package.json yarn.lock ./

# Install yarn globally
RUN npm install -g yarn --force

# Install dependencies
RUN yarn install

# Copy the rest of project files into this image
COPY . .

# Expose application port
EXPOSE 3000

# Build the application
RUN yarn build

# Serve the application
RUN yarn start:prod
