# Stage 1: Build stage
FROM node:16-alpine AS build

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

# Stage 2: Runtime stage
FROM build AS runtime

# Set working directory
WORKDIR /app/products

# Copy .env.development to .env (for development purposes)
RUN cp .env.development .env

# Expose port 3000
EXPOSE 3000

# Command to run the application
CMD ["node", "/src/index.js"]
