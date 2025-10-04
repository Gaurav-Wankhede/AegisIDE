// BlueprintComponent - Renders project blueprint strictly following blueprint.json schema with Real-Time Updates
class BlueprintComponent {
    constructor() {
        this.data = null;
        this.lastUpdate = null;
    }

    render(data) {
        // Work with centralized data from dashboard
        this.data = data?.['blueprint.json'];
        
        if (!this.data) {
            return this.getErrorMessage('blueprint.json not loaded - Auto-refresh every 5 minutes');
        }

        // Check for new data
        const hasNewData = this.hasNewData(this.data);
        if (hasNewData) {
            this.lastUpdate = new Date().toLocaleTimeString();
        }

        const bp = this.data;
        const updateInfo = this.lastUpdate ? `<div class="text-sm text-gray-400 mb-2">Last updated: ${this.lastUpdate}</div>` : '';
        
        return `
            <h3 class="text-lg font-bold text-purple-400 mb-3">🎯 Project Blueprint</h3>
            ${updateInfo}
            <div class="bg-gray-800 rounded-lg p-4 border border-purple-600/30">
                ${this.renderProjectInfo(bp)}
                ${this.renderOverallScore(bp.overall_score, bp.min_score_threshold)}
                ${this.renderValidationPillars(bp.validation)}
                ${this.renderTechStack(bp.tech_stack)}
                ${this.renderParliamentaryApproval(bp.parliamentary_approval)}
                ${this.renderImprovements(bp.improvements)}
            </div>
        `;
    }

    hasNewData(blueprintData) {
        if (!blueprintData || !blueprintData.last_updated) return false;
        
        const currentTimestamp = new Date(blueprintData.last_updated).getTime();
        const lastTimestamp = this.lastDataTimestamp || 0;
        
        if (currentTimestamp > lastTimestamp) {
            this.lastDataTimestamp = currentTimestamp;
            return true;
        }
        return false;
    }

    renderProjectInfo(bp) {
        return `
            <div class="mb-4">
                <div class="flex justify-between items-start mb-2">
                    <h4 class="font-semibold text-white text-sm">${bp.project_name || 'Unnamed Project'}</h4>
                    <span class="text-sm px-2 py-1 rounded ${this.getStatusClass(bp.status)}">${bp.status || 'draft'}</span>
                </div>
                <div class="text-sm text-gray-400 mb-2">ID: ${bp.blueprint_id || 'N/A'}</div>
                ${bp.idea_description ? `<div class="text-sm text-gray-300">${bp.idea_description}</div>` : ''}
            </div>
        `;
    }

    renderOverallScore(score, threshold) {
        const scoreColor = score >= (threshold || 70) ? 'text-green-400' : 'text-yellow-400';
        const progressColor = score >= (threshold || 70) ? 'bg-green-400' : 'bg-yellow-400';
        
        return `
            <div class="mb-4">
                <div class="flex justify-between items-center mb-2">
                    <span class="text-white font-medium text-sm">Overall Score</span>
                    <span class="${scoreColor} font-bold">${score || 0}/100</span>
                </div>
                <div class="w-full bg-gray-600 rounded-full h-2">
                    <div class="${progressColor} h-2 rounded-full transition-all" style="width:${score || 0}%"></div>
                </div>
                <div class="text-sm text-gray-400 mt-1">Threshold: ${threshold || 70}/100</div>
            </div>
        `;
    }

    renderValidationPillars(validation) {
        if (!validation) return '';
        
        const pillars = [
            { key: 'pillar_1_problem', name: 'Problem Definition', icon: '🎯' },
            { key: 'pillar_2_solution', name: 'Solution Feasibility', icon: '💡' },
            { key: 'pillar_3_market', name: 'Market Validation', icon: '📈' },
            { key: 'pillar_4_feasibility', name: 'Technical Feasibility', icon: '⚙️' },
            { key: 'pillar_5_scalability', name: 'Scalability', icon: '🚀' },
            { key: 'pillar_6_monetization', name: 'Monetization', icon: '💰' }
        ];

        return `
            <div class="mb-4">
                <h4 class="font-semibold text-white text-sm mb-3">Six-Pillar Validation</h4>
                <div class="grid grid-cols-2 gap-3">
                    ${pillars.map(pillar => {
                        const data = validation[pillar.key];
                        return data ? this.renderPillar(pillar, data) : '';
                    }).join('')}
                </div>
            </div>
        `;
    }

