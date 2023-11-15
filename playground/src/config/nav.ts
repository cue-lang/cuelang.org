import { NavItem, TARGET_TYPE } from '@models/nav';
import { environment } from 'environment';

export const mainNav: NavItem[] = [
    { url: '/', title: 'CUE home' },
    { url: '/about-play', title: 'About CUE Playground' },
    { url: '/docs', title: 'Documentation' },
    { url: 'https://github.com/cue-lang/cue/releases', title: 'Download CUE' },
    { url: '/community', title: 'Community' },
    { url: 'https://github.com/cue-lang/cue', title: 'Github' },
    { url: environment.issueUrl, title: 'Report an issue', target: TARGET_TYPE.BLANK },
];
