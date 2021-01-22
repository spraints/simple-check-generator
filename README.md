# simple-check-generator

> A GitHub App built with [Probot](https://github.com/probot/probot) to debug something

## Setup

Create a GitHub app. Copy `.env.example` to `.env` and fill in the details.

```sh
# Install dependencies
npm install

# Check for errors
npm run-script build

# Run the bot
npm start
```

## Docker

```sh
# 1. Build container
docker build -t simple-check-generator .

# 2. Start container
docker run -e APP_ID=<app-id> -e PRIVATE_KEY=<pem-value> simple-check-generator
```

## License

[ISC](LICENSE) © 2021 Matt Burke <spraints@gmail.com>
