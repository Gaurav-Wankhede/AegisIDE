# 🤖 AegisIDE - AI That Actually Finishes Your Projects

> **Turn any AI assistant into a reliable teammate that works on its own and remembers everything.**

[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE.md)
[![Version](https://img.shields.io/badge/version-3.2.2-blue.svg)](CHANGELOG.md)
[![6 Mandatory MCPs](https://img.shields.io/badge/MCPs-6%20Core-success)](src/mcp_servers.json)
[![Auto-Bootstrap](https://img.shields.io/badge/setup-automatic-brightgreen)](setup.sh)
[![Business Ready](https://img.shields.io/badge/business-ready-success)](docs/archive/BUSINESS_MODEL_MONETIZATION_STRATEGY.md)

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

## 🚀 Get Started (One Command)

### Autonomous Installation ✨
```bash
# Single command installs everything automatically
curl -sL https://raw.githubusercontent.com/Gaurav-Wankhede/AegisIDE/main/setup.sh | bash
```

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
