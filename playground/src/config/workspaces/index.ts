import { functionWorkspace } from '@config/workspaces/function';
import { policyWorkspace } from '@config/workspaces/policy';
import { jsonValidationWorkspace } from '@config/workspaces/jsonValidation';

export * from './function';
export * from './jsonValidation';
export * from './policy';

export const workspaces = [
    functionWorkspace,
    policyWorkspace,
    jsonValidationWorkspace,
]
