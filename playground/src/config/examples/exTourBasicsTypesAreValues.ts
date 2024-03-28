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

export const exTourBasicsTypesAreValues: Example = {
    slug: 'tour-basics-types-are-values',
    title: 'Basics: Types are Values',
    category: 'Tour',
    workspace: WORKSPACE.FUNC,
    workspaceConfig: {
        ...config,
        inputTabs: config.inputTabs.map((tab) => {
            if (tab.type === OPTION_TYPE.INPUT) {
                // This text is a manually sync'd copy of <basename>.cue, produced by
		//   cue export text: <basename>.cue
                // TODO: make this better (cue-lang/cue#2995)
                tab.code = "// This example is explained at\n// https://cuelang.org/docs/tour/basics/types-are-values/\n\nmunicipality: {\n\tname:    string\n\tpop:     int\n\tcapital: bool\n}\n\nlargeCapital: {\n\tname:    string\n\tpop:     >5M\n\tcapital: true\n}\n\nkinshasa: {\n\tname:    \"Kinshasa\"\n\tpop:     16.32M\n\tcapital: true\n}\n\nlargeCapital: municipality\nkinshasa:     largeCapital\n";
            }
            return tab;
        }),
    },
}

