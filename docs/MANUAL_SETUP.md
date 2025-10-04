# AegisIDE Manual Setup - Step by Step

**Version**: 2.7.0  
**Last Updated**: 2025-10-04T18:02:32+05:30

---

## 🎯 **Overview**

This guide provides **manual file copying steps** since automated commands don't exist yet. You'll copy files from AegisIDE repository to your project.

---

## 📁 **What You Need from AegisIDE**

AegisIDE repository has files in different locations:

```
AegisIDE/
├── core/
│   ├── schemas/          ← 16 JSON schema files (copy to project)
│   ├── constitution/     ← 14 constitutional articles (copy to project)
│   └── laws/             ← Language-specific rules (copy to project)
├── platforms/
│   └── windsurf/
│       ├── global_rules.md   ← Goes to IDE's global location (NOT project)
│       └── CheatSheet.md     ← Goes to IDE's global location (NOT project)
```

### **Important: Global vs Project Files**

**Project-Specific** (copy to `.windsurf/`):
- ✅ Schemas (16 JSON files)
- ✅ Constitution (14 articles)
- ✅ Laws (14 language rules)

**IDE-Global** (Windsurf manages these):
- ❌ `global_rules.md` → Lives in IDE's global memory location:
  - **Linux/Mac**: `~/.codeium/windsurf/memories/` or `~/.codeium/windsurf-next/memories/`
  - **Windows**: `%USERPROFILE%\.codeium\windsurf\memories\` or `%USERPROFILE%\.codeium\windsurf-next\memories\`
- ❌ `CheatSheet.md` → Lives in IDE's global memory location (same paths as above)
- ❌ Platform configuration → Managed by IDE, not copied to projects

---

## 🔧 **Manual Setup Steps**

### **Step 1: Copy Schemas to Your Project**

```bash
# Navigate to your project
cd /path/to/your-project

# Create schemas directory inside memory-bank
mkdir -p .windsurf/memory-bank/schemas

