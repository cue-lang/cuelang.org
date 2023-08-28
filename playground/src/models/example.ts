import { WORKSPACE, WorkspaceConfig } from '@models/workspace';

export interface Example {
    slug: string;
    title: string;
    category: string;
    workspace: WORKSPACE,
    workspaceConfig: WorkspaceConfig;
}

export interface ExamplesByCategory {
    category: string;
    examples: Example[];
}
