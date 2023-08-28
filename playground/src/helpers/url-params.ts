import { Workspace, WORKSPACE } from '@models/workspace';
import { OPTION_TYPE } from '@models/options';
import { HASH_KEY, hashParams } from '@models/hashParams';
import { cleanObject } from '@helpers/cleaner';

export const getSearchParamsFromUrl = (): URLSearchParams => {
    return new URLSearchParams(window.location.search);
}

export const getHashParamsFromUrl = (): hashParams => {
    let hash = window.location.hash.slice(1);
    const params: hashParams = {};

    // If hash includes '@': use old way of getting params by splitting on '@' and using func workspace
    // Else: new way: get named params, for example i:cue/f:def/o:yaml
    if (hash.includes('@')) {
        const values = hash.split('@');
        params[HASH_KEY.WORKSPACE] = WORKSPACE.FUNC;
        params[HASH_KEY.INPUT] = values[0]?.trim();
        params[HASH_KEY.FUNC] = values[1]?.trim();
        params[HASH_KEY.OUTPUT] = values[2]?.trim();
    } else {
        const hashItems = hash.split('&');
        for (const item of hashItems) {
            const filter = item.split('=');
            if (filter.length === 2 && Object.values(HASH_KEY).includes(filter[0] as HASH_KEY)) {
                params[filter[0] as HASH_KEY] = filter[1];
            }
        }
    }

    return params;
}

export const updateHash = (newHash: string, replace = false): void => {
    const currentHash = window.location.hash.slice(1);
    if (currentHash !== newHash) {
        if (replace) {
            const newUrl = window.location;
            newUrl.hash = newHash;
            window.history.replaceState(null, '', newUrl.toString());
        } else {
            window.location.hash = newHash;
        }
    }
}

export const updateSearchParams = (searchParams: URLSearchParams, replace = false): void => {
    if (replace) {
        const newUrl = window.location;
        newUrl.search = searchParams.toString();
        window.history.pushState(null, '', newUrl.toString());
    } else {
        window.location.search = searchParams.toString();
    }
}

export const workspaceToHashParams = (workspace: Workspace): string => {
    const params: Record<string, string> = cleanObject({
        [HASH_KEY.WORKSPACE]: workspace.type,
        [HASH_KEY.POLICY]: workspace.config.inputTabs.find(tab => tab.type === OPTION_TYPE.POLICY)?.selected.value,
        [HASH_KEY.INPUT]: workspace.config.inputTabs.find(tab => tab.type === OPTION_TYPE.INPUT)?.selected.value,
        [HASH_KEY.DATA]: workspace.config.inputTabs.find(tab => tab.type === OPTION_TYPE.DATA)?.selected.value,
        [HASH_KEY.FUNC]: workspace.config.func.enabled ? workspace.config.func.selected.value : '',
        [HASH_KEY.OUTPUT]: workspace.config.outputTab.selected.value,
    });

    return new URLSearchParams(params).toString();
}

export const optionToHashkey = (option: OPTION_TYPE): HASH_KEY => {
    switch (option) {
        case OPTION_TYPE.DATA:
            return HASH_KEY.DATA;
        case OPTION_TYPE.FUNC:
            return HASH_KEY.FUNC;
        case OPTION_TYPE.INPUT:
            return HASH_KEY.INPUT;
        case OPTION_TYPE.OUTPUT:
            return HASH_KEY.OUTPUT;
        case OPTION_TYPE.POLICY:
            return HASH_KEY.POLICY;
        default:
            return null;
    }
}

export const hashKeyToOption = (hashkey: HASH_KEY): OPTION_TYPE => {
    switch (hashkey) {
        case HASH_KEY.DATA:
            return OPTION_TYPE.DATA;
        case HASH_KEY.FUNC:
            return OPTION_TYPE.FUNC;
        case HASH_KEY.INPUT:
            return OPTION_TYPE.INPUT;
        case HASH_KEY.OUTPUT:
            return OPTION_TYPE.OUTPUT;
        case HASH_KEY.POLICY:
            return OPTION_TYPE.POLICY;
        default:
            return null;
    }
}
