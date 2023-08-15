export enum CookieCategory {
    NECESSARY = 'necessary',
    PREFERENCES = 'preferences',
    STATISTICS = 'statistics',
    MARKETING = 'marketing'
}

export class CookieService {
    static hasConsent(_category: CookieCategory): boolean {
        // False since there is no cookiewall for now
        return false;
    }

    static getCookie(name: string): string {
        return document.cookie
            .replace(new RegExp('(?:(?:^|.*;)\\s*' + name + '\\s*\\=\\s*([^;]*).*$)|^.*$'), '$1') || null;
    }

    static setCookie(name: string, value: string, days?: number): void {
        let cookie = `${ name }=${ value }; path=/; Secure; SameSite=Strict`;

        if (days) {
            cookie += '; expires=' + new Date((new Date()).getTime() + (days * 864e+5)).toUTCString();
        }

        // Add cookie
        document.cookie = cookie;
    }
}
