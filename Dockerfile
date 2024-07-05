# Use Node.js 16 Alpine as base image
FROM node:16-alpine

# Set working directory
WORKDIR /app/products

# Copy package files
COPY package.json package-lock.json ./

# Install nodemon globally
RUN npm install --global nodemon --save-dev

# Install dependencies
RUN npm install

# Copy other application files and directories
COPY . .

# Expose port 3000
EXPOSE 3000

# Command to run the application
CMD ["node", "/src/index.js"]
