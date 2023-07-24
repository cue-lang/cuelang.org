import { WORKSPACE, Workspace } from '@models/workspace';

export const jsonValidationWorkspace: Workspace = {
    enabled: false,
    name: WORKSPACE.JSON_VALIDATION,
    title: 'JSON Validation',
    description: '',
    icon: 'workspace-json-validation',
    config: null,
}
