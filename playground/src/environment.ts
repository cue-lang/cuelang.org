declare global {
    interface DocumentEnv extends Document {
        editorEnv?: {
            [key: string]: boolean | string | number;
        };
    }
}

export class Environment {
    baseUrl: string;
    wasmPath: string;

    constructor() {
        const envVars = (document as DocumentEnv).editorEnv ? (document as DocumentEnv).editorEnv : {};

        this.baseUrl = envVars ? String(envVars['baseUrl']) : '';
        this.wasmPath = envVars ? String(envVars['wasmPath']) : '';
    }
}

export const environment = new Environment();
