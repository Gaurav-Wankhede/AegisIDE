// System Patterns Component - Real-time architecture patterns following systemPatterns.json schema
class SystemPatternsComponent {
    constructor() {
        this.containerId = 'systempatterns';
        this.data = null;
        this.lastUpdate = null;
    }

    render(data) {
        // Real-time data processing with change detection
        const sp = data['systemPatterns.json'];
        const currentUpdate = sp?.last_updated || new Date().toISOString();
        
        if (!sp) {
            return this.getErrorMessage('systemPatterns.json not loaded - auto-refresh every 5 minutes');
        }
        
        // Track updates for real-time indicators
        const isNewData = this.lastUpdate !== currentUpdate;
        this.lastUpdate = currentUpdate;

        return `
            <div>
                <h3 class="text-lg font-bold text-orange-400 mb-3 flex items-center">
                    🏥️ System Patterns
                    <span class="ml-2 text-sm bg-orange-900 text-orange-200 px-2 py-1 rounded">
                        Updated: ${new Date(currentUpdate).toLocaleTimeString()}
                    </span>
                </h3>
                <div class="bg-gray-800 rounded-lg p-4 border border-orange-600/30">
                    ${this.renderArchitecturePatterns(sp.architecture_patterns)}
                    ${this.renderSuccessfulImplementations(sp.successful_implementations)}
                    ${this.renderOptimizationSuggestions(sp.optimization_suggestions)}
                    ${this.renderPatternRelationships(sp.pattern_relationships)}
                </div>
            </div>
        `;
    }

    renderArchitecturePatterns(patterns) {
        if (!patterns || patterns.length === 0) return '';
        
        const highSuccessPatterns = patterns.filter(p => (p.success_rate || 0) >= 80);
        
        return `
            <div class="mb-4">
                <h4 class="font-semibold text-white text-sm mb-2">🎯 Architecture Patterns (${patterns.length})</h4>
                <div class="grid grid-cols-1 md:grid-cols-2 gap-3">
                    ${patterns.slice(0, 4).map(pattern => `
                        <div class="bg-gray-700 rounded p-3">
                            <div class="flex justify-between items-start mb-2">
                                <div>
                                    <div class="text-sm text-white font-medium">${pattern.name}</div>
                                    <div class="text-sm text-gray-400">${pattern.category || 'General'}</div>
                                </div>
                                <div class="text-right">
                                    <div class="text-sm font-bold ${this.getSuccessRateClass(pattern.success_rate)}">${pattern.success_rate || 0}%</div>
                                    <div class="text-sm text-gray-400">${pattern.usage_count || 0} uses</div>
                                </div>
                            </div>
                            ${pattern.description ? `<div class="text-sm text-gray-300 mb-2">${pattern.description.substring(0, 100)}...</div>` : ''}
                            ${pattern.implementation_template ? `
                                <div class="text-sm">
                                    <span class="text-gray-400">Est:</span> <span class="text-white">${pattern.implementation_template.estimated_hours || 0}h</span>
                                    <span class="text-gray-400 ml-2">Complexity:</span> <span class="text-white">${pattern.implementation_template.complexity_score || 0}/10</span>
                                </div>
                            ` : ''}
                        </div>
                    `).join('')}
                </div>
                ${highSuccessPatterns.length > 0 ? `
                    <div class="mt-2 text-sm bg-green-900/20 text-green-400 px-2 py-1 rounded">
                        ✅ ${highSuccessPatterns.length} high-success patterns (≥80%)
                    </div>
                ` : ''}
            </div>
        `;
    }

    renderSuccessfulImplementations(implementations) {
        if (!implementations || implementations.length === 0) return '';
        
        const recentImpls = implementations.slice(-3);
        
        return `
            <div class="mb-4">
                <h4 class="font-semibold text-white text-sm mb-2">✅ Recent Implementations (${implementations.length})</h4>
                <div class="space-y-2">
                    ${recentImpls.map(impl => `
                        <div class="bg-gray-700 rounded p-2">
                            <div class="flex justify-between items-center mb-1">
                                <span class="text-sm text-white">Task: ${impl.task_id}</span>
                                <span class="text-sm text-green-400">${impl.quality_score || 0}/10</span>
                            </div>
                            <div class="text-sm text-gray-400">
                                Completed in ${impl.completion_time_hours || 0}h • ${new Date(impl.implementation_date).toLocaleDateString()}
                            </div>
                            ${impl.reusable_components && impl.reusable_components.length > 0 ? `
                                <div class="text-sm text-blue-400 mt-1">Components: ${impl.reusable_components.slice(0, 2).join(', ')}</div>
                            ` : ''}
                        </div>
                    `).join('')}
                </div>
            </div>
        `;
    }

    renderOptimizationSuggestions(suggestions) {
        if (!suggestions || suggestions.length === 0) return '';
        
        return `
            <div class="mb-4">
                <h4 class="font-semibold text-white text-sm mb-2">💡 Optimization Suggestions (${suggestions.length})</h4>
                <div class="space-y-2">
                    ${suggestions.slice(0, 3).map(suggestion => `
                        <div class="bg-yellow-900/20 border border-yellow-600/30 rounded p-2">
                            <div class="text-sm text-yellow-300">${suggestion.suggestion}</div>
                            <div class="flex justify-between items-center mt-1 text-sm">
                                <span class="text-yellow-400">Impact: ${suggestion.impact || 'Unknown'}</span>
                                <span class="text-gray-400">Confidence: ${Math.round((suggestion.confidence || 0) * 100)}%</span>
                            </div>
                        </div>
                    `).join('')}
                </div>
            </div>
        `;
    }

    renderPatternRelationships(relationships) {
        if (!relationships || relationships.length === 0) return '';
        
        const relationshipCounts = relationships.reduce((acc, rel) => {
            acc[rel.relationship_type] = (acc[rel.relationship_type] || 0) + 1;
            return acc;
        }, {});
        
        return `
            <div>
                <h4 class="font-semibold text-white text-sm mb-2">🔗 Pattern Relationships (${relationships.length})</h4>
                <div class="grid grid-cols-2 gap-2 text-sm">
                    ${Object.entries(relationshipCounts).map(([type, count]) => `
                        <div class="bg-gray-700 rounded p-2 text-center">
                            <div class="text-gray-400 capitalize">${type.replace('_', ' ')}</div>
                            <div class="text-white font-bold">${count}</div>
                        </div>
                    `).join('')}
                </div>
            </div>
        `;
    }

    getSuccessRateClass(rate) {
        if (rate >= 80) return 'text-green-400';
        if (rate >= 60) return 'text-yellow-400';
        return 'text-red-400';
    }

    getErrorMessage(message) {
        return `<div class="bg-red-900/20 border border-red-600 rounded-lg p-4">
            <div class="text-red-400 font-medium">⚠️ ${message}</div>
        </div>`;
    }
}

window.SystemPatternsComponent = SystemPatternsComponent;
