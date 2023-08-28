import { functionWorkspace } from '@config/workspaces/function';
import { policyWorkspace } from '@config/workspaces/policy';
import { jsonValidationWorkspace } from '@config/workspaces/jsonValidation';
import { WORKSPACE, Workspaces } from '@models/workspace';
import { cloneDeep } from 'lodash';

export * from './function';
export * from './jsonValidation';
export * from './policy';

// We need clone deep here because we don't want to reference the original config object
export const availableWorkspaces: Workspaces = {
    [WORKSPACE.FUNC]: cloneDeep(functionWorkspace),
    [WORKSPACE.POLICY]: cloneDeep(policyWorkspace),
    [WORKSPACE.JSON_VALIDATION]: cloneDeep(jsonValidationWorkspace),
}

export const defaultWorkspace = cloneDeep(functionWorkspace);
