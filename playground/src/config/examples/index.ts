import { cloneDeep } from 'lodash';
import { Example } from '@models/example';
import { exIntroWelcomeToCue} from '@config/examples/exIntroWelcomeToCue';
import { exIntroBasicTypes} from '@config/examples/exIntroBasicTypes';
import { exIntroStructsAndLists} from '@config/examples/exIntroStructsAndLists';
import { exTourBasicsJsonSuperset } from '@config/examples/exTourBasicsJsonSuperset';
import { exTourBasicsTypesAreValues } from '@config/examples/exTourBasicsTypesAreValues';
// import { exPolicy } from '@config/examples/exPolicy';

export const examples: Example[] = [
    cloneDeep(exIntroWelcomeToCue),
    cloneDeep(exIntroBasicTypes),
    cloneDeep(exIntroStructsAndLists),
    cloneDeep(exTourBasicsJsonSuperset),
    cloneDeep(exTourBasicsTypesAreValues),
    // Policy workspace is currently disabled.
    // cloneDeep(exPolicy),
];
