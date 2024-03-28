import { cloneDeep } from 'lodash';
import { Example } from '@models/example';
import { WORKSPACE, WorkspaceConfig } from '@models/workspace';
import { functionWorkspace } from '@config/workspaces';
import { OPTION_TYPE } from '@models/options';

/*  In the future we can also let the pre-processor create examples based on one of the workspace config's
    instead of doing it with typescript. Make sure the example follows the Example model and the config
    is correct for the chosen workspace. */

// Clone config because we don't want to change the original workspace config
const config = cloneDeep<WorkspaceConfig>(functionWorkspace.config);

export const exIntroBasicTypes: Example = {
    slug: 'intro-basic-types',
    title: 'Basic Types',
    category: 'Introduction',
    workspace: WORKSPACE.FUNC,
    workspaceConfig: {
        ...config,
        inputTabs: config.inputTabs.map((tab) => {
            if (tab.type === OPTION_TYPE.INPUT) {
                // This text is a manually sync'd copy of <basename>.cue, produced by
		//   cue export text: <basename>.cue
                // TODO: make this better (cue-lang/cue#2995)
                tab.code = "// CUE has several basic types:\n\na: int\nb: float\nc: string\nd: bool\ne: null\nf: bytes\ng: number\n\n// Each type has a literal form:\n\na: 42\nb: 42.0\nc: \"42\"\nd: true\ne: null\nf: '42'\ng: 42 | 42.0 // number is compatible with int or float\n";
            }
            return tab;
        }),
    },
}

