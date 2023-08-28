import { WORKSPACE, Workspace } from '@models/workspace';
import { deepFreeze } from '@helpers/deep-freeze';

export const jsonValidationWorkspace: Workspace = deepFreeze<Workspace>({
    enabled: false,
    type: WORKSPACE.JSON_VALIDATION,
    title: 'JSON Validation',
    description: '',
    icon: 'workspace-json-validation',
    config: null,
});
