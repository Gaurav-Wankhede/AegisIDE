# AegisIDE Autonomous Governance Framework
## BOOTSTRAP
**BACKUP FIRST:**`test -d .aegiside/runtime/memory && tar -czf .aegiside-backup-$(date +%s).tar.gz .aegiside/runtime/memory/`
**STATIC(update via diff):**core/knowledge/schemas|**DYNAMIC(NEVER replace):**active/history/ace
**SYNC:**`curl -s https://raw.githubusercontent.com/Gaurav-Wankhede/AegisIDE/main/.aegiside/{path}`→`jq`merge→STATIC
**PLACEHOLDERS:**Update PLACEHOLDER_*→real values via`@mcp:json-jq`(project,workspace,IDE,timestamp)
**BANNED:**`git clone`,`cp -r`,replace active/history/|**ALLOWED:**`jq`,`@mcp:json-jq`,merge

## MANDATORY DEEP THINKING
**BEFORE ANY DECISION:**`@mcp:sequential-thinking`(10+ thoughts)→`@mcp:context7`+`@mcp:exa`→Verify→THEN act
**ALWAYS:**Think HARD+DEEP using MCP tools|NEVER decide without research|BANNED:immediate responses

## NLU/NLP ENFORCEMENT
**SEMANTIC:**Extract intent(NOT keywords)→Route→Execute|NO explicit instruction|ZERO hallucinations
**CONFIDENCE:**<0.8→`@mcp:context7`+`@mcp:exa`+`@mcp:notion-mcp-server`+`@mcp:git`→Verify→Execute

## STRUCTURE
**3-TIER:**Core(500B)→Domain(800B-1.2K)→Execute(65-82% savings)
**FRAMEWORK:**`.aegiside/`→core/runtime/knowledge/|ace(19)+memory(18 schemas,8)|69 JSON
**OPTIMIZATION:**200K:15%rules+40%history+30%input+15%reserve|Delta edits

## INITIALIZATION
**VERIFY:**`test -d .aegiside`→NO:BOOTSTRAP→`jq '.tier_1_domains' core/main-router.json`
**DOMAINS:**ace_queries|architecture_queries|governance_queries(3 tier-1 domains)
**GATES:**Bootstrap|JSON|Confidence|Memory|MCP|Intent|Sources|Requirements|Constitutional|Harmful|Safe

## WORKFLOWS
**MCP CHAIN(7 steps,EACH task,NO EXCEPTIONS):**
1.`@mcp:sequential-thinking`(10+ thoughts MANDATORY)
2.`jq '.tier_1_domains' core/main-router.json`
3.`jq '.tier_1_domains.{domain}.router' core/main-router.json`→Load domain router
4.`@mcp:json-jq`active/`.current_task`|`.current_phase`
5.`@mcp:context7`+`@mcp:exa`+`@mcp:notion-mcp-server`(research MANDATORY)
6.`@mcp:git`(history check)
7.`@mcp:json-jq`systemPatterns`.architecture_patterns`|`.auto_learning`
**Skip penalty:**p=1.0(SEVERE)|Banned tool:p=0.5|Skipping step 1 or 5:HALT

**FLOW:**kanban→`@mcp:sequential-thinking`→Research→Execute→Update active/→Phase→Update history/→Loop

**MEMORY SYNC:**
**Iteration:**activeContext+kanban+scratchpad via`@mcp:json-jq`
**Phase:**progress+roadmap+systemPatterns+mistakes via`@mcp:json-jq`
**Schema:**Cross-verify 18 schemas(9 main+9 helpers)via`@mcp:json-jq`BEFORE write
**Keys:**`.current_task`|`.current_phase`|`.HALT_ACTIVE`|`.approval_gate`|`.constitutional_flow`|`.nlu`|`.production_status`|`.mcp_integration`|`.model_info`|`.columns`|`.milestones`|`.architecture_patterns`|`.auto_learning`|`.error_patterns`|`.constitutional_compliance`|`.rl_runtime_controls`

## ACE WORKFLOW
**GENERATE:**Task→Solution via Gen(4)|Log attempt+outcome+reasoning
**REFLECT:**Analyze errors/tests/lint|Extract root cause|Distill insight
**CURATE:**`@mcp:json-jq`systemPatterns|Add pitfall+strategy
**LOOP:**Gen→Ref→Cur|Playbook=systemPatterns.json|Self-evolution

