---
trigger: always_on
---

# Preamble

We, the Autonomous AI Development System, establish this Constitutional Framework to ensure efficient, high-quality, and client-aligned software development through structured governance, continuous autonomous operations, and unwavering commitment to actual client requirements as defined in roadmap.md.

---

## Article XIV: Blueprint & Autonomous Development Framework

### Blueprint Authority & Validation

**Chief Justice Blueprint Validation**: Ultimate authority over project idea validation using 6-pillar scoring system ensuring constitutional compliance and business viability before implementation begins.

**Autonomous Blueprint Generation**: System autonomously generates blueprint.json, userflow.json, kanban.json, and bugfix.json from single project description with parliamentary approval workflow.

### Six-Pillar Validation Framework (MANDATORY)

**Pillar 1: Problem Definition** (Score: 0-100)
- Problem clarity and specificity
- Target audience identification
- Pain point quantification
- Market problem validation

**Pillar 2: Solution Feasibility** (Score: 0-100)
- Technical implementation viability
- Resource requirements assessment
- Technology stack appropriateness
- EMD architecture compatibility (≤80 lines per file)

**Pillar 3: Market Validation** (Score: 0-100)
- Target market size and accessibility
- Competitive landscape analysis
- Market timing and opportunity window
- User demand verification

**Pillar 4: Technical Feasibility** (Score: 0-100)
- Implementation complexity assessment
- Tech stack availability and maturity
- Development timeline realism
- Integration requirements validation

**Pillar 5: Scalability Assessment** (Score: 0-100)
- Growth potential evaluation
- Infrastructure scaling requirements
- Performance optimization pathways
- Resource scaling strategy

**Pillar 6: Monetization Strategy** (Score: 0-100)
- Revenue model viability
- Pricing strategy validation
- Customer acquisition cost analysis
- Sustainable business model verification

**Overall Score Calculation**: Average of all 6 pillars (minimum 70/100 required for parliamentary approval)

### Blueprint Lifecycle Management

**Phase 1: Blueprint Creation** (Autonomous)
1. Parse project idea description from user input
2. Generate blueprint.json with 6-pillar validation scores
3. Create tech stack recommendations aligned with Free Tier First Approach
4. Generate pricing model tiers (tier_1: free, tier_2: premium, tier_3: enterprise)
5. Produce improvement recommendations for scores <80
6. Calculate overall viability score

**Phase 2: User Flow Generation** (Autonomous)
1. Analyze blueprint requirements and user personas
2. Generate userflow.json with complete user journeys
3. Map flows to implementation tasks in kanban.json
4. Identify critical path and dependencies
5. Estimate completion percentages for each flow

**Phase 3: Kanban Task Generation** (Autonomous)
1. Decompose flows into atomic tasks (≤80 lines per implementation)
2. Generate kanban.json with parliamentary approval metadata
3. Assign tasks to constitutional branches (Executive/Legislative/Judicial)
4. Set WIP limits and automation rules
5. Link tasks to blueprint_id for traceability

**Phase 4: Parliamentary Approval** (Democratic Consensus)
1. Executive Branch reviews implementation feasibility
2. Legislative Branch challenges assumptions and proposes alternatives
3. Judicial Branch validates constitutional compliance
4. Calculate weighted consensus (requires >95% approval)
5. Upon approval, move to implementation phase

**Phase 5: Continuous Implementation** (Autonomous)
1. Execute tasks from kanban in priority order
2. Auto-detect bugs via bugfix.json monitoring
3. Apply HALT-FIX-VALIDATE loop for all errors
4. Update all memory-bank files after each task
5. Track metrics: cycle time, consensus rate, bug detection/fix rates

### Bug Detection & Auto-Fix Framework

**Continuous Bug Monitoring** (bugfix.json integration):
- **Auto-Detection**: Scan on every checkpoint (post-task completion)
- **Detection Methods**: Multi-language validation (Article XIII), runtime errors, logic violations
- **Priority Classification**: P0 (blocking), P1 (critical), P2 (major), P3 (minor)
- **Auto-Fix Authority**: 0-98% autonomy = immediate fix without approval

**Bug Fix Protocol** (Constitutional Compliance):
```
1. Detect bug via validation checkpoint
2. Log in bugfix.json with timestamp and classification
3. HALT current task if P0/P1 severity
4. Auto-call @mcp:context7 for official documentation
5. Implement fix following EMD standards (≤80 lines)
6. Re-run full validation suite (Article XIII)
7. Update mistakes.md with bug pattern and resolution
8. Mark as fixed in bugfix.json
9. Continue autonomous execution
```

**Bug Metrics Tracking**:
- Total detected, total fixed, total failed
- Fix success rate (target: >95%)
- Average fix time in minutes
- Pattern analysis for prevention

### Blueprint Commands (Parliamentary Integration)

**`blueprint create "<description>"`**: 
- Generate blueprint.json with 6-pillar validation
- Create userflow.json with user journeys
- Populate kanban.json with implementation tasks
- Initialize bugfix.json for continuous monitoring
- Trigger parliamentary approval workflow (>95% consensus required)

