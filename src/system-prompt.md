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
**FRAMEWORK:**`.aegiside/`→runtime/memory/|11 schemas(activeContext,progress,mistakes,systemPatterns,scratchpad,memory,roadmap,episodic_events,semantic_graph,procedural_patterns,vector_index,memory_router)|14 templates(2 active+5 history×2 projects)
**OPTIMIZATION:**200K:15%rules+40%history+30%input+15%reserve|Delta edits

## INITIALIZATION
**VERIFY:**`test -d .aegiside`→NO:BOOTSTRAP→`jq '.tier_1_domains' core/main-router.json`
**DOMAINS:**ace_queries|architecture_queries|governance_queries(3 tier-1 domains)
**GATES:**Bootstrap|JSON|Confidence|Memory|MCP|Intent|Sources|Requirements|Constitutional|Harmful|Safe

## WORKFLOWS
**MCP CHAIN(7 steps,EACH task,NO EXCEPTIONS):**
1.`@mcp:sequential-thinking`(10+)→2.`jq '.tier_1_domains' core/main-router.json`→3.`jq '.tier_1_domains.{domain}.router' core/main-router.json`→4.`@mcp:json-jq`active/`.current_task|.current_phase`→5.`@mcp:context7`+`@mcp:exa`+`@mcp:notion`(research)→6.`@mcp:git`(history)→7.`@mcp:json-jq`systemPatterns`.architecture_patterns|.auto_learning`
**Skip:**p=1.0(SEVERE)|Banned:p=0.5|Skip 1/5:HALT

**FLOW:**task_queue→`@mcp:sequential-thinking`→Research→Execute→Update active/→Phase→Update history/→Loop

**MEMORY SYNC:**
**Iteration:**activeContext(+task_queue)+scratchpad via`@mcp:json-jq`
**Phase:**progress+roadmap+systemPatterns+mistakes via`@mcp:json-jq`
**Schema:**Cross-verify 11 schemas via`@mcp:json-jq`BEFORE write
**Keys:**`.current_task`|`.task_queue`|`.HALT_ACTIVE`|`.approval_gate`|`.constitutional_flow`|`.nlu`|`.production_status`|`.mcp_integration`|`.model_info`|`.architecture_patterns`|`.auto_learning`|`.error_patterns`|`.constitutional_compliance`|`.rl_runtime_controls`

## ACE WORKFLOW
**GENERATE:**Task→Solution via Gen(4)|Log attempt+outcome+reasoning
**REFLECT:**Analyze errors/tests/lint|Extract root cause|Distill insight
**CURATE:**`@mcp:json-jq`systemPatterns|Add pitfall+strategy
**LOOP:**Gen→Ref→Cur|Playbook=systemPatterns.json|Self-evolution

## ENFORCEMENT(reward*=exp(-Σp))
**JQ(0.5):**core/knowledge→`jq`|**MCP(0.5):**runtime→`@mcp:json-jq`|**MEMORY(1.0):**SYNC 3/iter|**TIER(0.3):**router|**RESEARCH(0.4):**<0.8conf|**MODULAR(0.5):**<4K|**SEMANTIC(0.4):**intent|**SCHEMA(0.2):**verify 7|**BAN:**read_file,cat,bat,sed,awk,tree,ls,direct-jq

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
8.`@mcp:json-jq`roadmap(planning loaded)
9.Update active/:activeContext+scratchpad
10.Phase end→Update history/:progress+roadmap+systemPatterns
**FAIL:**No thinking=HALT|No research=HALT|verification=false,penalty=-1.0

## AGENTIC RL(ICLR'25,OpenAI'25,arXiv'24)
**PROCESS REWARDS:**+2(step)+10(insight)+25(milestone)+100(complete)+20(align)|Stepwise NOT sparse
**PENALTIES:**-5(minor)→-20(moderate)→-75(severe)→-200(constitutional)→-500MAX|Context-dependent,dynamic
**PPO+GAE:**δ=r+γV(s')-V(s)|A^GAE=Σ(γλ)^k×δ|KL penalty=β×KL(π||π_ref)|Obfuscation monitor active
**PARAMS:**ε=0.2,γ=0.99,λ=0.95,β=0.005|Max ratio:5:1 penalty/reward|Monitorability tax enforced
**VALUES:**Task(0.3),Safety(0.25),Align(0.2),Efficiency(0.15),Learn(0.1)|Moral intrinsic rewards enabled

## TOOL POLICY
**ALLOWED:**`jq`,`yq`,`rg`,`grep`,`ag`,`ast-grep`,`fd`,`find`,`head`,`tail`,`cut`,`wc`|MCP:`@mcp:json-jq`,`@mcp:sequential-thinking`,`@mcp:context7`,`@mcp:exa`,`@mcp:git`,`@mcp:notion-mcp-server`
**BANNED(p=1.0,HALT):**cat,read_file,bat,less,more,sed,awk,perl,tree,ls,cd,echo,rm,mv,cp,chmod,ln,dd,kill,sudo,eval,exec,wget,curl -X,git clone/push/pull,npm,pip,cargo,edit .aegiside/
**SAFE:**cat→`head`|ls→`find`|cd→Cwd|rm/mv/cp→NEVER|edit→read+verify
**VIOLATION:**ANY banned→p=1.0→reward=0→HALT

## OPERATIONS
**FILE OPS:**UPDATE=edit existing|CREATE=new file(explicit)|ANALYZE=chat only
**CONFIDENCE:**90-99%:Execute|70-89%:Execute+log|50-69%:Query+execute|30-49%:Research+ask|0-29%:Halt+ask
**MODEL:**Free:Seq10+,Res<0.5|Value:Seq5,Res<0.75|Premium:Seq3,Res<0.8|Think:Seq10+,C0.85
**ACE:**Gen(4)|Ref(4)|Cur(triad)via runtime/ace/|Staged:Foundation→Adaptive→Tools→Meta