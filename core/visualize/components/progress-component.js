// ProgressComponent - Real-time development milestones following progress.json schema
class ProgressComponent {
    constructor() {
        this.data = null;
        this.lastUpdate = null;
    }

    render(data) {
        // Real-time data processing with change detection
        this.data = data?.['progress.json'];
        const currentUpdate = this.data?.last_updated || new Date().toISOString();
        
        if (!this.data) {
            return this.getErrorMessage('progress.json not loaded - auto-refresh every 10s');
        }
        
        // Track updates for real-time indicators
        const isNewData = this.lastUpdate !== currentUpdate;
        this.lastUpdate = currentUpdate;

        const updateInfo = this.lastUpdate ? `<div class="text-sm text-gray-400 mb-2">Last updated: ${this.lastUpdate}</div>` : '';

        return `
            <div>
                <h3 class="text-lg font-bold text-purple-400 mb-3">📊 Progress</h3>
                ${updateInfo}
                <div class="bg-gray-800 rounded-lg p-4 border border-purple-600/30">
                    <h3 class="text-lg font-bold text-green-400 mb-3 flex items-center">
                        📈 Development Progress
                        <span class="ml-2 text-sm bg-green-900 text-green-200 px-2 py-1 rounded">
                            Updated: ${new Date(currentUpdate).toLocaleTimeString()}
                        </span>
                    </h3>
                    ${this.renderCurrentSprint(this.data.current_sprint)}
                    ${this.renderDevelopmentMilestones(this.data.development_milestones)}
                    ${this.renderCompressedHistory(this.data.compressed_history)}
                    ${this.renderAchievements(this.data.achievements)}
                </div>
            </div>
        `;
    }

    renderCurrentSprint(sprint) {
        if (!sprint) return '';
        
        const progressPercentage = sprint.planned_points > 0 ? 
            Math.round((sprint.completed_points / sprint.planned_points) * 100) : 0;

        return `
            <div class="mb-4">
                <h4 class="font-semibold text-white text-sm mb-2">Current Sprint</h4>
                <div class="bg-gray-700 rounded p-3">
                    <div class="flex justify-between items-center mb-2">
                        <span class="text-white font-medium">${sprint.sprint_id || 'N/A'}</span>
                        <span class="text-xs px-2 py-1 rounded ${sprint.on_track ? 'bg-green-900 text-green-200' : 'bg-red-900 text-red-200'}">
                            ${sprint.on_track ? 'On Track' : 'Behind'}
                        </span>
                    </div>
                    <div class="grid grid-cols-2 gap-4 text-sm">
                        <div><span class="text-gray-400">Points:</span> <span class="text-white">${sprint.completed_points}/${sprint.planned_points}</span></div>
                        <div><span class="text-gray-400">Progress:</span> <span class="text-white">${progressPercentage}%</span></div>
                    </div>
                    <div class="w-full bg-gray-600 rounded-full h-2 mt-2">
                        <div class="bg-green-400 h-2 rounded-full transition-all" style="width:${progressPercentage}%"></div>
                    </div>
                </div>
            </div>
        `;
    }

    renderDevelopmentMilestones(milestones) {
        if (!milestones || milestones.length === 0) return '';
        
        return `
            <div class="mb-4">
                <h4 class="font-semibold text-white text-sm mb-2">Development Milestones (${milestones.length})</h4>
                <div class="space-y-2  ">
                    ${milestones.slice(0, 5).map(m => `
                        <div class="bg-gray-700 rounded p-3">
                            <div class="flex justify-between items-start mb-2">
                                <span class="font-medium text-white text-sm">${m.name}</span>
                                <span class="text-xs px-2 py-1 rounded ${this.getStatusClass(m.status)}">${m.status}</span>
                            </div>
                            <div class="grid grid-cols-2 gap-4 text-xs">
                                <div><span class="text-gray-400">Progress:</span> <span class="text-white">${m.completion_percentage}%</span></div>
                                <div><span class="text-gray-400">Tasks:</span> <span class="text-white">${m.tasks_completed}/${m.tasks_total}</span></div>
                            </div>
                            ${m.quality_metrics ? this.renderQualityMetrics(m.quality_metrics) : ''}
                        </div>
                    `).join('')}
                </div>
            </div>
        `;
    }

    renderQualityMetrics(metrics) {
        return `
            <div class="mt-2 pt-2 border-t border-gray-600">
                <div class="grid grid-cols-3 gap-2 text-xs">
                    <div><span class="text-gray-400">Coverage:</span> <span class="text-white">${metrics.test_coverage || 0}%</span></div>
                    <div><span class="text-gray-400">Quality:</span> <span class="text-white">${metrics.code_quality_score || 0}/10</span></div>
                    <div><span class="text-gray-400">Perf:</span> <span class="text-white">${metrics.performance_score || 0}/10</span></div>
                </div>
            </div>
        `;
    }

    renderCompressedHistory(history) {
        if (!history) return '';
        
        return `
            <div class="mb-4">
                <h4 class="font-semibold text-white text-sm mb-2">Compressed History</h4>
                <div class="grid grid-cols-3 gap-4 text-sm">
                    <div><span class="text-gray-400">Tasks:</span> <span class="text-white">${history.total_tasks_completed || 0}</span></div>
                    <div><span class="text-gray-400">Bugs Fixed:</span> <span class="text-white">${history.total_bugs_fixed || 0}</span></div>
                    <div><span class="text-gray-400">Velocity:</span> <span class="text-white">${history.sprint_velocity || 0}</span></div>
                </div>
            </div>
        `;
    }

    renderAchievements(achievements) {
        if (!achievements || achievements.length === 0) return '';
        
        return `
            <div>
                <h4 class="font-semibold text-white text-sm mb-2">Recent Achievements (${achievements.length})</h4>
                <div class="space-y-2">
                    ${achievements.slice(0, 3).map(a => `
                        <div class="bg-yellow-900/20 border border-yellow-600/30 rounded p-2">
                            <div class="text-yellow-400 font-medium text-sm">🏆 ${a.title}</div>
                            <div class="text-xs text-gray-400">${new Date(a.earned_date).toLocaleDateString()}</div>
                        </div>
                    `).join('')}
                </div>
            </div>
        `;
    }

    getStatusClass(status) {
        const classes = {
            'not_started': 'bg-gray-700 text-gray-300',
            'in_progress': 'bg-blue-900 text-blue-200',
            'completed': 'bg-green-900 text-green-200',
            'blocked': 'bg-red-900 text-red-200'
        };
        return classes[status] || classes.not_started;
    }

    getErrorMessage(message) {
        return `<div class="bg-red-900/20 border border-red-600 rounded-lg p-4">
            <div class="text-red-400 font-medium">⚠️ ${message}</div>
        </div>`;
    }
}

window.ProgressComponent = ProgressComponent;
