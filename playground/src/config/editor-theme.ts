import { vscodeLightInit } from '@uiw/codemirror-theme-vscode';

export const vscodeLight = vscodeLightInit({
    settings: {
        lineHighlight: '#f0f0f0b3',
        selectionMatch: '#add6ff',
    },
});

export const vscodeLightTerminal = vscodeLightInit({
    settings: {
        background: '#eef0f5',
        gutterBackground: '#eef0f5',
        lineHighlight: '#f0f0f0b3',
        selectionMatch: '#add6ff',
    },
});
