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

export const exIntroStructsAndLists: Example = {
    slug: 'intro-structs-and-lists',
    title: 'Structs and Lists',
    category: 'Introduction',
    workspace: WORKSPACE.FUNC,
    workspaceConfig: {
        ...config,
        inputTabs: config.inputTabs.map((tab) => {
            if (tab.type === OPTION_TYPE.INPUT) {
                // This text is a manually sync'd copy of <basename>.cue, produced by
		//   cue export text: <basename>.cue
                // TODO: make this better (cue-lang/cue#2995)
                tab.code = "// Structs and lists are composite types, composed of\n// \"fields\" (structs) and \"elements\" (lists).\n// Structs are indicated by { and }, and lists by [ and ].\n\n// aStruct is a struct.\naStruct: {\n\ta: 1\n\tb: 2.0\n\tc: \"3\"\n\td: {\n\t\te: 4 + 4\n\t\tf: 5 * 5.0\n\t}\n\tg: false\n}\n\n// aList is a list.\naList: [\n\t1,\n\t2.0,\n\t\"3\",\n\t{\n\t\te: 4 + 4\n\t\tf: 5 * 5.0\n\t},\n\tfalse,\n]\n";
            }
            return tab;
        }),
    },
}

