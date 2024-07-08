# Use Node.js 18 on Alpine Linux as the base image
FROM node:18-alpine

# Set the working directory inside the container
WORKDIR /app/products

# Copy package.json and package-lock.json to the working directory
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install --only=production

# Install nodemon globally (if needed)
RUN npm install --location=global nodemon --save-dev

# Install dotenv package
RUN npm install dotenv

# Copy all other files and directories to the working directory
COPY . .

# Expose port 3000 (assuming your application listens on port 3000)
EXPOSE 3000

# Command to run when the container starts
CMD ["node", "src/index.js"]
