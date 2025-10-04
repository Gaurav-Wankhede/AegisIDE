// ProductContext Component - Real-time business requirements following productContext.json schema
class ProductContextComponent {
    constructor() {
        this.containerId = 'productcontext';
        this.data = null;
        this.lastUpdate = null;
    }

    render(data) {
        // Real-time data processing with change detection
        const productContext = data['productContext.json'];
        const currentUpdate = productContext?.last_updated || new Date().toISOString();
        
        if (!productContext) {
            return this.getErrorMessage('productContext.json not loaded - auto-refresh every 5 minutes');
        }
        
        // Track updates for real-time indicators
        const isNewData = this.lastUpdate !== currentUpdate;
        this.lastUpdate = currentUpdate;

        return `
            <div>
                <h3 class="text-lg font-bold text-purple-400 mb-3 flex items-center">
                    💼 Product Context
                    <span class="ml-2 text-sm bg-purple-900 text-purple-200 px-2 py-1 rounded">
                        Updated: ${new Date(currentUpdate).toLocaleTimeString()}
                    </span>
                </h3>
                <div class="bg-gray-800 rounded-lg p-4 border border-purple-600/30">
                    ${this.renderAlignmentMetrics(productContext.alignment_metrics)}
                    ${this.renderBusinessRequirements(productContext.business_requirements)}
                    ${this.renderStakeholderFeedback(productContext.stakeholder_feedback)}
                    ${this.renderMarketContext(productContext.market_context)}
                </div>
            </div>
        `;
    }

    renderAlignmentMetrics(metrics) {
        if (!metrics) return '';
        
        return `
            <div class="mb-4">
                <h4 class="font-semibold text-white text-sm mb-2">📊 Alignment Metrics</h4>
                <div class="grid grid-cols-2 gap-3">
                    <div class="bg-gray-700 rounded p-3">
                        <div class="text-gray-400 text-sm mb-1">Requirements Coverage</div>
                        <div class="flex justify-between items-center">
                            <div class="text-white font-bold">${metrics.requirements_coverage || 0}%</div>
                            <div class="w-16 bg-gray-600 rounded-full h-2">
                                <div class="${this.getProgressColor(metrics.requirements_coverage)} h-2 rounded-full" style="width:${metrics.requirements_coverage || 0}%"></div>
                            </div>
                        </div>
                    </div>
                    <div class="bg-gray-700 rounded p-3">
                        <div class="text-gray-400 text-sm mb-1">Business Value</div>
                        <div class="flex justify-between items-center">
                            <div class="text-white font-bold">${metrics.business_value_delivered || 0}%</div>
                            <div class="w-16 bg-gray-600 rounded-full h-2">
                                <div class="${this.getProgressColor(metrics.business_value_delivered)} h-2 rounded-full" style="width:${metrics.business_value_delivered || 0}%"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="grid grid-cols-2 gap-3 mt-3">
                    <div class="bg-gray-700 rounded p-2 text-center">
                        <div class="text-gray-400 text-sm">User Satisfaction</div>
                        <div class="text-white font-bold">${metrics.user_satisfaction_score || 0}/10</div>
                    </div>
                    <div class="bg-gray-700 rounded p-2 text-center">
                        <div class="text-gray-400 text-sm">Revenue Impact</div>
                        <div class="text-green-400 font-bold">${metrics.revenue_impact || 'N/A'}</div>
                    </div>
                </div>
            </div>
        `;
    }

    renderBusinessRequirements(requirements) {
        if (!requirements || requirements.length === 0) return '';
        
        const statusCounts = requirements.reduce((acc, req) => {
            acc[req.status] = (acc[req.status] || 0) + 1;
            return acc;
        }, {});
        
        const priorityCounts = requirements.reduce((acc, req) => {
            acc[req.priority] = (acc[req.priority] || 0) + 1;
            return acc;
        }, {});
        
        return `
            <div class="mb-4">
                <h4 class="font-semibold text-white text-sm mb-2">📋 Business Requirements (${requirements.length})</h4>
                <div class="grid grid-cols-4 gap-2 mb-3 text-sm">
                    <div class="bg-red-900/30 rounded p-2 text-center">
                        <div class="text-red-400">Critical</div>
                        <div class="text-red-200 font-bold">${priorityCounts.critical || 0}</div>
                    </div>
                    <div class="bg-orange-900/30 rounded p-2 text-center">
                        <div class="text-orange-400">High</div>
                        <div class="text-orange-200 font-bold">${priorityCounts.high || 0}</div>
                    </div>
                    <div class="bg-yellow-900/30 rounded p-2 text-center">
                        <div class="text-yellow-400">Medium</div>
                        <div class="text-yellow-200 font-bold">${priorityCounts.medium || 0}</div>
                    </div>
                    <div class="bg-blue-900/30 rounded p-2 text-center">
                        <div class="text-blue-400">Low</div>
                        <div class="text-blue-200 font-bold">${priorityCounts.low || 0}</div>
                    </div>
                </div>
                <div class="grid grid-cols-4 gap-2 mb-3 text-sm">
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
                <div class="space-y-2">
                    ${requirements.slice(0, 4).map(req => `
                        <div class="bg-gray-700 rounded p-3">
                            <div class="flex justify-between items-start mb-2">
                                <span class="text-sm text-white font-medium">${req.title}</span>
                                <div class="flex gap-2">
                                    <span class="text-sm px-2 py-1 rounded ${this.getPriorityClass(req.priority)}">${req.priority}</span>
                                    <span class="text-sm px-2 py-1 rounded ${this.getStatusClass(req.status)}">${req.status}</span>
                                </div>
                            </div>
                            ${req.description ? `<div class="text-sm text-gray-300 mb-2">${req.description}</div>` : ''}
                            ${req.business_value ? `<div class="text-sm text-purple-400">Value: ${req.business_value}</div>` : ''}
                            ${req.success_metrics ? `
                                <div class="text-sm text-gray-400 mt-1">
                                    Target: ${req.success_metrics.target || 'N/A'} | Current: ${req.success_metrics.current || 'N/A'}
                                </div>
                            ` : ''}
                        </div>
                    `).join('')}
                </div>
            </div>
        `;
    }

