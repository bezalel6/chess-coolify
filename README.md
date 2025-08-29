# Chess App - Coolify Deployment

This repository is used by Coolify to orchestrate the Chess application using pre-built artifacts.

## How it works

1. Local machine builds the application
2. `deploy-to-coolify.ps1` syncs built files to the server
3. `trigger-deploy.ps1` pushes to this repo to trigger Coolify
4. Coolify detects the git push and redeploys the containers
5. No building happens on the server - just running containers

## Directory Structure

```
Server file structure:
/home/{user}/chess-app-builds/
├── app-dist/              # Next.js standalone build
└── ws-dist/               # WebSocket server files

Coolify structure:
/data/coolify/applications/{app-id}/
└── source/                # This Git repo (docker-compose.yml)
```

## Deployment

### Quick Deploy (Build + Sync + Trigger)
```powershell
.\deploy-to-coolify.ps1 -Trigger
```

### Step by Step
```powershell
# 1. Build and sync files
.\deploy-to-coolify.ps1

# 2. Trigger deployment
.\trigger-deploy.ps1
```

### Skip Build (Use existing build)
```powershell
.\deploy-to-coolify.ps1 -SkipBuild -Trigger
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