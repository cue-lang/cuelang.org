export enum HASH_KEY {
    DATA = 'd',
    FUNC = 'f',
    INPUT = 'i',
    OUTPUT = 'o',
    POLICY = 'p',
    WORKSPACE = 'w',
}

export type hashParams = {
    [key in HASH_KEY]?: string;
};