    renderStakeholderFeedback(feedback) {
        if (!feedback || feedback.length === 0) return '';
        
        const recentFeedback = feedback.sort((a, b) => new Date(b.date) - new Date(a.date));
        
        return `
            <div class="mb-4">
                <h4 class="font-semibold text-white text-sm mb-2">💬 Stakeholder Feedback (${feedback.length})</h4>
                <div class="space-y-2">
                    ${recentFeedback.slice(0, 3).map(fb => `
                        <div class="bg-gray-700 rounded p-3">
                            <div class="flex justify-between items-start mb-2">
                                <span class="text-sm text-white font-medium">${fb.stakeholder}</span>
                                <div class="flex gap-2">
                                    <span class="text-sm px-2 py-1 rounded ${this.getFeedbackPriorityClass(fb.priority)}">${fb.priority}</span>
                                    <span class="text-sm text-gray-400">${new Date(fb.date).toLocaleDateString()}</span>
                                </div>
                            </div>
                            <div class="text-sm text-gray-300 mb-1">${fb.feedback}</div>
                            ${fb.action_taken ? `<div class="text-sm text-green-400">Action: ${fb.action_taken}</div>` : ''}
                            ${fb.related_requirement ? `<div class="text-sm text-blue-400">Related to: ${fb.related_requirement}</div>` : ''}
                        </div>
                    `).join('')}
                </div>
            </div>
        `;
    }

    renderMarketContext(marketContext) {
        if (!marketContext) return '';
        
        return `
            <div>
                <h4 class="font-semibold text-white text-sm mb-2">🌍 Market Context</h4>
                <div class="space-y-3">
                    ${marketContext.competitor_analysis && marketContext.competitor_analysis.length > 0 ? `
                        <div class="bg-gray-700 rounded p-3">
                            <div class="text-sm text-gray-400 mb-2">Competitor Analysis</div>
                            <div class="space-y-2">
                                ${marketContext.competitor_analysis.slice(0, 2).map(comp => `
                                    <div class="text-sm">
                                        <div class="text-white font-medium">${comp.competitor}</div>
                                        <div class="text-red-400">Strength: ${comp.strength}</div>
                                        <div class="text-green-400">Our Advantage: ${comp.our_advantage}</div>
                                    </div>
                                `).join('')}
                            </div>
                        </div>
                    ` : ''}
                    
                    ${marketContext.industry_trends && marketContext.industry_trends.length > 0 ? `
                        <div class="bg-gray-700 rounded p-3">
                            <div class="text-sm text-gray-400 mb-2">Industry Trends</div>
                            <div class="space-y-1">
                                ${marketContext.industry_trends.slice(0, 3).map(trend => `
                                    <div class="text-sm text-white">• ${trend}</div>
                                `).join('')}
                            </div>
                        </div>
                    ` : ''}
                    
                    ${marketContext.compliance_requirements && marketContext.compliance_requirements.length > 0 ? `
                        <div class="bg-gray-700 rounded p-3">
                            <div class="text-sm text-gray-400 mb-2">Compliance Requirements</div>
                            <div class="space-y-1">
                                ${marketContext.compliance_requirements.slice(0, 3).map(req => `
                                    <div class="text-sm text-yellow-400">• ${req}</div>
                                `).join('')}
                            </div>
                        </div>
                    ` : ''}
                </div>
            </div>
        `;
    }

    getProgressColor(value) {
        if (!value) return 'bg-gray-400';
        if (value >= 80) return 'bg-green-400';
        if (value >= 60) return 'bg-yellow-400';
        return 'bg-red-400';
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

    getStatusClass(status) {
        const classes = {
            'not_started': 'bg-gray-600 text-gray-300',
            'in_progress': 'bg-yellow-600 text-yellow-200',
            'completed': 'bg-green-600 text-green-200',
            'blocked': 'bg-red-600 text-red-200'
        };
        return classes[status] || 'bg-gray-600 text-gray-300';
    }

    getFeedbackPriorityClass(priority) {
        const classes = {
            'high': 'bg-red-800 text-red-200',
            'medium': 'bg-yellow-800 text-yellow-200',
            'low': 'bg-blue-800 text-blue-200'
        };
        return classes[priority] || 'bg-gray-600 text-gray-300';
    }

    getErrorMessage(message) {
        return `<div class="bg-red-900/20 border border-red-600 rounded-lg p-4">
            <div class="text-red-400 font-medium">⚠️ ${message}</div>
        </div>`;
    }
}

window.ProductContextComponent = ProductContextComponent;
