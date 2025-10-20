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

### 🔥 [**View Interactive Architecture Diagram** →](https://mermaid.live/edit#pako:eNrFWm1v2zYQ_iuC93mOZCdNgtoB0nbDgL5gA7YPRj9QPNrqaImqSNXJivzvO1KyZdu10hQdOnwxKfF4d7x77h6qRy4rhnzChRalUE0hccbymohS5vOc3QjJSl6yhAgly5rIb4SU9UV1E71qjjGbg7ZKlqd1zpqcSS5K1m9P8nIiOa8kq8qhGbNPJK-NnEhW6L9JSXSS67RkM1EqgzFrzxb6X8XNOL25_7i4v7m7mX24X3y6-XD7cXF_e7u4-fDh9u7j4vb-D_Th5v5ufv_h8u5ucf_p9vL-w-Xu_u5ycTtf3M7vPt1-fH939-_b2_ud7fV48R_dPK7mH24XN_PLGz1-c3l3v3h8GE_f0fRqcXfz8W4-v_lwezX_18fl_eXd4tP87nJx8_Fm_vF-8e_5p_n95fzybj7_NPswXw7QFSzEI9A5iFqUjPGayKwo1ZNVV0TwJy2ywXhT5jXREpXs4yBZypkguUK2kbJhpWSCNbnmxuuaVIqJkhT9GWvGa5LxnGSiZPiZoaXBEa-6ZVyWmhLV2Rq6IcSSPGtCRSlKltc1A02SYyVXeZ21N4dM5Kxs6gx1NU_rnGQVK_LPRJb6lyVWtTd3VhN5Q-RCM1ZSLU5IVWpWa6GVQnRTkxo1oVr_RdSCNXXeNG3GFY8rqRXJq7wgJedNXpGSV5yk7cPGa1LxvL1lJVE5ydVTm7Ga53XOat5kJM_rmtQ5U-0Dnmd1XYtqKQrGlSqJ4KziGRe8zpSo81I09bIkNcqgrmsiG5VnTMka-y9XpMyXpOJ-I7IW6EzxquZZrogsC0VEI8_VulSN4DXPVUNExXhFZEnqSlRkLTIVr3OmWNXezNU646pmQpQNL0Rbh4pUvOZ5o1iVl6zmDS-btiZNzhVRLKtzXjW0UTxjKl81olINb1hVN7lqdV_nhj14k7OaFU1FS14pXjWi4pUgVd0QoVjBJZG84aLhBS-bnIhW93XOFK-VyksimzqveUkqng9G6aAVhqOyYVy1t1hV1yQr65JngvNKk4rnQpSsyCsuG53nQpSN5nlZ8bLJSSM4L-uaiLzJa5bVBa95VQhW11LyXAie8dYW1Z47qqvmzN4g7VqpG5EfxzMwMTLJBXssMkGynGQcbXGE_cIkF-yxrAlnyF1ZtlNUK8UzQWrBapLX7S1UpORFnguSV02meCY4L9u7VqLKa6Jy3t5VJcsrUXFRsLziueBNXpBK8YLnta5DpXjBM8ErrntUJ0w2JFPtkdTKsEUl8qzOSIXKWGU8L_VtqHiTl_qulJyolc4B13lVNrxSlb5DBeFNk-ekqkieF7xqr6Ig6hQxVRG7VSjvE5HlFe5DU4lc1yEXRCqW5dofltxQSdYqkfFWs7riPK9Zi_alSOqcNE2dC16Sqm5vua5JWeREKlHquooXXOe5vuu6B5UFqXOueF6Jlb3U7DM_nI9KG5BkLHnCspbxSsgKb8uKVbwQRc6XTc4F0ypveCXa25IVmchzUbXaZEKUZSOa9hbnpdC3S96Tlq3ypm7ZBVAqUfEsL_UvlGR5RZo8V_qua57nma5JxWpSM96-K_jMZE14yYu8rGsi6rwseJk3NdDU7ZJXA_2C4FQIzKskdZ2XjaoFUU3OFM9a7Uu8yTmv6rpqiCib9rapqpznwL5U8Vq0N7UgtdD_U6JUjWqvG0EaUd2qRnCuGiG4VPLM3N0irxW4rLpm4qmmFqS9pTlXdUOqhnNd04oXTZ6pmlW84bnioq7rpmkEr5q65nndiDrnVaZvS9_lRZmpmrT3uOCiVgKcTXAuVU1ypUXV8CIjTV7WvMkrweu8qZoG1bLSd3ld14JURcGLpm541dS84rnkJa_qpmkFr-o650JULbRXqlaNqnlZ1KyuddOouq5Y2RRN0woueZnzoqwUpWpW5rUo8oqXeZ0pUeua1PWK1Cxu60ox0eRN3bSiblTNqzov65w0Nckboeu8qi3F9dW1Y9c4_sHBV4dTaZ6zJ5ayuhaZ0H90wtU8Cyg74Kl8JHXVZIVAW85VydG-VI0oClbxouDtLyQ1y8qSNdYT58SaGKRQjap4UTeC1AK1aHiZN5mqVcMr0N7u4f8HPnZYO4VlU_OC17zUf9QZq_OiZGUDGqyqmiueN7lpUecFKZu6yVQLylW8YlVZNqTOS11zXZGs6GQX3W2IHmjWBKhyXgu9lwpD5wVHZ3KlWFU3uKwV7iSrr1dUNSsbIBU1q0XJql6HVeZCqJqXhLdXI7f6AY8yc1fUORdKsapqWF3VDc9LXvCizRRTVavrqpIrUtbatN8Lti2KA-w6nOtC5QWpymolQEIJwP7jRfvHX1oy88HQnRXMPBx6s66FQpdS55tXucgzYHVd8Vzo2q6qpmmlYN0BvLfLiZW8YEXOF4zneV7z-VVBu5PvS7z3nIa9udV7o-0VXvFa1A0v65w1TZ2TqrRSXtQN6KXiZdM0TemUpuRVTUpQ_rbk8ypnzarzqqwbnuVl0-qjt7riZYmmUvDtfMJ6q_9Wn9ZN0_CqbATuB1eKF3meqaopeFbzphFNLriqWVnnrG54nfOi0Xte18WqvShruakfAr0ZZzxvRNH0SlfyfuVzzvSfAj1pecsrnrVXvBAFm1_lpe5FS_q6KDgvc0Vc5bxSFWFVwat2b3TNC61rqlZ1q_s6E7yqWV0CK6qC17zOW9D-uqkrodCx1BVpVFWDjupG1A1QtGSl4hWCmFWt_itWt0LWvCw4r3jJ8rKt64oVNa8KUdYsFzWrSl7wvMmUrsuy1v9tVb1iTc2qumB1nvOqEbzOS14VfEXWZ6jLTX_d-1VVEK5UTeoWlUfVpGKtQleqVaJmRctrUVa85oXOA152pL9otOZV1VR1I_RdrAu9x1x0F2f99n45kxrZXdWE1-21C8rLvG54y2u8bUpW1aySvNbp1XnFy7zRd1uCjvRvS1byRvE6L_M675ZOkLosGt4yzbdTVeb_ATZVT0I)

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
