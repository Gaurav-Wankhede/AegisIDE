// ProjectBrief Component - Real-time project overview following projectbrief.json schema
class ProjectBriefComponent {
    constructor() {
        this.containerId = 'projectbrief';
        this.data = null;
        this.lastUpdate = null;
    }

    render(data) {
        // Real-time data processing with change detection
        const projectBrief = data['projectbrief.json'];
        const currentUpdate = projectBrief?.last_updated || new Date().toISOString();
        
        if (!projectBrief) {
            return this.getErrorMessage('projectbrief.json not loaded - auto-refresh every 5 minutes');
        }
        
        // Track updates for real-time indicators
        const isNewData = this.lastUpdate !== currentUpdate;
        this.lastUpdate = currentUpdate;

        return `
            <div>
                <h3 class="text-lg font-bold text-indigo-400 mb-3 flex items-center">
                    📄 Project Brief
                    <span class="ml-2 text-sm bg-indigo-900 text-indigo-200 px-2 py-1 rounded">
                        Updated: ${new Date(currentUpdate).toLocaleTimeString()}
                    </span>
                </h3>
                <div class="bg-gray-800 rounded-lg p-4 border border-indigo-600/30">
                    ${this.renderProjectOverview(projectBrief.project_overview)}
                    ${this.renderCoreRequirements(projectBrief.core_requirements)}
                    ${this.renderProjectScope(projectBrief.project_scope)}
                    ${this.renderSuccessCriteria(projectBrief.success_criteria)}
                    ${this.renderConstraints(projectBrief.constraints)}
                </div>
            </div>
        `;
    }

    renderProjectOverview(overview) {
        if (!overview) return '';
        
        const startDate = overview.started_date ? new Date(overview.started_date).toLocaleDateString() : 'Not set';
        const targetDate = overview.target_completion ? new Date(overview.target_completion).toLocaleDateString() : 'Not set';
        
        return `
            <div class="mb-4">
                <h4 class="font-semibold text-white text-sm mb-2">📋 Overview</h4>
                <div class="bg-gray-700 rounded p-3 mb-3">
                    <div class="flex justify-between items-start mb-2">
                        <h5 class="text-white font-bold text-base">${overview.name}</h5>
                        <span class="text-xs px-2 py-1 rounded ${this.getStatusClass(overview.status)}">${overview.status}</span>
                    </div>
                    <div class="text-sm text-gray-300 mb-2">${overview.description}</div>
                    <div class="flex justify-between items-center text-xs text-gray-400">
                        <span>Version: <span class="text-white">${overview.version}</span></span>
                        <span>Started: <span class="text-white">${startDate}</span></span>
                        <span>Target: <span class="text-white">${targetDate}</span></span>
                    </div>
                </div>
            </div>
        `;
    }

    renderCoreRequirements(requirements) {
        if (!requirements || requirements.length === 0) return '';
        
        const statusCounts = requirements.reduce((acc, req) => {
            acc[req.status] = (acc[req.status] || 0) + 1;
            return acc;
        }, {});
        
        const avgCompletion = requirements.reduce((sum, req) => sum + (req.completion_percentage || 0), 0) / requirements.length;
        
        return `
            <div class="mb-4">
                <h4 class="font-semibold text-white text-sm mb-2">🎯 Core Requirements (${requirements.length})</h4>
                <div class="grid grid-cols-4 gap-2 mb-3 text-xs">
                    <div class="bg-gray-700 rounded p-2 text-center">
                        <div class="text-gray-400">Not Started</div>
                        <div class="text-gray-200 font-bold">${statusCounts.not_started || 0}</div>
                    </div>
                    <div class="bg-yellow-900/30 rounded p-2 text-center">
                        <div class="text-yellow-400">In Progress</div>
                        <div class="text-yellow-200 font-bold">${statusCounts.in_progress || 0}</div>
                    </div>
                    <div class="bg-green-900/30 rounded p-2 text-center">
                        <div class="text-green-400">Completed</div>
                        <div class="text-green-200 font-bold">${statusCounts.completed || 0}</div>
                    </div>
                    <div class="bg-red-900/30 rounded p-2 text-center">
                        <div class="text-red-400">Blocked</div>
                        <div class="text-red-200 font-bold">${statusCounts.blocked || 0}</div>
                    </div>
                </div>
                <div class="bg-gray-700 rounded p-3 mb-3">
                    <div class="flex justify-between items-center mb-2">
                        <span class="text-white text-sm">Overall Progress</span>
                        <span class="text-white font-bold">${Math.round(avgCompletion)}%</span>
                    </div>
                    <div class="w-full bg-gray-600 rounded-full h-2">
                        <div class="${this.getProgressColor(avgCompletion)} h-2 rounded-full transition-all" style="width:${avgCompletion}%"></div>
                    </div>
                </div>
                <div class="space-y-2  ">
                    ${requirements.slice(0, 4).map(req => `
                        <div class="bg-gray-700 rounded p-2">
                            <div class="flex justify-between items-start mb-1">
                                <span class="text-sm text-white font-medium">${req.requirement}</span>
                                <div class="flex gap-2">
                                    <span class="text-xs px-2 py-1 rounded ${this.getPriorityClass(req.priority)}">${req.priority}</span>
                                    <span class="text-xs px-1 py-1 rounded ${this.getStatusClass(req.status)}">${req.status}</span>
                                </div>
                            </div>
                            <div class="w-full bg-gray-600 rounded-full h-1">
                                <div class="${this.getProgressColor(req.completion_percentage)} h-1 rounded-full" style="width:${req.completion_percentage || 0}%"></div>
                            </div>
                        </div>
                    `).join('')}
                </div>
            </div>
        `;
    }

