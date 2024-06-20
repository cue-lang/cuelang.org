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

export const exIntroWelcomeToCue: Example = {
    slug: 'intro-welcome-to-cue',
    title: 'Welcome to CUE!',
    category: 'Introduction',
    workspace: WORKSPACE.FUNC,
    workspaceConfig: {
        ...config,
        inputTabs: config.inputTabs.map((tab) => {
            if (tab.type === OPTION_TYPE.INPUT) {
                // This text is a manually sync'd copy of <basename>.cue, produced by
		//   cue export text: <basename>.cue
                // TODO: make this better (cue-lang/cue#2995)
                tab.code = "// Welcome to CUE!\n//\n// Play around with CUE by typing directly into this window,\n// or use the Examples menu to load some CUE.\n//\n// There are many examples of how to use the language on the CUE\n// documentation site, https://cuelang.org/docs/, with the language\n// tour being a great place to start: https://cuelang.org/docs/tour/.\n//\n// You can safely delete the text in this editor window - simply\n// reload the page to see this message again. Happy CUEing!\n\n// This is a comment\n_greeting: \"Welcome\" // Hidden fields start with \"_\"\n#project:  \"CUE\"     // Definitions start with \"#\"\n\nmessage: \"\\(_greeting) to \\(#project)!\" // Regular fields are exported\n"
            }
            return tab;
        }),
    },
}

