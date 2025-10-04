# Security Policy

**AegisIDE v2.7.0** - Constitutional Framework Security with JSON-First Architecture

## Reporting a Vulnerability

If you discover a security vulnerability in AegisIDE's constitutional framework, platform implementations, or autonomous operations:

### Preferred Reporting Methods
1. **GitHub Security Advisory** (Recommended): Use the "Security" tab on the repository
2. **GitHub Issues**: Create private issue titled "Security: Confidential Vulnerability Report"
3. **Direct Message**: Contact maintainer via GitHub profile for sensitive disclosures

### Required Information
Please include:
- **Affected Version**: Specify AegisIDE version (e.g., v2.5.0)
- **Platform**: Which IDE/platform (Windsurf, Cursor, Cline, JetBrains, etc.)
- **Component**: Constitutional framework, memory-bank, MCP integration, terminal safety, etc.
- **Reproduction Steps**: Detailed steps to reproduce the vulnerability
- **Impact Assessment**: Severity and potential exploitation scenarios
- **Suggested Mitigation**: Any known workarounds or fixes

## Supported Versions

| Version | Supported | Status |
|---------|-----------|--------|
| 2.7.x   | ✅ Yes    | Current - JSON Architecture + Schema Validation |
| 2.6.x   | ✅ Yes    | Supported - Security fixes |
| 2.5.x   | ⚠️ Limited | Critical fixes only |
| < 2.5   | ❌ No     | Upgrade required |

## Security Features

### Constitutional Security
- **Terminal Safety Protocol**: Auto-approved vs approval-required command classification
- **Cross-Platform Safety**: Linux/macOS/Windows command validation
- **Forbidden Operations**: Blocked destructive commands (rm -rf /, format, etc.)
- **Audit Trails**: All operations logged in systemPatterns.json with schema validation
- **JSON Schema Validation**: All 16 JSON files validated against core/schemas/ on every read/write

### Framework Security
- **Tri-Branch Governance**: Democratic oversight with >95% consensus requirements
- **Judicial Review**: Chief Justice authority for security-critical decisions
- **Memory-Bank Isolation**: Project-specific context boundaries with 17-file structure
- **JSON Data Integrity**: Schema validation prevents corruption and injection attacks
- **MCP Security**: Validated integration with 9 external MCP servers
- **File Size Limits**: ≤10KB per JSON file prevents context overflow attacks

### Data Privacy
- **User-Controlled API Keys**: No centralized key storage
- **Local-First Architecture**: All processing within user environment
- **No Telemetry**: Zero data collection or tracking
- **Open Source Transparency**: Full code review capability

## Security Update Process

1. **Vulnerability Received** → Acknowledgment within 48 hours
2. **Triage & Assessment** → Security team evaluates severity
3. **Fix Development** → Patch created with democratic consensus if needed
4. **Security Advisory** → Published after fix deployment
5. **Credit Attribution** → Researcher acknowledged in CHANGELOG.md

## Responsible Disclosure

We appreciate responsible disclosure and will:
- Acknowledge researchers in release notes and CHANGELOG.md
- Provide credit in GitHub Security Advisories
- Maintain confidentiality until patch is released
- Work collaboratively on mitigation strategies

## Security Contacts

**Maintainer**: Gaurav Wankhede
- **GitHub**: [@Gaurav-Wankhede](https://github.com/Gaurav-Wankhede)
- **LinkedIn**: [linkedin.com/in/wankhede-gaurav](https://www.linkedin.com/in/wankhede-gaurav)
- **Portfolio**: [gaurav-wankhede.vercel.app](https://gaurav-wankhede.vercel.app)
- **Response Time**: 24-48 hours for critical vulnerabilities

---

**Last Updated**: 2025-10-04 | **Version**: 2.7.0 | **Status**: Active Security Support ✅
