import { Workspace, WORKSPACE } from '@models/workspace';
import { funcOptions, inputOptions, OPTION_TYPE, outputOptions } from '@models/options';

export const functionWorkspace: Workspace = {
    enabled: true,
    name: WORKSPACE.FUNC,
    title: 'Function',
    description: 'In the Function Workspace you can play around with Export or Def options. You can also change the output language',
    icon: 'workspace-function',
    config: {
        func: {
            enabled: true,
            title: 'Function',
            selected: funcOptions[0],
            options: funcOptions,
        },
        inputTabs: [ {
            type: OPTION_TYPE.INPUT,
            title: 'Input',
            options: inputOptions,
            selected: inputOptions[0],
        }, ],
        outputTab: {
            type: OPTION_TYPE.OUTPUT,
            title: 'Output',
            selected: outputOptions[0],
            options: outputOptions,
        }
    }
};
