# Chess App - Coolify Deployment

This repository is used by Coolify to orchestrate the Chess application using pre-built artifacts.

## How it works

1. Local machine builds the application
2. `deploy-to-coolify.ps1` rsyncs built files to the server
3. Coolify uses this docker-compose.yml to run the pre-built application
4. No building happens on the server - just running containers

## Directory Structure

```
/data/coolify/applications/{app-id}/
├── source/                 # This Git repo (docker-compose.yml)
└── builds/                 # Pre-built files from rsync
    ├── app-dist/          # Next.js standalone build
    └── ws-dist/           # WebSocket server files
```

## Deployment

Run from your local machine:
```powershell
.\deploy-to-coolify.ps1
```

## Environment Variables

Configure in Coolify's UI:
- `NEXTAUTH_URL`
- `NEXTAUTH_SECRET`
- `DATABASE_URL`
- `GOOGLE_CLIENT_ID`
- `GOOGLE_CLIENT_SECRET`
- `REDIS_PASSWORD`
- `NEXT_PUBLIC_WEBSOCKET_URL`