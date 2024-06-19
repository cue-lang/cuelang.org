import { EditorView } from '@uiw/react-codemirror';

import { Workspace } from '@models/workspace';

export const workspaceToWasmConfig = (workspace: Workspace, inputEditors: {
    [key: string]: EditorView
}): WasmConfig => {
    const inputs = workspace.config.inputTabs.map(tab => {
        const editorId = `${ workspace.type }-${ tab.type }`;
        const inputEditor = inputEditors[editorId];
        return {
            type: tab.type,
            language: tab.selected.value,
            value: inputEditor ? inputEditor.state.doc.toString() : '',
        }
    });

    const output = workspace.config.outputTab.optionsReadonly ? null : workspace.config.outputTab.selected?.value;

    return {
        workspace: workspace.type,
        inputs: inputs,
        function: workspace.config.func.enabled ? workspace.config.func.selected.value : null,
        outputLanguage: output ?? null,
    }
}
