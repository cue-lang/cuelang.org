import { functionWorkspace } from '@config/workspaces/function';
import { policyWorkspace } from '@config/workspaces/policy';
import { jsonValidationWorkspace } from '@config/workspaces/jsonValidation';
import { WORKSPACE, Workspaces } from '@models/workspace';

export * from './function';
export * from './jsonValidation';
export * from './policy';

export const availableWorkspaces: Workspaces = {
    [WORKSPACE.FUNC]: functionWorkspace,
    [WORKSPACE.POLICY]: policyWorkspace,
    [WORKSPACE.JSON_VALIDATION]: jsonValidationWorkspace,
}

export const defaultWorkspace = functionWorkspace;
export const defaultWorkspaceName = WORKSPACE.FUNC;
