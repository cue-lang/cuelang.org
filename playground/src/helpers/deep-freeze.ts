export const deepFreeze = <T extends { [key: string]: any }>(object: T): T => {
    if (!object) {
        return object;
    }
    Object.keys(object).forEach(prop => {
        if (typeof object[prop] === 'object') {
            deepFreeze(object[prop]);

        }
    });
    return Object.freeze(object);
};
