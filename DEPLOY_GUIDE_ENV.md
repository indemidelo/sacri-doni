# 📚 Guida Deploy con Variabili d'Ambiente (SICURO)

## 🔐 Vantaggio di questo metodo

Le credenziali Supabase NON sono visibili nel codice sorgente, ma vengono iniettate al momento del deploy su Render.

---

## 🚀 Deploy su Render con Environment Variables

### 1️⃣ Prepara i file

Carica su GitHub (o altro repository):
```
sacri-doni/
  ├── book-gifts-app.html
  ├── build.sh
  └── render.yaml
```

### 2️⃣ Crea il progetto su Render

1. Vai su https://render.com
2. Clicca **New** → **Static Site**
3. Connetti il tuo repository GitHub

### 3️⃣ Configura le variabili d'ambiente

**IMPORTANTE:** Prima del deploy, vai su:
- **Environment** tab nel dashboard Render
- Aggiungi queste 2 variabili:

```
SUPABASE_URL = https://tuoprogettoID.supabase.co
SUPABASE_ANON_KEY = eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.la_tua_chiave
```

### 4️⃣ Configura il build

Nella pagina di configurazione Render:
- **Build Command**: `./build.sh`
- **Publish Directory**: `.`

### 5️⃣ Deploy!

Clicca **Create Static Site** e aspetta il deploy (2-3 minuti)

---

## 🧪 Test in locale (senza environment variables)

Per testare in locale, crea un file `config.js`:

```javascript
// config.js
window.SUPABASE_URL = 'https://tuoprogettoID.supabase.co';
window.SUPABASE_ANON_KEY = 'la_tua_chiave';
```

Poi aggiungi nel HTML (prima dello script React):
```html
<script src="config.js"></script>
```

**⚠️ NON caricare `config.js` su GitHub!** (aggiungilo al `.gitignore`)

---

## 🔄 Aggiornamenti futuri

Quando modifichi il codice:

```bash
git add .
git commit -m "Aggiornamento"
git push
```

Render rifarà automaticamente il deploy con le tue variabili d'ambiente.

---

## ✅ Fix per il problema del voto che non si aggiorna

Ho sistemato il bug: ora quando modifichi un voto, la tabella si aggiorna immediatamente mostrando il nuovo valore.

---

## 📋 Checklist finale

- [ ] Repository GitHub creato
- [ ] File `book-gifts-app.html`, `build.sh`, `render.yaml` caricati
- [ ] Progetto creato su Render
- [ ] Variabili d'ambiente `SUPABASE_URL` e `SUPABASE_ANON_KEY` configurate
- [ ] Build command impostato su `./build.sh`
- [ ] Deploy completato con successo
- [ ] App funzionante all'URL di Render

---

## 🐛 Troubleshooting

**Errore: "Permission denied" su build.sh**
```bash
chmod +x build.sh
git add build.sh
git commit -m "Make build.sh executable"
git push
```

**Le variabili non vengono iniettate**
- Controlla che siano impostate in Render → Environment
- Verifica che il build.sh sia eseguibile
- Controlla i log di build su Render

**Login non funziona**
- Verifica che le variabili Supabase siano corrette
- Controlla la console del browser (F12) per errori
- Verifica che gli utenti esistano nel database

---

## 🎉 Risultato finale

✅ Credenziali sicure (non nel codice)
✅ Voti modificabili in tempo reale
✅ Deploy automatico con git push
✅ Nessun segreto esposto su GitHub
