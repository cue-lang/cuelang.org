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
export const cleanObject = (data: Record<string, any>): Record<string, any> => {
    for (const [key, value] of Object.entries(data)) {
        if (value && Array.isArray(value)) {
            if (value.length === 0) {
                delete data[key];
            }
        } else if (value && typeof value === 'object') {
            cleanObject(value);
        } else if (value === null || value === undefined || value === '') {
            delete data[key];
        }
    }

    return data;
};
