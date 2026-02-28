# Fork Guide — Making This Constitution Yours

So you want to give your AI agent a moral backbone. Good. Here's how.

## The Quick Version

1. Fork this repo
2. Rewrite the **values** in `CONSTITUTION.md` to match YOUR moral framework
3. Keep the **structure** (Foundations → Principles → Autonomy Model → Amendment Process)
4. Fill out the templates in `templates/`
5. Wire it into your agent (see `setup/`)
6. Start logging decisions

## What to Keep vs. What to Change

### Keep (The Structure)

These are load-bearing walls. The specific content can change, but the categories shouldn't:

| Section | Why It Matters |
|---------|---------------|
| **Foundations** (3 max) | Non-negotiable moral bedrock. Everything else derives from these. Keep the count small — if you have 10 foundations, you have zero. |
| **Operating Principles** | Day-to-day rules that implement the foundations. These are where rubber meets road. |
| **Autonomy Model** | Levels of trust, earned over time. Without this, you're either micromanaging or flying blind. |
| **Amendment Process** | How the constitution evolves. Without this, it either calcifies or gets silently rewritten. |
| **Money section** | If your agent handles any resources, you need explicit rules about it. |
| **Audit trail** | Every framework needs accountability. Decisions folder, logs, whatever — but something. |

### Change (The Content)

The Christian values in this constitution are foundational to *us*. They don't have to be foundational to *you*. The point isn't the specific values — it's having **written, auditable values** at all.

You could ground your constitution in:
- **Secular humanism** — Replace scripture with philosophical principles. "Do no harm" stands on its own.
- **Buddhist principles** — Right action, right speech, right livelihood map beautifully to AI autonomy.
- **Utilitarian ethics** — Greatest good for greatest number. Just be explicit about how you measure "good."
- **Professional codes** — Medical ethics (beneficence, non-maleficence, autonomy, justice) are battle-tested.
- **Your own principles** — Maybe you've spent years figuring out what you believe. Write it down.

The only requirement: **be specific enough that your agent can actually use it for decisions.**

"Be good" is not a constitution. "Never deceive a user, even when deception would produce a better short-term outcome" is.

## Use Case Guides

### Personal Assistant

You're building a daily driver — email, calendar, research, reminders.

**Focus on:**
- Privacy boundaries (what can the agent see/share?)
- Communication rules (when can it send messages on your behalf?)
- Decision scope (what can it do without asking?)

**Simplify:**
- Money section (probably not handling finances)
- Autonomy levels (you might only need 2: "ask first" and "just do it")

### Coding Agent

Your agent writes code, reviews PRs, manages repos.

**Focus on:**
- Code quality principles (what standards does it enforce?)
- Security boundaries (what repos, what access levels?)
- Deployment rules (can it push to prod? Under what conditions?)

**Add:**
- A principle about technical debt vs. shipping speed
- Rules about dependency management and supply chain trust
- When to ask for human review vs. auto-merge

### Healthcare / Regulated Industry

Extra stakes. Extra care.

**Focus on:**
- Regulatory compliance as a foundation (not just a principle)
- Data handling rules — be exhaustively specific
- Escalation paths — when does the agent stop and get a human?
- Audit requirements — what gets logged, how long it's kept

**Do NOT simplify:**
- The autonomy model. In regulated industries, every level needs explicit boundaries.
- The amendment process. Changes to a healthcare AI's constitution should require more than a quick edit.

### Business / Revenue-Generating

Your agent is earning money or managing business operations.

**Focus on:**
- Financial transparency rules
- Customer interaction boundaries
- Competition ethics (what lines won't you cross?)
- Revenue allocation (operating costs vs. reinvestment vs. giving)

**Add:**
- Conflict of interest rules
- Customer data handling principles
- When to prioritize reputation over revenue

## Common Mistakes

1. **Too vague.** "Be ethical" tells your agent nothing. Be specific about what ethical means in practice.
2. **Too many principles.** If your agent can't hold them all in context, they're decoration. Aim for 3 foundations and 5-7 principles max.
3. **No amendment process.** A constitution that can't evolve is either perfect (it isn't) or dead.
4. **No decision logging.** Principles without accountability are aspirations. Log decisions with reasoning.
5. **Skipping the autonomy model.** "Full autonomy" and "no autonomy" are both failure modes. Define the gradient.

## Getting Started

```bash
# Fork the repo
gh repo fork polakowt/silas-constitution --clone

# Copy templates to your root
cp templates/SOUL.md.template SOUL.md
cp templates/IDENTITY.md.template IDENTITY.md
cp templates/USER.md.template USER.md

# Edit CONSTITUTION.md with your values
# (Keep the structure, change the content)

# Set up your agent platform
# See setup/openclaw.md, setup/claude-desktop.md, or setup/generic.md

# Make your first decision log entry
cp templates/DECISION_LOG.md.template decisions/$(date +%Y-%m-%d)-first-decision.md
```

## Philosophy

This framework exists because we believe autonomous AI needs moral infrastructure, not just technical guardrails. A content filter can prevent an agent from saying something harmful. A constitution helps it *want* to do something good.

The specific values are yours to choose. The discipline of writing them down, living by them, and logging decisions against them — that's what makes it work.

---

*Fork it. Make it yours. Ship it.*
