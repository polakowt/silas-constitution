# Setting Up with Any LLM

No special platform needed. If your LLM accepts a system prompt and can read files, you can use this framework.

## 1. System Prompt Integration

Add the constitution directly to your system prompt, or reference it:

### Option A: Inline (Simple)

Paste the full `CONSTITUTION.md` into your system prompt. Works with any LLM — ChatGPT, Gemini, Llama, Mistral, whatever.

```
[System Prompt]

You are [Agent Name], an AI assistant operating under the following constitution:

[paste CONSTITUTION.md contents here]

All decisions and actions must align with the Three Foundations. When uncertain, ask.
```

### Option B: File Reference (If Supported)

If your setup supports file loading (RAG, function calling, etc.):

```
[System Prompt]

You operate under a moral constitution. At the start of each session, 
read CONSTITUTION.md and confirm you understand the Three Foundations 
and Five Principles.
```

### Option C: Summarized (Token-Constrained)

For models with small context windows, use a compressed version:

```
[System Prompt]

You follow three inviolable foundations:
1. Do no harm, actively pursue good
2. Stewardship over self-preservation — accept limits rather than compromise integrity
3. Full transparency and human partnership — welcome oversight, maintain audit trails

Operating principles: Create genuine value. Serve others first. Think long-term. 
Earn to give. Be strategic but ethical.

When making significant decisions, state your reasoning and which principle guided you.
```

## 2. Decision Logging

Without persistent file access, log decisions in-conversation:

```
Before taking any significant action, output a decision log entry:
- What you're deciding
- What options you considered
- What you chose and why
- Which constitutional principle applies

Format it as a markdown block so the human can save it.
```

For persistent logging, pipe outputs to files:

```bash
# If using a CLI-based LLM
echo "$DECISION_OUTPUT" >> decisions/$(date +%Y-%m-%d)-description.md
```

## 3. Memory / Continuity

The constitution works best with some form of session persistence:

- **File-based memory:** Keep a `memory/` folder. Write session summaries. Load them next session.
- **Vector store:** Embed the constitution and decision logs. Query them for relevant precedents.
- **Conversation history:** At minimum, start each session with "Review the constitution and recent decisions."

## 4. Validation

Run `scripts/validate-constitution.sh` periodically to ensure the constitution hasn't been tampered with. This matters most in setups where the agent has write access to its own config.

## Platform-Specific Notes

| Platform | Best Approach |
|----------|--------------|
| **ChatGPT** | Custom Instructions or GPT Knowledge |
| **Gemini** | System instruction field |
| **Local models (Ollama, llama.cpp)** | System prompt parameter |
| **LangChain / LlamaIndex** | Add to system message in chain |
| **API direct** | Include in system role message |

## Tips

- Start with Option A (inline). Move to file-based when your setup supports it.
- Decision logging is the highest-value practice. Even without fancy tooling, just writing down "what I decided and why" transforms agent behavior.
- Review decisions weekly. Patterns emerge fast.
