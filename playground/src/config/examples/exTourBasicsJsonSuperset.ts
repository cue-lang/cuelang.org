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

export const exTourBasicsJsonSuperset: Example = {
    slug: 'tour-basics-json-superset',
    title: 'Basics: JSON Superset',
    category: 'Tour',
    workspace: WORKSPACE.FUNC,
    workspaceConfig: {
        ...config,
        inputTabs: config.inputTabs.map((tab) => {
            if (tab.type === OPTION_TYPE.INPUT) {
                // This text is a manually sync'd copy of <basename>.cue, produced by
		//   cue export text: <basename>.cue
                // TODO: make this better (cue-lang/cue#2995)
                tab.code = "import \"math\"\n\n// Simple labels don't need to be quoted.\none:       1\ntwo:       2\npiPlusOne: math.Pi + 1\n\n// Field names must be quoted if they contain\n// special characters, such as hyphen and space.\n\"quoted field names\": {\n\t\"two-and-a-half\":    2.5\n\t\"three point three\": 3.3\n\t\"four^four\":         math.Pow(4, 4)\n}\n\naList: [\n\t1,\n\t2,\n\t3,\n]\n";
            }
            return tab;
        }),
    },
}