    renderProjectScope(scope) {
        if (!scope) return '';
        
        return `
            <div class="mb-4">
                <h4 class="font-semibold text-white text-sm mb-2">🔍 Project Scope</h4>
                <div class="grid grid-cols-2 gap-3">
                    ${scope.included && scope.included.length > 0 ? `
                        <div class="bg-green-900/20 rounded p-3">
                            <div class="text-green-400 text-xs font-medium mb-2">Included (${scope.included.length})</div>
                            <div class="space-y-1">
                                ${scope.included.slice(0, 4).map(item => `
                                    <div class="text-xs text-green-300">✓ ${item}</div>
                                `).join('')}
                            </div>
                        </div>
                    ` : ''}
                    
                    ${scope.excluded && scope.excluded.length > 0 ? `
                        <div class="bg-red-900/20 rounded p-3">
                            <div class="text-red-400 text-xs font-medium mb-2">Excluded (${scope.excluded.length})</div>
                            <div class="space-y-1">
                                ${scope.excluded.slice(0, 4).map(item => `
                                    <div class="text-xs text-red-300">✗ ${item}</div>
                                `).join('')}
                            </div>
                        </div>
                    ` : ''}
                </div>
            </div>
        `;
    }

    renderSuccessCriteria(criteria) {
        if (!criteria) return '';
        
        return `
            <div class="mb-4">
                <h4 class="font-semibold text-white text-sm mb-2">🏆 Success Criteria</h4>
                <div class="grid grid-cols-2 gap-3">
                    ${criteria.functional && criteria.functional.length > 0 ? `
                        <div class="bg-blue-900/20 rounded p-3">
                            <div class="text-blue-400 text-xs font-medium mb-2">Functional (${criteria.functional.length})</div>
                            <div class="space-y-1">
                                ${criteria.functional.slice(0, 3).map(item => `
                                    <div class="text-xs text-blue-300">• ${item}</div>
                                `).join('')}
                            </div>
                        </div>
                    ` : ''}
                    
                    ${criteria.non_functional && criteria.non_functional.length > 0 ? `
                        <div class="bg-purple-900/20 rounded p-3">
                            <div class="text-purple-400 text-xs font-medium mb-2">Non-Functional (${criteria.non_functional.length})</div>
                            <div class="space-y-1">
                                ${criteria.non_functional.slice(0, 3).map(item => `
                                    <div class="text-xs text-purple-300">• ${item}</div>
                                `).join('')}
                            </div>
                        </div>
                    ` : ''}
                </div>
            </div>
        `;
    }

    renderConstraints(constraints) {
        if (!constraints) return '';
        
        return `
            <div>
                <h4 class="font-semibold text-white text-sm mb-2">⚠️ Constraints</h4>
                <div class="space-y-2">
                    ${constraints.technical && constraints.technical.length > 0 ? `
                        <div class="bg-gray-700 rounded p-2">
                            <div class="text-gray-400 text-xs font-medium mb-1">Technical (${constraints.technical.length})</div>
                            <div class="space-y-1">
                                ${constraints.technical.slice(0, 2).map(item => `
                                    <div class="text-xs text-white">• ${item}</div>
                                `).join('')}
                            </div>
                        </div>
                    ` : ''}
                    
                    ${constraints.business && constraints.business.length > 0 ? `
                        <div class="bg-gray-700 rounded p-2">
                            <div class="text-gray-400 text-xs font-medium mb-1">Business (${constraints.business.length})</div>
                            <div class="space-y-1">
                                ${constraints.business.slice(0, 2).map(item => `
                                    <div class="text-xs text-white">• ${item}</div>
                                `).join('')}
                            </div>
                        </div>
                    ` : ''}
                    
                    ${constraints.regulatory && constraints.regulatory.length > 0 ? `
                        <div class="bg-gray-700 rounded p-2">
                            <div class="text-gray-400 text-xs font-medium mb-1">Regulatory (${constraints.regulatory.length})</div>
                            <div class="space-y-1">
                                ${constraints.regulatory.slice(0, 2).map(item => `
                                    <div class="text-xs text-white">• ${item}</div>
                                `).join('')}
                            </div>
                        </div>
                    ` : ''}
                </div>
            </div>
        `;
    }

    getStatusClass(status) {
        const classes = {
            'planning': 'bg-blue-600 text-blue-200',
            'development': 'bg-yellow-600 text-yellow-200',
            'testing': 'bg-orange-600 text-orange-200',
            'deployment': 'bg-purple-600 text-purple-200',
            'maintenance': 'bg-green-600 text-green-200',
            'not_started': 'bg-gray-600 text-gray-300',
            'in_progress': 'bg-yellow-600 text-yellow-200',
            'completed': 'bg-green-600 text-green-200',
            'blocked': 'bg-red-600 text-red-200'
        };
        return classes[status] || 'bg-gray-600 text-gray-300';
    }

    getPriorityClass(priority) {
        const classes = {
            'critical': 'bg-red-900 text-red-200',
            'high': 'bg-orange-900 text-orange-200',
            'medium': 'bg-yellow-900 text-yellow-200',
            'low': 'bg-blue-900 text-blue-200'
        };
        return classes[priority] || 'bg-gray-600 text-gray-300';
    }

    getProgressColor(value) {
        if (!value) return 'bg-gray-400';
        if (value >= 80) return 'bg-green-400';
        if (value >= 60) return 'bg-yellow-400';
        return 'bg-red-400';
    }

    getErrorMessage(message) {
        return `<div class="bg-red-900/20 border border-red-600 rounded-lg p-4">
            <div class="text-red-400 font-medium">⚠️ ${message}</div>
        </div>`;
    }
}

window.ProjectBriefComponent = ProjectBriefComponent;
