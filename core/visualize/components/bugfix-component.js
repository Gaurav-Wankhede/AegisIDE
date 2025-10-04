// Bugfix Component - Schema-Based Implementation with Real-Time Updates
class BugfixComponent {
    constructor() {
        this.containerId = 'bugfix';
        this.lastUpdate = null;
    }

    render(data) {
        const bugfix = data['bugfix.json'];

        if (!bugfix) {
            return this.getErrorMessage('bugfix.json not loaded - Auto-refresh every 5 minutes');
        }

        // Check for new data
        const hasNewData = this.hasNewData(bugfix);
        if (hasNewData) {
            this.lastUpdate = new Date().toLocaleTimeString();
        }

        const updateInfo = this.lastUpdate ? `<div class="text-sm text-gray-400 mb-2">Last updated: ${this.lastUpdate}</div>` : '';

        return `
            <h3 class="text-lg font-bold text-red-400 mb-3">🐛 Bug Fix Queue</h3>
            ${updateInfo}
            <div class="bg-gray-800 rounded-lg p-4 border border-red-600/30">
                ${this.renderDetectionConfig(bugfix)}
                ${this.renderPriorityClassification(bugfix.priority_classification)}
                ${this.renderDetectedBugs(bugfix.detected_bugs)}
                ${this.renderFixQueue(bugfix.fix_queue)}
                ${this.renderStats(bugfix.stats)}
                ${this.renderConstitutionalCompliance(bugfix.constitutional_compliance)}
            </div>
        `;
    }

    hasNewData(bugfixData) {
        if (!bugfixData || !bugfixData.last_updated) return false;
        
        const currentTimestamp = new Date(bugfixData.last_updated).getTime();
        const lastTimestamp = this.lastDataTimestamp || 0;
        
        if (currentTimestamp > lastTimestamp) {
            this.lastDataTimestamp = currentTimestamp;
            return true;
        }
        return false;
    }

    renderDetectionConfig(bugfix) {
        const lastScan = bugfix.last_scan ? new Date(bugfix.last_scan).toLocaleString() : 'Never';
        
        return `
            <div class="mb-4">
                <h4 class="font-semibold text-white text-sm mb-2">🔍 Detection Config</h4>
                <div class="grid grid-cols-2 gap-3">
                    <div class="bg-gray-700 rounded p-3">
                        <div class="flex justify-between items-center">
                            <span class="text-gray-400 text-sm">Auto-Detect</span>
                            <span class="${bugfix.auto_detect ? 'text-green-400' : 'text-red-400'} font-medium">
                                ${bugfix.auto_detect ? 'ON' : 'OFF'}
                            </span>
                        </div>
                    </div>
                    <div class="bg-gray-700 rounded p-3">
                        <div class="flex justify-between items-center">
                            <span class="text-gray-400 text-sm">Halt P0/P1</span>
                            <span class="${bugfix.halt_on_p0_p1 ? 'text-green-400' : 'text-red-400'} font-medium">
                                ${bugfix.halt_on_p0_p1 ? 'YES' : 'NO'}
                            </span>
                        </div>
                    </div>
                </div>
                <div class="mt-3 text-sm">
                    <div class="text-gray-400">Scan Frequency: <span class="text-white">${bugfix.scan_frequency || 'Unknown'}</span></div>
                    <div class="text-gray-400">Last Scan: <span class="text-white">${lastScan}</span></div>
                </div>
            </div>
        `;
    }

    renderPriorityClassification(classification) {
        if (!classification) return '';
        
        return `
            <div class="mb-4">
                <h4 class="font-semibold text-white text-sm mb-2">📊 Priority Breakdown</h4>
                <div class="grid grid-cols-4 gap-2">
                    <div class="bg-red-900/30 rounded p-3 text-center">
                        <div class="text-red-400 text-sm font-medium">P0 Blocking</div>
                        <div class="text-red-200 font-bold text-lg">${classification.P0_blocking || 0}</div>
                    </div>
                    <div class="bg-orange-900/30 rounded p-3 text-center">
                        <div class="text-orange-400 text-sm font-medium">P1 Critical</div>
                        <div class="text-orange-200 font-bold text-lg">${classification.P1_critical || 0}</div>
                    </div>
                    <div class="bg-yellow-900/30 rounded p-3 text-center">
                        <div class="text-yellow-400 text-sm font-medium">P2 Major</div>
                        <div class="text-yellow-200 font-bold text-lg">${classification.P2_major || 0}</div>
                    </div>
                    <div class="bg-blue-900/30 rounded p-3 text-center">
                        <div class="text-blue-400 text-sm font-medium">P3 Minor</div>
                        <div class="text-blue-200 font-bold text-lg">${classification.P3_minor || 0}</div>
                    </div>
                </div>
            </div>
        `;
    }

