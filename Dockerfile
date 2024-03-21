# Use the official Node.js image with the desired version
# FROM node:13-alpine

# Set the working directory inside the container
# WORKDIR /home/react-app

# Copy package.json and package-lock.json to the working directory
# COPY package*.json ./

# Install dependencies
# RUN npm install

# Copy the rest of the application code
# COPY . .

# Expose the port your app runs on
# EXPOSE 3000

# Command to run your app (assuming you're using Vite for development)
# CMD ["npm", "run", "dev"]


# Use the official Node.js image with the desired version
FROM node:13-alpine AS build

# Set the working directory inside the container
WORKDIR /home/react-app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install --production

# Copy the rest of the application code
COPY . .

# Build the React application for production
RUN npm run build

# Stage 2: Serve the built assets using `serve`
FROM node:13-alpine

# Install `serve` globally to serve the built assets
RUN npm install -g serve

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy the built assets from the previous stage
COPY --from=build /home/react-app/build .

# Expose the port to serve the application
EXPOSE 3000

# Command to serve the application using `serve`
CMD ["serve", "-s", "-l", "3000", "."]



