// Roadmap Component - Schema-Based Implementation with Real-Time Updates
class RoadmapComponent {
    constructor() {
        this.containerId = 'roadmap';
        this.lastUpdate = null;
    }

    render(data) {
        const roadmap = data['roadmap.json'];

        if (!roadmap) {
            return this.getErrorMessage('roadmap.json not loaded - Auto-refresh every 5 minutes');
        }

        // Check for new data
        const hasNewData = this.hasNewData(roadmap);
        if (hasNewData) {
            this.lastUpdate = new Date().toLocaleTimeString();
        }

        const updateInfo = this.lastUpdate ? `<div class="text-sm text-gray-400 mb-2">Last updated: ${this.lastUpdate}</div>` : '';

        return `
            <h3 class="text-lg font-bold text-cyan-400 mb-3">🗺️ Strategic Roadmap</h3>
            ${updateInfo}
            <div class="bg-gray-800 rounded-lg p-4 border border-cyan-600/30">
                ${this.renderResourceAllocation(roadmap.resource_allocation)}
                ${this.renderStrategicRoadmap(roadmap.strategic_roadmap)}
                ${this.renderLongTermVision(roadmap.long_term_vision)}
            </div>
        `;
    }

    hasNewData(roadmap) {
        if (!roadmap || !roadmap.last_updated) return false;
        
        const currentTimestamp = new Date(roadmap.last_updated).getTime();
        const lastTimestamp = this.lastDataTimestamp || 0;
        
        if (currentTimestamp > lastTimestamp) {
            this.lastDataTimestamp = currentTimestamp;
            return true;
        }
        return false;
    }

    renderResourceAllocation(allocation) {
        if (!allocation || !allocation.current_sprint) return '';
        
        const sprint = allocation.current_sprint;
        
        return `
            <div class="mb-4">
                <h4 class="font-semibold text-white text-sm mb-2">⚡ Resource Allocation</h4>
                <div class="bg-gray-700 rounded p-3">
                    <div class="space-y-2">
                        <div class="flex justify-between items-center">
                            <span class="text-gray-400 text-sm">Dev Minister</span>
                            <div class="flex items-center gap-2">
                                <div class="w-16 bg-gray-600 rounded-full h-2">
                                    <div class="bg-blue-400 h-2 rounded-full" style="width:${sprint.dev_minister_allocation || 0}%"></div>
                                </div>
                                <span class="text-white text-sm font-medium">${sprint.dev_minister_allocation || 0}%</span>
                            </div>
                        </div>
                        <div class="flex justify-between items-center">
                            <span class="text-gray-400 text-sm">Tech Minister</span>
                            <div class="flex items-center gap-2">
                                <div class="w-16 bg-gray-600 rounded-full h-2">
                                    <div class="bg-green-400 h-2 rounded-full" style="width:${sprint.tech_minister_allocation || 0}%"></div>
                                </div>
                                <span class="text-white text-sm font-medium">${sprint.tech_minister_allocation || 0}%</span>
                            </div>
                        </div>
                        <div class="flex justify-between items-center">
                            <span class="text-gray-400 text-sm">Quality Shadow</span>
                            <div class="flex items-center gap-2">
                                <div class="w-16 bg-gray-600 rounded-full h-2">
                                    <div class="bg-yellow-400 h-2 rounded-full" style="width:${sprint.quality_shadow_allocation || 0}%"></div>
                                </div>
                                <span class="text-white text-sm font-medium">${sprint.quality_shadow_allocation || 0}%</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        `;
    }

    renderStrategicRoadmap(phases) {
        if (!phases || phases.length === 0) return '';
        
        const totalPhases = phases.length;
        const completedPhases = phases.filter(phase => phase.status === 'completed').length;
        const inProgressPhases = phases.filter(phase => phase.status === 'in_progress').length;
        
        return `
            <div class="mb-4">
                <h4 class="font-semibold text-white text-sm mb-2">📋 Strategic Phases (${totalPhases})</h4>
                <div class="grid grid-cols-3 gap-2 mb-3 text-sm">
                    <div class="bg-green-900/30 rounded p-2 text-center">
                        <div class="text-green-400">Completed</div>
                        <div class="text-green-200 font-bold">${completedPhases}</div>
                    </div>
                    <div class="bg-yellow-900/30 rounded p-2 text-center">
                        <div class="text-yellow-400">In Progress</div>
                        <div class="text-yellow-200 font-bold">${inProgressPhases}</div>
                    </div>
                    <div class="bg-gray-700 rounded p-2 text-center">
                        <div class="text-gray-400">Total</div>
                        <div class="text-gray-200 font-bold">${totalPhases}</div>
                    </div>
                </div>
                <div class="space-y-3">
                    ${phases.map(phase => `
                        <div class="bg-gray-700 rounded p-3">
                            <div class="flex justify-between items-start mb-2">
                                <h5 class="text-white font-medium text-sm">${phase.name}</h5>
                                <span class="text-sm px-2 py-1 rounded ${this.getStatusClass(phase.status)}">${phase.status}</span>
                            </div>
                            <div class="flex justify-between items-center mb-2">
                                <span class="text-gray-400 text-sm">Progress</span>
                                <span class="text-white text-sm font-medium">${phase.completion_percentage || 0}%</span>
                            </div>
                            <div class="w-full bg-gray-600 rounded-full h-1 mb-2">
                                <div class="${this.getProgressColor(phase.completion_percentage)} h-1 rounded-full" style="width:${phase.completion_percentage || 0}%"></div>
                            </div>
                            ${this.renderPhaseMilestones(phase.milestones)}
                            ${this.renderPhaseRisks(phase.risks)}
                        </div>
                    `).join('')}
                </div>
            </div>
        `;
    }

