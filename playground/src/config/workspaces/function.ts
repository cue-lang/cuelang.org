import { Workspace, WORKSPACE } from '@models/workspace';
import { OPTION_TYPE, optionCUE, optionDef, optionEval, optionExport, optionJSON, optionYAML } from '@models/options';
import { deepFreeze } from '@helpers/deep-freeze';

export const functionWorkspace: Workspace = deepFreeze<Workspace>({
    enabled: true,
    type: WORKSPACE.FUNC,
    title: 'Function',
    description: 'In the Function Workspace you can play around with the Export, Eval, or Def options. You can also change the output language',
    icon: 'workspace-function',
    config: {
        func: {
            enabled: true,
            title: 'Function',
            options: [ optionExport, optionEval, optionDef ],
            selected: optionEval,
        },
        inputTabs: [ {
            type: OPTION_TYPE.INPUT,
            title: 'Input',
            options: [ optionCUE ],
            selected: optionCUE,
        }, ],
        outputTab: {
            type: OPTION_TYPE.OUTPUT,
            title: 'Output',
            options: [ optionCUE, optionJSON, optionYAML ],
            selected: optionCUE,
        }
    }
});