    renderDetectedBugs(bugs) {
        if (!bugs || bugs.length === 0) {
            return `
                <div class="mb-4">
                    <h4 class="font-semibold text-white text-sm mb-2">🎯 Detected Bugs</h4>
                    <div class="bg-green-900/20 border border-green-600 rounded p-3 text-center">
                        <div class="text-green-400 font-medium">No bugs detected! 🎉</div>
                    </div>
                </div>
            `;
        }
        
        const activeBugs = bugs.filter(bug => bug.status !== 'fixed');
        
        return `
            <div class="mb-4">
                <h4 class="font-semibold text-white text-sm mb-2">🎯 Active Bugs (${activeBugs.length})</h4>
                <div class="space-y-2">
                    ${activeBugs.slice(0, 5).map(bug => `
                        <div class="bg-gray-700 rounded p-3">
                            <div class="flex justify-between items-start mb-2">
                                <div class="flex items-center gap-2">
                                    <span class="text-sm px-2 py-1 rounded ${this.getPriorityClass(bug.priority)}">${bug.priority}</span>
                                    <span class="text-sm px-2 py-1 rounded ${this.getTypeClass(bug.type)}">${bug.type}</span>
                                </div>
                                <span class="text-sm px-2 py-1 rounded ${this.getStatusClass(bug.status)}">${bug.status}</span>
                            </div>
                            <div class="text-sm text-white mb-1">${bug.description}</div>
                            <div class="text-sm text-gray-400">
                                ${bug.file}${bug.line ? `:${bug.line}` : ''} • ${bug.language || 'Unknown'} 
                                ${bug.mcp_context7_used ? '• MCP Fix Available' : ''}
                            </div>
                        </div>
                    `).join('')}
                </div>
            </div>
        `;
    }

    renderFixQueue(fixQueue) {
        if (!fixQueue || fixQueue.length === 0) return '';
        
        return `
            <div class="mb-4">
                <h4 class="font-semibold text-white text-sm mb-2">🔧 Fix Queue (${fixQueue.length})</h4>
                <div class="space-y-1">
                    ${fixQueue.slice(0, 3).map(fix => `
                        <div class="bg-gray-700 rounded p-2">
                            <div class="flex justify-between items-center">
                                <span class="text-sm text-white">Bug ${fix.bug_id.substring(0, 8)}</span>
                                <span class="text-sm text-gray-400">${new Date(fix.queued_at).toLocaleDateString()}</span>
                            </div>
                            ${fix.fix_strategy ? `<div class="text-sm text-gray-300 mt-1">${fix.fix_strategy}</div>` : ''}
                            <div class="flex gap-2 mt-1">
                                ${fix.emd_compliant_fix ? '<span class="text-sm text-green-400">EMD ✓</span>' : ''}
                                ${fix.validation_required ? '<span class="text-sm text-yellow-400">Validation Required</span>' : ''}
                            </div>
                        </div>
                    `).join('')}
                </div>
            </div>
        `;
    }

