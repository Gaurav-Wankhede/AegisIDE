#!/usr/bin/env node
/*
  Schema Validator for AegisIDE memory bank using Ajv v8
  - Validates .windsurf/memory-bank/*.json against core/schemas/*schema.json
  - Fails fast with clear error report
*/

const fs = require('fs');
const path = require('path');
const Ajv = require('ajv');

const REPO_ROOT = process.cwd();
const MB = path.join(REPO_ROOT, '.windsurf', 'memory-bank');
const SCHEMAS_DIR = path.join(REPO_ROOT, 'core', 'schemas');

const targets = [
  { data: 'activeContext.json', schema: 'activeContext.schema.json' },
  { data: 'scratchpad.json',   schema: 'scratchpad.schema.json' },
  { data: 'kanban.json',       schema: 'kanban.schema.json' },
  { data: 'mistakes.json',     schema: 'mistakes.schema.json' },
  { data: 'systemPatterns.json', schema: 'systemPatterns.schema.json' },
  { data: 'progress.json',     schema: 'progress.schema.json' },
  { data: 'roadmap.json',      schema: 'roadmap.schema.json' },
];

function readJSON(p) {
  return JSON.parse(fs.readFileSync(p, 'utf8'));
}

function exists(p) {
  try { fs.accessSync(p); return true; } catch { return false; }
}

function main() {
  const ajv = new Ajv({ allErrors: true, strict: false });
  let errors = [];

  for (const { data, schema } of targets) {
    const dataPath = path.join(MB, data);
    const schemaPath = path.join(SCHEMAS_DIR, schema);

    if (!exists(dataPath)) {
      // Not all memory-bank files must exist in every repo state; skip silently
      continue;
    }
    if (!exists(schemaPath)) {
      errors.push(`Missing schema for ${data}: ${schemaPath}`);
      continue;
    }

    const schemaObj = readJSON(schemaPath);
    const validate = ajv.compile(schemaObj);
    const dataObj = readJSON(dataPath);

    const ok = validate(dataObj);
    if (!ok) {
      const pretty = (validate.errors || [])
        .map(e => `  • ${e.instancePath || '(root)'} ${e.message}`)
        .join('\n');
      errors.push(`Schema validation failed for ${data} (schema: ${schema}):\n${pretty}`);
    } else {
      console.log(`OK: ${data} ✓`);
    }
  }

  if (errors.length) {
    console.error('Schema validation errors:');
    console.error(errors.join('\n\n'));
    process.exit(1);
  } else {
    console.log('All schema validations passed.');
  }
}

main();
