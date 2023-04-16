declare global {
    interface DocumentEnv extends Document {
        editorEnv?: {
            [key: string]: boolean | string | number;
        };
    }
}

export class Environment {
    wasmPath: string;

    constructor() {
        const envVars = (document as DocumentEnv).editorEnv ? (document as DocumentEnv).editorEnv : {};

        this.wasmPath = envVars ? String(envVars['wasmPath']) : '';
    }
}

export const environment = new Environment();
