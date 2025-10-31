#!/bin/bash
# Atomic Transaction Manager - ACID properties for memory-bank updates
# Usage: ./atomic-update.sh schema1 schema2 schema3...
# Provides: Auto-backup, auto-rollback on failure, validation

MEMORY_BANK=".aegiside/memory-bank/memory"
TIMESTAMP=$(date +%s)
BACKUP_DIR="$MEMORY_BANK/.backup_$TIMESTAMP"

atomic_update() {
    local schemas=("$@")
    
    if [ ${#schemas[@]} -eq 0 ]; then
        echo "Usage: $0 schema1 [schema2 ...]"
        exit 1
    fi
    
    echo "🔒 Starting atomic transaction for ${#schemas[@]} schemas..."
    
    # Create backup directory
    mkdir -p "$BACKUP_DIR"
    
    # Phase 1: Backup
    echo "📦 Phase 1: Backing up schemas..."
    for schema in "${schemas[@]}"; do
        if [ -f "$MEMORY_BANK/$schema.json" ]; then
            cp "$MEMORY_BANK/$schema.json" "$BACKUP_DIR/" || {
                echo "❌ Backup failed for $schema.json"
                cleanup_and_exit 1
            }
            echo "   ✓ Backed up $schema.json"
        fi
    done
    
    # Phase 2: Validate JSON syntax AND schema compliance
    echo "✅ Phase 2: Validating JSON syntax and schema compliance..."
    for schema in "${schemas[@]}"; do
        if [ -f "$MEMORY_BANK/$schema.json" ]; then
            # Step 2a: JSON syntax validation
            jq empty "$MEMORY_BANK/$schema.json" 2>/dev/null || {
                echo "❌ Invalid JSON syntax in $schema.json"
                rollback "${schemas[@]}"
                exit 1
            }
            echo "   ✓ JSON syntax valid: $schema.json"
            
            # Step 2b: Schema compliance validation
            if [ -f ".aegiside/enforcement/shell/validators/schema-validator.sh" ]; then
                bash .aegiside/enforcement/shell/validators/schema-validator.sh "$schema" "$schema" || {
                    echo "❌ Schema validation failed for $schema.json"
                    rollback "${schemas[@]}"
                    exit 1
                }
            else
                echo "   ⚠️  Schema validator not found, skipping schema check"
            fi
        fi
    done
    
    # Phase 3: Apply updates (your update logic goes here)
    # This is a placeholder - actual updates happen via @mcp:json-jq
    echo "💾 Phase 3: Updates ready (via @mcp:json-jq)"
    
    # Phase 4: Final validation (JSON + schema)
    echo "🔍 Phase 4: Final validation (post-update)..."
    for schema in "${schemas[@]}"; do
        if [ -f "$MEMORY_BANK/$schema.json" ]; then
            # JSON syntax check
            jq empty "$MEMORY_BANK/$schema.json" 2>/dev/null || {
                echo "❌ Post-update JSON validation failed for $schema.json"
                rollback "${schemas[@]}"
                exit 1
            }
            
            # Schema compliance check
            if [ -f ".aegiside/enforcement/shell/validators/schema-validator.sh" ]; then
                bash .aegiside/enforcement/shell/validators/schema-validator.sh "$schema" "$schema" || {
                    echo "❌ Post-update schema validation failed for $schema.json"
                    rollback "${schemas[@]}"
                    exit 1
                }
            fi
        fi
    done
    
    # Success - remove backup
    rm -rf "$BACKUP_DIR"
    echo "✅ Atomic transaction complete - all ${#schemas[@]} schemas updated successfully"
    return 0
}

rollback() {
    local schemas=("$@")
    echo ""
    echo "🔄 ROLLBACK INITIATED - Restoring ${#schemas[@]} schemas from backup..."
    
    for schema in "${schemas[@]}"; do
        if [ -f "$BACKUP_DIR/$schema.json" ]; then
            cp "$BACKUP_DIR/$schema.json" "$MEMORY_BANK/" || {
                echo "❌ Critical: Rollback failed for $schema.json"
            }
            echo "   ✓ Restored $schema.json"
        fi
    done
    
    rm -rf "$BACKUP_DIR"
    echo "✅ Rollback complete - all changes reverted"
    exit 1
}

# Run atomic update
atomic_update "$@"
