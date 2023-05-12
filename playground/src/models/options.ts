export const OPTION_TYPE = {
    func: 'func',
    input: 'input',
    output: 'output',
} as const;

export interface Option {
    name: string;
    value: string;
}

export const inputOptions: Option[] = [
    { value: 'cue', name: 'CUE', },
];

export const funcOptions: Option[] = [
    { value: 'export', name: 'export', },
    { value: 'def', name: 'def', },
];

export const outputOptions: Option[] = [
    { value: 'cue', name: 'CUE', },
    { value: 'json', name: 'JSON', },
    { value: 'yaml', name: 'Yaml', },
]
