/*import express from 'express';
import cors from 'cors';
import requestId from 'express-request-id';
import { ProductAPI } from './api/index.js'
import { LogHandler, ErrorHandler } from './middlewares/index.js';

export function expressApp(app) {

  app.use(requestId());
  app.use(cors())
  app.use(express.json());

  app.get('/', (_req, res, _next) => {
    res.status(200).send({
      message: 'Products service is up and running'
    });
  });

  ProductAPI(app);

  app.use(LogHandler);
  app.use(ErrorHandler);

}*/

import express from 'express';
import cors from 'cors';
import requestId from 'express-request-id';
import { ProductAPI } from './api/index.js';
import { LogHandler, ErrorHandler } from './middlewares/index.js';

export function expressApp() {
  const app = express();

  // Middleware setup
  app.use(requestId());
  app.use(cors({
    origin: 'http://hadiyaapplication001.s3-website.us-east-2.amazonaws.com',
    credentials: true  // Enable credentials if your frontend requires cookies or authorization headers
  }));
  app.use(express.json());

  // Root route
  app.get('/', (_req, res) => {
    res.status(200).send({
      message: 'Products service is up and running'
    });
  });

  // API routes
  ProductAPI(app);

  // Error handling middleware
  app.use(LogHandler);
  app.use(ErrorHandler);

  return app;
}
