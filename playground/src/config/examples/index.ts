import { Example } from '@models/example';
import { defaultExample } from '@config/examples/defaultExample';
import { testExample } from '@config/examples/example';
import { cloneDeep } from 'lodash';
import { testExample2 } from '@config/examples/example2';
import { testExample3 } from '@config/examples/example3';

export const examples: Example[] = [
    cloneDeep(defaultExample),
    cloneDeep(testExample),
    cloneDeep(testExample2),
    cloneDeep(testExample3),
];
