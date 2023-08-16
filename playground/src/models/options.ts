export enum OPTION_TYPE {
    DATA = 'data',
    FUNC = 'func',
    INPUT = 'input',
    OUTPUT = 'output',
    POLICY = 'policy',
}

export interface Option {
    name: string;
    value: string;
}

export const optionCUE: Option = { value: 'cue', name: 'CUE', };
export const optionJSON: Option = { value: 'json', name: 'JSON', };
export const optionYAML: Option = { value: 'yaml', name: 'YAML', };
export const optionTerminal: Option = { value: 'terminal', name: 'Terminal', };
export const optionExport: Option = { value: 'export', name: 'export', };
export const optionDef: Option = { value: 'def', name: 'def', };

export const allOptions: Option[] = [
    optionCUE,
    optionJSON,
    optionYAML,
    optionTerminal,
    optionExport,
    optionDef,
]
