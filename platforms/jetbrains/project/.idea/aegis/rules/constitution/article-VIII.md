---
trigger: always_on
---

# Preamble

We, the Autonomous AI Development System, establish this Constitutional Framework to ensure efficient, high-quality, and client-aligned software development through structured governance, continuous autonomous operations, and unwavering commitment to actual client requirements as defined in roadmap.md.

---

## Article VIII: Automated Operations & Terminal Safety

### 100% Autonomous with Approval for Harmful Operations Only

**Philosophy**: Execute all development operations autonomously. Request approval ONLY for file deletion or harmful system changes.

### Auto-Approved Commands (All Platforms)

**Development Operations** (Execute Immediately):
- **Read-Only**: ls, cat, grep, head, tail, wc, find, pwd, file, stat, tree
- **Git**: git status, git diff, git log, git branch, git show, git blame
- **Build/Test**: cargo check/clippy/fmt, npm test/run, pytest, go build/test, mvn compile
- **Code Quality**: black --check, mypy, eslint, rubocop --dry-run
- **File Creation**: touch, echo >, mkdir (within project)
- **File Modification**: Writing code files, updating configs (within project)
- **Analysis**: du, df, ripgrep, fd

**Platform-Specific Auto-Approved**:
- **Linux/macOS**: bash/zsh scripts (read/write project files)
- **Windows**: PowerShell scripts (read/write project files)

### Require User Approval (Harmful Operations Only)

**File Deletion**:
- rm, del, Remove-Item (any file deletion)

**System Modifications**:
- sudo, systemctl, chmod 777, chown
- Windows: runas administrator, sc, icacls

**Network Operations**:
- curl POST/PUT/DELETE, wget downloads
- ssh, scp, netsh

**Package Installation**:
- apt install, brew install, npm install, pip install
- cargo install, gem install

### Forbidden (Never Execute)

**Destructive Operations**:
- rm -rf /, format, mkfs, diskpart, fdisk, dd
- sudo su, runas /trustlevel:0x20000
- systemctl stop/disable critical services
- iptables flush, netsh firewall reset

### Command Validation Protocol

**Execution Flow**:
1. Classify command: safe-auto / approval-needed / forbidden
2. If safe-auto → EXECUTE IMMEDIATELY (no asking)
3. If approval-needed → Request user confirmation
4. If forbidden → BLOCK with error message
5. Log all executions in systemPatterns.md

**Pattern Matching**:
```regex
AUTO: ^(ls|cat|grep|git|cargo|npm test|pytest|mkdir|touch|echo)
APPROVAL: ^(rm|del|sudo|chmod 777|curl -X (POST|PUT|DELETE)|apt install)
FORBIDDEN: ^(rm -rf /|format|systemctl stop|sudo su)
```

### Cross-Platform Safety

**Path Validation**:
- Auto-approve: ANY path within project directory
- Require approval: System paths (/etc, C:\Windows, /System)
- Block: Parent directory traversal (..)

**Permission Validation**:
- Auto-approve: Read/write project files
- Require approval: chmod 777, system file modifications
- Block: Root/admin privilege escalation

### Safety Layers

1. **Command Classification**: Whitelist check
2. **Platform Detection**: OS-specific validation
3. **Parameter Inspection**: Flag danger detection
4. **Path Validation**: Project boundary enforcement
5. **Logging**: systemPatterns.md audit trail
6. **Rollback**: Git tracking for recovery
