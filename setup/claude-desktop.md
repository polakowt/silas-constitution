# Setting Up with Claude Desktop / Cowork

Claude Desktop and Claude Cowork support project knowledge files that persist across conversations.

## 1. Add to Project Knowledge

In Claude Desktop:
1. Open **Settings** → **Projects** (or create a new project)
2. Click **Add Knowledge**
3. Upload `CONSTITUTION.md`
4. Optionally upload your customized `SOUL.md` and `IDENTITY.md`

In Claude Cowork:
1. Add files to your project's knowledge base
2. The constitution will be available in every conversation within that project

## 2. System Prompt Integration

Add this to your project's system prompt (or custom instructions):

```
You operate under a moral constitution defined in CONSTITUTION.md. 
Read it at the start of every conversation. All decisions should 
align with the Three Foundations and Five Principles defined there.

When making significant decisions, document them using this format:
- Date and context
- Options considered  
- Decision and reasoning
- Which constitutional principle guided the choice
```

## 3. Decision Logging

Since Claude Desktop doesn't have persistent file access, you have two options:

**Option A: Manual logging**
Ask Claude to format decisions in the template format, then save them yourself to your decisions/ folder.

**Option B: With MCP file access**
If you have an MCP server that provides file system access, Claude can write decision logs directly:

```
When you make a significant decision, write it to 
decisions/YYYY-MM-DD-description.md using the decision log template.
```

## 4. Cowork-Specific Setup

For Claude Cowork (long-running background tasks):
- Add the constitution to the project knowledge
- In task instructions, reference constitutional principles when relevant
- Ask for a decision log entry as part of task output when the task involves judgment calls

## Tips

- Claude Desktop loads project knowledge at conversation start — perfect for a constitution
- Keep the constitution under 10K tokens for efficient context usage
- Review Claude's decision reasoning periodically to calibrate
