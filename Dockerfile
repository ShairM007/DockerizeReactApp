# Use the official Node.js image with the desired version
FROM node:13-alpine

# Set the working directory inside the container
WORKDIR /home/react-app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Expose the port your app runs on
EXPOSE 3000

# Command to run your app (assuming you're using Vite for development)
CMD ["npm", "run", "dev"]


