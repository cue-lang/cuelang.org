import { BaseWidget } from './base-widget';
import { CookieCategory, CookieService } from '../helpers/cookie-service';

export class Youtube extends BaseWidget {
    public static readonly NAME = 'youtube';

    private readonly playButton: HTMLElement;
    private readonly youtubeId: string;
    private interval: null | number = null;
    private youtubePlayer: YT.Player;
    private readonly playerVars = {
        autoplay: 1,
        rel: 0,
        showinfo: 0,
        modestbranding: 1,
    };

    constructor(element: HTMLElement) {
        super(element);

        this.youtubeId = this.element.dataset.youtube || '';
        this.playButton = this.element.getElementsByClassName('video__button').item(0) as HTMLElement;
    }

    public static registerWidget(): void {
        if (window.app !== undefined) {
            window.app.addWidget({
                name: Youtube.NAME,
                load: Youtube.attachWidgetToElements,
            });
        }
    }

    public static attachWidgetToElements(container: HTMLElement | Document): void {
        const elements = container.querySelectorAll<HTMLElement>(`[data-${ Youtube.NAME }]`);
        elements.forEach((element) => {
            const newWidget = new Youtube(element);
            newWidget.init();
        });
    }

    public init(): void {
        super.init();

        if (!this.youtubeId) {
            console.error('No youtube-id set for video');
            return;
        }

        // Only play in overlay if cookies accepted
        if (CookieService.hasConsent(CookieCategory.MARKETING)) {
            this.loadYoutubeApiScript();
        }

        this.playButton.addEventListener('click', (e) => {
            if (CookieService.hasConsent(CookieCategory.MARKETING)) {
                e.preventDefault();
                this.loadYoutubeApiScript();
                this.play();
            }
        });
    }

    public play(): void {
        const html = '<div class="media media--video"><div class="yt-target"></div></div>';
        this.element.insertAdjacentHTML('beforeend', html);

        // eslint-disable-next-line @typescript-eslint/no-this-alias
        const self = this; // save this because of context YTPlayer
        const target = this.element.getElementsByClassName('yt-target').item(0) as HTMLElement;

        // Check if the Youtube API is fully loaded
        this.interval = window.setInterval(() => {
            if (YT !== undefined) {
                clearInterval(this.interval);
                this.youtubePlayer = new YT.Player(target, {
                    videoId: self.youtubeId,
                    playerVars: self.playerVars,
                    events: {
                        onReady: (e) => {
                            e.target.playVideo();

                            const video = self.element.getElementsByClassName('media--video').item(0) as HTMLElement;
                            video.classList.add('is-loaded');
                        },
                    },
                });
            }
        }, 500);
    }

    public destroy(): void {
        if (this.youtubePlayer) {
            this.youtubePlayer.destroy();
            this.youtubePlayer = undefined;
        }
    }

    private loadYoutubeApiScript(): void {
        const selector = 'script[src="https://www.youtube.com/iframe_api"]';
        if (document.querySelectorAll(selector).length < 1) {
            const tag = document.createElement('script');
            tag.src = 'https://www.youtube.com/iframe_api';
            const firstScriptTag = document.getElementsByTagName('script')[0];
            firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);
        }
    }
}

if (document.readyState !== 'loading') {
    // Ready to go!
    Youtube.registerWidget();
    Youtube.attachWidgetToElements(document);
}
else {
    // Still loading, so wait...
    document.addEventListener('DOMContentLoaded', () => {
        Youtube.registerWidget();
        Youtube.attachWidgetToElements(document);
    });
}
