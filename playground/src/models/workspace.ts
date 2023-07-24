import { Option, OPTION_TYPE } from '@models/options';

export enum WORKSPACE {
    FUNC = 'function',
    POLICY = 'policy',
    JSON_VALIDATION = 'jsonValidation',
}

export type WorkspaceTab = {
    title: string;
    type: OPTION_TYPE;
    selected: Option;
    options: Option[];
    code?: string;
};

export type FunctionConfig = {
    enabled: boolean;
    title: string;
    selected: Option;
    options: Option[];
};

export type WorkspaceConfig = {
    func: FunctionConfig;
    inputTabs: WorkspaceTab[];
    outputTab: WorkspaceTab;
}

export type Workspace = {
    enabled: boolean;
    name: WORKSPACE,
    title: string;
    description: string;
    icon: string;
    config: WorkspaceConfig;
};

