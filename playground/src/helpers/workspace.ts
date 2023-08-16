import { Workspace } from '@models/workspace';
import { HASH_KEY, hashParams } from '@models/hashParams';
import { OPTION_TYPE } from '@models/options';
import { optionToHashkey } from '@helpers/hash-params';

export const setupWorkspaceConfig = (workspace: Workspace, params: hashParams): Workspace => {
    // Loop through input tabs for workspace and set selected values to values from params
    for (const inputTab of workspace.config.inputTabs) {
        const hashForOption: HASH_KEY = optionToHashkey(inputTab.type);
        if (params[hashForOption]) {
            const selectedOption = inputTab.options.find(option => option.value === params[hashForOption]);
            const defaultOption = inputTab.selected ?? inputTab.options[0];
            inputTab.selected = selectedOption ?? defaultOption;
        }
    }

    // If workspace has function option enabled and is set in params: use value from params
    if (workspace.config.func.enabled && params[HASH_KEY.FUNC]) {
        const funcOption = workspace.config.func.options.find(option => option.value === params[HASH_KEY.FUNC]);
        const defaultFuncOption = workspace.config.func.selected ?? workspace.config.func.options[0];
        workspace.config.func.selected = funcOption ?? defaultFuncOption;
    }

    // Set value for output if in params
    if (params[HASH_KEY.OUTPUT]) {
        const outputOption = workspace.config.outputTab.options.find(option => option.value === params[HASH_KEY.OUTPUT]);
        const defaultOutputOption = workspace.config.outputTab.selected ?? workspace.config.outputTab.options[0];
        workspace.config.outputTab.selected = outputOption ?? defaultOutputOption;
    }

    /**
     * Validate if selected options work together: if not change them:
     */

    // if function enabled and function is def but input is not cue: change func to export
    const inputTabInput = workspace.config.inputTabs.find(input => input.type === OPTION_TYPE.INPUT);
    if (workspace.config.func.enabled && workspace.config.func.selected.value === 'def' &&
        inputTabInput?.selected?.value !== 'cue') {
        const exportOption = workspace.config.func.options.find(option => option.value === 'export');
        const defaultFuncOption = workspace.config.func.selected ?? workspace.config.func.options[0];
        workspace.config.func.selected = exportOption ?? defaultFuncOption;
    }

    // If function is def but output is not cue : set output to cue
    if (workspace.config.func.enabled && workspace.config.func.selected.value === 'def' &&
        workspace.config.outputTab.selected.value !== 'cue') {
        const cueOption = workspace.config.outputTab.options.find(option => option.value === 'cue');
        const defaultOutputOption = workspace.config.outputTab.selected ?? workspace.config.outputTab.options[0];
        workspace.config.outputTab.selected = cueOption ?? defaultOutputOption;
    }

    return workspace;
}
