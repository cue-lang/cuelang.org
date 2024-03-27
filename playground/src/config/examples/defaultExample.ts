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

export const defaultExample: Example = {
    slug: 'welcome-to-cue',
    title: 'Welcome to CUE!',
    category: 'Category 1',
    workspace: WORKSPACE.FUNC,
    workspaceConfig: {
        ...config,
        inputTabs: config.inputTabs.map((tab) => {
            if (tab.type === OPTION_TYPE.INPUT) {
                // This code is a copy of defaultExample.cue, manually updated to be
                // a TypeScript string by:
                // - adding leading double quotes to each line
                // - adding trailing '\n" +' to each line
                // - escaping all backslashes
                // - escaping all double quotes
                // TODO: make this less heinous.
                tab.code = "" +
"// Welcome to CUE!\n" +
"//\n" +
"// Play around with CUE by typing directly into this window,\n" +
"// or use the Examples menu to load some CUE.\n" +
"//\n" +
"// There are many examples of how to use the language on the CUE\n" +
"// documentation site, https://cuelang.org/docs/, with the language\n" +
"// tour being a great place to start: https://cuelang.org/docs/tour/.\n" +
"// Just Ctrl-click links to open them in a new window.\n" +
"//\n" +
"// You can safely delete the text in this editor window - simply\n" +
"// reload the page to see this message again. Happy CUEing!\n" +
"\n" +
"\n" +
"// This is a comment\n" +
"_greeting: \"Welcome\" // Hidden fields start with \"_\"\n" +
"#project:  \"CUE\"     // Definitions start with \"#\"\n" +
"\n" +
"message: \"\\(_greeting) to \\(#project)!\" // Data fields are exported\n" +
		"";
            }
            return tab;
        }),
    },
}

