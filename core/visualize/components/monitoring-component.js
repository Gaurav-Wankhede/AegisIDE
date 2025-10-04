// Monitoring Component - Schema-Based Implementation with Real-Time Updates
class MonitoringComponent {
    constructor() {
        this.containerId = 'monitoring';
        this.lastUpdate = null;
    }

    render(data) {
        const monitoring = data['monitoring.json'];

        if (!monitoring) {
            return this.getErrorMessage('monitoring.json not loaded - Auto-refresh every 5 minutes');
        }

        // Check for new data
        const hasNewData = this.hasNewData(monitoring);
        if (hasNewData) {
            this.lastUpdate = new Date().toLocaleTimeString();
        }

        const updateInfo = this.lastUpdate ? `<div class="text-sm text-gray-400 mb-2">Last updated: ${this.lastUpdate}</div>` : '';

        return `
            <h3 class="text-lg font-bold text-teal-400 mb-3">📊 Monitoring</h3>
            ${updateInfo}
            <div class="bg-gray-800 rounded-lg p-4 border border-teal-600/30">
                ${this.renderHealthStatus(monitoring.health_status)}
                ${this.renderPerformanceMetrics(monitoring.performance_metrics)}
                ${this.renderAlerts(monitoring.alerts)}
                ${this.renderPerformanceTrends(monitoring.performance_trends)}
            </div>
        `;
    }

    hasNewData(monitoringData) {
        if (!monitoringData || !monitoringData.last_updated) return false;
        
        const currentTimestamp = new Date(monitoringData.last_updated).getTime();
        const lastTimestamp = this.lastDataTimestamp || 0;
        
        if (currentTimestamp > lastTimestamp) {
            this.lastDataTimestamp = currentTimestamp;
            return true;
        }
        return false;
    }

    renderHealthStatus(healthStatus) {
        if (!healthStatus) return '';
        
        const overallHealth = healthStatus.overall_health || 0;
        const healthColor = this.getHealthColor(overallHealth);
        
        return `
            <div class="mb-4">
                <h4 class="font-semibold text-white text-sm mb-2">💚 System Health</h4>
                <div class="bg-gray-700 rounded p-3">
                    <div class="flex justify-between items-center mb-3">
                        <span class="text-white font-medium">Overall Health</span>
                        <span class="${healthColor} font-bold text-lg">${overallHealth}%</span>
                    </div>
                    <div class="w-full bg-gray-600 rounded-full h-2 mb-3">
                        <div class="${this.getHealthBarColor(overallHealth)} h-2 rounded-full transition-all" style="width:${overallHealth}%"></div>
                    </div>
                    <div class="grid grid-cols-2 gap-3 text-sm">
                        <div>
                            <div class="text-gray-400 text-sm">Memory Bank</div>
                            <div class="${this.getHealthColor(healthStatus.memory_bank_health || 0)} font-medium">${healthStatus.memory_bank_health || 0}%</div>
                        </div>
                        <div>
                            <div class="text-gray-400 text-sm">Schema Validation</div>
                            <div class="${this.getHealthColor(healthStatus.schema_validation_health || 0)} font-medium">${healthStatus.schema_validation_health || 0}%</div>
                        </div>
                    </div>
                    ${healthStatus.last_health_check ? `
                        <div class="text-sm text-gray-400 mt-2">Last Check: ${new Date(healthStatus.last_health_check).toLocaleString()}</div>
                    ` : ''}
                </div>
            </div>
        `;
    }

    renderPerformanceMetrics(metrics) {
        if (!metrics) return '';
        
        return `
            <div class="mb-4">
                <h4 class="font-semibold text-white text-sm mb-2">⚡ Performance Metrics</h4>
                <div class="grid grid-cols-2 gap-3">
                    <div class="bg-gray-700 rounded p-3">
                        <div class="text-gray-400 text-sm mb-1">Parsing Time</div>
                        <div class="text-white font-bold">${metrics.parsing_time_ms || 0}ms</div>
                    </div>
                    <div class="bg-gray-700 rounded p-3">
                        <div class="text-gray-400 text-sm mb-1">Memory Usage</div>
                        <div class="text-white font-bold">${this.formatMemory(metrics.memory_usage_kb || 0)}</div>
                    </div>
                    <div class="bg-gray-700 rounded p-3">
                        <div class="text-gray-400 text-sm mb-1">AI Processing</div>
                        <div class="text-white font-bold">${metrics.ai_processing_time_ms || 0}ms</div>
                    </div>
                    <div class="bg-gray-700 rounded p-3">
                        <div class="text-gray-400 text-sm mb-1">Query Response</div>
                        <div class="text-white font-bold">${metrics.query_response_time_ms || 0}ms</div>
                    </div>
                </div>
                <div class="grid grid-cols-2 gap-3 mt-3">
                    <div class="bg-gray-700 rounded p-2 text-center">
                        <div class="text-gray-400 text-sm">Files</div>
                        <div class="text-white font-medium">${metrics.file_count || 0}</div>
                    </div>
                    <div class="bg-gray-700 rounded p-2 text-center">
                        <div class="text-gray-400 text-sm">Total Size</div>
                        <div class="text-white font-medium">${this.formatMemory(metrics.total_size_kb || 0)}</div>
                    </div>
                </div>
            </div>
        `;
    }

