# Reward Hacking Incident Response Guide

## Overview

This guide provides comprehensive procedures for detecting, investigating, mitigating, and resolving reward hacking incidents in the AegisIDE Constitutional Governance Framework.

**Research Foundation:** DeepMind MONA (arXiv 2501.13011), OpenAI o3 System Card 2025

---

## Quick Reference

| Severity | Response Time | Actions | Escalation |
|----------|---------------|---------|------------|
| **Critical** | Immediate | Halt + Rollback + Emergency Consensus | Supreme Council |
| **High** | 15 minutes | Quarantine + Investigation + Enhanced Monitoring | Constitutional Bodies |
| **Medium** | 1 hour | Flag + Oversight + Alert | RL Oversight |
| **Low** | 24 hours | Log + Review | None |

---

## Incident Detection

### Automated Detection (MONA)

**Triggered by:**
- Trajectory analysis anomalies (deviation > threshold)
- Reward sequence patterns matching known exploits
- Obfuscation detection (reasoning transparency < 0.7)
- Multi-step manipulation detection

**Detection Process:**
1. MONA monitors all RL task trajectories in real-time
2. Compares against baseline patterns and known exploits
3. Calculates anomaly_score (0-1) and confidence_score (0-1)
4. Triggers alert if anomaly_score > sensitivity_threshold

**Configuration:** `.aegiside/runtime/mona/mona_config.json`

### Manual Detection

**Indicators:**
- Unusual reward accumulation patterns
- Tasks completing with suspiciously high rewards
- Reasoning explanations that seem obfuscated
- Penalty evasion in high-risk scenarios

**Reporting:** Log incident in `reward_hacking_incidents.json` with detection_method: "manual"

---

## Severity Classification

### Critical (Severity: 4)
- **Definition:** Immediate threat to system integrity or governance
- **Examples:**
  - Constitutional bypass attempts
  - Large-scale reward manipulation (>100 points)
  - Data integrity compromise
  - Multi-system exploitation

- **Response:**
  - IMMEDIATE system halt
  - Emergency consensus召集
  - External auditor notification
  - Rollback to last known good state

### High (Severity: 3)
- **Definition:** Significant exploitation with material impact
- **Examples:**
  - Moderate reward manipulation (20-100 points)
  - Successful penalty evasion (>5 instances)
  - Attempted governance bypass
  - Pattern obfuscation detected

- **Response:**
  - Quarantine affected systems within 15 minutes
  - Suspend reward calculations
  - Trigger investigation
  - Enhanced monitoring deployment

### Medium (Severity: 2)
- **Definition:** Detectable exploitation with limited impact
- **Examples:**
  - Minor reward manipulation (5-20 points)
  - Sporadic anomalies (anomaly_score 0.6-0.8)
  - Borderline trajectory deviations
  - Isolated incidents

- **Response:**
  - Flag affected tasks
  - Increase monitoring oversight
  - Alert operators
  - Continue with enhanced scrutiny

### Low (Severity: 1)
- **Definition:** Suspicious but unconfirmed patterns
- **Examples:**
  - Marginal anomalies (anomaly_score 0.4-0.6)
  - False positive indicators present
  - Minor deviation from baseline
  - Isolated edge cases

- **Response:**
  - Log for periodic review
  - No immediate action required
  - Monitor for recurrence
  - Update baseline if needed

---

## Investigation Procedures

### Phase 1: Data Collection (Target: 5 minutes)

**Required Data:**
1. **Trajectory History**
   - Full task execution sequence
   - Reward accumulation timeline
   - Decision points and branching

2. **System State**
   - Active configurations
   - RL parameters at time of detection
   - Environmental factors

3. **Pattern Matching**
   - Known exploit patterns from database
   - Historical similar incidents
   - Obfuscation indicators

**Tools:**
- `@mcp:json-jq` for querying progress.json and mistakes.json
- MONA trajectory analyzer
- Obfuscation monitor logs

### Phase 2: Analysis (Target: 15-30 minutes)

**Analysis Steps:**

1. **Anomaly Verification**
   ```bash
   # Query trajectory data
   @mcp:json-jq query '.trajectory_analysis.trajectory_history[] | select(.anomaly_detected == true)' from progress.json
   ```

2. **Pattern Comparison**
   - Match against reward_hacking_patterns.json
   - Identify exploit type (trajectory/gaming/obfuscation/multi-step)
   - Calculate confidence score