    renderStats(stats) {
        if (!stats) return '';
        
        return `
            <div class="mb-4">
                <h4 class="font-semibold text-white text-sm mb-2">📈 Fix Statistics</h4>
                <div class="grid grid-cols-3 gap-3">
                    <div class="bg-gray-700 rounded p-2 text-center">
                        <div class="text-gray-400 text-sm">Detected</div>
                        <div class="text-white font-bold">${stats.total_detected || 0}</div>
                    </div>
                    <div class="bg-gray-700 rounded p-2 text-center">
                        <div class="text-gray-400 text-sm">Fixed</div>
                        <div class="text-green-400 font-bold">${stats.total_fixed || 0}</div>
                    </div>
                    <div class="bg-gray-700 rounded p-2 text-center">
                        <div class="text-gray-400 text-sm">Failed</div>
                        <div class="text-red-400 font-bold">${stats.total_failed || 0}</div>
                    </div>
                </div>
                <div class="grid grid-cols-2 gap-3 mt-3">
                    <div class="bg-gray-700 rounded p-2 text-center">
                        <div class="text-gray-400 text-sm">Success Rate</div>
                        <div class="${this.getSuccessRateColor(stats.fix_success_rate)} font-bold">${stats.fix_success_rate || 0}%</div>
                    </div>
                    <div class="bg-gray-700 rounded p-2 text-center">
                        <div class="text-gray-400 text-sm">Avg Fix Time</div>
                        <div class="text-white font-bold">${stats.avg_fix_time_minutes || 0}m</div>
                    </div>
                </div>
            </div>
        `;
    }

    renderConstitutionalCompliance(compliance) {
        if (!compliance) return '';
        
        return `
            <div>
                <h4 class="font-semibold text-white text-sm mb-2">⚖️ Constitutional Compliance</h4>
                <div class="grid grid-cols-3 gap-2 text-sm">
                    <div class="bg-gray-700 rounded p-2 text-center">
                        <div class="text-gray-400">HALT-FIX-VALIDATE</div>
                        <div class="${compliance.halt_fix_validate_active ? 'text-green-400' : 'text-red-400'} font-medium">
                            ${compliance.halt_fix_validate_active ? 'ACTIVE' : 'INACTIVE'}
                        </div>
                    </div>
                    <div class="bg-gray-700 rounded p-2 text-center">
                        <div class="text-gray-400">Article XIII</div>
                        <div class="${compliance.article_xiii_enforced ? 'text-green-400' : 'text-red-400'} font-medium">
                            ${compliance.article_xiii_enforced ? 'ENFORCED' : 'NOT ENFORCED'}
                        </div>
                    </div>
                    <div class="bg-gray-700 rounded p-2 text-center">
                        <div class="text-gray-400">Zero Tolerance</div>
                        <div class="${compliance.zero_tolerance_p0_p1 ? 'text-green-400' : 'text-red-400'} font-medium">
                            ${compliance.zero_tolerance_p0_p1 ? 'ENABLED' : 'DISABLED'}
                        </div>
                    </div>
                </div>
            </div>
        `;
    }

    getPriorityClass(priority) {
        const classes = {
            'P0': 'bg-red-900 text-red-200',
            'P1': 'bg-orange-900 text-orange-200',
            'P2': 'bg-yellow-900 text-yellow-200',
            'P3': 'bg-blue-900 text-blue-200'
        };
        return classes[priority] || 'bg-gray-600 text-gray-300';
    }

    getTypeClass(type) {
        const classes = {
            'compilation': 'bg-red-800 text-red-200',
            'type_error': 'bg-orange-800 text-orange-200',
            'lint': 'bg-yellow-800 text-yellow-200',
            'runtime': 'bg-purple-800 text-purple-200',
            'logic': 'bg-blue-800 text-blue-200',
            'security': 'bg-red-900 text-red-100'
        };
        return classes[type] || 'bg-gray-600 text-gray-300';
    }

    getStatusClass(status) {
        const classes = {
            'pending': 'bg-gray-600 text-gray-300',
            'fixing': 'bg-yellow-600 text-yellow-200',
            'fixed': 'bg-green-600 text-green-200',
            'failed': 'bg-red-600 text-red-200'
        };
        return classes[status] || 'bg-gray-600 text-gray-300';
    }

    getSuccessRateColor(rate) {
        if (!rate) return 'text-gray-400';
        if (rate >= 90) return 'text-green-400';
        if (rate >= 70) return 'text-yellow-400';
        return 'text-red-400';
    }

    getErrorMessage(message) {
        return `<div class="bg-red-900/20 border border-red-600 rounded-lg p-4">
            <div class="text-red-400 font-medium">⚠️ ${message}</div>
        </div>`;
    }
}

window.BugfixComponent = BugfixComponent;
