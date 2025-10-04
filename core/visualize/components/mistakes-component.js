// Mistakes Component - Real-time error patterns following mistakes.json schema
class MistakesComponent {
    constructor() {
        this.containerId = 'mistakes';
        this.data = null;
        this.lastUpdate = null;
    }

    render(data) {
        // Real-time data processing with change detection
        this.data = data?.['mistakes.json'];
        const currentUpdate = this.data?.last_updated || new Date().toISOString();
        
        if (!this.data) {
            return this.getErrorMessage('mistakes.json not loaded - auto-refresh every 5 minutes');
        }
        
        // Track updates for real-time indicators
        const isNewData = this.lastUpdate !== currentUpdate;
        this.lastUpdate = currentUpdate;

        const updateInfo = this.lastUpdate ? `<div class="text-sm text-gray-400 mb-2">Last updated: ${this.lastUpdate}</div>` : '';

        return `
            <div>
                <h3 class="text-lg font-bold text-red-400 mb-3">🚨 Mistakes & Learning</h3>
                ${updateInfo}
                <div class="bg-gray-800 rounded-lg p-4 border border-red-600/30">
                    ${this.renderLearningData(this.data.learning_data)}
                    ${this.renderErrorPatterns(this.data.error_patterns)}
                    ${this.renderPredictiveWarnings(this.data.predictive_warnings)}
                    ${this.renderLintTracking(this.data.instant_lint_tracking)}
                </div>
            </div>
        `;
    }

    renderLearningData(learningData) {
        if (!learningData) return '';
        
        return `
            <div class="mb-4">
                <h4 class="font-semibold text-white text-sm mb-2">📊 Learning Statistics</h4>
                <div class="grid grid-cols-2 gap-3 text-sm">
                    <div class="bg-green-900/20 rounded p-3">
                        <div class="text-green-400 text-sm">Successful Fixes</div>
                        <div class="text-green-200 font-bold text-lg">${learningData.successful_fixes || 0}</div>
                    </div>
                    <div class="bg-blue-900/20 rounded p-3">
                        <div class="text-blue-400 text-sm">Patterns Prevented</div>
                        <div class="text-blue-200 font-bold text-lg">${learningData.patterns_prevented || 0}</div>
                    </div>
                </div>
                <div class="grid grid-cols-2 gap-3 mt-3 text-sm">
                    <div class="bg-purple-900/20 rounded p-2">
                        <div class="text-purple-400 text-sm">Time Saved</div>
                        <div class="text-purple-200 font-medium">${learningData.time_saved_hours || 0}h</div>
                    </div>
                    <div class="bg-yellow-900/20 rounded p-2">
                        <div class="text-yellow-400 text-sm">Accuracy</div>
                        <div class="text-yellow-200 font-medium">${Math.round((learningData.accuracy_improvement || 0) * 100)}%</div>
                    </div>
                </div>
            </div>
        `;
    }

    renderErrorPatterns(patterns) {
        if (!patterns || patterns.length === 0) return '';
        
        const highFrequencyPatterns = patterns.filter(p => (p.frequency || 0) >= 3);
        
        return `
            <div class="mb-4">
                <h4 class="font-semibold text-white text-sm mb-2">🔍 Error Patterns (${patterns.length})</h4>
                <div class="space-y-2">
                    ${patterns.slice(0, 4).map(pattern => `
                        <div class="bg-gray-700 rounded p-3">
                            <div class="flex justify-between items-start mb-2">
                                <div>
                                    <div class="text-sm text-white font-medium">${pattern.pattern_name}</div>
                                    <div class="text-sm text-gray-400">${pattern.category}</div>
                                </div>
                                <div class="text-right">
                                    <span class="text-sm px-2 py-1 rounded ${this.getSeverityClass(pattern.severity)}">${pattern.severity}</span>
                                    <div class="text-sm text-gray-400 mt-1">×${pattern.frequency}</div>
                                </div>
                            </div>
                            ${pattern.description ? `<div class="text-sm text-gray-300 mb-2">${pattern.description}</div>` : ''}
                            ${pattern.fix_strategy ? `<div class="text-sm text-green-400">Fix: ${pattern.fix_strategy}</div>` : ''}
                            ${pattern.prevention_rule ? `<div class="text-sm text-blue-400">Prevention: ${pattern.prevention_rule}</div>` : ''}
                        </div>
                    `).join('')}
                </div>
                ${highFrequencyPatterns.length > 0 ? `
                    <div class="mt-2 text-sm bg-red-900/20 text-red-400 px-2 py-1 rounded">
                        ⚠️ ${highFrequencyPatterns.length} high-frequency patterns (≥3 occurrences)
                    </div>
                ` : ''}
            </div>
        `;
    }

