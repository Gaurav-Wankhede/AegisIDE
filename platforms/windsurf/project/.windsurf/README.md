# Windsurf Project Structure Template

This folder provides the **complete Windsurf project structure** ready to copy into your project.

## Structure

```
.windsurf/
├── rules/
│   ├── constitution/     (13 articles - Democratic governance)
│   │   ├── article-I.md through article-XIII.md
│   └── laws/            (Language-specific rules)
│       ├── python.md
│       ├── javascript.md
│       ├── typescript.md
│       ├── rust.md
│       ├── java.md
│       ├── nextjs.md
│       ├── fastapi.md
│       ├── flask.md
│       ├── tailwind.md
│       ├── shadcnui.md
│       ├── machinelearning.md
│       └── tailwind-nextjs.md
├── docs/               (Project-specific documentation)
│   └── (Copy your project docs here)
└── memory-bank/        (AUTO-GENERATED - DO NOT CREATE MANUALLY)
    ├── scratchpad.md
    ├── activeContext.md
    ├── mistakes.md
    ├── progress.md
    ├── systemPatterns.md
    ├── techContext.md
    ├── productContext.md
    ├── projectbrief.md
    └── roadmap/
        └── roadmap.md
```

## How to Use

### Step 1: Copy Structure to Your Project

```bash
# From your project root
cp -r /path/to/AegisIDE/platforms/windsurf/project/.windsurf/ .
```

### Step 2: Add Project-Specific Docs (Optional)

Copy any project-specific documentation to `.windsurf/docs/`:
- PDFs, brochures, specifications
- API documentation
- Architecture diagrams
- Business requirements

### Step 3: Initialize Memory Bank

**DO NOT create memory-bank files manually!**

```bash
# In Windsurf chat:
# 1. Describe your project
"I want to build [your project description]"

# 2. Run initialization command
initialize memory bank

# 3. AI auto-generates all 8 files + roadmap based on your project
```

### Step 4: Start Development

```bash
what next
```

## Files Explained

### rules/constitution/ (13 Articles)

The democratic governance framework:
- **Article I-III**: Tri-branch system, decision-making, workflows
- **Article IV-VI**: Principles, communication, amendments
- **Article VII-IX**: Autonomy, terminal safety, security
- **Article X-XIII**: MCP integration, compliance, continuity, roadmap supremacy

**Source**: Copy from `AegisIDE/core/constitution/`

### rules/laws/ (Language-Specific)

Language and framework-specific best practices:
- **python.md**: Python development standards
- **javascript.md/typescript.md**: JS/TS development
- **rust.md**: Rust development patterns
- **nextjs.md/fastapi.md/flask.md**: Framework-specific rules
- **tailwind.md/shadcnui.md**: UI framework patterns
- **machinelearning.md**: ML/AI development standards

**Source**: Copy from `AegisIDE/Language Specific Rules/`

### docs/ (Project Context)

Store project-specific documentation for AI awareness:
- Business requirements (PDFs, brochures)
- API documentation
- Technical specifications
- Architecture diagrams

**Example** (Job Scrapper project):
- `Codebasics_DS_AI_Bootcamp_Brochure_v1-1.pdf`
- `api_url_patterns.md`
- `scraping_strategies.md`

### memory-bank/ (AUTO-GENERATED)

**NEVER create these files manually!**

Run `initialize memory bank` and AI generates:
- `scratchpad.md` - Next 5-10 tasks
- `activeContext.md` - Current phase
- `mistakes.md` - Error patterns
- `progress.md` - Milestones
- `systemPatterns.md` - Architecture patterns
- `techContext.md` - Tech stack details
- `productContext.md` - Business requirements
- `projectbrief.md` - Project scope
- `roadmap/roadmap.md` - Strategic plan

## Complete Example

### Job Scrapper Project Structure

```
Job_Scrapper/
└── .windsurf/
    ├── rules/
    │   ├── constitution/ (13 articles)
    │   └── laws/
    │       ├── python.md
    │       └── web-scraping.md (custom)
    ├── docs/
    │   ├── Codebasics_DS_AI_Bootcamp_Brochure_v1-1.pdf
    │   └── api_url_patterns.md
    └── memory-bank/ (AUTO-GENERATED via `initialize memory bank`)
        ├── scratchpad.md (LinkedIn scraping tasks)
        ├── techContext.md (Python 3.11, Selenium, Streamlit)
        ├── roadmap/roadmap.md (Scraping milestones)
        └── ... (5 other files)
```

## Key Points

✅ **Copy constitution + laws**: Manual setup
✅ **Add project docs**: Optional for context
❌ **DO NOT create memory-bank**: Auto-generated only
✅ **Run `initialize memory bank`**: After describing project
✅ **Start with `what next`**: Begin autonomous development

## Maintainer

**Gaurav Wankhede** - AegisIDE Framework
- Repository: https://github.com/Gaurav-Wankhede/AegisIDE
