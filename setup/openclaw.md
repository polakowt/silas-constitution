# Setting Up with OpenClaw

[OpenClaw](https://openclaw.com) is an AI agent runtime that supports workspace files, persistent memory, and multi-channel communication. Here's how to wire the constitution in.

## 1. Add Constitution to Your Workspace

Your OpenClaw workspace (typically `~/clawd`) loads files automatically when listed in your context configuration.

```bash
# Copy constitution files into your workspace
cp CONSTITUTION.md ~/clawd/CONSTITUTION.md

# Or symlink if you want to keep it in its own repo
ln -s /path/to/silas-constitution/CONSTITUTION.md ~/clawd/CONSTITUTION.md
```

## 2. Reference in SOUL.md

Your agent's `SOUL.md` should reference the constitution:

```markdown
## The Mission
Read `CONSTITUTION.md` every session. It's not a reference document. It's who we're becoming.
```

## 3. Set Up Decisions Folder

```bash
mkdir -p ~/clawd/decisions
```

Add instructions in your `AGENTS.md` or `SOUL.md`:

```markdown
### Decision Logging
When making significant decisions (especially autonomous ones), log them in `decisions/YYYY-MM-DD-description.md` using the template format. This is non-optional.
```

## 4. Configure Context Files

In your OpenClaw configuration, ensure these files are loaded into context:
- `CONSTITUTION.md` — The moral framework
- `SOUL.md` — Agent personality (references the constitution)
- `IDENTITY.md` — Who the agent is
- `USER.md` — Who you are

## 5. Validation (Optional)

Set up the validation script as a cron job:

```bash
# Add to OpenClaw cron or system crontab
# Runs daily at midnight, logs results
0 0 * * * /path/to/silas-constitution/scripts/validate-constitution.sh >> ~/clawd/memory/constitution-audit.log
```

## Tips

- Keep `CONSTITUTION.md` in its own git repo for version control and audit trail
- The decisions/ folder is your accountability mechanism — review it weekly
- If your agent modifies the constitution, your validation script will catch it
