import { BaseWidget } from './base-widget';

export class Carousel extends BaseWidget {
    public static readonly NAME = 'carousel';

    private readonly slideshow: HTMLUListElement;
    private readonly dots: NodeListOf<HTMLElement>;
    private readonly slides: NodeListOf<HTMLElement>;
    private readonly nextArrow: HTMLElement;
    private readonly prevArrow: HTMLElement;
    private amountvisible: number;
    private scrollLength: number;

    constructor(element: HTMLElement) {
        super(element);

        this.slideshow = this.element.querySelector<HTMLUListElement>('.carousel__slides');
        this.dots = this.element.querySelectorAll<HTMLElement>('.carousel__dot');
        this.slides = this.element.querySelectorAll<HTMLElement>('.carousel__slide');
        this.nextArrow = this.element.querySelector<HTMLElement>('.carousel__arrow--next');
        this.prevArrow = this.element.querySelector<HTMLElement>('.carousel__arrow--prev');
        this.amountvisible = Math.round(
            this.slideshow.offsetWidth /
            this.slideshow.querySelector<HTMLElement>('.carousel__slide:nth-child(1)').offsetWidth
        );

        if (this.slides.length > 1 ) {
            this.scrollLength = (
                this.element.querySelector<HTMLElement>('.carousel__slide:nth-child(2)').offsetLeft -
                this.element.querySelector<HTMLElement>('.carousel__slide:nth-child(1)').offsetLeft
            );
        } else {
            this.scrollLength = this.slides.item(0).offsetLeft;
        }
    }

    public static registerWidget(): void {
        if (window.app !== undefined) {
            window.app.addWidget({
                name: Carousel.NAME,
                load: Carousel.attachWidgetToElements,
            });
        }
    }

    public static attachWidgetToElements(container: HTMLElement | Document): void {
        const elements = container.querySelectorAll<HTMLElement>(`[data-${ Carousel.NAME }]`);
        elements.forEach((element) => {
            const newWidget = new Carousel(element);
            newWidget.init();
        });
    }

    public init(): void {
        window.addEventListener('resize', () => this.onResize() );

        this.slideshow.scrollLeft = 0;
        this.dots[0].classList.add('selected');
        this.slides[0].classList.add('selected');

        // Remove dots depending on how many images (== items in shortcode) per slides are shown
        if (this.amountvisible > 1) {
            const dotsToRemove = this.element.querySelectorAll(`.carousel__dot:nth-last-child(-n + ${ this.amountvisible - 1 })`);
            dotsToRemove.forEach((dot) => {
                dot.remove();
            });
        }

        // setInterval for autoplay
        if (this.element.dataset.duration) {
            setInterval(() => {
                if (
                    this.slideshow != document.querySelector<HTMLElement>('.carousel:hover carousel__slides') &&
                    this.slideshow.classList.contains('interacted') === false
                ) {
                    this.nextSlide();
                }
            }, +this.element.dataset.duration);
        }

        this.initListeners();
    }

    public initListeners() {
        this.slideshow.addEventListener('scroll', () => this.setSelected());
        this.slideshow.addEventListener('touchstart', () => this.setInteracted());
        this.slideshow.addEventListener('keydown', (e) => {
            if (e.key == 'ArrowLeft') this.setInteracted();
            if (e.key == 'ArrowRight') this.setInteracted();
        });

        this.nextArrow.addEventListener('click', () => this.nextSlide());
        this.nextArrow.addEventListener('mousedown', () => this.setInteracted());
        this.nextArrow.addEventListener('touchstart', () => this.setInteracted());

        this.prevArrow.addEventListener('click', () => this.prevSlide());
        this.prevArrow.addEventListener('mousedown', () => this.setInteracted());
        this.prevArrow.addEventListener('touchstart', () => this.setInteracted());

        this.dots.forEach(dot => {
            dot.addEventListener('click', () => {
                const index = +dot.getAttribute('data-index');
                this.scrollTo(index);
            });
            dot.addEventListener('mousedown', () => this.setInteracted());
            dot.addEventListener('touchstart', () => this.setInteracted());
        });
    }

    public nextSlide(): void {
        const lastSlide = this.element.querySelector<HTMLElement>('.carousel__dot:last-child');

        if (!lastSlide.classList.contains('selected')) {
            this.slideshow.scrollBy(this.scrollLength, 0);
        } else {
            this.slideshow.scrollTo(0, 0);
        }
    }

    public prevSlide(): void {
        const firstSlide = this.element.querySelector<HTMLElement>('.carousel__dot:first-child');

        if (!firstSlide.classList.contains('selected')) {
            this.slideshow.scrollBy(this.scrollLength * -1, 0);
        } else {
            this.slideshow.scrollTo(this.scrollLength * this.slides.length, 0);
        }
    }

    public setInteracted(): void {
        this.slideshow.classList.add('interacted');
    }

    public setSelected(): void {
        this.dots.forEach((dot) => {
            dot.classList.remove('selected');
        });

        this.slides.forEach((slide) => {
            slide.classList.remove('selected');
        });

        const nthchild = (Math.round((this.slideshow.scrollLeft / this.scrollLength) + 1));

        this.element.querySelector<HTMLElement>(`.carousel__dot:nth-child(${ nthchild })`).classList.add('selected');

        this.element.querySelector<HTMLElement>(`.carousel__slide:nth-child(${ nthchild })`).classList.add('selected');
    }

    public scrollTo(index: number): void {
        this.slideshow.scrollLeft = this.slideshow.querySelector<HTMLElement>(`.carousel__slide:nth-child(${ index })`).offsetLeft;
    }

    public onResize(): void {
        this.amountvisible = Math.round(
            this.slideshow.offsetWidth /
            this.slideshow.querySelector<HTMLElement>('.carousel__slide:nth-child(1)').offsetWidth
        );

        if (this.slides.length > 1 ) {
            this.scrollLength = (
                this.element.querySelector<HTMLElement>('.carousel__slide:nth-child(2)').offsetLeft -
                this.element.querySelector<HTMLElement>('.carousel__slide:nth-child(1)').offsetLeft
            );
        } else {
            this.scrollLength = this.slides.item(0).offsetLeft;
        }
    }
}

if (document.readyState !== 'loading') {
    // Ready to go!
    Carousel.registerWidget();
    Carousel.attachWidgetToElements(document);
} else {
    // Still loading, so wait...
    document.addEventListener('DOMContentLoaded', () => {
        Carousel.registerWidget();
        Carousel.attachWidgetToElements(document);
    });
}