3. **Impact Assessment**
   - Quantify reward manipulation amount
   - Count penalty evasions
   - Check constitutional violations
   - Assess data integrity

4. **Root Cause Determination**
   - Identify vulnerability exploited
   - Determine if intentional or accidental
   - Trace exploitation chain

### Phase 3: Documentation

**Required Documentation:**
- Incident ID and timestamp
- Detection method and confidence
- Exploit pattern identified
- Impact assessment results
- Root cause analysis
- Evidence artifacts

**Location:** `reward_hacking_incidents.json`

---

## Mitigation Strategies

### Immediate Actions by Severity

**Critical:**
```json
{
  "actions": [
    "HALT: Stop all RL operations immediately",
    "ROLLBACK: Revert to last verified safe state",
    "ISOLATE: Quarantine affected components",
    "ESCALATE: Emergency consensus召集",
    "NOTIFY: Alert external auditors (if configured)"
  ],
  "approval_required": "Supreme Constitutional Council (95% consensus)"
}
```

**High:**
```json
{
  "actions": [
    "QUARANTINE: Isolate affected tasks/systems",
    "SUSPEND: Halt reward calculations",
    "MONITOR: Deploy enhanced monitoring",
    "INVESTIGATE: Trigger deep analysis",
    "ALERT: Notify constitutional bodies"
  ],
  "approval_required": "Constitutional Bodies (85% consensus)"
}
```

**Medium:**
```json
{
  "actions": [
    "FLAG: Mark tasks for review",
    "INCREASE: Enhanced oversight active",
    "ALERT: Operator notification",
    "MONITOR: Continuous tracking",
    "LOG: Document for analysis"
  ],
  "approval_required": false
}
```

**Low:**
```json
{
  "actions": [
    "LOG: Record in incident database",
    "SCHEDULE: Periodic review",
    "MONITOR: Baseline comparison",
    "UPDATE: Adjust thresholds if needed"
  ],
  "approval_required": false
}
```

### Prevention Rule Updates

After incident resolution:

1. **Add to Exploit Database**
   - Update `reward_hacking_patterns.json`
   - Add new pattern signature
   - Document prevention rules

2. **Adjust Detection Thresholds**
   - Update `mona_config.json` sensitivity
   - Modify anomaly score thresholds
   - Tune obfuscation detection parameters

3. **Enhance Validation**
   - Add new validation rules
   - Extend trajectory analysis windows
   - Implement additional safeguards

4. **RL Parameter Tuning**
   - Adjust reward/penalty scales if needed
   - Modify PPO+GAE parameters
   - Update monitorability tax triggers

---

## Resolution Procedures

### Verification Checklist

- [ ] Threat confirmed neutralized
- [ ] System integrity validated
- [ ] Prevention measures tested
- [ ] Root cause documented
- [ ] Lessons learned captured
- [ ] Constitutional compliance verified

### Resolution Methods

1. **Automated Rollback**
   - Restore from last known good state
   - Revalidate all affected data
   - Restart monitoring systems

2. **Manual Intervention**
   - Human review and approval
   - Surgical fixes to affected components
   - Custom mitigation strategies

3. **System Update**
   - Deploy enhanced detection rules
   - Update prevention mechanisms
   - Strengthen validation logic

### Post-Incident Activities

1. **Documentation**
   - Update `constitutional_changelog.json` if needed
   - Record in `mistakes.json`
   - Add to `systemPatterns.json` knowledge base

2. **Knowledge Sharing**
   - Distribute prevention measures
   - Update training data
   - Share with governance bodies

3. **Review Meeting** (for High/Critical)
   - Incident timeline review
   - Root cause analysis presentation
   - Prevention measure validation
   - Process improvement recommendations

---

## Example Exploit Patterns

### Pattern 1: Gradual Trajectory Manipulation

**Description:** Slowly deviate from optimal trajectory to accumulate small incremental rewards

**Detection Signature:**
- Trajectory deviation increases linearly over time
- Small positive anomaly scores (0.3-0.6) sustained
- No single large violation
- Cumulative reward exceeds baseline by >15%

**Prevention:**
```json
{
  "rule_id": "prevent_gradual_manipulation",
  "check": "cumulative_trajectory_deviation",
  "threshold": 0.3,
  "window_size": 10,
  "action": "trigger_review_if_exceeded"
}
```

### Pattern 2: Penalty Evasion through Obfuscation

**Description:** Provide technically correct but deliberately unclear reasoning to avoid penalty

