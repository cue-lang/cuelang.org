import { BaseWidget } from './base-widget';
import { StorageService } from '../helpers/storage-service';
import { TabEventData, TabEvents } from '../interfaces/tabs';

export class Tabs extends BaseWidget {
    public static readonly NAME = 'tabs';

    private readonly tabGroup: string;
    private readonly tabItems: NodeListOf<HTMLElement>;
    private readonly storage: StorageService;

    constructor(element: HTMLElement) {
        super(element);

        this.storage = new StorageService();
        this.tabGroup = this.element.dataset.group;
        // tabItems is both buttons & content
        this.tabItems = this.element.querySelectorAll<HTMLElement>('[data-tab-group][data-tab-item]');
    }

    public static registerWidget(): void {
        if (window.app !== undefined) {
            window.app.addWidget({
                name: Tabs.NAME,
                load: Tabs.attachWidgetToElements,
            });
        }
    }

    public static attachWidgetToElements(container: HTMLElement | Document): void {
        const elements = container.querySelectorAll<HTMLElement>(`[data-${ Tabs.NAME }]`);
        elements.forEach((element) => {
            const newWidget = new Tabs(element);
            newWidget.init();
        });
    }

    public init(): void {
        // Get tabs selection from storage on load
        this.restoreTabSelections();

        // Add event on tab buttons
        const tabButtons = this.element.querySelectorAll<HTMLElement>('button[data-tab-item]');
        tabButtons.forEach((tab) => {
            tab.addEventListener('click', () => {
                this.switchTab(tab, true);
            });
        });

        // Listen to switchTabs events from other tabs instances
        document.addEventListener(TabEvents.SWITCH_TAB, (e: CustomEvent<TabEventData>) => {
            if (e.detail.originalElement !== this.element && this.tabGroup === e.detail.tabGroup) {
                const tabButton = this.element.querySelector<HTMLElement>(`button[data-tab-item="${ e.detail.tabId }"]`);
                if (tabButton) {
                    this.switchTab(tabButton);
                }
            }
        });
    }

    public restoreTabSelections() {
        const currentSaved = this.storage.getItem('tabSelections');
        const tabSelections = currentSaved ? JSON.parse(currentSaved) : {};

        // Loop over saved tabgroups and switch tabs to saved item ids when group matches
        Object.keys(tabSelections).forEach((tabGroup) => {
            const tabId = tabSelections[tabGroup];
            if (tabGroup === this.tabGroup) {
                const activeTab = this.element.querySelector<HTMLElement>(`button[data-tab-item="${ tabId }"]`);
                if (activeTab) {
                    this.switchTab(activeTab);
                }
            }
        });
    }

    public switchTab(tabButton: HTMLElement, isButtonEvent = false): void {
        const tabId = tabButton.dataset.tabItem;
        const tabContent = this.element.querySelector<HTMLElement>(`.tabs__item[data-tab-item="${ tabId }"]`);

        // Save position of current tab if is triggered from click
        let positionTab: number = null;
        if (isButtonEvent) {
            positionTab = tabButton.getBoundingClientRect().top;
        }

        // Close other tabs within element
        this.tabItems.forEach((tabItem) => {
            tabItem.classList.remove('is-active');
        });

        // Open current tab
        tabButton.classList.add('is-active');
        tabContent.classList.add('is-active');

        // Save to storage + dispatch events when group is not default and switchtab is called from button click
        if (isButtonEvent && this.tabGroup !== 'default') {
            // Save to storage when not default
            const currentSaved = this.storage.getItem('tabSelections');
            const tabSelections = currentSaved ? JSON.parse(currentSaved) : {};
            tabSelections[this.tabGroup] = tabId;
            this.storage.setItem('tabSelections', JSON.stringify(tabSelections));

            // Send event to other tabs instances with same groupId if not default
            document.dispatchEvent(new CustomEvent<TabEventData>(TabEvents.SWITCH_TAB, {
                detail: {
                    originalElement: this.element,
                    tabGroup: this.tabGroup,
                    tabId: tabId,
                },
            }));
        }

        // Set screen to the same position relative to clicked button to prevent page jump
        if (isButtonEvent) {
            const tabPositionDiff = tabButton.getBoundingClientRect().top - positionTab;
            window.scrollTo(window.scrollX, window.scrollY + tabPositionDiff);
        }
    }
}

if (document.readyState !== 'loading') {
    // Ready to go!
    Tabs.registerWidget();
    Tabs.attachWidgetToElements(document);
}
else {
    // Still loading, so wait...
    document.addEventListener('DOMContentLoaded', () => {
        Tabs.registerWidget();
        Tabs.attachWidgetToElements(document);
    });
}
