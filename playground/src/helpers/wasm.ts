import { Workspace } from '@models/workspace';
import { editor } from 'monaco-editor';

export const workspaceToWasmConfig = (workspace: Workspace, inputEditors: {
    [key: string]: editor.IStandaloneCodeEditor
}): WasmConfig => {
    const inputs = workspace.config.inputTabs.map(tab => {
        const editorId = `${ workspace.type }-${ tab.type }`;
        const inputEditor = inputEditors[editorId];
        return {
            type: tab.type,
            language: tab.selected.value,
            value: inputEditor ? inputEditor.getValue() : '',
        }
    });

    const output = workspace.config.outputTab.optionsReadonly ? null: workspace.config.outputTab.selected?.value;

    return {
        workspace: workspace.type,
        inputs: inputs,
        function: workspace.config.func.enabled ? workspace.config.func.selected.value : null,
        outputLanguage: output ?? null,
    }
}
