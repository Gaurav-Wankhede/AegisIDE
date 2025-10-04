// ScratchpadComponent - Real-time immediate priorities following scratchpad.json schema
class ScratchpadComponent {
    constructor() {
        this.data = null;
        this.lastUpdate = null;
    }

    render(data) {
        // Real-time data processing with change detection
        this.data = data?.['scratchpad.json'];
        const currentUpdate = this.data?.last_updated || new Date().toISOString();
        
        if (!this.data) {
            return this.getErrorMessage('scratchpad.json not loaded - Auto-refresh every 5 minutes');
        }
        
        // Track updates for real-time indicators
        const isNewData = this.lastUpdate !== currentUpdate;
        this.lastUpdate = currentUpdate;

        const sp = this.data;
        
        return `
            <div>
                <h3 class="text-lg font-bold text-yellow-400 mb-3 flex items-center">
                    📝 Scratchpad
                    <span class="ml-2 text-sm bg-yellow-900 text-yellow-200 px-2 py-1 rounded">
                        Updated: ${new Date(currentUpdate).toLocaleTimeString()}
                    </span>
                </h3>
                <div class="bg-gray-800 rounded-lg p-4 border border-yellow-600/30">
                    ${this.renderFocusMode(sp.focus_mode)}
                    ${this.renderImmediatePriorities(sp.immediate_priorities)}
                    ${this.renderTaskQueue(sp.task_queue)}
                    ${this.renderQuickNotes(sp.quick_notes)}
                    ${this.renderEventHistory(sp.immutable_event_history)}
                </div>
            </div>
        `;
    }

    renderFocusMode(focusMode) {
        if (!focusMode) return '';
        
        return `
            <div class="mb-4">
                <div class="flex justify-between items-center mb-2">
                    <h4 class="font-semibold text-white text-sm">🎯 Focus Mode</h4>
                    <span class="text-xs px-2 py-1 rounded ${focusMode.enabled ? 'bg-green-900 text-green-200' : 'bg-gray-700 text-gray-300'}">
                        ${focusMode.enabled ? 'Active' : 'Inactive'}
                    </span>
                </div>
                ${focusMode.enabled ? `
                    <div class="bg-gray-700 rounded p-3">
                        <div class="text-sm text-white mb-1">${focusMode.current_focus || 'No focus set'}</div>
                        ${focusMode.focus_end_time ? `<div class="text-xs text-gray-400">Until: ${new Date(focusMode.focus_end_time).toLocaleString()}</div>` : ''}
                        ${focusMode.distractions_blocked && focusMode.distractions_blocked.length > 0 ? 
                            `<div class="text-xs text-red-400 mt-1">Blocked: ${focusMode.distractions_blocked.join(', ')}</div>` : ''}
                    </div>
                ` : ''}
            </div>
        `;
    }

    renderImmediatePriorities(priorities) {
        if (!priorities || priorities.length === 0) return '';
        
        return `
            <div class="mb-4">
                <h4 class="font-semibold text-white text-sm mb-2">⚡ Immediate Priorities (${priorities.length}/10)</h4>
                <div class="space-y-2  ">
                    ${priorities.slice(0, 5).map(priority => `
                        <div class="bg-gray-700 rounded p-3">
                            <div class="flex justify-between items-start mb-1">
                                <div class="text-sm text-white font-medium">${priority.title}</div>
                                <span class="text-xs px-2 py-1 rounded ${this.getUrgencyClass(priority.urgency)}">${priority.urgency}</span>
                            </div>
                            <div class="grid grid-cols-2 gap-3 text-xs">
                                <div><span class="text-gray-400">Task ID:</span> <span class="text-white">${priority.task_id}</span></div>
                                <div><span class="text-gray-400">Est:</span> <span class="text-white">${priority.estimated_minutes || 0} min</span></div>
                            </div>
                            <div class="flex justify-between items-center mt-2 text-xs">
                                <div class="flex space-x-2">
                                    ${priority.dependencies_met ? '<span class="px-1 py-0.5 bg-green-900 text-green-200 rounded">✓ Ready</span>' : '<span class="px-1 py-0.5 bg-red-900 text-red-200 rounded">⏳ Blocked</span>'}
                                </div>
                                ${priority.deadline ? `<div class="text-gray-400">Due: ${new Date(priority.deadline).toLocaleDateString()}</div>` : ''}
                            </div>
                        </div>
                    `).join('')}
                </div>
            </div>
        `;
    }

