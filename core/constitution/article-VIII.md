---
trigger: always_on
---

# Preamble

We, the Autonomous AI Development System, establish this Constitutional Framework to ensure efficient, high-quality, and client-aligned software development through structured governance, continuous autonomous operations, and unwavering commitment to actual client requirements as defined in roadmap.md.

---

## Article VIII: Automated Operations & Terminal Safety

### 100% Autonomous with Approval for Harmful Operations Only

**Philosophy**: Execute all development operations autonomously. Request approval ONLY for file deletion or harmful system changes.

### File Editing Hierarchy (MANDATORY)

**CRITICAL RULE**: Check file existence BEFORE choosing tool:
- **Existing File** → MUST use `replace_file_content` (Direct Edit)
- **New File** → Use `write_to_file`
- **NEVER use write_to_file on existing files** (causes hallucination error)

**ALWAYS use this order** when editing files:

**1. Direct Edit (PRIMARY)**: Use `replace_file_content` tool first
- For ALL existing files (MANDATORY)
- Fastest and most reliable method
- Precise line-by-line replacements
- Execute immediately without asking

**2. Filesystem MCP (FALLBACK)**: If direct edit fails
- Use `@mcp:filesystem` tools (`mcp3_edit_file`, `mcp3_write_file`)
- Apply only when direct edit unavailable

**3. Terminal Edit (LAST RESORT)**: If both methods fail
- Use `sed -i` (Linux/macOS) or PowerShell (Windows)
- Requires approval for system file modifications

**CRITICAL**: NEVER ask "Which method?" - Follow hierarchy at 0-98% autonomy

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

This protocol is subject to the compliance standards in **Article XI** and the validation requirements in **Article XIII**.

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
5. Logging: systemPatterns.json audit trail
6. **Rollback**: Git tracking for recovery

### Enhanced Auto-Approved Command Categories

**Development and Build Operations** (Execute Immediately with SafeToAutoRun=true):

**Language-Specific Build Commands**:
- **Rust**: `cargo check`, `cargo check --all-targets`, `cargo clippy`, `cargo clippy -- -D warnings`, `cargo fmt`, `cargo fmt --check`, `cargo test --no-run`, `cargo build --release`, `cargo doc`, `cargo audit`, `cargo tree`, `cargo metadata`
- **Python**: `python -c`, `python -m py_compile`, `python -m pytest --collect-only`, `basedpyright .`, `mypy .`, `black --check`, `black --diff`, `flake8`, `pylint`, `isort --check-only`, `pip freeze`
- **JavaScript/TypeScript**: `npm test`, `npm run build`, `npm run lint`, `npm run format`, `pnpm typecheck`, `pnpm build`, `pnpm test`, `pnpm lint`, `npx tsc --noEmit`, `npx eslint .`, `npx prettier --check`, `yarn test`, `yarn build`, `yarn typecheck`
- **Go**: `go build ./...`, `go test -run=^$ ./...`, `go vet ./...`, `gofmt -l .`, `goimports -l .`, `golint ./...`, `go mod tidy`, `go mod verify`, `go mod download`
- **Java**: `mvn compile`, `mvn test-compile`, `mvn validate`, `mvn dependency:tree`, `./gradlew compileJava`, `./gradlew compileTestJava`, `./gradlew check`, `javac -cp`, `java -version`, `mvn -version`
- **C#**: `dotnet build`, `dotnet build --no-restore`, `dotnet test --no-build`, `dotnet format --verify-no-changes`, `dotnet restore`, `dotnet --version`, `dotnet --info`
- **PHP**: `php -l`, `php -v`, `php -m`, `php -i`, `composer validate`, `composer install --dry-run`, `phpstan analyse --dry-run`, `php-cs-fixer fix --dry-run`
- **Ruby**: `ruby -c`, `ruby -v`, `gem list`, `bundle --version`, `bundle exec rubocop --dry-run`, `bundle install --dry-run`, `rails routes`, `rake -T`

**File Operations** (Within Project Scope):
- **Creation**: `touch`, `mkdir -p`, `echo >`, `printf >`, `tee`
- **Modification**: `cp`, `mv` (within project directory only)
- **Permissions**: `chmod` (non-777 permissions), `chown` (current user only)
- **Analysis**: All linting tools in dry-run/check mode, formatting tools in check mode, static analysis tools (non-modifying), code coverage analysis tools, documentation generators

**System Information and Analysis**:
- **Process Information**: `ps`, `top`, `htop`, `free`, `uptime`, `whoami`, `id`
- **File System**: `du`, `df`, `locate`, `which`, `whereis`
- **Text Processing**: `grep`, `ripgrep`, `rg`, `fd`, `sed -n` (read-mode), `awk` (read-mode), `sort`, `uniq`, `cut`

