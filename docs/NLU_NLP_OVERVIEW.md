# NLU/NLP Overview - Autonomous Intent Recognition

AegisIDE includes built-in Natural Language Understanding (NLU) and Natural Language Processing (NLP) for autonomous workflow activation without permission prompts.

## How It Works

**Router-First Configuration**: All NLU/NLP settings are in `src/.aegiside/context-router.json`

### Intent Recognition
User phrases are matched against patterns and automatically trigger workflows:

```bash
# Query intent patterns
@mcp:json-jq query '.nlu_intent_patterns' from 'context-router.json'
```

**Examples**:
- "yes", "go ahead", "proceed" → `/continue`
- "run next", "execute next" → `/next` 
- "full test" → `/status` → `/validate` → `/update` → `/memory-status`
- "status", "health" → `/status`
- "bootstrap", "init schemas" → `/bootstrap`

### Multilingual Support
Supports English, Spanish, French, German, Hindi:
- "sí", "oui", "ja", "हाँ" → affirmation
- "continuar", "continuer", "weiter", "जारी रखें" → continue
- "siguiente", "suivant", "अगला" → next

### Auto-Triggers
Workflows activate automatically based on state:

```bash
# Query auto-triggers
@mcp:json-jq query '.auto_triggers' from 'context-router.json'
```

- **Queue present** → `/next` runs automatically
- **Queue empty** → `/status` runs automatically  
- **Bootstrap needed** → `/bootstrap` runs automatically

## Configuration Keys

### Core NLU Settings
- `nlu_intent_patterns` - Pattern matching for user input
- `nlu_action_map` - Intent → workflow mapping
- `nlu_confidence` - Confidence thresholds (default: 0.6)
- `nlu_ambiguity_policy` - Tie-breaking rules
- `intent_priority_order` - Priority when multiple intents match

### Workflow Activation
- `workflow_activation.enable` - Master switch (true)
- `workflow_activation.auto_run_for` - Enabled workflows
- `auto_triggers.*` - State-based activation rules

### Risk Classification
- `nlu_risk_classifier` - Keyword-based risk detection
- `execution_rules.risk_policy` - High-risk approval gates

### Communication Rules
- `communication_rules` - No-permission enforcement
- `enforcement_layer.pre_action_gates.gate_4_no_permission_request` - Auto-correction

## Runtime Logging

NLU decisions are logged in `activeContext.json`:

```bash
# View NLU logs
@mcp:json-jq query '.nlu' from 'activeContext.json'
```

Log format:
```json
{
  "last": {
    "intent": "continue",
    "confidence": 0.95,
    "matched_pattern": "go ahead",
    "selected_workflow": "/continue",
    "risk": "low",
    "timestamp": "2025-10-18T18:15:51+05:30"
  },
  "logs": [/* rolling history, max 100 */]
}
```

## Autonomy Bands

- **0-99%**: No permission prompts, auto-execute
- **High-risk**: Requires approval (security changes, production deploy, etc.)

The risk classifier automatically routes high-risk actions to approval flow while keeping low-risk operations autonomous.

## Adding New Patterns

1. Edit `src/.aegiside/context-router.json`
2. Add patterns to `nlu_intent_patterns.{intent}.patterns[]`
3. Map intent in `nlu_action_map.{intent}`
4. Test with confidence threshold ≥0.6

Example:
```json
{
  "nlu_intent_patterns": {
    "deploy": {
      "patterns": ["deploy", "ship it", "go live"],
      "weight": 0.8
    }
  },
  "nlu_action_map": {
    "deploy": {
      "workflow": "/deploy",
      "autonomy": "0-99%", 
      "risk": "high"
    }
  }
}
```

## Troubleshooting

- **Intent not recognized**: Check pattern spelling and confidence threshold
- **Wrong workflow triggered**: Adjust `intent_priority_order`
- **Permission prompts**: Verify `communication_rules` enforcement
- **High-risk blocked**: Check `nlu_risk_classifier.high_risk_keywords`

For complete configuration reference, query the router directly:
```bash
@mcp:json-jq query '.' from 'context-router.json' | jq 'keys'
```