    renderPillar(pillar, data) {
        const scoreColor = data.score >= 70 ? 'text-green-400' : data.score >= 50 ? 'text-yellow-400' : 'text-red-400';
        
        return `
            <div class="bg-gray-700 rounded p-3">
                <div class="flex items-center justify-between mb-1">
                    <span class="text-sm font-medium text-white">${pillar.icon} ${pillar.name}</span>
                    <span class="${scoreColor} text-sm font-bold">${data.score}/100</span>
                </div>
                <div class="w-full bg-gray-600 rounded-full h-1 mb-2">
                    <div class="bg-blue-400 h-1 rounded-full" style="width:${data.score}%"></div>
                </div>
                <div class="text-sm text-gray-400 truncate">${data.feedback || 'No feedback'}</div>
            </div>
        `;
    }

    renderTechStack(techStack) {
        if (!techStack) return '';
        
        return `
            <div class="mb-4">
                <h4 class="font-semibold text-white text-sm mb-2">Tech Stack</h4>
                <div class="bg-gray-700 rounded p-3">
                    <div class="grid grid-cols-2 gap-3 text-sm">
                        ${techStack.backend ? `<div><span class="text-gray-400">Backend:</span> <span class="text-white">${techStack.backend.join(', ')}</span></div>` : ''}
                        ${techStack.frontend ? `<div><span class="text-gray-400">Frontend:</span> <span class="text-white">${techStack.frontend.join(', ')}</span></div>` : ''}
                        ${techStack.database ? `<div><span class="text-gray-400">Database:</span> <span class="text-white">${techStack.database.join(', ')}</span></div>` : ''}
                        ${techStack.infrastructure ? `<div><span class="text-gray-400">Infra:</span> <span class="text-white">${techStack.infrastructure.join(', ')}</span></div>` : ''}
                    </div>
                    ${techStack.free_tier_optimized ? '<div class="mt-2 text-sm bg-green-900/20 text-green-400 px-2 py-1 rounded">✅ Free Tier Optimized</div>' : ''}
                </div>
            </div>
        `;
    }

    renderParliamentaryApproval(approval) {
        if (!approval) return '';
        
        return `
            <div class="mb-4">
                <h4 class="font-semibold text-white text-sm mb-2">Parliamentary Approval</h4>
                <div class="bg-gray-700 rounded p-3">
                    <div class="flex justify-between items-center">
                        <span class="text-gray-400 text-sm">Consensus:</span>
                        <span class="text-white font-medium">${approval.weighted_consensus || 0}%</span>
                    </div>
                    <div class="flex justify-between items-center mt-1">
                        <span class="text-gray-400 text-sm">Status:</span>
                        <span class="text-sm px-2 py-1 rounded ${approval.approved ? 'bg-green-900 text-green-200' : 'bg-red-900 text-red-200'}">
                            ${approval.approved ? 'Approved' : 'Pending'}
                        </span>
                    </div>
                </div>
            </div>
        `;
    }

    renderImprovements(improvements) {
        if (!improvements || improvements.length === 0) return '';
        
        return `
            <div>
                <h4 class="font-semibold text-white text-sm mb-2">Improvement Suggestions</h4>
                <div class="space-y-1">
                    ${improvements.slice(0, 3).map(imp => `
                        <div class="bg-yellow-900/20 border border-yellow-600/30 rounded p-2 text-sm text-yellow-300">
                            💡 ${imp}
                        </div>
                    `).join('')}
                </div>
            </div>
        `;
    }

    getStatusClass(status) {
        const classes = {
            'draft': 'bg-gray-700 text-gray-300',
            'approved': 'bg-green-900 text-green-200',
            'rejected': 'bg-red-900 text-red-200',
            'in_progress': 'bg-blue-900 text-blue-200',
            'completed': 'bg-purple-900 text-purple-200'
        };
        return classes[status] || classes.draft;
    }

    getErrorMessage(message) {
        return `<div class="bg-red-900/20 border border-red-600 rounded-lg p-4">
            <div class="text-red-400 font-medium">⚠️ ${message}</div>
        </div>`;
    }
}

window.BlueprintComponent = BlueprintComponent;
