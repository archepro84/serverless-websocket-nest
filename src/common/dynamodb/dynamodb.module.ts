import { DynamoDBClient } from '@aws-sdk/client-dynamodb';
import { DynamoDBDocument } from '@aws-sdk/lib-dynamodb';
import * as dotenv from 'dotenv';
import { Injectable } from '@nestjs/common';

dotenv.config({
  path: process.env.NODE_ENV === 'development' ? '.env.development' : '.env.product',
});

// Singleton
let cachedClient: DynamoDBModule;

@Injectable()
export class DynamoDBModule {
  private readonly client: DynamoDBClient;
  private readonly ddb: DynamoDBDocument;

  constructor() {
    if (cachedClient) return cachedClient;

    this.client = JSON.parse(process.env.SERVERLESS_OFFLINE)
      ? new DynamoDBClient({
          region: 'localhost',
          endpoint: 'http://localhost:8000',
        })
      : new DynamoDBClient({ region: process.env.REGION });
    this.ddb = DynamoDBDocument.from(this.client);
    cachedClient = this;
  }

  getClient = (): DynamoDBDocument => {
    return this.ddb;
  };
}
