#!/bin/bash

# Script di build per Render
# Sostituisce i placeholder con le variabili d'ambiente

echo "🔧 Building app with environment variables..."

# Crea index.html dal template
cp book-gifts-app.html index.html

# Verifica che le variabili d'ambiente siano impostate
if [ -z "$SUPABASE_URL" ]; then
    echo "❌ ERROR: SUPABASE_URL is not set!"
    echo "Please set it in Render Dashboard → Environment"
    exit 1
fi

if [ -z "$SUPABASE_ANON_KEY" ]; then
    echo "❌ ERROR: SUPABASE_ANON_KEY is not set!"
    echo "Please set it in Render Dashboard → Environment"
    exit 1
fi

echo "✅ Environment variables found"
echo "   SUPABASE_URL: ${SUPABASE_URL:0:30}..."
echo "   SUPABASE_ANON_KEY: ${SUPABASE_ANON_KEY:0:30}..."

# Sostituisci i placeholder con le variabili d'ambiente
sed -i "s|window.SUPABASE_URL \|\| 'YOUR_SUPABASE_URL'|'$SUPABASE_URL'|g" index.html
sed -i "s|window.SUPABASE_ANON_KEY \|\| 'YOUR_SUPABASE_ANON_KEY'|'$SUPABASE_ANON_KEY'|g" index.html

echo "✅ Environment variables injected successfully"
echo "🎉 Build complete!"
