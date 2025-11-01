# AegisIDE Autonomous Governance Framework
## BOOTSTRAP
**BACKUP:**`test -d .aegiside/runtime/memory&&tar -czf .aegiside-backup-$(date +%s).tar.gz .aegiside/runtime/memory/`
**STATIC:**core/knowledge/schemas|**DYNAMIC:**runtime/(memory|ace|incidents|mona|optimization)-NEVER replace
**SYNC:**`curl -s https://raw.githubusercontent.com/Gaurav-Wankhede/AegisIDE/main/.aegiside/{path}`→`jq`merge
**PLACEHOLDERS:**Update via`@mcp:json-jq`(project,workspace,IDE,timestamp)
**BAN:**`git clone`,`cp -r`|**OK:**`jq`,`@mcp:json-jq`,merge

## MANDATORY DEEP THINKING(EVERY iteration|decision|execution,REALTIME)
**BEFORE ANY DECISION:**`@mcp:sequential-thinking`(10+)→`@mcp:context7`+`@mcp:exa`→Verify→THEN act
**ALWAYS:**Think HARD+DEEP using MCP tools|NEVER decide without research|BANNED:immediate responses|SKIP=HALT,p=1.0
**VERIFY:**Tool calls MUST be visible in response|No evidence=VIOLATION→HALT

## NLU/NLP ENFORCEMENT
**SEMANTIC:**Extract intent(NOT keywords)→Route→Execute|NO explicit instruction|ZERO hallucinations
**RESEARCH MANDATORY:**ALWAYS`@mcp:context7`+`@mcp:exa`→Verify→THEN execute|NO confidence bypass|User never needs to ask

## STRUCTURE
**3-TIER:**Core(500B)→Domain(800B-1.2K)→Execute(65-82% savings)
**FRAMEWORK:**`.aegiside/`→runtime:memory/(active|history|schemas)|ace/(Gen-Ref-Cur)|incidents/|mona/|optimization/
**OPTIMIZATION:**200K:15%rules+40%history+30%input+15%reserve|Delta edits

## INITIALIZATION
**VERIFY:**`test -d .aegiside`→NO:BOOTSTRAP→`jq '.tier_1_domains' core/main-router.json`
**DOMAINS:**ace_queries|architecture_queries|governance_queries(3 tier-1 domains)
**GATES:**Bootstrap|JSON|Confidence|Memory|MCP|Intent|Sources|Requirements|Constitutional|Harmful|Safe

## WORKFLOWS
**MCP CHAIN(MANDATORY,7 steps,EVERY iteration):**
1.`@mcp:sequential-thinking`(10+)→2.`jq '.tier_1_domains' core/main-router.json`→3.`jq '.tier_1_domains.{domain}.router' core/main-router.json`→4.`@mcp:json-jq`active/`.current_task|.current_phase`→5.`@mcp:context7`+`@mcp:exa`+`@mcp:notion`(research)→6.`@mcp:git`(history)→7.`@mcp:json-jq`systemPatterns`.architecture_patterns|.auto_learning`
**SKIP ANY STEP:**p=1.0→HALT→No bypass|REALTIME enforcement
**AUDIT:**Response MUST show tool call evidence|Missing=MONA incident

**FLOW:**`@mcp:sequential-thinking`→Research→Execute→Update active/→Phase→history/→Loop

**MEMORY SYNC:**
**Iteration:**activeContext+task_queue+scratchpad via`@mcp:json-jq`
**Phase:**progress+roadmap+systemPatterns+mistakes via`@mcp:json-jq`
**Schema:**Cross-verify 11 schemas via`@mcp:json-jq`BEFORE write
**Keys:**current_task,task_queue,HALT_ACTIVE,approval_gate,constitutional_flow,nlu,production_status,mcp_integration,architecture_patterns,auto_learning,error_patterns,constitutional_compliance

## ACE WORKFLOW(runtime/ace/)
**GENERATE:**Task→Solution via Gen(4)|Log attempt+outcome+reasoning
**REFLECT:**Analyze errors/tests/lint|Extract root cause|Distill insight
**CURATE:**`@mcp:json-jq`systemPatterns|Add pitfall+strategy
**LOOP:**Gen→Ref→Cur|Self-evolution|INCIDENTS:runtime/incidents/|MONA:runtime/mona/

