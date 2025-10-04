// Dependencies Component - Schema-Based Implementation with Real-Time Updates
class DependenciesComponent {
    constructor() {
        this.containerId = 'dependencies';
        this.lastUpdate = null;
    }

    render(data) {
        const dependencies = data['dependencies.json'];

        if (!dependencies) {
            return this.getErrorMessage('dependencies.json not loaded - Auto-refresh every 5 minutes');
        }

        // Check for new data
        const hasNewData = this.hasNewData(dependencies);
        if (hasNewData) {
            this.lastUpdate = new Date().toLocaleTimeString();
        }

        const updateInfo = this.lastUpdate ? `<div class="text-sm text-gray-400 mb-2">Last updated: ${this.lastUpdate}</div>` : '';

        return `
            <h3 class="text-lg font-bold text-blue-400 mb-3">📦 Dependencies</h3>
            ${updateInfo}
            <div class="bg-gray-800 rounded-lg p-4 border border-blue-600/30">
                ${this.renderSecurityScan(dependencies.security_scan)}
                ${this.renderVulnerabilities(dependencies.vulnerabilities)}
                ${this.renderDependencies(dependencies.dependencies)}
                ${this.renderUpdatePolicy(dependencies.update_policy)}
            </div>
        `;
    }

    hasNewData(dependenciesData) {
        if (!dependenciesData || !dependenciesData.last_updated) return false;
        
        const currentTimestamp = new Date(dependenciesData.last_updated).getTime();
        const lastTimestamp = this.lastDataTimestamp || 0;
        
        if (currentTimestamp > lastTimestamp) {
            this.lastDataTimestamp = currentTimestamp;
            return true;
        }
        return false;
    }

    renderSecurityScan(securityScan) {
        if (!securityScan) return '';
        
        const lastScan = securityScan.last_scan ? new Date(securityScan.last_scan).toLocaleString() : 'Never';
        const statusColor = this.getScanStatusColor(securityScan.scan_status);
        
        return `
            <div class="mb-4">
                <h4 class="font-semibold text-white text-sm mb-2">🔍 Security Scan</h4>
                <div class="bg-gray-700 rounded p-3 mb-3">
                    <div class="flex justify-between items-center mb-2">
                        <span class="text-white font-medium">Scan Status</span>
                        <span class="${statusColor} font-bold uppercase">${securityScan.scan_status || 'Unknown'}</span>
                    </div>
                    <div class="text-sm text-gray-400 mb-3">Last Scan: ${lastScan}</div>
                    <div class="grid grid-cols-3 gap-3">
                        <div class="bg-gray-600 rounded p-2 text-center">
                            <div class="text-gray-400 text-sm">Total</div>
                            <div class="text-white font-bold">${securityScan.total_packages || 0}</div>
                        </div>
                        <div class="bg-red-900/30 rounded p-2 text-center">
                            <div class="text-red-400 text-sm">Vulnerable</div>
                            <div class="text-red-200 font-bold">${securityScan.vulnerable_packages || 0}</div>
                        </div>
                        <div class="bg-yellow-900/30 rounded p-2 text-center">
                            <div class="text-yellow-400 text-sm">Outdated</div>
                            <div class="text-yellow-200 font-bold">${securityScan.outdated_packages || 0}</div>
                        </div>
                    </div>
                </div>
            </div>
        `;
    }

    renderVulnerabilities(vulnerabilities) {
        if (!vulnerabilities || vulnerabilities.length === 0) {
            return `
                <div class="mb-4">
                    <h4 class="font-semibold text-white text-sm mb-2">🛡️ Vulnerabilities</h4>
                    <div class="bg-green-900/20 border border-green-600 rounded p-3 text-center">
                        <div class="text-green-400 font-medium">No vulnerabilities detected! 🎉</div>
                    </div>
                </div>
            `;
        }
        
        const activeVulns = vulnerabilities.filter(vuln => !vuln.resolved);
        const severityCounts = vulnerabilities.reduce((acc, vuln) => {
            acc[vuln.severity] = (acc[vuln.severity] || 0) + 1;
            return acc;
        }, {});
        
        return `
            <div class="mb-4">
                <h4 class="font-semibold text-white text-sm mb-2">🛡️ Vulnerabilities (${vulnerabilities.length})</h4>
                <div class="grid grid-cols-4 gap-2 mb-3">
                    <div class="bg-red-900/30 rounded p-2 text-center">
                        <div class="text-red-400 text-sm">Critical</div>
                        <div class="text-red-200 font-bold">${severityCounts.critical || 0}</div>
                    </div>
                    <div class="bg-orange-900/30 rounded p-2 text-center">
                        <div class="text-orange-400 text-sm">High</div>
                        <div class="text-orange-200 font-bold">${severityCounts.high || 0}</div>
                    </div>
                    <div class="bg-yellow-900/30 rounded p-2 text-center">
                        <div class="text-yellow-400 text-sm">Medium</div>
                        <div class="text-yellow-200 font-bold">${severityCounts.medium || 0}</div>
                    </div>
                    <div class="bg-blue-900/30 rounded p-2 text-center">
                        <div class="text-blue-400 text-sm">Low</div>
                        <div class="text-blue-200 font-bold">${severityCounts.low || 0}</div>
                    </div>
                </div>
                ${activeVulns.length > 0 ? `
                    <div class="space-y-2  ">
                        ${activeVulns.slice(0, 3).map(vuln => `
                            <div class="bg-gray-700 rounded p-2">
                                <div class="flex justify-between items-start mb-1">
                                    <span class="text-sm px-2 py-1 rounded ${this.getSeverityClass(vuln.severity)}">${vuln.severity}</span>
                                    <span class="text-sm text-gray-400">${new Date(vuln.published_date).toLocaleDateString()}</span>
                                </div>
                                <div class="text-sm text-white font-medium">${vuln.package}</div>
                                <div class="text-sm text-gray-300 mt-1">${vuln.description}</div>
                                ${vuln.fixed_version ? `<div class="text-sm text-green-400 mt-1">Fix: v${vuln.fixed_version}</div>` : ''}
                            </div>
                        `).join('')}
                    </div>
                ` : '<div class="text-sm text-green-400">All vulnerabilities resolved</div>'}
            </div>
        `;
    }

