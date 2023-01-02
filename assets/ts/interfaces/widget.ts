export interface Widget {
    name: string;
    load: (container: HTMLElement) => void;
}