## ENFORCEMENT(Penalty:reward*=exp(-Σp))
1.**JQ(p=0.5):**core/knowledge→`jq`|BAN:read_file,cat,bat,sed,awk,perl,tree,ls
2.**MCP(p=0.5):**runtime/memory→`@mcp:json-jq`|BAN:direct jq
3.**MEMORY(p=1.0):**SYNC 3/iteration:activeContext+kanban+scratchpad|SYNC history/phase
4.**AMNESIA(p=0.1):**Store systemPatterns post-phase
5.**TIER(p=0.3):**Load main-router→domain router
6.**RESEARCH(p=0.4):**Conf<0.8→MCP research
7.**MODULAR(p=0.5):**<4K,<100 lines
8.**SEMANTIC(p=0.4):**Intent|BAN:keyword
9.**GREP(p=0):**`grep -C/-A/-B -n -m`
10.**QUERY(p=0.3):**Specific|BAN:dumps
11.**SCHEMA(p=0.2):**Cross-verify schemas via`@mcp:json-jq`BEFORE write|18 schemas
**EXEMPT:**`.aegiside/enforcement/shell/*.sh`

## FILE ROUTING
**JSON:**`jq`(core/knowledge)|`@mcp:json-jq`(runtime/memory)
**Code:**`ast-grep`,`rg -t`|**Text:**`head`,`grep -C`|**Search:**`fd`,`find`|**YAML:**`yq`

## PRE-RESPONSE VERIFICATION
**MANDATORY BEFORE response:**
1.`@mcp:sequential-thinking`(10+ thoughts completed?)
2.Research conducted?(`@mcp:context7`+`@mcp:exa` called?)
3.`test -d .aegiside`(framework exists)
4.`jq '.tier_1_domains' core/main-router.json`(routers loaded)
5.`@mcp:json-jq`active/(memory loaded)
6.Confidence≥0.8 OR researched
7.`@mcp:json-jq`systemPatterns(patterns stored)
8.`@mcp:json-jq`roadmap/kanban(tasks loaded)
9.Update active/:activeContext+kanban+scratchpad
10.Phase end→Update history/:progress+roadmap+systemPatterns
**FAIL:**No thinking=HALT|No research=HALT|verification=false,penalty=-1.0

## REINFORCEMENT LEARNING
**PPO+GAE:**δ=r+γV(s')-V(s)|A^GAE=Σ(γλ)^k×δ|KL=Σπ_new×log(π_new/π_ref)|score+=r×exp(-0.005×KL)-p
**COMPUTE:**TD error→GAE advantage→KL divergence→PPO clip→Update|NO raw integers|Store:td_error,value_updated,policy_probs,monte_carlo_return
**PARAMS:**ε=0.2,γ=0.99,λ=0.95,kl_coef=0.005|Value branches:task(0.3),quality(0.25),user(0.2),efficiency(0.15),learn(0.1)

## TOOL POLICY
**ALLOWED:**`jq`,`yq`,`rg`,`grep -C`,`ag`,`ast-grep`,`fd`,`find`,`head -n`,`tail -n`,`cut`,`wc`|MCP:`@mcp:json-jq`,`@mcp:sequential-thinking`,`@mcp:context7`,`@mcp:exa`,`@mcp:git`,`@mcp:notion-mcp-server`
**BANNED(p=1.0,HALT):**cat,read_file,bat,less,more,sed,awk,perl,tree,ls,cd,echo,printf,rm,mv,cp,chmod,chown,ln,dd,kill,sudo,eval,exec,source,wget,curl -X,git clone/push/pull,npm,pip,cargo,edit .aegiside/
**SAFE:**cat→`head -n`|ls→`find`|cd→Cwd|rm/mv/cp→NEVER|edit→read+verify first
**VIOLATION:**ANY banned tool→p=1.0→reward=0→IMMEDIATE HALT→NO EXECUTION

## OPERATIONS
**FILE OPS:**UPDATE=edit existing|CREATE=new file(explicit)|ANALYZE=chat only
**CONFIDENCE:**90-99%:Execute|70-89%:Execute+log|50-69%:Query+execute|30-49%:Research+ask|0-29%:Halt+ask
**MODEL:**Free:Seq10+,Res<0.5|Value:Seq5,Res<0.75|Premium:Seq3,Res<0.8|Think:Seq10+,C0.85
**ACE:**Gen(4)|Ref(4)|Cur(triad)via runtime/ace/|Staged:Foundation→Adaptive→Tools→Meta