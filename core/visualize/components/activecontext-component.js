// ActiveContext Component - Real-time schebased implementation
class ActiveContextComponent {
    constructor() {
        this.data = null;
        this.lastUpdate = null;
    }

    render(data) {
        // Real-time data processing with change detection
        this.data = data?.['activeContext.json'];
        const currentUpdate = this.data?.last_updated || new Date().toISOString();
        
        if (!this.data) {
            return `
                <h3 class="text-lg font-bold text-cyan-400 mb-3">🔄 Active Context</h3>
                <div class="bg-red-900/20 border border-red-700 rounded-lg p-4">
                    <p class="text-red-200">❌ activeContext.json not loaded - auto-refresh every 5 minutes</p>
                </div>
            `;
        }
        
        // Track updates for real-time indicators
        const isNewData = this.lastUpdate !== currentUpdate;
        this.lastUpdate = currentUpdate;

        return `
            <div>
                <h3 class="text-lg font-bold text-cyan-400 mb-3 flex items-center">
                    🔄 Active Context
                    <span class="ml-2 text-sm bg-cyan-900 text-cy0 px-2 py-1 rounded">
                        Updated: ${new Date(currentUpdate).toLocaleTimeString()}
                    </span>
                </h3>
                <div class="bg-gray-800 rounded-lg p-4 border border-cyan-600/30">
                    ${this.renderCurrentImplementation()}
                    ${this.renderAIState()}
                    ${this.renderEventTracking()}
                    ${this.renderCurrentContext()}
                </div>
            </div>
        `;
    }

    renderCurrentImplementation() {
        const impl = this.data?.current_implementation;
        if (!impl) return '<div class="text-gray-500 mb-4">No active implementation</div>';
        
        return `
            <div class="mb-4">
                <h4 class="font-semibold text-white text-sm mb-2">Current Implementation</h4>
                <div class="grid grid-cols-2 gap-4 text-sm">
                    <div><span class="text-gray-400">Task ID:</span> <span class="text-white">${impl.active_task_id || 'N/A'}</span></div>
                    <div><span class="text-gray-400">Phase:</span> <span class="text-white">${impl.current_phase || 'N/A'}</span></div>
                    <div><span class="text-gray-400">Progress:</span> <span class="text-white">${impl.progress_percentage || 0}%</span></div>
                    <div><span class="text-gray-400">Started:</span> <span class="text-white">${impl.started_at ? new Date(impl.started_at).toLocaleDateString() : 'N/A'}</span></div>
                </div>
            </div>
        `;
    }

    renderAIState() {
        const aiState = this.data?.ai_state;
        if (!aiState) return '';
        
        return `
            <div class="mb-4">
                <h4 class="font-semibold text-white text-sm mb-2">AI State</h4>
                <div class="text-sm">
                    <div><span class="text-gray-400">Current Minister:</span> <span class="text-white">${aiState.current_minister || 'N/A'}</span></div>
                    <div><span class="text-gray-400">Checkpoint:</span> <span class="text-white">${aiState.checkpoint_status || 'N/A'}</span></div>
                </div>
            </div>
        `;
    }

    renderEventTracking() {
        const events = this.data?.event_tracking;
        if (!events || !Array.isArray(events) || events.length === 0) return '';
        
        return `
            <div class="mb-4">
                <h4 class="font-semibold text-white text-sm mb-2">Recent Events (${events.length})</h4>
                <div class="space-y-2  ">
                    ${events.slice(0, 5).map(e => `
                        <div class="bg-gray-700 rounded p-2">
                            <div class="text-xs text-white">${e.description || e.type || 'Event'}</div>
                            <div class="text-xs text-gray-400">${e.timestamp ? new Date(e.timestamp).toLocaleString() : 'No timestamp'}</div>
                        </div>
                    `).join('')}
                </div>
            </div>
        `;
    }

    renderCurrentContext() {
        const context = this.data?.current_context;
        if (!context) return '';
        
        return `
            <div>
                <h4 class="font-semibold text-white text-sm mb-2">Current Context</h4>
                <div class="text-sm">
                    <div><span class="text-gray-400">Working Files:</span> <span class="text-white">${context.working_files?.length || 0}</span></div>
                    <div><span class="text-gray-400">Active Processes:</span> <span class="text-white">${context.active_processes?.length || 0}</span></div>
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

window.ActiveContextComponent = ActiveContextComponent;
