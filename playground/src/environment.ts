declare global {
    interface DocumentEnv extends Document {
        playgroundEnv?: {
            [key: string]: boolean | string | number;
        };
    }
}

export class Environment {
    baseUrl: string;
    wasmPath: string;
    issueUrl: string;

    constructor() {
        const envVars = (document as DocumentEnv).playgroundEnv ? (document as DocumentEnv).playgroundEnv : {};

        this.baseUrl = envVars ? String(envVars['baseUrl']) : '';
        this.wasmPath = envVars ? String(envVars['wasmPath']) : '';
        this.issueUrl = envVars ? String(envVars['issueUrl']) : '';
    }
}

export const environment = new Environment();
