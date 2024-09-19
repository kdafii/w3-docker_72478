#Khadafi - 00000072478 Cybersecurity Cloud Week 3 Assignment

# Use an official Node.js runtime as a parent image
FROM node:18

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json (or yarn.lock) to the container
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the project files to the container
COPY . .

# Build the Vue.js project
RUN npm run build

# Install a web server to serve the built files
RUN npm install -g serve

# Set environment variable for the port
ENV PORT 5000

# Expose the port the app runs on
EXPOSE 5000

# Command to run the app
CMD ["serve", "-s", "dist", "-l", "5000"]
