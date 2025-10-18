# Router Usage Guide - Progressive Loading Architecture

## Overview

AegisIDE implements **Claude Skills-inspired progressive disclosure** for constitutional articles and external best practices, achieving **92-97% token reduction** through metadata-driven loading.

---

## Constitutional Articles (42 Articles)

### Startup (Lightweight)
```bash
# Load metadata only (500 tokens)
@mcp:json-jq query '.articles' from 'routers/constitutional-index.json'

# Load 3 critical articles (6,000 tokens)
@mcp:fetch url "${GITHUB_BASE}/01-preamble/preamble.md"
@mcp:fetch url "${GITHUB_BASE}/03-fundamental-rights/article-4.md"
@mcp:fetch url "${GITHUB_BASE}/04-fundamental-duties/article-13.md"

# Total startup: 6,500 tokens (vs 84,000 loading all)
```

### On-Demand Loading
```bash
# User asks: "Can I skip validation?"

# 1. Query trigger → article mapping
@mcp:json-jq query '.on_demand_triggers.validation' from 'routers/constitutional.json'
# Returns: ["article-5", "article-15"]

# 2. Get article metadata
@mcp:json-jq query '.articles[] | select(.id == "article-5")' from 'routers/constitutional-index.json'
# Returns: {title, github_path, tokens: 2000}

# 3. Check session cache
@mcp:json-jq query '.loaded_articles[] | select(.id == "article-5")' from 'activeContext.json'

# 4. Fetch if not cached (2,000 tokens - ONCE per session)
@mcp:fetch url "https://raw.githubusercontent.com/Gaurav-Wankhede/AegisIDE/main/src/rules/constitution/03-fundamental-rights/article-5.md"

# 5. Cache in session
jq '.loaded_articles += [{"id": "article-5", "content": "..."}]' activeContext.json | sponge activeContext.json

# 6. Apply rule: Zero-tolerance validation mandatory → -30 RL if violated
```

---

## External Skills (Best Practices)

### Query Available Skills
```bash
# List all skills
@mcp:json-jq query '.skills | keys' from 'routers/skills.json'
# Returns: ["documentation", "python", "rust", "typescript", "react", "nextjs", ...]

# Get skill metadata
@mcp:json-jq query '.skills.python' from 'routers/skills.json'
```

### Load Best Practices On-Demand
```bash
# User asks: "How to write Python type hints?"

# 1. Query skill trigger
@mcp:json-jq query '.skills | to_entries[] | select(.value.github_repos[].triggers[] | contains("type-hints"))' from 'routers/skills.json'
# Returns: skills.python

# 2. Get GitHub URL
@mcp:json-jq query '.skills.python.github_repos[] | select(.triggers[] | contains("type-hints")) | .url' from 'routers/skills.json'
# Returns: https://raw.githubusercontent.com/google/styleguide/gh-pages/pyguide.md

# 3. Fetch content
@mcp:fetch url "https://raw.githubusercontent.com/google/styleguide/gh-pages/pyguide.md"

# 4. Apply best practices to code
```

### Multi-Skill Scenarios
```bash
# Task: "Create Next.js API documentation"

# Load multiple skills:
@mcp:json-jq query '.skills.nextjs.github_repos[0].url' from 'routers/skills.json'
@mcp:fetch url "https://raw.githubusercontent.com/vercel/next.js/canary/README.md"

@mcp:json-jq query '.skills.documentation.github_repos[0].url' from 'routers/skills.json'
@mcp:fetch url "https://raw.githubusercontent.com/google/styleguide/gh-pages/docguide/README.md"

# Combine best practices from both skills
```

---

## Token Efficiency Comparison

| Scenario | Traditional | Progressive | Savings |
|----------|-------------|-------------|---------|
| **Startup (all articles)** | 84,000 | 6,500 | 92% |
| **Single query (autonomy)** | 84,000 | 2,500 | 97% |
| **Cached query** | 84,000 | 0 | 100% |
| **Multi-skill (3 skills)** | N/A | 6,000 | Load only needed |

---

## Workflow Integration

### /next Workflow with Progressive Loading
```bash
# 1. Load task
@mcp:json-jq query '.[0]' from 'memory-bank/scratchpad.json'

# 2. Check if constitutional validation needed
if [[ "$task" == *"validation"* ]]; then
  # Load Article 5 (zero-tolerance)
  @mcp:json-jq query '.articles[] | select(.id == "article-5")' from 'routers/constitutional-index.json'
  @mcp:fetch url "${GITHUB_BASE}/03-fundamental-rights/article-5.md"
fi

# 3. Check if skill needed
if [[ "$task" == *"Python"* ]]; then
  @mcp:json-jq query '.skills.python.github_repos[0].url' from 'routers/skills.json'
  @mcp:fetch url "https://raw.githubusercontent.com/google/styleguide/gh-pages/pyguide.md"
fi

# 4. Execute task with loaded context
# 5. Update memory-bank
```

---

## Cache Management

### Session Cache (activeContext.json)
```json
{
  "loaded_articles": [
    {"id": "article-4", "loaded_at": "2025-10-19T00:08:30+05:30"},
    {"id": "article-5", "loaded_at": "2025-10-19T00:10:15+05:30"}
  ],
  "loaded_skills": [
    {"skill": "python", "repo": "google/styleguide", "loaded_at": "2025-10-19T00:12:00+05:30"}
  ]
}
```

### Weekly Sync (Optional)
```bash
# Check for updates
REMOTE_VERSION=$(curl -sL "https://raw.githubusercontent.com/Gaurav-Wankhede/AegisIDE/main/VERSION")
LOCAL_VERSION=$(jq -r '.last_updated' routers/constitutional-index.json)

if [[ "$REMOTE_VERSION" != "$LOCAL_VERSION" ]]; then
  curl -sL "https://raw.githubusercontent.com/Gaurav-Wankhede/AegisIDE/main/src/aegiside/routers/constitutional-index.json" \
    > routers/constitutional-index.json
fi
```

---

## Adding New Skills

```bash
# Edit routers/skills.json
jq '.skills.newtool = {
  "name": "New Tool Best Practices",
  "description": "Guidelines for new tool",
  "github_repos": [{
    "source": "org/repo",
    "url": "https://raw.githubusercontent.com/org/repo/main/README.md",
    "priority": "high",
    "triggers": ["newtool", "keyword"]
  }]
}' routers/skills.json | sponge routers/skills.json
```

---

## Best Practices

1. **Load metadata first** (constitutional-index.json, skills.json)
2. **Query triggers** before fetching full content
3. **Check session cache** (activeContext.loaded_articles[])
4. **Fetch only when needed** (triggered by task context)
5. **Cache in activeContext** for session reuse
6. **Weekly sync** for updated content (optional)

**Result: 92-97% token reduction with same constitutional authority**
