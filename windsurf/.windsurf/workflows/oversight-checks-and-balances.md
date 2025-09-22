---
description: Oversight checks-and-balances workflow for Windsurf (pre/during/post constitutional compliance)
auto_execution_mode: 1
---

# Windsurf Oversight — Legislative Checks & Balances

Constitutional framework for task execution ensuring compliance with rules.xml (Legislature), Memory Bank (Executive), and safety protocols.

## Pre-Execution (Legislative Compliance Check)
**Purpose**: Validate task alignment with constitutional framework before execution

### Constitutional Review
- [ ] **Primary Law**: Read `.windsurf/rules/constitution.md`
- [ ] **Secondary Guidance**: Read all files under `.windsurf/docs/` and `.windsurf/guide/`
- [ ] **Executive Context**: Load Memory Bank (all 7 core files: projectbrief, productContext, activeContext, systemPatterns, techContext, progress, mistakes)

### Legislative Hierarchy Validation
- [ ] **Precedence Check**: Constitution > Oversight > Executive (Memory Bank) > Docs/Workflows
- [ ] **Rule Compliance**: Verify task aligns with constitutional mandates (rules 1-67)
- [ ] **Authority Check**: Confirm proper MCP tool selection per constitutional guidelines
- [ ] **Scope Validation**: Ensure task falls within authorized project boundaries

### Risk Assessment
- [ ] **Security Review**: No secrets exposure, proper auth patterns
- [ ] **Performance Impact**: Memory/CPU considerations for serverless deployment
- [ ] **Breaking Changes**: Validate against existing system patterns
- [ ] **Dependency Conflicts**: Check for version/compatibility issues

## During Execution (Active Monitoring)
**Purpose**: Continuous constitutional compliance during task execution

### Execution Protocols
- [ ] **Safe Parallelization**: Independent reads/searches only (NEVER writes/edits/terminal commands)
- [ ] **Validation Gates**: Continuous import/syntax checking with diffs and logs
- [ ] **Decision Logging**: Record all decisions with timestamps and constitutional citations
- [ ] **Error Handling**: Immediate correction on constitutional violations

### Quality Assurance
- [ ] **Code Standards**: Follow established patterns from systemPatterns.md
- [ ] **Documentation**: Update relevant files with decisions and rationale
- [ ] **Testing**: Validate changes against success metrics from projectbrief.md

## Post-Execution (Checks & Balances Validation)
**Purpose**: Audit completed work for constitutional compliance and system integrity

### Executive Updates
- [ ] **Memory Bank Sync**: Update activeContext.md and progress.md with current state
- [ ] **Decision Archive**: Document architectural decisions in systemPatterns.md
- [ ] **Progress Tracking**: Update phase status and milestone completion

### Constitutional Audit
- [ ] **Rule Adherence**: Verify all 67 constitutional rules were followed
- [ ] **Quality Gates**: Confirm success metrics alignment (performance, security, testing)
- [ ] **System Integrity**: Validate no breaking changes to established patterns
- [ ] **Documentation Completeness**: Ensure all decisions are properly recorded

### Compliance Reporting
- [ ] **Issue Documentation**: Record any violations or issues in mistakes.md
- [ ] **Improvement Opportunities**: Note optimization possibilities for future work
- [ ] **Rollback Readiness**: Confirm ability to revert changes if needed
- [ ] **Handoff Preparation**: Ensure next executor has complete context

## Emergency Protocols
- **Constitutional Violation**: Immediate halt and correction required
- **System Integrity Risk**: Rollback to last known good state
- **Security Breach**: Immediate containment and audit
- **Performance Degradation**: Optimization or rollback decision required

## Oversight Authority
This workflow operates under constitutional mandate and supersedes individual preferences when constitutional compliance is at stake.