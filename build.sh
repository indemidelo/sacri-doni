#!/bin/bash

# Script di build per Render
# Sostituisce i placeholder con le variabili d'ambiente

echo "Building app with environment variables..."

# Crea index.html dal template
cp book-gifts-app.html index.html

# Sostituisci i placeholder con le variabili d'ambiente
if [ ! -z "$SUPABASE_URL" ] && [ ! -z "$SUPABASE_ANON_KEY" ]; then
    # Usa sed per sostituire i placeholder
    sed -i "s|window.SUPABASE_URL \|\| 'YOUR_SUPABASE_URL'|'$SUPABASE_URL'|g" index.html
    sed -i "s|window.SUPABASE_ANON_KEY \|\| 'YOUR_SUPABASE_ANON_KEY'|'$SUPABASE_ANON_KEY'|g" index.html
    echo "✅ Environment variables injected successfully"
else
    echo "⚠️  Warning: SUPABASE_URL or SUPABASE_ANON_KEY not set"
fi

echo "Build complete!"
