// Kanban Component - Schema-Based Implementation with Real-Time Updates
class KanbanComponent {
    constructor() {
        this.containerId = 'kanban';
        this.lastUpdate = null;
    }

    render(data) {
        // Work with centralized data from dashboard
        this.data = data?.['kanban.json'];
        
        if (!this.data) {
            return this.getErrorMessage('kanban.json not loaded - Auto-refresh every 5 minutes');
        }

        // Check for new data
        const hasNewData = this.hasNewData(this.data);
        if (hasNewData) {
            this.lastUpdate = new Date().toLocaleTimeString();
        }

        const updateInfo = this.lastUpdate ? `<div class="text-sm text-gray-400 mb-2">Last updated: ${this.lastUpdate}</div>` : '';

        return `
            <h3 class="text-lg font-bold text-yellow-400 mb-3">📋 Task Board (Kanban)</h3>
            ${updateInfo}
            <div class="bg-gray-800 rounded-lg p-4 border border-yellow-600/30">
                ${this.renderMetadata(this.data.metadata)}
                ${this.renderColumns(this.data.columns, this.data.tasks)}
                ${this.renderMetrics(this.data.metrics)}
            </div>
        `;
    }

    hasNewData(kanbanData) {
        if (!kanbanData || !kanbanData.last_updated) return false;
        
        const currentTimestamp = new Date(kanbanData.last_updated).getTime();
        const lastTimestamp = this.lastDataTimestamp || 0;
        
        if (currentTimestamp > lastTimestamp) {
            this.lastDataTimestamp = currentTimestamp;
            return true;
        }
        return false;
    }

    renderMetadata(metadata) {
        if (!metadata) return '';
        
        return `
            <div class="mb-4">
                <div class="grid grid-cols-3 gap-4 text-sm">
                    <div><span class="text-gray-400">Project:</span> <span class="text-white">${metadata.project_name || 'N/A'}</span></div>
                    <div><span class="text-gray-400">Governance:</span> <span class="text-white">${metadata.governance_mode || 'N/A'}</span></div>
                    <div><span class="text-gray-400">Autonomy:</span> <span class="text-white">${metadata.autonomy_level || 0}%</span></div>
                </div>
            </div>
        `;
    }

    renderColumns(columns, tasks) {
        if (!columns || !tasks) return '<div class="text-gray-500">No columns or tasks available</div>';

        const tasksByStatus = {};
        tasks.forEach(task => {
            if (!tasksByStatus[task.status]) {
                tasksByStatus[task.status] = [];
            }
            tasksByStatus[task.status].push(task);
        });

        return `
            <div class="grid grid-cols-1 md:grid-cols-${Math.min(columns.length, 5)} gap-4 mb-4">
                ${columns.map(col => this.renderColumn(col, tasksByStatus[col.id] || [])).join('')}
            </div>
        `;
    }

    renderColumn(column, tasks) {
        const colorMap = {
            'todo': 'border-yellow-500',
            'in_progress': 'border-blue-500',
            'done': 'border-green-500',
            'approved': 'border-purple-500',
            'blocked': 'border-red-500'
        };

        return `
            <div class="bg-gray-700 rounded-lg p-3">
                <div class="flex justify-between items-center mb-3">
                    <h4 class="font-semibold text-white text-sm">${column.name}</h4>
                    <span class="text-xs bg-gray-600 px-2 py-1 rounded">${tasks.length}</span>
                </div>
                <div class="space-y-2  ">
                    ${tasks.map(task => `
                        <div class="bg-gray-800 rounded p-2 border-l-4 ${colorMap[task.status] || 'border-gray-500'}">
                            <div class="flex justify-between items-start mb-1">
                                <h5 class="text-white text-xs font-medium">${task.title}</h5>
                                <span class="text-xs px-1 py-0.5 rounded ${this.getPriorityClass(task.priority)}">${task.priority}</span>
                            </div>
                            <p class="text-gray-400 text-xs mb-1">${(task.description || '').substring(0, 60)}...</p>
                            <div class="flex justify-between items-center text-xs">
                                <span class="text-gray-500">${task.assigned_branch}</span>
                                ${task.blocked ? '<span class="text-red-400">🚫</span>' : '<span class="text-green-400">✅</span>'}
                            </div>
                        </div>
                    `).join('')}
                </div>
            </div>
        `;
    }

    renderMetrics(metrics) {
        if (!metrics) return '';
        
        return `
            <div class="border-t border-gray-600 pt-3">
                <div class="grid grid-cols-3 gap-4 text-sm">
                    <div><span class="text-gray-400">Total Tasks:</span> <span class="text-white">${metrics.total_tasks || 0}</span></div>
                    <div><span class="text-gray-400">Avg Cycle:</span> <span class="text-white">${metrics.average_cycle_time_hours || 0}h</span></div>
                    <div><span class="text-gray-400">Consensus:</span> <span class="text-white">${metrics.consensus_rate || 0}%</span></div>
                </div>
            </div>
        `;
    }

    getPriorityClass(priority) {
        const classes = {
            'critical': 'bg-red-900 text-red-200',
            'high': 'bg-red-800 text-red-200',
            'medium': 'bg-yellow-800 text-yellow-200',
            'low': 'bg-green-800 text-green-200'
        };
        return classes[priority] || 'bg-gray-800 text-gray-200';
    }

    getErrorMessage(message) {
        return `<div class="bg-red-900/20 border border-red-600 rounded-lg p-4">
            <div class="text-red-400 font-medium">⚠️ ${message}</div>
        </div>`;
    }
}

window.KanbanComponent = KanbanComponent;
