import { forceFocusPosition } from './force-focus-position';

export const scrollToElement = (element: HTMLElement): boolean => {
    if (!element) {
        return false;
    }

    const targetTop = element.getBoundingClientRect().top + window.scrollY - 80;
    window.scroll({
        top: targetTop,
        behavior: 'smooth',
    });

    forceFocusPosition(element);

    return true;
};

export const scrollToHash = (hash: string): boolean => {
    // Try by ID first
    const targetId = hash.replace('#', '');
    let element = document.getElementById(targetId);

    // Try by name second
    if (!element) {
        // Name attribute second
        element = document.querySelector(`[name="${targetId}"]`);
    }

    return scrollToElement(element);
};
