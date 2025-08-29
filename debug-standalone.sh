#!/bin/sh
# Debug script to check what's in the mounted volume

echo "=== Checking /app directory ==="
ls -la /app

echo ""
echo "=== Checking for server.js ==="
if [ -f /app/server.js ]; then
    echo "✓ server.js exists"
    echo "First 20 lines of server.js:"
    head -20 /app/server.js
else
    echo "✗ server.js NOT FOUND!"
fi

echo ""
echo "=== Checking .next directory ==="
if [ -d /app/.next ]; then
    echo "✓ .next directory exists"
    ls -la /app/.next | head -10
else
    echo "✗ .next directory NOT FOUND!"
fi

echo ""
echo "=== Checking node_modules ==="
if [ -d /app/node_modules ]; then
    echo "✓ node_modules exists"
    echo "Number of packages: $(ls /app/node_modules | wc -l)"
else
    echo "✗ node_modules NOT FOUND!"
fi

echo ""
echo "=== Checking package.json ==="
if [ -f /app/package.json ]; then
    echo "✓ package.json exists"
    echo "Scripts section:"
    grep -A10 '"scripts"' /app/package.json
else
    echo "✗ package.json NOT FOUND!"
fi

echo ""
echo "=== Attempting to run server.js ==="
if [ -f /app/server.js ]; then
    echo "Starting standalone server..."
    node /app/server.js
else
    echo "Cannot run server.js - file not found!"
    echo "Files in /app:"
    ls -la /app
fi