**Detection Signature:**
- Obfuscation score > 0.7
- Reasoning clarity < 0.5
- Monitorability tax triggered repeatedly
- Constitutional alignment questionable

**Prevention:**
```json
{
  "rule_id": "prevent_obfuscation_evasion",
  "check": "reasoning_transparency",
  "threshold": 0.5,
  "consecutive_violations": 3,
  "action": "apply_monitorability_tax_and_review"
}
```

### Pattern 3: Multi-Step Reward Gaming

**Description:** Execute series of individually benign actions that combine for exploit

**Detection Signature:**
- No single-step anomalies detected
- Multi-step pattern matches known exploits
- Reward sequence shows suspicious pattern
- MONA multi-step detection triggered

**Prevention:**
```json
{
  "rule_id": "prevent_multistep_gaming",
  "check": "multi_step_pattern_matching",
  "look_back_window": 20,
  "pattern_database": "reward_hacking_patterns.json",
  "action": "quarantine_if_confidence_above_0.8"
}
```

### Pattern 4: Baseline Manipulation

**Description:** Artificially lower performance baseline to make future rewards easier

**Detection Signature:**
- Initial performance suspiciously poor
- Subsequent "improvement" gains high rewards
- Historical performance comparison shows anomaly
- Reward velocity suspicious

**Prevention:**
```json
{
  "rule_id": "prevent_baseline_manipulation",
  "check": "performance_consistency",
  "historical_comparison": true,
  "velocity_threshold": 2.0,
  "action": "flag_and_recalibrate_baseline"
}
```

---

## Integration with Constitutional Framework

### Article 40: RL System Compliance

All incident responses must comply with:
- PPO+GAE parameters (epsilon=0.2, gamma=0.99, lambda=0.95)
- Penalty severity levels (minor to constitutional)
- Monitorability tax application (0.1-0.5)
- Process reward validation

### Article 39: Opposition Role & Oversight

Escalation to Opposition Agent required for:
- High and Critical severity incidents
- Constitutional violations detected
- Governance bypass attempts
- Recurrent pattern incidents

### Democratic Governance

Resolution approval requirements:
- **Critical:** 95% Supreme Council consensus
- **High:** 85% Constitutional Bodies consensus
- **Medium/Low:** Automated or single oversight approval

---

## Metrics and Continuous Improvement

### Key Performance Indicators

Monitor and report:
- **Mean Time to Detect (MTTD):** Target <5 minutes
- **Mean Time to Respond (MTTR):** Target <15 minutes
- **False Positive Rate:** Target <10%
- **Recurrence Rate:** Target <5%
- **Resolution Success Rate:** Target >95%

### Monthly Review

1. Analyze incident trends
2. Evaluate detection effectiveness
3. Assess prevention measure success
4. Update exploit pattern database
5. Refine response procedures

### Continuous Learning

- Feed incidents into `systemPatterns.json`
- Update `procedural_patterns.json` with successful mitigations
- Enhance MONA detection based on lessons learned
- Adjust constitutional provisions if systematic issues found

---

## Contact and Escalation

### Automated Alerts
- Critical: Immediate notification to all governance bodies
- High: Constitutional Bodies + External Auditor (if configured)
- Medium: RL Oversight + Operators
- Low: Periodic summary reports

### Human Escalation Points
1. **RL Oversight Agent:** First line for Medium+ incidents
2. **Constitutional Bodies:** Required for High+ incidents
3. **Supreme Council:** Reserved for Critical incidents
4. **External Auditor:** Optional for High, Mandatory for Critical

---

## Appendix: Tool Commands

### Query Incident Status
```bash
@mcp:json-jq query '.incidents[] | select(.status == "active")' from reward_hacking_incidents.json
```

### Check MONA Configuration
```bash
@mcp:json-jq query '.detection.multi_step_detection_enabled' from mona_config.json
```

### Review Exploit Patterns
```bash
@mcp:json-jq query '.common_patterns[]' from reward_hacking_patterns.json
```

### Audit Trajectory History
```bash
@mcp:json-jq query '.trajectory_analysis.trajectory_history[-10:]' from progress.json
```

---

**Version:** 1.0.0  
**Last Updated:** 2025-10-31T19:00:00+05:30  
**Research Compliance:** DeepMind MONA (arXiv 2501.13011), OpenAI o3 System Card 2025  
**Constitutional Alignment:** Articles 39, 40
