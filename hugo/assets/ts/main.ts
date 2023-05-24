// Helpers
import { Docs, Drawer, Header, Menu, NotificationBar, Search, Tabs, TabsNav } from './widgets';
import { scrollToHash } from './helpers/scroll-to';
import { Widget } from './interfaces/widget';

declare global {
    interface Window {
        app: App;
        // eslint-disable-next-line @typescript-eslint/no-explicit-any
        dataLayer: Record<string, any>[];
    }
}

type WidgetTypes = Docs | Drawer | Header | Menu | NotificationBar | Search | Tabs | TabsNav;

class App {
    public widgets: Widget[];
    public widgetMap: {
        [key: string]: {
            new (element: HTMLElement): WidgetTypes;
        };
    };

    constructor() {
        this.widgets = [];
        this.widgetMap = {
            [Docs.NAME]: Docs,
            [Drawer.NAME]: Drawer,
            [Header.NAME]: Header,
            [Menu.NAME]: Menu,
            [NotificationBar.NAME]: NotificationBar,
            [Search.NAME]: Search,
            [Tabs.NAME]: Tabs,
            [TabsNav.NAME]: TabsNav,
        };

        this.initWidgets();

        requestAnimationFrame(() => {
            this.scrollTo();
            this.externalLinks();
        });
    }

    public initWidgets(container?: HTMLElement): void {
        const scope = container ? container : document;

        for (const key in this.widgetMap) {
            const elements = scope.querySelectorAll<HTMLElement>('[data-'.concat(key).concat(']'));

            elements.forEach((element) => {
                new this.widgetMap[key](element);
            });
        }
    }

    // Add widget to widget list
    public addWidget(widget: Widget) {
        if (!this.widgets.find((w) => w.name === widget.name )) {
            this.widgets.push(widget);
        }
    }

    // Load widgets in case html container is injected later, accessible via window.app.reloadWidgets
    public reLoadWidgets(container: HTMLElement) {
        for (const widget of this.widgets) {
            widget.load(container);
        }
    }

    public scrollTo() {
        // Scroll to target if page-url contains a hash
        const hash = window.location.hash;
        const regex = /^#[a-zA-Z0-9-_]+$/;

        if (regex.test(hash)) {
            scrollToHash(hash);
        }

        document.querySelectorAll('a[href^="#"]').forEach((element) => {
            element.addEventListener('click', (e) => {
                e.preventDefault();
                const target = element.getAttribute('href');
                window.history.replaceState(null, '', target);
                scrollToHash(target);
            });
        });
    }

    public externalLinks() {
        const host = new RegExp(`/${window.location.host}/`);
        const anchors = Array.from(document.getElementsByTagName('a'));

        for (const anchor of anchors) {
            if (!host.test(anchor.href)) {
                anchor.setAttribute('rel', 'noopener');
                anchor.setAttribute('target', '_blank');
            }
        }
    }
}

if (document.readyState !== 'loading') {
    // Ready to go!
    window.app = new App();
}
else {
    // Still loading, so wait...
    document.addEventListener('DOMContentLoaded', () => {
        window.app = new App();
    });
}