# Copy all 16 schema files from AegisIDE
cp /path/to/AegisIDE/core/schemas/*.json .windsurf/memory-bank/schemas/
cp /path/to/AegisIDE/core/schemas/README.md .windsurf/memory-bank/schemas/
```

**Result**:
```
your-project/.windsurf/memory-bank/schemas/
├── activeContext.schema.json
├── scratchpad.schema.json
├── mistakes.schema.json
├── progress.schema.json
├── systemPatterns.schema.json
├── techContext.schema.json
├── productContext.schema.json
├── projectbrief.schema.json
├── roadmap.schema.json
├── kanban.schema.json
├── blueprint.schema.json
├── userflow.schema.json
├── bugfix.schema.json
├── deployment.schema.json
├── monitoring.schema.json
├── dependencies.schema.json
└── README.md
```

---

### **Step 2: Copy Constitutional Framework (Optional but Recommended)**

```bash
# Create rules directories
mkdir -p .windsurf/rules/constitution
mkdir -p .windsurf/rules/laws

# Copy constitutional articles
cp /path/to/AegisIDE/core/constitution/*.md .windsurf/rules/constitution/

# Copy language-specific laws
cp /path/to/AegisIDE/core/laws/*.md .windsurf/rules/laws/
```

**Result**:
```
your-project/.windsurf/rules/
├── constitution/
│   ├── article-I.md
│   ├── article-II.md
│   ├── article-III.md
│   └── [11 more articles...]
└── laws/
    ├── rust.md
    ├── python.md
    ├── javascript.md
    └── [11 more laws...]
```

---

### **Step 3: Create Configuration File**

Create `.windsurf/config.json` manually:

```bash
cat > .windsurf/config.json << 'EOF'
{
  "schemaPath": ".windsurf/schemas",
  "memoryBankPath": ".windsurf/memory-bank",
  "constitutionPath": ".windsurf/rules/constitution",
  "lawsPath": ".windsurf/rules/laws",
  "autoValidate": true,
  "schemaVersion": "1.0.0"
}
EOF
```

---

### **Step 4: Create Memory-Bank Directory**

```bash
# Create memory-bank directory
mkdir -p .windsurf/memory-bank

# AI will populate this automatically when you start using it
```

---

## 📋 **Complete Manual Setup Script**

Save this as `setup_aegiside.sh` in your project:

```bash
#!/bin/bash

# AegisIDE Manual Setup Script
# Usage: ./setup_aegiside.sh /path/to/AegisIDE

AEGIS_PATH=$1

if [ -z "$AEGIS_PATH" ]; then
  echo "Usage: ./setup_aegiside.sh /path/to/AegisIDE"
  exit 1
fi

echo "🚀 Setting up AegisIDE..."

# Create directories
mkdir -p .windsurf/memory-bank/schemas
mkdir -p .windsurf/rules/constitution
mkdir -p .windsurf/rules/laws

# Copy schemas
echo "📋 Copying schemas..."
cp $AEGIS_PATH/core/schemas/*.json .windsurf/memory-bank/schemas/
cp $AEGIS_PATH/core/schemas/README.md .windsurf/memory-bank/schemas/

# Copy constitution
echo "📜 Copying constitution..."
cp $AEGIS_PATH/core/constitution/*.md .windsurf/rules/constitution/

# Copy laws
echo "⚖️ Copying laws..."
cp $AEGIS_PATH/core/laws/*.md .windsurf/rules/laws/

# Create config.json
echo "⚙️ Creating config.json..."
cat > .windsurf/config.json << 'EOF'
{
  "schemaPath": ".windsurf/memory-bank/schemas",
  "memoryBankPath": ".windsurf/memory-bank",
  "constitutionPath": ".windsurf/rules/constitution",
  "lawsPath": ".windsurf/rules/laws",
  "autoValidate": true,
  "schemaVersion": "1.0.0"
}
EOF

echo "✅ AegisIDE setup complete!"
echo ""
echo "📁 Structure created:"
echo "  .windsurf/"
echo "    ├── config.json"
echo "    ├── memory-bank/"
echo "    │   └── schemas/ (17 files)"
echo "    └── rules/"
echo "        ├── constitution/ (14 files)"
echo "        └── laws/ (14 files)"
echo ""
echo "🎉 Ready to use! Start with: init"
```

**Make it executable**:
```bash
chmod +x setup_aegiside.sh
```

**Run it**:
```bash
./setup_aegiside.sh /mnt/windows_d/Gauravs-Files-and-Folders/Projects/Portfolio/AegisIDE
```

---

## 🎯 **Verification Checklist**

After manual setup, verify files exist:

```bash
# Check schemas (should show 16 .json files + README.md)
ls -la .windsurf/memory-bank/schemas/

# Check constitution (should show 14 article files)
ls -la .windsurf/rules/constitution/

# Check laws (should show 14 language files)
ls -la .windsurf/rules/laws/

# Check config
cat .windsurf/config.json
```

**Expected output**:
```
✅ 17 schema files (16 JSON + README.md)
✅ 14 constitution articles
✅ 14 law files
✅ config.json created
✅ memory-bank directory exists
```

> **Note**: `global_rules.md` and platform-specific files live in Windsurf IDE's global location:  
> - **Linux/Mac**: `~/.codeium/windsurf/memories/` or `~/.codeium/windsurf-next/memories/`  
> - **Windows**: `%USERPROFILE%\.codeium\windsurf\memories\` or `%USERPROFILE%\.codeium\windsurf-next\memories\`  
>   
> They are NOT copied to your project.

---

## 🚀 **What Happens Next**

Once manual setup is complete:

1. **AI detects configuration** via `.windsurf/config.json`
2. **AI loads schemas** from `.windsurf/schemas/`
3. **AI reads constitution** from `.windsurf/rules/constitution/`
4. **AI creates memory-bank files** in `.windsurf/memory-bank/`
5. **AI validates everything** automatically

You can then use commands like `init`, `next`, `update`, etc.

---

## 📝 **Example: ServeUPSC Backend Setup**

```bash
# Navigate to backend
cd /mnt/windows_d/.../serveupsc_rust_backend

# Run setup script
/mnt/windows_d/.../AegisIDE/setup_aegiside.sh \
  /mnt/windows_d/Gauravs-Files-and-Folders/Projects/Portfolio/AegisIDE

# Verify
ls -la .windsurf/

# AI will now automatically:
# - Detect existing .md files in memory-bank/
# - Prompt to migrate to JSON
# - Create 16 JSON files + roadmap.md
```

---

## 🆘 **Troubleshooting**

### **"Schemas not found"**
```bash
# Verify schemas directory
ls .windsurf/memory-bank/schemas/

# Should show 16 .json files + README.md
# If empty, re-run Step 1
```

### **"AI not following constitution"**
```bash
# Verify constitutional files
ls .windsurf/rules/constitution/

# Should show 14 .md files
# If missing, re-run Step 2
```

### **"Config not detected"**
```bash
# Check config file
cat .windsurf/config.json

# Verify paths are correct
# Re-create if needed using Step 4
```

---

## ✅ **Summary**

**Manual Steps** (Copy to Project):
1. Copy 17 schema files to `.windsurf/memory-bank/schemas/` (16 JSON + README.md)
2. Copy 14 constitution articles to `.windsurf/rules/constitution/`
3. Copy 14 law files to `.windsurf/rules/laws/`
4. Create `config.json`

**NOT Copied** (IDE Manages):
- ❌ `global_rules.md` - IDE's global memory location:
  - Linux/Mac: `~/.codeium/windsurf-next/memories/`
  - Windows: `%USERPROFILE%\.codeium\windsurf-next\memories\`
- ❌ `CheatSheet.md` - Same global location as above
- ❌ Platform configurations (IDE-managed)

**OR use the provided script**:
```bash
./setup_aegiside.sh /path/to/AegisIDE
```

**Total time**: ~2 minutes manual, ~30 seconds with script

**After setup**: Everything works automatically via AI detection! ✨
