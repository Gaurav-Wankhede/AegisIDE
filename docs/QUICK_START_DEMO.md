# Quick Start Demo - Autonomous Flow

This demonstrates AegisIDE's autonomous execution without permission prompts.

## Demo Flow (30 seconds)

```bash
# 1. Clone and enter directory
git clone https://github.com/Gaurav-Wankhede/AegisIDE.git
cd AegisIDE

# 2. Open in your IDE (auto-detects and sets up)
# Windsurf/Cursor/VS Code/etc. - framework creates .{IDE}/aegiside/

# 3. Initialize (generates 8 memory-bank files from schemas)
# In AI chat: "/init" or "bootstrap"
```

## What You'll See

### Step 1: Auto-Detection
```
✅ IDE detected: Windsurf
✅ Creating .windsurf/aegiside/
✅ Copying constitution (42 articles)
✅ Copying workflows (12 commands)
✅ Ready in 30 seconds!
```

### Step 2: Memory Bank Generation
```
# AI says: "Proceeding autonomously per router."
✅ Generated activeContext.json
✅ Generated scratchpad.json  
✅ Generated kanban.json
✅ Generated mistakes.json
✅ Generated systemPatterns.json
✅ Generated progress.json
✅ Generated roadmap.json
✅ Generated memory.json
✅ Memory bank initialized (+10 RL)
```

### Step 3: Autonomous Execution
```
# You: "status"
# AI: (no permission prompt, runs immediately)
✅ System health: 100%
✅ Constitutional compliance: 98%
✅ Memory bank: 8 schemas valid
✅ Queue: Empty (auto-trigger → /status)
✅ RL Score: +10 (initialization)

# You: "yes" or "go ahead" or "run next"  
# AI: (detects intent, runs /next automatically)
✅ Intent: proceed (confidence: 0.95)
✅ Workflow: /next
✅ Queue empty → running /status instead
✅ All systems operational
```

## NLU/NLP in Action

### English
- "yes" → `/continue`
- "run next" → `/next`
- "full test" → `/status` → `/validate` → `/update` → `/memory-status`

### Multilingual  
- "sí" (Spanish) → `/continue`
- "oui" (French) → `/continue`
- "ja" (German) → `/continue`
- "हाँ" (Hindi) → `/continue`

### Auto-Triggers
- Queue has tasks → `/next` runs automatically
- Queue empty → `/status` runs automatically
- No memory bank → `/bootstrap` runs automatically

## Key Features Demonstrated

### 🚫 No Permission Prompts (0-99%)
```
❌ "Should I continue?"
❌ "Would you like me to..."
❌ "Do you want me to..."

✅ "Proceeding autonomously per router."
✅ "Running /next workflow."
✅ "Intent detected: continue (0.95)"
```

### 🧠 Persistent Memory
```
✅ Remembers project context across sessions
✅ Learns from mistakes (stored in mistakes.json)
✅ Reuses successful patterns (+20 RL)
✅ Constitutional compliance tracking
```

### ⚡ Instant Response
```
✅ Router-first reads (100x faster)
✅ Atomic writes (jq | sponge)
✅ Intent recognition (NLU/NLP)
✅ Auto-workflow activation
```

## Live Example Commands

Try these in your AI chat:

```bash
# Basic commands
/init           # Initialize memory bank
/status         # System health report  
/next           # Execute next task
/validate       # Run quality checks
/fix            # Auto-fix all issues

# Natural language (NLU/NLP)
"yes"           # Continue current work
"go ahead"      # Proceed with task
"run next"      # Execute next item
"full test"     # Complete validation chain
"status"        # Health check
```

## Expected Output Pattern

```
User: "full test"

AI: Intent: full_test (confidence: 0.9)
    Workflow chain: /status → /validate → /update → /memory-status
    
    ✅ /status: System health 100%
    ✅ /validate: All checks passed (+15 RL)
    ✅ /update: 8 schemas synced (+8 RL)  
    ✅ /memory-status: Knowledge graph healthy (+5 RL)
    
    Total: +28 RL | Constitutional compliance: 98%
    Next: Queue empty, standing by for tasks
```

## Troubleshooting

### "AI asks for permission"
- Check `communication_rules` in context-router.json
- Verify enforcement gate is active
- Ensure autonomy band is 0-99%

### "Intent not recognized"  
- Add patterns to `nlu_intent_patterns`
- Check confidence threshold (default: 0.6)
- View logs in `activeContext.json.nlu`

### "Workflows don't auto-run"
- Verify `workflow_activation.enable = true`
- Check `auto_triggers` configuration
- Ensure MCP servers are connected

## Video Demo (Coming Soon)

We're creating a 30-second screen recording showing:
1. Git clone → IDE open (5s)
2. "/init" → memory bank generation (10s)  
3. "full test" → autonomous chain execution (15s)

The demo will show real-time NLU logs, RL scoring, and zero permission prompts.

## Try It Now

1. Clone: `git clone https://github.com/Gaurav-Wankhede/AegisIDE.git`
2. Open in any supported IDE
3. Type "/init" in AI chat
4. Watch autonomous execution begin

No configuration needed - the framework detects your environment and sets everything up automatically.
