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
    optionsReadonly?: boolean;
    code?: string;
};

export type FunctionConfig = {
    enabled: false;
} | {
    enabled: true;
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
    type: WORKSPACE,
    title: string;
    description: string;
    icon: string;
    config: WorkspaceConfig;
};

export type Workspaces = { [key in WORKSPACE]?: Workspace };