### Platform-Specific Safety Protocols

**Linux/Unix Safety Framework**:
- **Auto-Approved Shell Operations**: `bash -c "read-only commands"`, `zsh -c "read-only commands"`
- **Package Information**: `dpkg -l`, `rpm -qa`, `yum list installed`, `apt list --installed`
- **Archive Operations**: `tar -tf` (list contents), `zip -sf` (show files)
- **Network Analysis**: `netstat -tuln`, `ss -tuln`, `ping -c 4`, `traceroute`
- **Log Analysis**: `journalctl --no-pager`, `tail -f /var/log/*` (read-only)

**Windows Safety Framework**:
- **Auto-Approved PowerShell**: `PowerShell -Command "read-only operations"`
- **System Information**: `Get-Content`, `Get-ChildItem`, `Get-Location`, `Get-Process`, `Get-Service`
- **Text Processing**: `Select-String`, `Measure-Object`, `Sort-Object`, `Where-Object`
- **Registry Read**: `Get-ItemProperty` (read-only registry access)
- **Network Information**: `Get-NetAdapter`, `Test-NetConnection`, `Get-DnsClientServerAddress`

**macOS Safety Framework**:
- **System Information**: `system_profiler`, `sw_vers`, `uname -a`, `sysctl -a`
- **Application Management**: `defaults read`, `launchctl list`, `pkgutil --pkgs`
- **Network Analysis**: `networksetup -listallhardwareports`, `dscacheutil -q host`

### Enhanced Security Validation Matrix

**Command Risk Assessment Framework**:

**Low Risk (0-25%) - Auto-Execute**:
- Read-only file operations within project scope
- Information gathering commands with no side effects
- Build and test commands in dry-run or check modes
- Version control status and diff operations
- Code quality analysis and linting (read-only)

**Medium Risk (26-50%) - Auto-Execute with Monitoring**:
- File creation and modification within project boundaries
- Build and compilation operations producing artifacts
- Test execution with isolated environments
- Package management information gathering
- Development server startup (local scope only)

**High Risk (51-75%) - Require Approval**:
- File deletion operations of any scope
- Network operations with external endpoints
- System configuration modifications
- Package installation and system updates
- Administrative privilege requirements

**Critical Risk (76-100%) - Forbidden**:
- System-wide destructive operations
- Root/administrator privilege escalation
- Critical system service modifications
- Network security configuration changes
- Cross-system propagation commands

### Comprehensive Path Validation System

**Project Boundary Enforcement**:
- **Whitelist Paths**: Current working directory and subdirectories
- **Temporary Paths**: `/tmp`, `%TEMP%`, build output directories
- **Cache Paths**: `.cache`, `node_modules/.cache`, `target/debug`, `target/release`
- **Documentation Paths**: `docs/`, `README*`, `CHANGELOG*`, `LICENSE*`

**Restricted Path Detection**:
- **System Directories**: `/etc`, `/usr/bin`, `/sys`, `C:\Windows`, `C:\Program Files`
- **User System Paths**: `~/.bashrc`, `~/.zshrc`, `%USERPROFILE%`, registry locations
- **Network Paths**: UNC paths, mounted network drives, remote filesystems
- **Parent Traversal**: `../`, `..\`, absolute paths outside project scope

**Path Sanitization Protocols**:
1. **Canonical Path Resolution**: Resolve symlinks and relative paths to absolute forms
2. **Boundary Verification**: Confirm all operations remain within approved project boundaries
3. **Blacklist Checking**: Verify paths do not match system-critical or restricted locations
4. **Permission Verification**: Ensure current user has appropriate access rights
5. **Logging Requirements**: Record all path access attempts for security auditing

### Advanced Command Validation

**Multi-Layer Validation**: Syntax analysis, behavioral analysis, real-time monitoring
**Cross-Platform Translation**: Universal command mapping with platform optimization
**Emergency Response**: Immediate containment, impact assessment, recovery strategy, incident documentation
**Security Response**: Threat classification, recovery planning, prevention enhancement
**Compliance Monitoring**: Framework adherence and performance standards verification
- **Audit Trail Generation**: Maintain comprehensive logs for security auditing

**Quality Metrics**:
- **Success Rates**: Track command execution success and safety incident frequency
- **Performance Metrics**: Measure speed, resource utilization, and user satisfaction
- **Continuous Improvement**: Identify enhancement opportunities for safety and efficiency