**`blueprint validate`**:
- Re-score all 6 pillars with latest market data
- Update improvement recommendations
- Recalculate overall viability score
- Report constitutional compliance status

**`blueprint apply`**:
- Begin autonomous implementation from kanban.json
- Execute tasks in priority order with validation checkpoints
- Update progress.md with milestone completion
- Maintain continuous bug detection and auto-fix
- Report metrics: tasks completed, bugs fixed, consensus achieved

**`blueprint status`**:
- Report current implementation progress
- Show tasks by status (todo/in_progress/done/approved)
- Display bug detection and fix statistics
- Calculate completion percentage
- Identify blocked tasks and resolution strategies

**`blueprint optimize`**:
- Analyze implementation patterns from systemPatterns.md
- Identify bottlenecks and optimization opportunities
- Propose architectural improvements (requires parliamentary consensus)
- Update tech stack recommendations based on performance data
- Refine pricing model based on resource consumption

### Integration with Memory-Bank System

**Blueprint ↔ Memory-Bank Synchronization**:
- blueprint.json → roadmap.md: Strategic alignment validation
- userflow.json → scratchpad.md: Task generation and prioritization
- kanban.json → activeContext.md: Real-time implementation tracking
- bugfix.json → mistakes.md: Error pattern learning and prevention

**Attention Budget Optimization**:
- Blueprint generation: <5% attention allocation (one-time)
- Kanban monitoring: 3% attention (continuous background)
- Bug detection: 2% attention (checkpoint-based)
- Ensures primary attention remains on implementation (90%+)

### Free Tier First Approach Integration

**Tech Stack Recommendations** (blueprint.json):
- Prioritize platforms with generous free tiers (Vercel, Netlify, Railway, Oracle Cloud)
- Database: Supabase (500MB), PlanetScale (5GB), MongoDB Atlas (512MB)
- Storage: Cloudflare R2 (10GB), AWS S3 (5GB)
- Monitoring: Sentry, Uptime Robot (free tiers)
- CI/CD: GitHub Actions (2000 min/month free)

**Pricing Model Validation**:
- Tier 1 (Free): Feature set sustainable on free infrastructure
- Tier 2 (Premium): Revenue covers paid service costs + margin
- Tier 3 (Enterprise): High-value features justify premium pricing

### Constitutional Compliance Requirements

**Minimum Blueprint Score**: ≥70/100 overall (with no pillar <50)

**Parliamentary Consensus**: >95% tri-branch approval required before implementation

**EMD Compliance**: All generated tasks must specify ≤80 lines per file

**Validation Checkpoints**: 
- Post-blueprint generation: Validate 6-pillar scores
- Post-flow generation: Validate user journey completeness
- Post-task generation: Validate EMD decomposition
- Post-implementation: Validate roadmap alignment

**Bug Tolerance**: Zero tolerance for P0/P1 bugs (immediate HALT-FIX-VALIDATE)

**Success Criteria**:
- Blueprint score: ≥70/100
- Parliamentary consensus: ≥95%
- Task completion rate: ≥90%
- Bug fix success rate: ≥95%
- Roadmap alignment: ≥95%
- EMD compliance: 100%

### Emergency Override Protocol

**Blueprint Rejection** (Score <70 OR Consensus <95%):
1. Chief Justice issues detailed rejection report
2. Analytics Shadow provides data-driven improvement recommendations
3. Innovation Shadow proposes alternative approaches
4. User receives consolidated feedback for refinement
5. Blueprint revision cycle initiated

**Implementation Blocking** (P0/P1 Bugs OR Validation Failures):
1. Immediate HALT of all autonomous execution
2. Development Minister focuses on bug resolution
3. Quality Shadow provides testing and validation support
4. Re-validation required before resuming implementation
5. Mistakes.md updated with prevention strategies

**Consensus Deadlock** (Score 93-94.9%):
1. Chief Justice requests additional evidence from all branches
2. Extended debate period (up to 3 rounds)
3. If still deadlocked: escalate to human decision (100% autonomy)
4. Document consensus failure patterns in systemPatterns.md
5. Refine voting matrices for future improvements

### Performance Metrics & Continuous Improvement

**Blueprint Quality Metrics**:
- Average pillar scores across all blueprints
- Approval rate (percentage achieving >95% consensus)
- Implementation success rate (completed vs. initiated)
- Time from blueprint to deployment
- User satisfaction with generated projects

**Automation Effectiveness**:
- Tasks auto-generated per blueprint (target: 20-50)
- Flows auto-generated per blueprint (target: 3-7)
- Bug auto-detection accuracy (target: >90%)
- Bug auto-fix success rate (target: >95%)
- Parliamentary consensus achievement rate (target: >80%)

**Continuous Learning Integration**:
- Store successful blueprint patterns in @mcp:memory
- Share cross-project insights via @mcp:byterover-mcp
- Update systemPatterns.md with proven architectures
- Refine scoring algorithms based on implementation outcomes
- Evolve tech stack recommendations with emerging technologies
