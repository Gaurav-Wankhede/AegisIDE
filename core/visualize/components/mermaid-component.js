// MermaidComponent - Pure Mermaid diagram renderer following mermaid.schema.json
class MermaidComponent {
    constructor() {
        this.data = null;
        this.initialized = false;
        this.initializeMermaid();
    }

    initializeMermaid() {
        if (typeof mermaid !== 'undefined' && !this.initialized) {
            mermaid.initialize({
                theme: 'dark',
                darkMode: true,
                themeVariables: {
                    primaryColor: '#3b82f6',
                    primaryTextColor: '#f8fafc',
                    primaryBorderColor: '#1e40af',
                    lineColor: '#06b6d4',
                    sectionBkgColor: '#1f2937',
                    altSectionBkgColor: '#374151',
                    gridColor: '#4b5563',
                    secondaryColor: '#8b5cf6',
                    tertiaryColor: '#10b981'
                },
                flowchart: {
                    useMaxWidth: false,
                    htmlLabels: true
                }
            });
            this.initialized = true;
        }
    }

    render(data) {
        this.data = data?.['mermaid.json'];
        
        if (!this.data) {
            return `<div class="text-red-400 p-4">❌ mermaid.json not found</div>`;
        }

        return `
            <div class="space-y-8">
                ${this.renderProgressFlowDiagram()}
                ${this.renderConstitutionalFlowDiagram()}  
                ${this.renderMCPIntegrationDiagram()}
            </div>
        `;
    }

    renderProgressFlowDiagram() {
        const progressFlow = this.data.progress_flow;
        if (!progressFlow?.mermaid_code) return '';

        return `
            <div class="bg-gray-900 rounded-lg border border-gray-700 p-4">
                <h3 class="text-cyan-300 font-semibold mb-4">📈 Progress Flow</h3>
                ${this.createMermaidDiagram(progressFlow.mermaid_code, 'progress-flow')}
            </div>
        `;
    }

    renderConstitutionalFlowDiagram() {
        const constitutionalFlow = this.data.ai_logic_flow?.constitutional_flow;
        if (!constitutionalFlow?.mermaid_representation) return '';

        return `
            <div class="bg-gray-900 rounded-lg border border-gray-700 p-4">
                <h3 class="text-purple-300 font-semibold mb-4">⚖️ Constitutional Flow</h3>
                ${this.createMermaidDiagram(constitutionalFlow.mermaid_representation, 'constitutional-flow')}
            </div>
        `;
    }

    renderMCPIntegrationDiagram() {
        const mcpIntegration = this.data.ai_logic_flow?.mcp_integration;
        if (!mcpIntegration?.integration_diagram) return '';

        return `
            <div class="bg-gray-900 rounded-lg border border-gray-700 p-4">
                <h3 class="text-green-300 font-semibold mb-4">🔧 MCP Integration</h3>
                ${this.createMermaidDiagram(mcpIntegration.integration_diagram, 'mcp-integration')}
            </div>
        `;
    }

    createMermaidDiagram(mermaidCode, diagramType) {
        if (!mermaidCode) return '<div class="text-gray-500">No diagram available</div>';

        const uniqueId = `mermaid-${diagramType}-${Date.now()}`;
        
        setTimeout(() => {
            const element = document.getElementById(uniqueId);
            if (element && typeof mermaid !== 'undefined') {
                try {
                    element.innerHTML = '';
                    
                    const mermaidDiv = document.createElement('div');
                    mermaidDiv.className = 'mermaid';
                    mermaidDiv.textContent = mermaidCode;
                    element.appendChild(mermaidDiv);
                    
                    mermaid.run({
                        nodes: [mermaidDiv]
                    });
                    
                } catch (error) {
                    console.error(`Mermaid ${diagramType} error:`, error);
                    element.innerHTML = `
                        <div class="text-red-400 bg-red-900/10 p-3 rounded border border-red-600">
                            ❌ ${diagramType} render error: ${error.message}
                        </div>
                    `;
                }
            }
        }, 300);

        return `
            <div id="${uniqueId}" class="min-h-[400px] flex items-center justify-center bg-gray-800 rounded border border-gray-600">
                <div class="text-gray-400 animate-pulse">Loading ${diagramType} diagram...</div>
            </div>
        `;
    }
}

// Export to global window for dashboard access
window.MermaidComponent = MermaidComponent;
