// Tech Context Component - Real-time technical stack following techContext.json schema
class TechContextComponent {
    constructor() {
        this.containerId = 'techcontext';
        this.data = null;
        this.lastUpdate = null;
    }

    render(data) {
        // Real-time data processing with change detection
        this.data = data?.['techContext.json'];
        const currentUpdate = this.data?.last_updated || new Date().toISOString();
        
        if (!this.data) {
            return this.getErrorMessage('techContext.json not loaded - auto-refresh every 5 minutes');
        }
        
        // Track updates for real-time indicators
        const isNewData = this.lastUpdate !== currentUpdate;
        this.lastUpdate = currentUpdate;

        return `
            <div>
                <h3 class="text-lg font-bold text-indigo-400 mb-3 flex items-center">
                    ⚙️ Technical Context
                    <span class="ml-2 text-sm bg-indigo-900 text-indigo-200 px-2 py-1 rounded">
                        Updated: ${new Date(currentUpdate).toLocaleTimeString()}
                    </span>
                </h3>
                <div class="bg-gray-800 rounded-lg p-4 border border-indigo-600/30">
                    ${this.renderTechnicalStack(this.data.technical_stack)}
                    ${this.renderDependencyTracking(this.data.dependency_tracking)}
                    ${this.renderMCPEnrichedLinks(this.data.mcp_enriched_links)}
                    ${this.renderEnvironmentConfig(this.data.environment_config)}
                </div>
            </div>
        `;
    }

    renderTechnicalStack(stack) {
        if (!stack) return '';
        
        return `
            <div class="mb-4">
                <h4 class="font-semibold text-white text-sm mb-3">🏗️ Technical Stack</h4>
                <div class="grid grid-cols-1 md:grid-cols-3 gap-3">
                    ${stack.backend ? this.renderStackSection('Backend', stack.backend, 'bg-green-900/20') : ''}
                    ${stack.frontend ? this.renderStackSection('Frontend', stack.frontend, 'bg-blue-900/20') : ''}
                    ${stack.infrastructure ? this.renderStackSection('Infrastructure', stack.infrastructure, 'bg-purple-900/20') : ''}
                </div>
            </div>
        `;
    }

    renderStackSection(title, stackData, bgClass) {
        return `
            <div class="${bgClass} rounded p-3">
                <h5 class="font-medium text-white text-xs mb-2">${title}</h5>
                <div class="space-y-1 text-xs">
                    ${Object.entries(stackData).map(([key, value]) => `
                        <div><span class="text-gray-400 capitalize">${key.replace('_', ' ')}:</span> <span class="text-white">${value || 'N/A'}</span></div>
                    `).join('')}
                </div>
            </div>
        `;
    }

    renderDependencyTracking(deps) {
        if (!deps) return '';
        
        const vulnColor = deps.vulnerabilities > 0 ? 'text-red-400' : 'text-green-400';
        const outdatedColor = deps.outdated_packages > 5 ? 'text-yellow-400' : 'text-green-400';
        
        return `
            <div class="mb-4">
                <h4 class="font-semibold text-white text-sm mb-2">🔒 Dependency Tracking</h4>
                <div class="bg-gray-700 rounded p-3">
                    <div class="grid grid-cols-2 gap-4 text-sm mb-3">
                        <div><span class="text-gray-400">Vulnerabilities:</span> <span class="${vulnColor} font-bold">${deps.vulnerabilities || 0}</span></div>
                        <div><span class="text-gray-400">Outdated:</span> <span class="${outdatedColor} font-bold">${deps.outdated_packages || 0}</span></div>
                    </div>
                    <div class="text-xs text-gray-400 mb-2">
                        Last Scan: ${deps.last_security_scan ? new Date(deps.last_security_scan).toLocaleDateString() : 'Never'}
                    </div>
                    <div class="text-xs text-gray-400">
                        Strategy: ${deps.update_strategy || 'Manual'}
                    </div>
                </div>
            </div>  
        `;
    }

    renderMCPEnrichedLinks(links) {
        if (!links || links.length === 0) return '';
        
        return `
            <div class="mb-4">
                <h4 class="font-semibold text-white text-sm mb-2">🔗 MCP Enriched Links (${links.length})</h4>
                <div class="space-y-2  ">
                    ${links.slice(0, 3).map(link => `
                        <div class="bg-gray-700 rounded p-2">
                            <div class="flex justify-between items-start mb-1">
                                <a href="${link.url}" target="_blank" class="text-indigo-400 hover:text-indigo-300 text-sm font-medium truncate">${link.title}</a>
                                <span class="text-xs text-gray-400">${Math.round((link.relevance_score || 0) * 100)}%</span>
                            </div>
                            <div class="text-xs text-gray-400">${link.context || 'No context'}</div>
                        </div>
                    `).join('')}
                </div>
            </div>
        `;
    }

    renderEnvironmentConfig(envConfig) {
        if (!envConfig) return '';
        
        const environments = Object.keys(envConfig).filter(env => envConfig[env]);
        if (environments.length === 0) return '';
        
        return `
            <div>
                <h4 class="font-semibold text-white text-sm mb-2">🌍 Environment Config</h4>
                <div class="flex space-x-2">
                    ${environments.map(env => `
                        <span class="text-xs px-2 py-1 rounded bg-gray-700 text-gray-300 capitalize">${env}</span>
                    `).join('')}
                </div>
            </div>
        `;
    }

    getErrorMessage(message) {
        return `<div class="bg-red-900/20 border border-red-600 rounded-lg p-4">
            <div class="text-red-400 font-medium">⚠️ ${message}</div>
        </div>`;
    }
}

window.TechContextComponent = TechContextComponent;
