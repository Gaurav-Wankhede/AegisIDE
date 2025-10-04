// Deployment Component - Schema-Based Implementation with Real-Time Updates
class DeploymentComponent {
    constructor() {
        this.containerId = 'deployment';
        this.lastUpdate = null;
    }

    render(data) {
        const deployment = data['deployment.json'];

        if (!deployment) {
            return this.getErrorMessage('deployment.json not loaded - Auto-refresh every 5 minutes');
        }

        // Check for new data
        const hasNewData = this.hasNewData(deployment);
        if (hasNewData) {
            this.lastUpdate = new Date().toLocaleTimeString();
        }

        const updateInfo = this.lastUpdate ? `<div class="text-sm text-gray-400 mb-2">Last updated: ${this.lastUpdate}</div>` : '';

        return `
            <h3 class="text-lg font-bold text-emerald-400 mb-3">🚀 Deployment</h3>
            ${updateInfo}
            <div class="bg-gray-800 rounded-lg p-4 border border-emerald-600/30">
                ${this.renderDeploymentConfig(deployment.deployment_config)}
                ${this.renderDeploymentHistory(deployment.deployment_history)}
                ${this.renderHealthChecks(deployment.health_checks)}
            </div>
        `;
    }

    hasNewData(deploymentData) {
        if (!deploymentData || !deploymentData.last_updated) return false;
        
        const currentTimestamp = new Date(deploymentData.last_updated).getTime();
        const lastTimestamp = this.lastDataTimestamp || 0;
        
        if (currentTimestamp > lastTimestamp) {
            this.lastDataTimestamp = currentTimestamp;
            return true;
        }
        return false;
    }

    renderDeploymentConfig(config) {
        if (!config) return '';
        
        return `
            <div class="mb-4">
                <h4 class="font-semibold text-white text-sm mb-2">⚙️ Configuration</h4>
                <div class="bg-gray-700 rounded p-3">
                    <div class="grid grid-cols-2 gap-4 text-sm mb-3">
                        <div><span class="text-gray-400">Platform:</span> <span class="text-white capitalize">${config.platform || 'Not set'}</span></div>
                        <div><span class="text-gray-400">Auto Deploy:</span> 
                            <span class="${config.auto_deploy ? 'text-green-400' : 'text-red-400'}">${config.auto_deploy ? 'Enabled' : 'Disabled'}</span>
                        </div>
                    </div>
                    ${this.renderBranchStrategy(config.branch_strategy)}
                    ${this.renderBuildConfig(config.build_config)}
                </div>
            </div>
        `;
    }

    renderBranchStrategy(branchStrategy) {
        if (!branchStrategy) return '';
        
        return `
            <div class="mb-3">
                <h5 class="text-sm font-medium text-gray-300 mb-2">Branch Strategy</h5>
                <div class="grid grid-cols-3 gap-2 text-sm">
                    <div class="bg-green-900/20 rounded p-2">
                        <div class="text-green-400">Production</div>
                        <div class="text-white">${branchStrategy.production || 'main'}</div>
                    </div>
                    <div class="bg-yellow-900/20 rounded p-2">
                        <div class="text-yellow-400">Staging</div>
                        <div class="text-white">${branchStrategy.staging || 'staging'}</div>
                    </div>
                    <div class="bg-blue-900/20 rounded p-2">
                        <div class="text-blue-400">Development</div>
                        <div class="text-white">${branchStrategy.development || 'dev'}</div>
                    </div>
                </div>
            </div>
        `;
    }

    renderBuildConfig(buildConfig) {
        if (!buildConfig) return '';
        
        return `
            <div>
                <h5 class="text-sm font-medium text-gray-300 mb-2">Build Configuration</h5>
                <div class="text-sm space-y-1">
                    ${buildConfig.command ? `<div><span class="text-gray-400">Command:</span> <span class="text-white font-mono">${buildConfig.command}</span></div>` : ''}
                    ${buildConfig.output_directory ? `<div><span class="text-gray-400">Output:</span> <span class="text-white">${buildConfig.output_directory}</span></div>` : ''}
                    ${buildConfig.environment_variables ? `<div><span class="text-gray-400">Env Vars:</span> <span class="text-white">${Object.keys(buildConfig.environment_variables).length} defined</span></div>` : ''}
                </div>
            </div>
        `;
    }

    renderDeploymentHistory(history) {
        if (!history || history.length === 0) return '';
        
        const recentDeployments = history.slice(-5);
        const successCount = history.filter(d => d.status === 'success').length;
        const successRate = Math.round((successCount / history.length) * 100);
        
        return `
            <div class="mb-4">
                <h4 class="font-semibold text-white text-sm mb-2">📋 Deployment History (${history.length})</h4>
                <div class="flex justify-between items-center mb-3 text-sm">
                    <span class="text-gray-400">Success Rate:</span>
                    <span class="${successRate >= 80 ? 'text-green-400' : successRate >= 60 ? 'text-yellow-400' : 'text-red-400'} font-bold">${successRate}%</span>
                </div>
                <div class="space-y-2">
                    ${recentDeployments.map(deploy => `
                        <div class="bg-gray-700 rounded p-2">
                            <div class="flex justify-between items-center mb-1">
                                <span class="text-sm font-medium ${this.getStatusClass(deploy.status)}">${deploy.status.toUpperCase()}</span>
                                <span class="text-sm text-gray-400">${new Date(deploy.timestamp).toLocaleDateString()}</span>
                            </div>
                            <div class="grid grid-cols-2 gap-2 text-sm">
                                <div><span class="text-gray-400">Branch:</span> <span class="text-white">${deploy.branch || 'unknown'}</span></div>
                                <div><span class="text-gray-400">Duration:</span> <span class="text-white">${deploy.duration_seconds || 0}s</span></div>
                            </div>
                            ${deploy.deployed_by ? `<div class="text-sm text-gray-400 mt-1">By: ${deploy.deployed_by}</div>` : ''}
                        </div>
                    `).join('')}
                </div>
            </div>
        `;
    }

    renderHealthChecks(healthChecks) {
        if (!healthChecks || healthChecks.length === 0) return '';
        
        return `
            <div>
                <h4 class="font-semibold text-white text-sm mb-2">🔍 Health Checks (${healthChecks.length})</h4>
                <div class="space-y-1">
                    ${healthChecks.slice(0, 3).map(check => `
                        <div class="bg-gray-700 rounded p-2 text-sm">
                            <div class="flex justify-between items-center">
                                <span class="text-white">${check.method || 'GET'} ${new URL(check.endpoint).pathname}</span>
                                <span class="text-gray-400">${check.expected_status || 200}</span>
                            </div>
                            <div class="text-gray-400">Timeout: ${check.timeout_seconds || 30}s</div>
                        </div>
                    `).join('')}
                </div>
            </div>
        `;
    }

    getStatusClass(status) {
        const classes = {
            'success': 'text-green-400',
            'failed': 'text-red-400',
            'in_progress': 'text-blue-400',
            'cancelled': 'text-gray-400'
        };
        return classes[status] || 'text-gray-400';
    }

    getErrorMessage(message) {
        return `<div class="bg-red-900/20 border border-red-600 rounded-lg p-4">
            <div class="text-red-400 font-medium">⚠️ ${message}</div>
        </div>`;
    }
}

window.DeploymentComponent = DeploymentComponent;
