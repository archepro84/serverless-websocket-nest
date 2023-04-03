import { NestFactory } from '@nestjs/core';
import { APIGatewayEvent, Callback, Context, Handler } from 'aws-lambda';
import { configure as serverlessExpress } from '@vendia/serverless-express';
import { AppModule } from '../app.module';
import { INestApplication } from '@nestjs/common';

let cachedServer: Handler;

async function lambdaBootstrap(): Promise<Handler> {
  const nestApp: INestApplication = await NestFactory.create(AppModule);

  // Nest.js의 Application을 초기화
  await nestApp.init();
  await nestApp.enableCors();

  const expressApp = nestApp.getHttpAdapter().getInstance();
  return serverlessExpress({ app: expressApp });
}

export async function handler(
  event: APIGatewayEvent,
  context: Context,
  callback: Callback,
) {
  cachedServer = cachedServer ?? (await lambdaBootstrap());

  if (event.path === '') {
    event.path = '/';
    event.requestContext.path = '/';
  }
  console.log(event);

  return cachedServer(event, context, callback);
}
