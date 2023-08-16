import * as React from 'react';
import { MouseEvent, MutableRefObject } from 'react';
import { debounce } from 'lodash';
import cx from 'classnames';
import { Icon } from '@components/icon';

interface ShareProps {
    saved: boolean;
    showSaveURL: boolean;
    share: {(): void};
    disabled?: boolean;
}

export class Share extends React.Component<ShareProps>
{
    private smallScreenBreakpoint = 600;
    private showShareButton = window.innerWidth < this.smallScreenBreakpoint || !this.props.showSaveURL;
    private showSaveUrl = window.innerWidth >= this.smallScreenBreakpoint && this.props.showSaveURL;

    public copyMessageRef: MutableRefObject<HTMLDivElement>;
    public shareRef: MutableRefObject<HTMLDivElement>;
    public overlayRef: MutableRefObject<HTMLDivElement>;

    constructor(props: ShareProps) {
        super(props);
        this.copyMessageRef = React.createRef();
        this.shareRef = React.createRef();
        this.overlayRef = React.createRef();
    }

    public componentDidMount() {
        document.addEventListener('click', this.onDocumentClick.bind(this));
        window.addEventListener("resize", this.onWindowResize.bind(this));
    }

    public componentWillUnmount() {
        document.removeEventListener('click', this.onDocumentClick);
        window.removeEventListener("resize", this.onWindowResize.bind(this));
    }

    public componentDidUpdate(prevProps: ShareProps) {
        if (prevProps.showSaveURL !== this.props.showSaveURL) {
            this.setShareButtonVisibility();
            this.showSaveUrl = this.props.showSaveURL;
            this.forceUpdate();
        }
    }

    public copyShare(e: MouseEvent) {
        e.preventDefault();

        navigator.clipboard.writeText(window.location.toString()).then(() => {
            requestAnimationFrame(() => {
                this.copyMessageRef.current.classList.remove('is-hidden');
                this.copyMessageRef.current.setAttribute('aria-hidden', 'false');

                setTimeout(() => {
                    this.copyMessageRef.current.classList.add('is-hidden');
                    this.copyMessageRef.current.setAttribute('aria-hidden', 'true');
                }, 1000);
            });
        });
    }

    public render() {
        const cssClasses = cx({
            'is-open': window.innerWidth < this.smallScreenBreakpoint && this.showSaveUrl,
        }, 'cue-share');
        return (
            <div className= { cssClasses } ref={ this.shareRef }>
                { this.showShareButton &&
                    <button
                        className="cue-button cue-button--transparent cue-share__button"
                        disabled={ this.props.disabled }
                        title={ this.props.disabled ? 'Share is not available yet for this workspace' : '' }
                        onClick={ this.onClickShare.bind(this) }
                    >
                        <span className="cue-share__text">Share</span>
                        <span className="cue-share__icon cue-share__icon--animated">
                           <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                              <path className="cue-share__arrow" d="m 11.7109,0.1189 a 0.409,0.409 0 0 1 0.4462,-0.0872 0.409,0.409 0 0 1 0.133,0.0872 l 4.7388,4.6656 a 0.4003,0.4003 0 0 1 -0.2902,0.6884 h -3.5115 v 9.2635 a 1.2,1.2 0 0 1 -0.36,0.8542 1.237,1.237 0 0 1 -1.7344,0 1.2,1.2 0 0 1 -0.36,-0.8542 V 5.473 H 7.2613 A 0.4145,0.4145 0 0 1 6.8828,5.2242 0.397,0.397 0 0 1 6.9722,4.7846 Z" />
                              <path d="m 5.0458,10.3065 a 0.4112,0.4112 0 0 0 -0.2891,0.1178 0.4003,0.4003 0 0 0 -0.12,0.2836 V 21.18 c 0,0.2226 0.1833,0.4036 0.409,0.4036 h 13.9085 a 0.416,0.416 0 0 0 0.2891,-0.1178 0.4043,0.4043 0 0 0 0.12,-0.2847 V 10.709 a 0.4003,0.4003 0 0 0 -0.12,-0.2847 0.4123,0.4123 0 0 0 -0.289,-0.1178 h -1.6364 c -0.325,0 -0.6381,-0.1277 -0.8672,-0.3546 a 1.1989,1.1989 0 0 1 0,-1.7083 c 0.229,-0.2269 0.5422,-0.3545 0.8672,-0.3545 h 1.6363 c 1.5807,0 2.8635,1.2643 2.8635,2.8199 v 10.4722 c 0,0.7473 -0.3021,1.464 -0.8388,1.993 A 2.8864,2.8864 0 0 1 18.9542,24 H 5.0458 A 2.8864,2.8864 0 0 1 3.0211,23.1742 2.798,2.798 0 0 1 2.1823,21.1812 V 10.709 c 0,-1.5567 1.2828,-2.821 2.8635,-2.821 H 6.682 c 0.325,0 0.6381,0.1277 0.8672,0.3545 a 1.1989,1.1989 0 0 1 0,1.7083 1.237,1.237 0 0 1 -0.8672,0.3546 z" />
                            </svg>
                        </span>
                    </button>
                }

                { this.showSaveUrl &&
                    <div className="cue-share__content">
                        <input
                            className="cue-share__input"
                            readOnly={ true }
                            id="shareURL"
                            value={ window.location.toString() }/>
                        <div className="cue-share__copy">
                            <button
                                className="cue-button cue-button--transparent cue-share__button cue-share__button--copy"
                                onClick={ this.copyShare.bind(this)}
                            >
                                <span className="cue-button__icon cue-share__icon">
                                    <Icon icon="link"></Icon>
                                </span>
                                <span className="cue-button__text cue-share__text">Copy link</span>
                            </button>
                            <span className="cue-share__message is-hidden"
                                  ref={ this.copyMessageRef }
                                  aria-hidden="true">
                                <span className="cue-share__message-text">Share link copied!</span>
                            </span>
                        </div>
                    </div>
                }

                { (window.innerWidth < this.smallScreenBreakpoint && this.showSaveUrl) &&
                    <div className="cue-share__overlay" ref={ this.overlayRef }></div>
                }
            </div>
        );
    }

    private onWindowResize = debounce(() => {
        this.setShareButtonVisibility();
        this.showSaveUrl = window.innerWidth >= this.smallScreenBreakpoint && this.props.showSaveURL;
    }, 200);

    private onDocumentClick(event: Event) {
        // Only handle click on doc when on small screen and is showing
        if (!this.showSaveUrl || window.innerWidth >= this.smallScreenBreakpoint) {
            return;
        }

        const shareElement = this.shareRef.current;
        const clickOnOverlay = event.target === this.overlayRef.current;
        const clickOutside = event.target !== shareElement && !shareElement.contains(event.target as HTMLElement);

        if (clickOnOverlay || clickOutside) {
            this.showSaveUrl = false;
            this.forceUpdate();
        }
    }

    private onClickShare(e: MouseEvent) {
        e.preventDefault();

        // If already shared and on small screen: toggle showing share url
        if (window.innerWidth < this.smallScreenBreakpoint && this.props.saved) {
            this.showSaveUrl = !this.showSaveUrl;
            this.forceUpdate();
        } else { // else share
            this.props.share();
        }
    }

    private setShareButtonVisibility() {
        const showShareButton = window.innerWidth < this.smallScreenBreakpoint ||
            (window.innerWidth >= this.smallScreenBreakpoint && !this.props.showSaveURL);
        if (this.showShareButton !== showShareButton) {
            this.showShareButton = showShareButton;
        }
        this.forceUpdate();
    }
}
