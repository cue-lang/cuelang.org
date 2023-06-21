/* eslint-disable @typescript-eslint/explicit-module-boundary-types */
/* eslint-disable @typescript-eslint/no-explicit-any */

/**
 * Returns the given object, with all 'empty' values removed (with deep checks)
 *
 * Considered empty
 * - null
 * - undefined
 * - '' (empty string)
 * - [] (empty array)
 *
 * @param data
 */
export const cleanObject = <T = Record<string, any>>(data: T): T => {
    Object.keys(data).forEach(key => {
        if (data[key] && Array.isArray(data[key])) {
            if (data[key].length === 0) {
                delete data[key];
            }
        } else if (data[key] && typeof data[key] === 'object') {
            cleanObject(data[key]);
        } else if (data[key] === null || data[key] === undefined || data[key] === '') {
            delete data[key];
        }
    });

    return data;
};
