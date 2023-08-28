import { cloneDeep } from 'lodash';
import { Example } from '@models/example';
import { WORKSPACE, WorkspaceConfig } from '@models/workspace';
import { policyWorkspace } from '@config/workspaces';
import { OPTION_TYPE } from '@models/options';

/*  In the future we can also let the pre-processor create examples based on one of the workspace config's
    instead of doing it with typescript. Make sure the example follows the Example model and the config
    is correct for the chosen workspace. */

// Clone config because we don't want to change the original workspace config
const config = cloneDeep<WorkspaceConfig>(policyWorkspace.config);

export const testExample3: Example = {
    slug: 'test-example-3',
    title: 'Some other example',
    category: 'Category 2',
    workspace: WORKSPACE.POLICY,
    workspaceConfig: {
        ...config,
        inputTabs: config.inputTabs.map((tab) => {
            if (tab.type === OPTION_TYPE.INPUT) {
                tab.code = 'Examples for policy input are coming soon!';
            }
            if (tab.type === OPTION_TYPE.POLICY) {
                tab.code = 'Examples for policy are coming soon!';
            }
            return tab;
        }),
    },
}