    renderPhaseMilestones(milestones) {
        if (!milestones || milestones.length === 0) return '';
        
        return `
            <div class="mt-2">
                <div class="text-gray-400 text-sm mb-1">Milestones (${milestones.length})</div>
                <div class="space-y-1">
                    ${milestones.slice(0, 3).map(milestone => `
                        <div class="flex justify-between items-center text-sm">
                            <span class="text-gray-300">${milestone.title}</span>
                            <div class="flex gap-1">
                                <span class="px-1 py-0.5 rounded ${this.getBusinessImpactClass(milestone.business_impact)}">${milestone.business_impact}</span>
                                <span class="px-1 py-0.5 rounded ${this.getStatusClass(milestone.status)}">${milestone.status}</span>
                            </div>
                        </div>
                    `).join('')}
                </div>
            </div>
        `;
    }

    renderPhaseRisks(risks) {
        if (!risks || risks.length === 0) return '';
        
        const highRisks = risks.filter(risk => risk.impact === 'high' || risk.impact === 'critical');
        
        return `
            <div class="mt-2">
                <div class="text-gray-400 text-sm mb-1">Risks (${risks.length})</div>
                <div class="space-y-1">
                    ${highRisks.slice(0, 2).map(risk => `
                        <div class="text-sm">
                            <div class="flex justify-between items-center">
                                <span class="text-red-300">${risk.risk}</span>
                                <span class="px-1 py-0.5 rounded ${this.getImpactClass(risk.impact)}">${risk.impact}</span>
                            </div>
                            ${risk.mitigation ? `<div class="text-green-400 mt-1">Fix: ${risk.mitigation}</div>` : ''}
                        </div>
                    `).join('')}
                </div>
            </div>
        `;
    }

    renderLongTermVision(vision) {
        if (!vision) return '';
        
        return `
            <div>
                <h4 class="font-semibold text-white text-sm mb-2">🔮 Long-term Vision</h4>
                <div class="space-y-2">
                    ${vision['6_months'] ? `
                        <div class="bg-gray-700 rounded p-2">
                            <div class="text-blue-400 text-sm font-medium">6 Months</div>
                            <div class="text-white text-sm">${vision['6_months']}</div>
                        </div>
                    ` : ''}
                    
                    ${vision['1_year'] ? `
                        <div class="bg-gray-700 rounded p-2">
                            <div class="text-green-400 text-sm font-medium">1 Year</div>
                            <div class="text-white text-sm">${vision['1_year']}</div>
                        </div>
                    ` : ''}
                    
                    ${vision['2_years'] ? `
                        <div class="bg-gray-700 rounded p-2">
                            <div class="text-purple-400 text-sm font-medium">2 Years</div>
                            <div class="text-white text-sm">${vision['2_years']}</div>
                        </div>
                    ` : ''}
                </div>
            </div>
        `;
    }

    getStatusClass(status) {
        const classes = {
            'not_started': 'bg-gray-600 text-gray-300',
            'in_progress': 'bg-yellow-600 text-yellow-200',
            'completed': 'bg-green-600 text-green-200',
            'blocked': 'bg-red-600 text-red-200'
        };
        return classes[status] || 'bg-gray-600 text-gray-300';
    }

    getProgressColor(value) {
        if (!value) return 'bg-gray-400';
        if (value >= 80) return 'bg-green-400';
        if (value >= 60) return 'bg-yellow-400';
        return 'bg-red-400';
    }

    getBusinessImpactClass(impact) {
        const classes = {
            'critical': 'bg-red-800 text-red-200',
            'high': 'bg-orange-800 text-orange-200',
            'medium': 'bg-yellow-800 text-yellow-200',
            'low': 'bg-blue-800 text-blue-200'
        };
        return classes[impact] || 'bg-gray-600 text-gray-300';
    }

    getImpactClass(impact) {
        const classes = {
            'critical': 'bg-red-900 text-red-200',
            'high': 'bg-orange-900 text-orange-200',
            'medium': 'bg-yellow-900 text-yellow-200',
            'low': 'bg-blue-900 text-blue-200'
        };
        return classes[impact] || 'bg-gray-600 text-gray-300';
    }

    getErrorMessage(message) {
        return `<div class="bg-red-900/20 border border-red-600 rounded-lg p-4">
            <div class="text-red-400 font-medium">⚠️ ${message}</div>
        </div>`;
    }
}

window.RoadmapComponent = RoadmapComponent;
