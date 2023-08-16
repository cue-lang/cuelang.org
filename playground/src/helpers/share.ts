import { Workspace, WORKSPACE } from '@models/workspace';
import { OPTION_TYPE } from '@models/options';
import { SharedCode } from '@models/share';
import { editor } from 'monaco-editor';

export const getShareUrl = (): string => {
    const prefix = window.location.host.startsWith('localhost') ? 'http://localhost:8081' : '';
    return `${ prefix }/.netlify/functions/snippets`;
}

export const share = async (contents: string): Promise<string> => {
    return fetch(getShareUrl(), {
        method: 'POST',
        headers: { 'Content-Type': 'text/plain;' },
        body: contents,
    }).then((resp: Response) => {
        if (!resp.ok) {
            throw new Error(`Response status was not ok: ${ resp.status }`);
        }
        return resp.text();
    }).catch((error) => {
        console.log('Failed to share', error);
        return null;
    });
}

export const getSharedCode = async(id: string): Promise<SharedCode> => {
    const url = `${ getShareUrl() }?id=${ id }`;

    return fetch(url, {
        headers: { 'Content-Type': 'text/plain;' }
    }).then(async (resp: Response) => {
        if (!resp.ok) {
            throw new Error(`Error loading snippet with id: ${ id }, status: ${ resp.status }`);
        }
        const contents = await resp.text();
        return parseSharedCode(contents);
    }).catch((error) => {
        console.log(`Error loading snippet with id=${ id }`, error);
        return null;
    });
}

export const parseSharedCode = (contents: string): SharedCode => {
    // TODO parse multiple inputs/policy mode when we have new way of share via tartxt
    return {
        workspace: WORKSPACE.FUNC,
        inputs: [{
            type: OPTION_TYPE.INPUT,
            code: contents,
        }]
    };
}

export const workspaceToShareContent = (workspace: Workspace, inputEditors: {
    [key: string]: editor.IStandaloneCodeEditor
}): string => {
    // TODO: Make share work for policy workspace
    const inputTab = workspace.config.inputTabs.find(tab => tab.type === OPTION_TYPE.INPUT);
    const editorId = `${ workspace.type }-${ inputTab.type }`;
    const inputEditor = inputEditors[editorId];
    return inputEditor.getValue();
}
