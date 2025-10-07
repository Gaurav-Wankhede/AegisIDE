#!/usr/bin/env node
/*
  Linkage Validator for AegisIDE 7-core memory bank
  Validates that cross-file IDs (proposal_id, task_id, rm id, governance_decision_id) point to existing entities.
  Exit code 1 on any missing reference; prints a concise report.
*/

const fs = require('fs');
const path = require('path');

const MB = path.resolve(process.cwd(), '.windsurf/memory-bank');
const files = {
  systemPatterns: path.join(MB, 'systemPatterns.json'),
  kanban: path.join(MB, 'kanban.json'),
  progress: path.join(MB, 'progress.json'),
  roadmap: path.join(MB, 'roadmap.json'),
  activeContext: path.join(MB, 'activeContext.json'),
  scratchpad: path.join(MB, 'scratchpad.json'),
  mistakes: path.join(MB, 'mistakes.json'),
};

function readJson(p) {
  try {
    return JSON.parse(fs.readFileSync(p, 'utf8'));
  } catch (e) {
    return null;
  }
}

function main() {
  const missing = [];
  const data = Object.fromEntries(
    Object.entries(files).map(([k, p]) => [k, readJson(p)])
  );

  // Sets from targets
  const taskIds = new Set();
  if (data.kanban && Array.isArray(data.kanban.tasks)) {
    data.kanban.tasks.forEach(t => t && t.id && taskIds.add(t.id));
  }

  const milestoneIds = new Set();
  if (data.roadmap && Array.isArray(data.roadmap.strategic_objectives)) {
    data.roadmap.strategic_objectives.forEach(obj => {
      (obj?.milestones || []).forEach(m => m?.id && milestoneIds.add(m.id));
    });
  }

  const proposalIds = new Set();
  const decisionIds = new Set();
  if (data.systemPatterns && Array.isArray(data.systemPatterns.governance_decisions)) {
    data.systemPatterns.governance_decisions.forEach(d => {
      if (d?.proposal_id) proposalIds.add(d.proposal_id);
      if (d?.decision_id) decisionIds.add(d.decision_id);
    });
  }

  // Check activeContext.linkage
  const act = data.activeContext;
  if (act?.linkage) {
    const L = act.linkage;
    if (L.proposal_id && !proposalIds.has(L.proposal_id)) missing.push([files.systemPatterns, `missing proposal_id ${L.proposal_id} (from activeContext.linkage)`]);
    if (L.kanban_task_id && !taskIds.has(L.kanban_task_id)) missing.push([files.kanban, `missing kanban_task_id ${L.kanban_task_id} (from activeContext.linkage)`]);
    if (L.roadmap_milestone_id && !milestoneIds.has(L.roadmap_milestone_id)) missing.push([files.roadmap, `missing roadmap_milestone_id ${L.roadmap_milestone_id} (from activeContext.linkage)`]);
    if (L.governance_decision_id && !decisionIds.has(L.governance_decision_id)) missing.push([files.systemPatterns, `missing governance_decision_id ${L.governance_decision_id} (from activeContext.linkage)`]);
  }

  // Check scratchpad.immediate_priorities
  const sp = data.scratchpad;
  if (sp?.immediate_priorities) {
    sp.immediate_priorities.forEach((it, idx) => {
      if (it?.proposal_id && !proposalIds.has(it.proposal_id)) missing.push([files.systemPatterns, `missing proposal_id ${it.proposal_id} (scratchpad.immediate_priorities[${idx}])`]);
      if (it?.kanban_task_id && !taskIds.has(it.kanban_task_id)) missing.push([files.kanban, `missing kanban_task_id ${it.kanban_task_id} (scratchpad.immediate_priorities[${idx}])`]);
      if (it?.roadmap_milestone_id && !milestoneIds.has(it.roadmap_milestone_id)) missing.push([files.roadmap, `missing roadmap_milestone_id ${it.roadmap_milestone_id} (scratchpad.immediate_priorities[${idx}])`]);
    });
  }

  // Check progress.milestone_tracking
  const pr = data.progress;
  if (pr?.milestone_tracking) {
    pr.milestone_tracking.forEach((m, idx) => {
      (m?.kanban_task_ids || []).forEach((tid, j) => {
        if (!taskIds.has(tid)) missing.push([files.kanban, `missing kanban_task_id ${tid} (progress.milestone_tracking[${idx}].kanban_task_ids[${j}])`]);
      });
      if (m?.proposal_id && !proposalIds.has(m.proposal_id)) missing.push([files.systemPatterns, `missing proposal_id ${m.proposal_id} (progress.milestone_tracking[${idx}])`]);
      if (m?.governance_decision_id && !decisionIds.has(m.governance_decision_id)) missing.push([files.systemPatterns, `missing governance_decision_id ${m.governance_decision_id} (progress.milestone_tracking[${idx}])`]);
    });
  }

  // Check roadmap.strategic_objectives[*].milestones[*]
  const rd = data.roadmap;
  if (rd?.strategic_objectives) {
    rd.strategic_objectives.forEach((obj, oi) => {
      (obj?.milestones || []).forEach((ms, mi) => {
        (ms?.kanban_task_ids || []).forEach((tid, j) => {
          if (!taskIds.has(tid)) missing.push([files.kanban, `missing kanban_task_id ${tid} (roadmap.strategic_objectives[${oi}].milestones[${mi}].kanban_task_ids[${j}])`]);
        });
        if (ms?.proposal_id && !proposalIds.has(ms.proposal_id)) missing.push([files.systemPatterns, `missing proposal_id ${ms.proposal_id} (roadmap.strategic_objectives[${oi}].milestones[${mi}])`]);
        if (ms?.governance_decision_id && !decisionIds.has(ms.governance_decision_id)) missing.push([files.systemPatterns, `missing governance_decision_id ${ms.governance_decision_id} (roadmap.strategic_objectives[${oi}].milestones[${mi}])`]);
      });
    });
  }

  // Check mistakes linkages
  const mk = data.mistakes;
  if (mk) {
    (mk.error_patterns || []).forEach((ep, i) => {
      if (ep?.proposal_id && !proposalIds.has(ep.proposal_id)) missing.push([files.systemPatterns, `missing proposal_id ${ep.proposal_id} (mistakes.error_patterns[${i}])`]);
      if (ep?.kanban_task_id && !taskIds.has(ep.kanban_task_id)) missing.push([files.kanban, `missing kanban_task_id ${ep.kanban_task_id} (mistakes.error_patterns[${i}])`]);
      if (ep?.roadmap_milestone_id && !milestoneIds.has(ep.roadmap_milestone_id)) missing.push([files.roadmap, `missing roadmap_milestone_id ${ep.roadmap_milestone_id} (mistakes.error_patterns[${i}])`]);
      if (ep?.governance_decision_id && !decisionIds.has(ep.governance_decision_id)) missing.push([files.systemPatterns, `missing governance_decision_id ${ep.governance_decision_id} (mistakes.error_patterns[${i}])`]);
    });
    (mk.predictive_warnings || []).forEach((pw, i) => {
      if (pw?.proposal_id && !proposalIds.has(pw.proposal_id)) missing.push([files.systemPatterns, `missing proposal_id ${pw.proposal_id} (mistakes.predictive_warnings[${i}])`]);
      if (pw?.kanban_task_id && !taskIds.has(pw.kanban_task_id)) missing.push([files.kanban, `missing kanban_task_id ${pw.kanban_task_id} (mistakes.predictive_warnings[${i}])`]);
      if (pw?.roadmap_milestone_id && !milestoneIds.has(pw.roadmap_milestone_id)) missing.push([files.roadmap, `missing roadmap_milestone_id ${pw.roadmap_milestone_id} (mistakes.predictive_warnings[${i}])`]);
    });
    (mk.instant_lint_tracking || []).forEach((lt, i) => {
      if (lt?.proposal_id && !proposalIds.has(lt.proposal_id)) missing.push([files.systemPatterns, `missing proposal_id ${lt.proposal_id} (mistakes.instant_lint_tracking[${i}])`]);
      if (lt?.kanban_task_id && !taskIds.has(lt.kanban_task_id)) missing.push([files.kanban, `missing kanban_task_id ${lt.kanban_task_id} (mistakes.instant_lint_tracking[${i}])`]);
    });
  }

  if (missing.length) {
    console.error('Linkage validation failed:');
    missing.forEach(([target, msg]) => console.error(`- ${msg} → expected in ${target}`));
    process.exit(1);
  } else {
    console.log('Linkage validation passed.');
  }
}

main();
