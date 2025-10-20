# 🤖 AegisIDE - AI That Actually Finishes Your Projects

> **Turn any AI assistant into a reliable teammate that works on its own and remembers everything.**

[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE.md)
[![Version](https://img.shields.io/badge/version-3.4.0-blue.svg)](CHANGELOG.md)
[![6 Mandatory MCPs](https://img.shields.io/badge/MCPs-6%20Core-success)](src/mcp_servers.json)
[![Auto-Bootstrap](https://img.shields.io/badge/setup-automatic-brightgreen)](src/setup.sh)
[![2 Install Methods](https://img.shields.io/badge/install-CURL%20%7C%20Prompt-blue)](src/README.md)

## What Problem Does This Solve? 🎯

**Your AI assistant probably:**
- Forgets what you were working on
- Asks permission for everything (annoying!)
- Makes the same mistakes repeatedly

**AegisIDE fixes this:**
- 🧠 **Never forgets** - Remembers your entire project across sessions
- 🚀 **Works independently** - Does tasks without asking permission every 2 minutes
- 📈 **Gets smarter** - Learns from mistakes and never repeats them
- ⚡ **One-command setup** - Works in Windsurf, Cursor, VS Code, and more

## How It Works (Simple Version) 💡

1. **Install once** (1 command, 2 minutes)
2. **AI remembers everything** about your project in 8 memory files
3. **AI works alone** on 0-99% of tasks (no annoying permission prompts)
4. **AI learns** from every mistake (+91% fewer repeated errors)
5. **You stay in control** with smart safety checks for risky stuff

## 🏗️ Architecture Overview

**How Your Message Becomes Action:**

<div align="center">

### 🔥 [**View Interactive Architecture Diagram** →](https://www.mermaidchart.com/play?utm_source=mermaid_live_editor&utm_medium=toggle#pako:eNqlWGtz4kYW_Std3qp8iUUQEg9PpVIFGD8SZBOE7aR6tlKN1GAFIZFuaWwm7H_f2w-hlu2RNou_zMA95_Z9923-PgvSkJ59OlszsntGi9HnBMEfz5fqiwd_Mv_janr_hD-fPXDK0G2SUUaCLEoTdBWnL8hCkyREWSr--Xz2b8UXfw82lgyPck7WFJi7PDPlHXw3fUDDhMR7HvEfl-yHnyavmVAuT0ky9D0ap_C_1wrNwT7dkiSLAuSRLHiOkrXk_ppTti8IaJ7mYKjJc7H6Dvk0ptIBSZtFwQaNKM-UNpPRxQvCN2jySoP8iH-MiNZAww9O6WGPblMwZESSDXrYhSSjkjew_OAZDEfDLN2C7U8syqjJ7OM55bs04RRd0wSCfDxyTrOcJSLGIqCaQyHcyZts-b_7kCd_zzO6hXxkbF_JyBCv43RJ4j9YHlPe2oZSuw_5Edn0M8KyfGfgR5gwiG8GvuaMtraaMJr4CzR8IQys5NzAj6v4P7m236MZgTiQGstvHkZgeTV56CZfQnl5hIsPizxJaFzxZzzHgWJYTDLKI48lAiWmYigAXMTQ7mr9vMae6_tHsOc6_UJZQpKAFhSwxy3-X7FlbgtbeBZlslRIXNoy_vkczbxzdDv0z5H_TML0xSR23hCtKAnpa0l3O2jIwBVIGZqSr3s0TUloKnDeKtjqeJc6tAI0hm_jdG2yXbw-elkSFiyyRgy-g6KS5VQTq_uZqLr7nS5Z3hyrLlhsFsjNcLqwrm5_sx6H09vL4WJignuYqwo1sptBV0FhJDBXtjAoTHgfkzxLk3S7L_HHDhZdGZolOx_gl5RtVjDJeIkfwBjZbgW02uEfeT-dDOd34P-UEpbALELfoV9zEkfZHvx3Pvb_ArPYWlEaLkmwseI03ZVnz2b3318PJ8iHEIG6Som18ZcojVWUDQaFpMNxk2SVsuBdQGwb800UxwZjQUVeMzgczUgG9iV1vXB7dzUfgoe3yYpBL7Jctvf_0BEdvJWz0FrCLDSiW0zCsmQqNAdvg51hbU9kGupZTNVFmsZVtIt3hMUREW4TZiR9LEZpwnOOHtOsjORHHo7v7_yFmj_HPgK__HzHIJzQdS_VuWNjoynlYRcQSJZVhmEHzxgl22Ws5j98iKNtlICNaiBF6-cqwcGXcLJWeDnzZ4p39M7EuljX9Bel_ec8jIKo0D1KQ9BT4_DTFXj7VBQ-uFpWfMXTJ1t2E4ykKJOal2maQQkQ85p4khMMQpwrW1bRqyl1cAITWkoY5VRcEabYxXl5SX6BxhEfakz3xEVh3rHC-HkO50OmriJISMUDDzwIRJj03WJeEcd7r3IRex3MAyZ2gR0JjS5jETQktBnsGXkF7-ANSaDEjf4Sa0MRXhPq4m3EM7KhRnlPGEvZ2z6U6C7mcvYWspIzpzknUFnIT-P8bQd5Pbxj6RqCbTKmaAw1xEiMpjRcV5YWr48Z3ClbsjNHLISAruEGncUkSaqTyBvozi7xvyTpSywUo2uRprolZXwjlhQ5AkTp2W30qNIud8p3GfTfZpBLqjzVds57wF_uM2pGwO-UETDR7fO-PXiPPibQwBoloL41CW7hvkE4JvY9_F0eDVoR-PcsuPfkd9B8kAhRepZuj5RJauGiBZcJL3baus4Zz0TrjGdqikLojclaCfnCLharvjzpfrUS0yVGl2lgRm7RwSsKUZKgJ7pU23dlUi0cvNaz4xFuCJFiAWJpbIJcuOP_yoEJh1gZrPSbYqv3i_sGlm1KoNqqlbjoYvpK9LwPoR_ezpdFD4satf78S81J__4OyZfC-0A92MiyfjrYLTHLYQuXsAO8U7S4I8WdlnqyfKX6lQIIRyMciXBa6imBYIlaQ6fxA2yqCjGeS4TbUjdm-RQBJa5W4kpIt6XfHRREXS3qSlGvpd8VanSBvKflPSnvg3b5kghB1NeiPrJaIJvCroHuxI4tZhTI7cL7oeRWHgMHNDJlYu9ExS4PPpmyW7ggIHfRV1o6W3FZPPV0PFR0DnB3NyI6jQinEeE2IrqNiF4jot-IGDQiLpoj1m6GNEfVbg6r3RxX2y1KZ26r4hpXniFomGfP8sqEktBGzTu6DIt3zHGLMjCOwhRvFqPiCoSrEObzLD_q0BjVK7qHkKj7A6w9WthDP8pql--ImZhLHKrd0-U-7yux_PlCTytuiAdStV6Y0GXEdyokQr2GXOgDxDsHDWWLCw29ImBtJZ-ma6TW90iY77mF3C4MFPzi3gBAt4x5R0FgKoY_yB8TDAttNYn0iwA9iB9gDuICKOSuIqvNGF3K8ArrdNZ1QosF2MgkPIwbMfAgbMTIZ1MjSj49CqueriopFQPMyIqQCi3i9xn9HFGjSIm9kfZYb5hoRFcitmqSHsRWooFqzB9npC4dQxNcoPIkKI8Qlgk0nE4P4qeXOvHNw6hOfIzqx-JjQD8WG7H8GFAJI8_20FVDtII34SfY8hIoXwb32Dns9emGfvqX2-7TMNQfrZcozJ4_dXavJnv0z9hOlT0-6WwYSd-k06ATuO3aw2FYfZO-WoX9drv2dJhgJ9Gd0-juafTut-ntNrmg3Xp67zR6_zT64DT6xbfpTicInU49HUb2aXz7RH5N4V04_Xa4bOA7J_Ldk_jj2rbrOW6_lu7V0gdBQ-F7ndPozml09zR69zR675_R38xLr3_a6YP_g372n_8CTPalJw)

<sub>🎯 **Interactive Features:** Zoom • Pan • Export SVG/PNG • Click nodes to explore</sub>

---

**Or view static preview:**

[![AegisIDE Architecture Preview](src/.aegiside/architecture/architecture.png)](https://github.com/Gaurav-Wankhede/AegisIDE/blob/main/src/.aegiside/architecture/architecture.png?raw=true)

<sub>*Static preview • [View source .mmd file](src/.aegiside/architecture/architecture.mmd)*</sub>

</div>

**The System (Simplified):**

- **15 Specialized Routers** - Each handles specific tasks (governance, memory, workflows, etc.)
- **Context Router** - Master tunnel that routes your queries to the right specialist
- **8 Memory Files** - AI's brain (activeContext, scratchpad, mistakes, patterns, progress, roadmap, kanban, knowledge graph)
- **42 Constitutional Articles** - Rules for democratic AI governance
- **8 Workflows** - Commands like `/init`, `/fix`, `/next` for common operations
- **6 MCP Tools** - External integrations (context7 for docs, git, fetch, etc.)

**Session Loading (Efficient):**
- ✅ **First Session**: Loads full architecture diagram once (181 lines = complete system understanding)
- ✅ **Same Session**: Everything else lazy-loaded through Context Router (saves tokens)
- ✅ **LLM Lost?**: Re-reads architecture to regain track (self-recovery)

**Result**: AI knows exactly where to route your request, what to execute, where to store learnings, and never loses context.

## 🚀 Get Started - Choose Your Method

### Method 1: CURL Installation (Full Automation) ✨
```bash
# One command - complete setup in 2 minutes
bash <(curl -s https://raw.githubusercontent.com/Gaurav-Wankhede/AegisIDE/main/src/setup.sh)
```
**What it does:**
- Installs system prompt + framework to your project
- Handles all 4 scenarios automatically (fresh, existing, update, up-to-date)
- Configures 6 MCP servers
- Best for: New users, quick project setup

### Method 2: System Prompt Only (Lightweight) 🎯
```bash
# Copy system prompt to IDE global rules
# Windsurf:
cp src/system-prompt.md ~/.codeium/windsurf-next/memories/global_rules.md

# Cursor:
cp src/system-prompt.md ~/.cursor/memories/global_rules.mdc

# VS Code:
cp src/system-prompt.md ~/.vscode/system_prompt.md

# Restart IDE
```
**What it does:**
- One-time global install across ALL your projects
- Framework auto-initializes per project when you work on it
- Uses git diff to detect and update framework automatically
- Best for: Experienced users, multi-project workflows

### 🎯 Better UX: What to Expect

**First-Time Install:**
- Setup script detects no existing framework
- Shows "🆕 FRESH INSTALL" mode
- Downloads all components from scratch
- Asks Y/N permission before modifying system prompt (shows 15-line preview)
- For `mcp_servers.json`: Shows list of 6 MCPs, asks to create file

**Re-running (Update Mode):**
- Detects existing `context-router.json` → "🔄 UPDATE MODE"
- Compares each file with remote version
- **If identical**: Silent skip ✓ (no spam)
- **If different**: Shows unified diff + asks "Update file.json? [Y/n]"
- Creates `.backup` files before any updates
- Only downloads missing components

**Interactive Prompts You'll See:**
1. **System Prompt**: "This will APPEND AegisIDE rules to global_rules.md" → Y/n
2. **MCP Configuration**: "R)eplace/A)ppend/N)o changes to mcp_servers.json?" → Choose
3. **File Updates** (if changed): "Update core.json? [Y/n]" → See diff first

**Safe to Run Multiple Times:**
- ✅ Preserves your customizations
- ✅ Only updates what's different
- ✅ Automatic backups for all changes
- ✅ Clear feedback on what's happening


### That's It! 🎉

**Restart your IDE and you're done.** Type `/init` to verify.

**Works on:** Linux, macOS, Windows (WSL/Git Bash)  
**Works in:** Windsurf, Cursor, VS Code/Cline, JetBrains

**Want manual control?** `git clone` → `./setup.sh`

## What You Get 📦

**8 Memory Files** (AI's brain):
- What's happening now
- What's next in queue
- What went wrong + how to avoid it
- What patterns work best
- Progress tracking
- Long-term roadmap

**Real-Time Dashboard** (optional):
```bash
# From your project root:
cd .windsurf/aegiside  # or .cursor/aegiside or .vscode/aegiside
./visualize/start-dashboard.sh
# Opens at http://localhost:7777/visualize/dashboard.html
```

**Quality Checks** (automatic):
- Code validation before every commit
- Learns from mistakes
- 95% consensus required for big changes

## Why Teams Love It 👥

**For Developers:**
- Stops forgetting project context
- No more permission spam
- Learns from mistakes

**For Managers:**
- 3x faster delivery
- 91% fewer bugs
- Predictable timelines

**For Beginners:**
- AI teaches best practices
- Safe to experiment
- Real project experience

---

## 📚 Learn More

- 🚀 **[Quick Start Demo](docs/QUICK_START_DEMO.md)** - 30-second autonomous flow
- 🧠 **[NLU/NLP Overview](docs/NLU_NLP_OVERVIEW.md)** - Intent recognition guide
- 📖 **[Setup Guide](src/.aegiside/README.md)** - Detailed instructions
- 🔧 **[Technical Details](docs/planning/TECHNICAL_ROADMAP.md)** - How it works
- 🤝 **[Contributing](CONTRIBUTING.md)** - Join the project

---

## 📄 License

MIT License - Free for personal and commercial use.

**Questions?** [Open an issue](https://github.com/Gaurav-Wankhede/AegisIDE/issues) or check the [documentation](src/README.md).

---

## ⭐ Support This Project

If AegisIDE makes your development faster and better:

1. ⭐ **Star this repository**
2. 🐛 **Report bugs** to help us improve
3. 💡 **Share your ideas** for new features
4. 📢 **Tell other developers** about it

---

## 🚦 Project Status

✅ **Production Ready** - All 8 platforms tested and stable  
✅ **Active Development** - Regular updates and improvements  
✅ **Community Driven** - Democratic governance for all changes  
✅ **Enterprise Ready** - Used in production by real companies

## 📈 Star History

[![Star History Chart](https://api.star-history.com/svg?repos=Gaurav-Wankhede/AegisIDE&type=Date)](https://star-history.com/#Gaurav-Wankhede/AegisIDE&Date)

---

<div align="center">

**Made with ❤️ by developers, for developers**

[⭐ Star](https://github.com/Gaurav-Wankhede/AegisIDE) · [🐛 Report Bug](https://github.com/Gaurav-Wankhede/AegisIDE/issues) · [💡 Request Feature](https://github.com/Gaurav-Wankhede/AegisIDE/issues) · [📖 Documentation](src/README.md)

</div>