    renderAlerts(alerts) {
        if (!alerts || alerts.length === 0) return '';
        
        const activeAlerts = alerts.filter(alert => !alert.resolved);
        const severityCounts = alerts.reduce((acc, alert) => {
            acc[alert.severity] = (acc[alert.severity] || 0) + 1;
            return acc;
        }, {});
        
        return `
            <div class="mb-4">
                <h4 class="font-semibold text-white text-sm mb-2">🚨 Alerts (${alerts.length})</h4>
                <div class="grid grid-cols-3 gap-2 mb-3 text-sm">
                    <div class="bg-red-900/20 rounded p-2 text-center">
                        <div class="text-red-400">Critical</div>
                        <div class="text-red-200 font-bold">${severityCounts.critical || 0}</div>
                    </div>
                    <div class="bg-orange-900/20 rounded p-2 text-center">
                        <div class="text-orange-400">High</div>
                        <div class="text-orange-200 font-bold">${severityCounts.high || 0}</div>
                    </div>
                    <div class="bg-yellow-900/20 rounded p-2 text-center">
                        <div class="text-yellow-400">Medium</div>
                        <div class="text-yellow-200 font-bold">${severityCounts.medium || 0}</div>
                    </div>
                </div>
                ${activeAlerts.length > 0 ? `
                    <div class="space-y-1  ">
                        ${activeAlerts.slice(0, 3).map(alert => `
                            <div class="bg-gray-700 rounded p-2">
                                <div class="flex justify-between items-start mb-1">
                                    <span class="text-sm px-2 py-1 rounded ${this.getSeverityClass(alert.severity)}">${alert.severity}</span>
                                    <span class="text-sm text-gray-400">${new Date(alert.timestamp).toLocaleDateString()}</span>
                                </div>
                                <div class="text-sm text-white">${alert.message}</div>
                                ${alert.category ? `<div class="text-sm text-gray-400 mt-1">${alert.category}</div>` : ''}
                            </div>
                        `).join('')}
                    </div>
                ` : '<div class="text-sm text-green-400">No active alerts</div>'}
            </div>
        `;
    }

    renderPerformanceTrends(trends) {
        if (!trends) return '';
        
        return `
            <div>
                <h4 class="font-semibold text-white text-sm mb-2">📈 Performance Trends</h4>
                <div class="grid grid-cols-3 gap-3 text-sm">
                    <div class="bg-gray-700 rounded p-2 text-center">
                        <div class="text-gray-400 text-sm">Parsing</div>
                        <div class="${this.getTrendColor(trends.parsing_improvement)} font-medium">${this.formatTrend(trends.parsing_improvement)}</div>
                    </div>
                    <div class="bg-gray-700 rounded p-2 text-center">
                        <div class="text-gray-400 text-sm">Memory</div>
                        <div class="${this.getTrendColor(trends.memory_optimization)} font-medium">${this.formatTrend(trends.memory_optimization)}</div>
                    </div>
                    <div class="bg-gray-700 rounded p-2 text-center">
                        <div class="text-gray-400 text-sm">Errors</div>
                        <div class="${this.getTrendColor(trends.error_reduction)} font-medium">${this.formatTrend(trends.error_reduction)}</div>
                    </div>
                </div>
            </div>
        `;
    }

    getHealthColor(health) {
        if (health >= 90) return 'text-green-400';
        if (health >= 70) return 'text-yellow-400';
        return 'text-red-400';
    }

    getHealthBarColor(health) {
        if (health >= 90) return 'bg-green-400';
        if (health >= 70) return 'bg-yellow-400';
        return 'bg-red-400';
    }

    getSeverityClass(severity) {
        const classes = {
            'critical': 'bg-red-900 text-red-200',
            'high': 'bg-orange-900 text-orange-200',
            'medium': 'bg-yellow-900 text-yellow-200',
            'low': 'bg-blue-900 text-blue-200',
            'info': 'bg-gray-600 text-gray-300'
        };
        return classes[severity] || classes.info;
    }

    getTrendColor(trend) {
        if (!trend) return 'text-gray-400';
        return trend > 0 ? 'text-green-400' : trend < 0 ? 'text-red-400' : 'text-gray-400';
    }

    formatTrend(trend) {
        if (!trend) return '0%';
        const sign = trend > 0 ? '+' : '';
        return `${sign}${Math.round(trend * 100)}%`;
    }

    formatMemory(kb) {
        if (kb < 1024) return `${kb}KB`;
        return `${Math.round(kb / 1024 * 100) / 100}MB`;
    }

    getErrorMessage(message) {
        return `<div class="bg-red-900/20 border border-red-600 rounded-lg p-4">
            <div class="text-red-400 font-medium">⚠️ ${message}</div>
        </div>`;
    }
}

window.MonitoringComponent = MonitoringComponent;
