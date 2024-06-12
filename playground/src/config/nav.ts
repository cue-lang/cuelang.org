import { NavItem, TARGET_TYPE } from '@models/nav';
import { environment } from 'environment';

export const mainNav: NavItem[] = [
    { url: '/', title: 'CUE Homepage' },
    // TODO: reinstate About link when page is available (https://github.com/cue-lang/docs-and-content/issues/159)
    //{ url: '/about-play', title: 'About CUE Playground' },
    { url: '/docs/', title: 'Documentation' },
    { url: 'https://github.com/cue-lang/cue/releases', title: 'Download CUE' },
    { url: '/community/', title: 'Community' },
    { url: 'https://github.com/cue-lang/cue', title: 'Github' },
    { url: environment.issueUrl, title: 'Report an issue', target: TARGET_TYPE.BLANK },
];
