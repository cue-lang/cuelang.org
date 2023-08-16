import { WORKSPACE } from '@models/workspace';
import { OPTION_TYPE } from '@models/options';

export interface SharedCode {
    workspace: WORKSPACE,
    inputs: {
        type: OPTION_TYPE;
        code: string;
    }[];
}