    renderPredictiveWarnings(warnings) {
        if (!warnings || warnings.length === 0) return '';
        
        return `
            <div class="mb-4">
                <h4 class="font-semibold text-white text-sm mb-2">🔮 Predictive Warnings (${warnings.length})</h4>
                <div class="space-y-2">
                    ${warnings.slice(0, 3).map(warning => `
                        <div class="bg-yellow-900/20 border border-yellow-600/30 rounded p-2">
                            <div class="flex justify-between items-start mb-1">
                                <span class="text-sm text-yellow-300">${warning.type}</span>
                                <span class="text-sm text-gray-400">${Math.round((warning.confidence || 0) * 100)}%</span>
                            </div>
                            <div class="text-sm text-gray-300 mb-1">${warning.description || 'No description'}</div>
                            ${warning.suggested_action ? `<div class="text-sm text-yellow-400">Action: ${warning.suggested_action}</div>` : ''}
                        </div>
                    `).join('')}
                </div>
            </div>
        `;
    }

    renderLintTracking(lintData) {
        if (!lintData || lintData.length === 0) return '';
        
        const autoFixedCount = lintData.filter(item => item.auto_fixed).length;
        
        return `
            <div>
                <h4 class="font-semibold text-white text-sm mb-2">🔧 Lint Tracking (${lintData.length})</h4>
                <div class="grid grid-cols-2 gap-3 text-sm mb-2">
                    <div class="bg-gray-700 rounded p-2 text-center">
                        <div class="text-gray-400">Total Issues</div>
                        <div class="text-white font-bold">${lintData.length}</div>
                    </div>
                    <div class="bg-green-900/20 rounded p-2 text-center">
                        <div class="text-green-400">Auto-Fixed</div>
                        <div class="text-green-200 font-bold">${autoFixedCount}</div>
                    </div>
                </div>
                <div class="space-y-1">
                    ${lintData.slice(0, 3).map(item => `
                        <div class="bg-gray-700 rounded p-2">
                            <div class="flex justify-between items-center">
                                <span class="text-sm text-white truncate">${item.rule}</span>
                                ${item.auto_fixed ? '<span class="text-sm text-green-400">✓</span>' : '<span class="text-sm text-red-400">✗</span>'}
                            </div>
                            <div class="text-sm text-gray-400">${item.file} (×${item.frequency})</div>
                        </div>
                    `).join('')}
                </div>
            </div>
        `;
    }

    getSeverityClass(severity) {
        const classes = {
            'critical': 'bg-red-900 text-red-200',
            'high': 'bg-orange-900 text-orange-200',
            'medium': 'bg-yellow-900 text-yellow-200',
            'low': 'bg-gray-600 text-gray-300'
        };
        return classes[severity] || classes.medium;
    }

    getErrorMessage(message) {
        return `<div class="bg-red-900/20 border border-red-600 rounded-lg p-4">
            <div class="text-red-400 font-medium">⚠️ ${message}</div>
        </div>`;
    }
}

window.MistakesComponent = MistakesComponent;
