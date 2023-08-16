import { WORKSPACE, Workspace } from '@models/workspace';
import { OPTION_TYPE, optionCUE, optionJSON, optionTerminal, optionYAML } from '@models/options';

export const policyWorkspace: Workspace = {
    enabled: true,
    type: WORKSPACE.POLICY,
    title: 'Policy',
    description: 'In the Policy Workspace you can play around with multiple inputs: Policy, Input & Data.',
    icon: 'workspace-policy',
    config: {
        func: {
            enabled: false,
        },
        inputTabs: [
            {
                type: OPTION_TYPE.POLICY,
                title: 'Policy',
                options: [ optionCUE ],
                selected: optionCUE,
            },
            {
                type: OPTION_TYPE.INPUT,
                title: 'Input',
                options: [ optionCUE, optionJSON, optionYAML ],
                selected: optionCUE,
            },
            {
                type: OPTION_TYPE.DATA,
                title: 'Data',
                options: [ optionCUE, optionJSON, optionYAML ],
                selected: optionCUE,
            },
        ],
        outputTab: {
            type: OPTION_TYPE.OUTPUT,
            title: 'Output',
            options: [ optionCUE, optionTerminal, optionJSON ],
            optionsReadonly: true,
            selected: optionCUE,
        }
    }
};
