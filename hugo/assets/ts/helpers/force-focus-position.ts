// Enforce proper tab/focus position
export const forceFocusPosition = (element: HTMLElement): void => {
    let forced = false;

    // Try to focus
    element.focus();

    // Force it... if needed
    if (document.activeElement !== element) {
        forced = true;
        element.setAttribute('tabindex', '-1');
        element.focus();
    }

    // Remove focus after setting position
    requestAnimationFrame(() => {
        element.blur();

        if (forced) {
            element.removeAttribute('tabindex');
        }
    });
};
