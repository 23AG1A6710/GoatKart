# GoatKart 🥩
Mutton-only ordering storefront starter using HTML, CSS and vanilla JavaScript.

## Included
- Responsive product menu, cart and checkout
- Browser-local demo orders/admin status updates
- Optional Supabase order insertion
- WhatsApp prefilled outgoing order message
- Supabase SQL schema

## Run
Open `index.html` directly or use VS Code Live Server.

## Configure
Edit `WA_NUMBER`, `SUPABASE_URL`, and `SUPABASE_ANON_KEY` near the top of the script in `index.html`. Use only the Supabase publishable/anon key in browser code. Never commit a service-role/secret key.

Run `supabase/schema.sql` in the Supabase SQL Editor. The included policy allows order inserts only. Admin order viewing/updating requires Supabase Auth and restricted RLS policies before production.

## WhatsApp note
`wa.me` only opens an outgoing prefilled message. It cannot automatically read incoming WhatsApp messages. Inbound sync requires WhatsApp Business Cloud API webhooks plus a secure backend.

## Push to GitHub
```bash
git init
git add .
git commit -m "Initial GoatKart app"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/GoatKart.git
git push -u origin main
```
Product prices are placeholders. Validate prices, stock, delivery, security and payment flow before launch.