    renderDependencies(deps) {
        if (!deps || deps.length === 0) return '';
        
        const prodDeps = deps.filter(dep => dep.type === 'production');
        const devDeps = deps.filter(dep => dep.type === 'development');
        const outdatedDeps = deps.filter(dep => dep.version !== dep.latest_version);
        
        return `
            <div class="mb-4">
                <h4 class="font-semibold text-white text-sm mb-2">📋 Package Overview</h4>
                <div class="grid grid-cols-4 gap-2 mb-3 text-sm">
                    <div class="bg-gray-700 rounded p-2 text-center">
                        <div class="text-gray-400">Production</div>
                        <div class="text-white font-bold">${prodDeps.length}</div>
                    </div>
                    <div class="bg-gray-700 rounded p-2 text-center">
                        <div class="text-gray-400">Development</div>
                        <div class="text-white font-bold">${devDeps.length}</div>
                    </div>
                    <div class="bg-gray-700 rounded p-2 text-center">
                        <div class="text-gray-400">Total</div>
                        <div class="text-white font-bold">${deps.length}</div>
                    </div>
                    <div class="bg-yellow-900/30 rounded p-2 text-center">
                        <div class="text-yellow-400">Outdated</div>
                        <div class="text-yellow-200 font-bold">${outdatedDeps.length}</div>
                    </div>
                </div>
                ${outdatedDeps.length > 0 ? `
                    <div class="space-y-1  ">
                        <div class="text-sm text-yellow-400 font-medium mb-1">Outdated Packages:</div>
                        ${outdatedDeps.slice(0, 5).map(dep => `
                            <div class="bg-gray-700 rounded p-2 flex justify-between items-center">
                                <div>
                                    <span class="text-white text-sm">${dep.name}</span>
                                    <span class="text-sm px-2 py-1 rounded ${this.getTypeClass(dep.type)} ml-2">${dep.type}</span>
                                </div>
                                <div class="text-sm">
                                    <span class="text-gray-400">${dep.version}</span>
                                    <span class="text-gray-500">→</span>
                                    <span class="text-green-400">${dep.latest_version}</span>
                                </div>
                            </div>
                        `).join('')}
                    </div>
                ` : '<div class="text-sm text-green-400">All packages up to date</div>'}
            </div>
        `;
    }

    renderUpdatePolicy(policy) {
        if (!policy) return '';
        
        return `
            <div>
                <h4 class="font-semibold text-white text-sm mb-2">⚙️ Update Policy</h4>
                <div class="grid grid-cols-3 gap-2 text-sm">
                    <div class="bg-gray-700 rounded p-2 text-center">
                        <div class="text-gray-400">Security Updates</div>
                        <div class="${policy.auto_update_security ? 'text-green-400' : 'text-red-400'} font-medium">
                            ${policy.auto_update_security ? 'AUTO' : 'MANUAL'}
                        </div>
                    </div>
                    <div class="bg-gray-700 rounded p-2 text-center">
                        <div class="text-gray-400">Minor Updates</div>
                        <div class="${policy.auto_update_minor ? 'text-green-400' : 'text-red-400'} font-medium">
                            ${policy.auto_update_minor ? 'AUTO' : 'MANUAL'}
                        </div>
                    </div>
                    <div class="bg-gray-700 rounded p-2 text-center">
                        <div class="text-gray-400">Major Updates</div>
                        <div class="${policy.manual_approval_major ? 'text-yellow-400' : 'text-green-400'} font-medium">
                            ${policy.manual_approval_major ? 'APPROVAL' : 'AUTO'}
                        </div>
                    </div>
                </div>
            </div>
        `;
    }

    getScanStatusColor(status) {
        const colors = {
            'passed': 'text-green-400',
            'warning': 'text-yellow-400',
            'failed': 'text-red-400'
        };
        return colors[status] || 'text-gray-400';
    }

    getSeverityClass(severity) {
        const classes = {
            'critical': 'bg-red-900 text-red-200',
            'high': 'bg-orange-900 text-orange-200',
            'medium': 'bg-yellow-900 text-yellow-200',
            'low': 'bg-blue-900 text-blue-200'
        };
        return classes[severity] || 'bg-gray-600 text-gray-300';
    }

    getTypeClass(type) {
        const classes = {
            'production': 'bg-green-900 text-green-200',
            'development': 'bg-blue-900 text-blue-200',
            'peer': 'bg-purple-900 text-purple-200',
            'optional': 'bg-gray-600 text-gray-300'
        };
        return classes[type] || 'bg-gray-600 text-gray-300';
    }

    getErrorMessage(message) {
        return `<div class="bg-red-900/20 border border-red-600 rounded-lg p-4">
            <div class="text-red-400 font-medium">⚠️ ${message}</div>
        </div>`;
    }
}

window.DependenciesComponent = DependenciesComponent;
