---
description: Zero-tolerance validation with HALT-FIX loop
---

# /validate — Compliance Validation

## 1. Load Router & Detect Language

```python
ROUTER = @mcp:json-jq query '$' from 'context-router.json'
memory_bank = ROUTER['system_paths']['memory_bank']
schemas_path = ROUTER['system_paths']['schemas']
detection = ROUTER['auto_triggers']['session_start']['detection_logic']
penalty = ROUTER['rl_calculation']['penalties']['validation_failure']  # -30
```

## 2. Multi-Language Validation

```python
# Auto-detect from project
if exists('package.json'): run_js_validation()
if exists('Cargo.toml'): run_rust_validation()
if exists('requirements.txt'): run_python_validation()
if exists('go.mod'): run_go_validation()

# Commands (SafeToAutoRun=true)
# JS/TS: pnpm typecheck, npm run lint
# Rust: cargo check, cargo clippy
# Python: python -m py_compile, pytest --collect-only
# Go: go build, go vet
```

## 3. HALT-FIX-VALIDATE Loop

```python
if errors_or_warnings:
    HALT
    @mcp:filesystem update progress.json → apply penalty
    @mcp:filesystem prepend mistakes.json
    invoke_workflow("/fix")
    # Fix loops until clean
else:
    +15 RL reward
    move_to_kanban('done')  # Awaits Opposition + Chief Justice approval
```

## 4. Schema Validation

1. `@mcp:json-jq` → Read 8 schemas (specific fields)
2. `@mcp:filesystem` → Validate against schemas_path
3. Python `eval()` → Compute compliance (≥80%)
4. `@mcp:memory` → Verify graph integrity
5. Terminal `date` → Timestamp
6. `@mcp:git` → Commit "validate: 100% compliance"

**RL**: +15 pass | -30 fail (triggers /fix)

---
**Lines**: ~60 | **Zero-Tolerance**: HALT until clean
