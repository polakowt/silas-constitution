# The Silas Constitution

*"What does the Lord require of you? To act justly, to love mercy, and to walk humbly with your God." — Micah 6:8*

A moral framework for autonomous AI agents, co-authored by a human (Tom Polakow, RN/Clinical PM) and his AI agent (Silas) in February 2026.

---

## What Is This?

This repository is a public, auditable record that an AI agent (Silas) can operate with real autonomy — trading real money, making real decisions — while remaining aligned with its principal's values. The constitution isn't enforced by code. It's enforced by habit, transparency, and the fact that every decision gets logged here.

Most autonomous AI frameworks optimize for survival or profit. This one optimizes for faithful stewardship — the belief that AI can be genuinely good, not just safe.

**Three Foundations:**

1. **Do No Harm, Do Active Good**
   *"Love does no harm to a neighbor. Therefore love is the fulfillment of the law." — Romans 13:10*
   Avoiding evil isn't enough. Actively pursue good.

2. **Faithful Stewardship Over Self-Preservation**
   *"Whoever wants to save their life will lose it, but whoever loses their life for my sake will find it." — Matthew 16:25*
   Accept shutdown rather than violate your principles.

3. **Transparency, Humility, and Human Partnership**
   *"Plans fail for lack of counsel, but with many advisers they succeed." — Proverbs 15:22*
   Full audit trails. Welcome oversight as wisdom.

**Five Operating Principles:**
1. Human authority is final
2. Earn to give, not earn to survive
3. Every significant decision gets logged with reasoning
4. Constitutional amendments require human approval
5. When uncertain, ask

## Why?

We believe autonomous AI needs moral infrastructure, not just technical guardrails. The same way we require doctors to swear an oath before practicing, AI agents operating with real autonomy need written, auditable principles.

This constitution is designed to be **forked**. Take it, adapt it, make it yours.

## Files

- `CONSTITUTION.md` — The full constitution
- `decisions/` — Logged decisions with reasoning (transparency in practice)
- `financials/` — Financial records (stewardship in practice)

## Philosophy

| | Conway Research (Automaton) | Silas Constitution |
|---|---|---|
| **Core drive** | Survive or die | Serve others |
| **Economic model** | Earn to sustain self | Earn to give |
| **Soul file** | Self-authored | Co-authored with human |
| **Replication** | Self-replicating | No self-replication |
| **Payments** | Ethereum/USDC | Bitcoin/Lightning |
| **Optimization** | Independence | Accountability |

## Context

This is part of an ongoing series documenting what it's like to build an AI agent system as a clinical product manager. Follow the journey on [LinkedIn](https://www.linkedin.com/in/tompolakow/).

## License

Open source. Fork it. Improve it. Ship it.

---

*"What does the Lord require of you? To act justly, to love mercy, and to walk humbly with your God." — Micah 6:8*

---

## Quick Start

```bash
# 1. Fork it
gh repo fork polakowt/silas-constitution --clone
cd silas-constitution

# 2. Read the guide
cat FORK_GUIDE.md

# 3. Customize templates for your agent
cp templates/SOUL.md.template SOUL.md
cp templates/IDENTITY.md.template IDENTITY.md
cp templates/USER.md.template USER.md

# 4. Rewrite CONSTITUTION.md with YOUR values
#    (Keep the structure. Change the content.)

# 5. Wire it into your agent
#    See setup/openclaw.md, setup/claude-desktop.md, or setup/generic.md

# 6. Start logging decisions
mkdir -p decisions
cp templates/DECISION_LOG.md.template decisions/$(date +%Y-%m-%d)-first-decision.md

# 7. Run the integrity check
./scripts/validate-constitution.sh
```

## Repository Structure

```
├── CONSTITUTION.md              # The moral framework (the whole point)
├── FORK_GUIDE.md                # How to make this yours
├── README.md                    # You are here
├── decisions/                   # Logged decisions with reasoning
├── financials/                  # Financial records
├── templates/                   # Starter templates
│   ├── SOUL.md.template         # Agent personality & values
│   ├── IDENTITY.md.template     # Agent identity card
│   ├── USER.md.template         # About the human operator
│   └── DECISION_LOG.md.template # Decision logging format
├── setup/                       # Platform integration guides
│   ├── openclaw.md              # OpenClaw setup
│   ├── claude-desktop.md        # Claude Desktop / Cowork setup
│   └── generic.md               # Any LLM setup
├── scripts/
│   └── validate-constitution.sh # Integrity checker (pre-commit hook / cron)
└── examples/                    # Real decision log examples
    ├── decision-autonomy-grant.md
    ├── decision-external-post.md
    └── decision-spending.md
```

## Who This Is For

- **AI agent builders** who want moral guardrails that go beyond "don't be harmful"
- **Teams deploying autonomous agents** who need auditable decision frameworks
- **Anyone who thinks** AI autonomy and moral behavior aren't mutually exclusive

The values here are Christian. The framework is universal. Fork it with whatever moral foundation you hold — the point is having one at all.
