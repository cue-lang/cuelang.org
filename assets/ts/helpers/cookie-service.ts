export class CookieService {
    static hasAcceptedCookies(): boolean {
        return (CookieService.getCookie('cue-cookies') === 'yes');
    }

    static getCookie(name: string): string | null {
        return document.cookie
            .replace(new RegExp('(?:(?:^|.*;)\\s*' + name + '\\s*\\=\\s*([^;]*).*$)|^.*$'), '$1') || null;
    }

    static setCookie(name: string, value: string, days?: number): void {
        let cookie = `${name}=${value}; path=/; Secure; SameSite=Strict`;

        if (days) {
            cookie += '; expires=' + new Date((new Date()).getTime() + (days * 864e+5)).toUTCString();
        }

        // Add cookie
        document.cookie = cookie;
    }
}
