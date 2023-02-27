export class StorageService {
    private isAvailable: boolean;

    constructor() {
        this.isAvailable = undefined;
    }

    public getItem(key: string): string {
        if (this.hasLocalStorage()) {
            return localStorage.getItem(key);
        }
        else {
            return sessionStorage.getItem(key);
        }
    }

    public setItem(key: string, value: string): void {
        if (this.hasLocalStorage()) {
            localStorage.setItem(key, value);
        }
        else {
            sessionStorage.setItem(key, value);
        }
    }

    public removeItem(key: string): void {
        if (this.hasLocalStorage()) {
            localStorage.removeItem(key);
        }
        else {
            sessionStorage.removeItem(key);
        }
    }

    public hasLocalStorage(): boolean {
        if (this.isAvailable === undefined) {
            this.isAvailable = this.testStorage();
        }

        return this.isAvailable;
    }

    private testStorage(): boolean {
        try {
            localStorage.setItem('foo', 'bar');
            localStorage.removeItem('foo');
            return true;
        }
        catch (e) {
            return false;
        }
    }
}