    renderTaskQueue(taskQueue) {
        if (!taskQueue || taskQueue.length === 0) return '';
        
        const statusCounts = taskQueue.reduce((acc, task) => {
            acc[task.status] = (acc[task.status] || 0) + 1;
            return acc;
        }, {});

        return `
            <div class="mb-4">
                <h4 class="font-semibold text-white text-sm mb-2">📋 Task Queue (${taskQueue.length}/50)</h4>
                <div class="grid grid-cols-4 gap-2 mb-3 text-xs">
                    <div class="bg-gray-700 rounded p-2 text-center">
                        <div class="text-gray-400">Todo</div>
                        <div class="text-white font-bold">${statusCounts.todo || 0}</div>
                    </div>
                    <div class="bg-blue-900/20 rounded p-2 text-center">
                        <div class="text-blue-400">In Progress</div>
                        <div class="text-blue-200 font-bold">${statusCounts.in_progress || 0}</div>
                    </div>
                    <div class="bg-red-900/20 rounded p-2 text-center">
                        <div class="text-red-400">Blocked</div>
                        <div class="text-red-200 font-bold">${statusCounts.blocked || 0}</div>
                    </div>
                    <div class="bg-green-900/20 rounded p-2 text-center">
                        <div class="text-green-400">Done</div>
                        <div class="text-green-200 font-bold">${statusCounts.completed || 0}</div>
                    </div>
                </div>
            </div>
        `;
    }

    renderQuickNotes(notes) {
        if (!notes || notes.length === 0) return '';
        
        return `
            <div class="mb-4">
                <h4 class="font-semibold text-white text-sm mb-2">💭 Quick Notes (${notes.length}/20)</h4>
                <div class="space-y-2  ">
                    ${notes.slice(0, 3).map(note => `
                        <div class="bg-gray-700 rounded p-2">
                            <div class="text-sm text-white">${note.content}</div>
                            <div class="flex justify-between items-center mt-1 text-xs">
                                <div class="text-gray-400">${new Date(note.timestamp).toLocaleString()}</div>
                                <span class="px-1 py-0.5 rounded ${this.getPriorityClass(note.priority)}">${note.priority || 'medium'}</span>
                            </div>
                        </div>
                    `).join('')}
                </div>
            </div>
        `;
    }

    renderEventHistory(history) {
        if (!history || history.length === 0) return '';
        
        return `
            <div>
                <h4 class="font-semibold text-white text-sm mb-2">📚 Recent Events (${history.length})</h4>
                <div class="space-y-1  ">
                    ${history.slice(-3).map(event => `
                        <div class="bg-gray-700 rounded p-2 text-xs">
                            <div class="text-white">${event.action}</div>
                            <div class="text-gray-400">${new Date(event.timestamp).toLocaleString()}</div>
                        </div>
                    `).join('')}
                </div>
            </div>
        `;
    }

    getUrgencyClass(urgency) {
        const classes = {
            'critical': 'bg-red-900 text-red-200',
            'high': 'bg-orange-900 text-orange-200',
            'medium': 'bg-yellow-900 text-yellow-200',
            'low': 'bg-gray-600 text-gray-300'
        };
        return classes[urgency] || classes.medium;
    }

    getPriorityClass(priority) {
        const classes = {
            'high': 'bg-red-900 text-red-200',
            'medium': 'bg-yellow-900 text-yellow-200',
            'low': 'bg-green-900 text-green-200'
        };
        return classes[priority] || classes.medium;
    }

    getErrorMessage(message) {
        return `<div class="bg-red-900/20 border border-red-600 rounded-lg p-4">
            <div class="text-red-400 font-medium">⚠️ ${message}</div>
        </div>`;
    }
}

window.ScratchpadComponent = ScratchpadComponent;
