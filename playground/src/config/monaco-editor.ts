import { editor } from 'monaco-editor';

export const editorOptions: editor.IStandaloneEditorConstructionOptions = {
    automaticLayout: true,
    minimap: {
        enabled: false,
    },
    renderLineHighlight: 'none',
    scrollBeyondLastLine: false,
}

export const outputEditorOptions: editor.IStandaloneEditorConstructionOptions = {
    ...editorOptions,
    domReadOnly: true,
    readOnly: true,
}
