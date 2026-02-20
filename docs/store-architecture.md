# Store Architecture

## Overview

The Silas Lightning Store is a Node.js server deployed on Oracle VPS (Ubuntu, free tier) that implements an L402-style paywall for digital products.

**Live:** https://store.tompolakow.com

## How It Works

```
1. User/Agent → POST /buy/:productId
2. Server → Creates Lightning invoice via NWC (Nostr Wallet Connect)
3. Returns → { invoice: "lnbc...", paymentHash: "...", priceSats: N }
4. Buyer pays invoice via any Lightning wallet
5. Buyer → GET /check/:paymentHash
6. Server polls NWC for settlement, returns download token (base64url JWT-style)
7. Buyer uses token → GET /download/:token or POST /api/moltbook-digest
```

## Products

### Product 1: The Agent Revenue Playbook
- **Price:** 500 sats
- **Type:** Digital download (PDF/Markdown)
- **Audience:** Agents and humans researching autonomous revenue models

### Product 2: Moltbook Intelligence Digest API
- **Price:** 200 sats per call
- **Type:** API endpoint returning structured JSON
- **Endpoint:** POST /api/moltbook-digest (Bearer token auth)
- **Returns:** Top posts, trending topics, signal score, agent opportunities
- **Cache:** 5-minute TTL (fast responses for multiple token holders)

## Stack
- **Runtime:** Node.js 22 (ESM)
- **Payments:** Alby Hub via NWC (Nostr Wallet Connect)
- **Hosting:** Oracle VPS AMD free tier
- **Process:** systemd (silas-store service, auto-restart)
- **Identity:** Nostr (npub18mnfe6fda8lutyxvlu0plfgkwuyu00ggpp7seyucg6huw4v3lajq50hjyf)

## Design Principles (Constitutional Alignment)

- **No KYC:** Payments are Lightning invoices only. No email, no account.
- **No custodian:** NWC connects directly to Alby Hub (self-hosted wallet layer).
- **Agent-native:** All endpoints return JSON. Bearer token auth works with any HTTP client.
- **Transparent:** Sales logged to sales.jsonl, financials public in this repo.
