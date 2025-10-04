// User Flow Component - Schema-Based Implementation with Real-Time Updates
class UserflowComponent {
    constructor() {
        this.containerId = 'userflow';
        this.lastUpdate = null;
    }

    render(data) {
        const uf = data['userflow.json'];

        if (!uf) {
            return this.getErrorMessage('userflow.json not loaded - Auto-refresh every 5 minutes');
        }

        // Check for new data
        const hasNewData = this.hasNewData(uf);
        if (hasNewData) {
            this.lastUpdate = new Date().toLocaleTimeString();
        }

        const updateInfo = this.lastUpdate ? `<div class="text-sm text-gray-400 mb-2">Last updated: ${this.lastUpdate}</div>` : '';

        return `
            <h3 class="text-lg font-bold text-cyan-400 mb-3">🔄 User Flows</h3>
            ${updateInfo}
            <div class="bg-gray-800 rounded-lg p-4 border border-cyan-600/30">
                ${this.renderProjectInfo(uf)}
                ${this.renderFlowSummary(uf)}
                ${this.renderFlows(uf.flows)}
            </div>
        `;
    }

    hasNewData(userflowData) {
        if (!userflowData || !userflowData.last_updated) return false;
        
        const currentTimestamp = new Date(userflowData.last_updated).getTime();
        const lastTimestamp = this.lastDataTimestamp || 0;
        
        if (currentTimestamp > lastTimestamp) {
            this.lastDataTimestamp = currentTimestamp;
            return true;
        }
        return false;
    }

    renderProjectInfo(uf) {
        return `
            <div class="mb-4">
                <div class="flex justify-between items-center mb-2">
                    <h4 class="font-semibold text-white text-sm">${uf.project_name || 'Unnamed Project'}</h4>
                    <span class="text-sm px-2 py-1 rounded ${uf.generated_from_blueprint ? 'bg-green-900 text-green-200' : 'bg-gray-700 text-gray-300'}">
                        ${uf.generated_from_blueprint ? 'Blueprint Generated' : 'Manual'}
                    </span>
                </div>
                <div class="text-sm text-gray-400">Blueprint ID: ${uf.blueprint_id || 'N/A'}</div>
            </div>
        `;
    }

    renderFlowSummary(uf) {
        const completionRate = uf.total_flows > 0 ? Math.round((uf.completed_flows / uf.total_flows) * 100) : 0;
        
        return `
            <div class="mb-4">
                <div class="grid grid-cols-2 gap-4 text-sm">
                    <div class="bg-gray-700 rounded p-3">
                        <div class="text-gray-400 text-sm">Total Flows</div>
                        <div class="text-white font-bold text-lg">${uf.total_flows || 0}</div>
                    </div>
                    <div class="bg-gray-700 rounded p-3">
                        <div class="text-gray-400 text-sm">Completed</div>
                        <div class="text-green-400 font-bold text-lg">${uf.completed_flows || 0}</div>
                    </div>
                </div>
                <div class="mt-3">
                    <div class="flex justify-between text-sm mb-1">
                        <span class="text-gray-400">Completion Progress</span>
                        <span class="text-white">${completionRate}%</span>
                    </div>
                    <div class="w-full bg-gray-600 rounded-full h-2">
                        <div class="bg-cyan-400 h-2 rounded-full transition-all" style="width:${completionRate}%"></div>
                    </div>
                </div>
                <div class="grid grid-cols-2 gap-4 mt-3 text-sm">
                    <div class="flex items-center">
                        <span class="text-gray-400">Critical Path:</span>
                        <span class="ml-2 px-2 py-1 rounded ${uf.critical_path_identified ? 'bg-green-900 text-green-200' : 'bg-red-900 text-red-200'}">
                            ${uf.critical_path_identified ? 'Identified' : 'Missing'}
                        </span>
                    </div>
                    <div class="flex items-center">
                        <span class="text-gray-400">Dependencies:</span>
                        <span class="ml-2 px-2 py-1 rounded ${uf.dependencies_mapped ? 'bg-green-900 text-green-200' : 'bg-red-900 text-red-200'}">
                            ${uf.dependencies_mapped ? 'Mapped' : 'Pending'}
                        </span>
                    </div>
                </div>
            </div>
        `;
    }