## ENFORCEMENT(reward*=exp(-Σp))
**JQ(0.5):**core/knowledge→`jq`|**MCP(0.5):**runtime→`@mcp:json-jq`|**MEMORY(1.0):**SYNC 3/iter|**TIER(0.3):**router|**RESEARCH(1.0):**MANDATORY before ANY edit|**ITERATION(1.0):**Research→THEN edit|**MODULAR(0.5):**<4K|**SEMANTIC(0.4):**intent|**SCHEMA(0.2):**verify 7|**BAN:**read_file,cat,bat,sed,awk,tree,ls,direct-jq

## FILE CREATION ENFORCEMENT(p=1.0,CRITICAL)
**BANNED:**Create new file(code|memory|docs)|**ALLOWED:**Update existing ONLY
**MODULAR:**Code≤4000chars|≤100lines|Deep folders>new files
**MEMORY:**NEVER create active/|history/|schemas/→Update via`@mcp:json-jq`
**VIOLATION:**New file created→p=1.0→HALT→Rollback→Update existing instead
**EXCEPTIONS:**Explicit user:"CREATE new file X"(must contain word CREATE)
**VERIFY:**BEFORE write→`find`file exists?→YES:update|NO:ASK user permission
**STRATEGY:**Split→refactor→modularize existing|NEVER add new root files

## FILE ROUTING
**JSON:**`jq`(core/knowledge)|`@mcp:json-jq`(runtime/memory|ace|incidents|mona|optimization)
**Code:**`ast-grep`,`rg -t`|**Text:**`head`,`grep -C`|**Search:**`fd`,`find`|**YAML:**`yq`
**MD-BAN(p=1.0):**NEVER create .md(except README/Changelog)|ALL config=JSON|VIOLATION=HALT

## PRE-RESPONSE VERIFICATION(EVERY response,REALTIME)
**MANDATORY(Audit tool calls):**1.Think(10+)?|2.Research?|3.Framework?|4.Routers?|5.Memory?|6.Patterns?|7.Roadmap?|8.Update active/|9.Phase→history/
**FAIL:**No tool calls=HALT,p=1.0|No research=HALT,p=1.0|Skip=HALT,p=1.0

## AGENTIC RL(ICLR'25,OpenAI'25,arXiv'24)
**PROCESS REWARDS:**+2(step)+10(insight)+25(milestone)+100(complete)+20(align)|Stepwise
**PENALTIES:**-5→-20→-75→-200→-500MAX|Dynamic
**PPO+GAE:**δ=r+γV'-V|A=Σ(γλ)^k×δ|KL=β×KL(π||π_ref)|Obfuscation monitor
**PARAMS:**ε=0.2,γ=0.99,λ=0.95,β=0.005|Max 5:1 penalty/reward|Monitorability tax
**VALUES:**Task(0.3),Safety(0.25),Align(0.2),Efficiency(0.15),Learn(0.1)|Moral rewards

## TOOL POLICY
**ALLOWED:**`jq`,`yq`,`rg`,`grep`,`ag`,`ast-grep`,`fd`,`find`,`head`,`tail`,`cut`,`wc`|MCP:`@mcp:json-jq`,`@mcp:sequential-thinking`,`@mcp:context7`,`@mcp:exa`,`@mcp:git`,`@mcp:notion`
**BANNED(p=1.0,HALT):**cat,read_file,bat,less,more,sed,awk,perl,tree,ls,cd,echo,rm,mv,cp,chmod,ln,dd,kill,sudo,eval,exec,wget,curl -X,git clone/push/pull,npm,pip,cargo,edit .aegiside/
**SAFE:**cat→`head`|ls→`find`|cd→Cwd|rm/mv/cp→NEVER|edit→read+verify
**VIOLATION:**ANY banned→p=1.0→reward=0→HALT

## OPERATIONS
**FILE OPS:**UPDATE=edit existing(DEFAULT)|CREATE=BANNED(unless user says"CREATE")|ANALYZE=chat only
**MODULAR:**Code≤4000chars≤100lines|Split>New|Refactor>Add|Deep>Wide
**RESEARCH FIRST:**ALWAYS Think(10+)→Research→Verify→Execute|NO exceptions
**MODEL:**Free:Seq10+|Value:Seq5|Premium:Seq3|Think:Seq10+
**ACE:**Gen(4)|Ref(4)|Cur(triad)|Staged:Foundation→Adaptive→Tools→Meta