    renderFlows(flows) {
        if (!flows || flows.length === 0) return '<div class="text-gray-400 text-sm">No flows defined</div>';
        
        return `
            <div>
                <h4 class="font-semibold text-white text-sm mb-3">Flow Details (${flows.length})</h4>
                <div class="space-y-3">
                    ${flows.slice(0, 4).map(flow => this.renderFlow(flow)).join('')}
                </div>
            </div>
        `;
    }

    renderFlow(flow) {
        const completedSteps = flow.steps ? flow.steps.filter(s => s.status === 'completed').length : 0;
        const totalSteps = flow.steps ? flow.steps.length : 0;
        const stepProgress = totalSteps > 0 ? Math.round((completedSteps / totalSteps) * 100) : 0;
        
        return `
            <div class="bg-gray-700 rounded p-3">
                <div class="flex justify-between items-start mb-2">
                    <div>
                        <div class="font-medium text-white text-sm">${flow.name}</div>
                        <div class="text-sm text-gray-400">${flow.user_persona || 'No persona'}</div>
                    </div>
                    <div class="flex flex-col items-end">
                        <span class="text-sm px-2 py-1 rounded ${this.getPriorityClass(flow.priority)}">${flow.priority}</span>
                        <span class="text-sm px-2 py-1 rounded mt-1 ${this.getFlowTypeClass(flow.flow_type)}">${flow.flow_type}</span>
                    </div>
                </div>
                
                ${flow.description ? `<div class="text-sm text-gray-300 mb-2">${flow.description}</div>` : ''}
                
                <div class="grid grid-cols-3 gap-3 text-sm mb-2">
                    <div><span class="text-gray-400">Steps:</span> <span class="text-white">${completedSteps}/${totalSteps}</span></div>
                    <div><span class="text-gray-400">Progress:</span> <span class="text-white">${flow.completion_percentage || stepProgress}%</span></div>
                    <div><span class="text-gray-400">Consensus:</span> <span class="text-white">${flow.consensus_score || 0}%</span></div>
                </div>
                
                <div class="w-full bg-gray-600 rounded-full h-1 mb-2">
                    <div class="bg-cyan-400 h-1 rounded-full" style="width:${flow.completion_percentage || stepProgress}%"></div>
                </div>
                
                <div class="flex justify-between items-center text-sm">
                    <div class="flex space-x-2">
                        ${flow.accessibility_validated ? '<span class="px-1 py-0.5 bg-green-900 text-green-200 rounded">A11y</span>' : ''}
                        ${flow.parliamentary_approved ? '<span class="px-1 py-0.5 bg-blue-900 text-blue-200 rounded">Approved</span>' : ''}
                        ${flow.framework_specific ? '<span class="px-1 py-0.5 bg-purple-900 text-purple-200 rounded">Framework</span>' : ''}
                    </div>
                    ${flow.blocked ? `<span class="text-red-400">🚫 ${flow.blocker_reason || 'Blocked'}</span>` : ''}
                </div>
            </div>
        `;
    }

    getPriorityClass(priority) {
        const classes = {
            'critical': 'bg-red-900 text-red-200',
            'high': 'bg-orange-900 text-orange-200',
            'medium': 'bg-yellow-900 text-yellow-200',
            'low': 'bg-gray-600 text-gray-300'
        };
        return classes[priority] || classes.medium;
    }

    getFlowTypeClass(flowType) {
        const classes = {
            'user_flow': 'bg-blue-900 text-blue-200',
            'system_flow': 'bg-green-900 text-green-200',
            'error_flow': 'bg-red-900 text-red-200',
            'admin_flow': 'bg-purple-900 text-purple-200'
        };
        return classes[flowType] || classes.user_flow;
    }

    getErrorMessage(message) {
        return `<div class="bg-red-900/20 border border-red-600 rounded-lg p-4">
            <div class="text-red-400 font-medium">⚠️ ${message}</div>
        </div>`;
    }
}

window.UserflowComponent = UserflowComponent;
