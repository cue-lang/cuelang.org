import * as React from 'react';
import { MutableRefObject } from 'react';
import Fuse from 'fuse.js';
import { Example, ExamplesByCategory } from '@models/example';
import { examples } from '@config/examples';
import { categoryWeight } from '@config/examples/categories';
import { getSearchParamsFromUrl, updateSearchParams } from '@helpers/url-params';
import cx from 'classnames';

interface ExampleMenuProps {
    activeExample?: Example;
    onClose?: () => void;
}

interface ExampleMenuState {
    filteredExamples: ExamplesByCategory[];
}

export class ExamplesMenu extends React.Component<ExampleMenuProps, ExampleMenuState> {
    private fuse: Fuse<Example>;

    public inputRef: MutableRefObject<HTMLInputElement>;

    constructor(props: ExampleMenuProps) {
        super(props);

        this.inputRef = React.createRef();
        this.state = {
            filteredExamples: this.examplesByCategory(examples),
        };

        const options = {
            keys: ['title'],
            threshold: 0.4,
        };
        this.fuse = new Fuse(examples, options);
    }

    public search() {
        const value = this.inputRef.current.value;
        let result: Example[];
        if (value && value !== '') {
            result = this.fuse.search(value).map(result => result.item);
        } else {
            result = examples;
        }

        this.setState( {
            filteredExamples: this.examplesByCategory(result),
        });
    }

    public examplesByCategory(exampleItems: Example[]): ExamplesByCategory[] {
        const categories: {[key: string]: Example[] } = {};
        // First put examples in the right categories
        for (const example of exampleItems) {
            if (!categories[example.category]) {
                categories[example.category] = [];
            }

            categories[example.category].push(example);
        }

        const sortedCategories: ExamplesByCategory[] = [];

        // Sort the result
        Object.keys(categories)
            .sort((a, b) => {
                const weightA = categoryWeight[a] ?? 1;
                const weightB = categoryWeight[b] ?? 1;
                return weightA - weightB;
            })
            .forEach((key) => {
                sortedCategories.push({
                    category: key,
                    examples: categories[key],
                })
            });

        return sortedCategories;
    }

    public updateUrl(example: Example) {
        const params = getSearchParamsFromUrl();
        params.set('example', example.slug);
        updateSearchParams(params);
        this.props.onClose();
    }

    public render() {
        const items = [];
        for (const item of this.state.filteredExamples) {
            items.push(<li className="cue-example-menu__item cue-example-menu__item--category" key={ item.category }>
                <p className="cue-example-menu__category">{ item.category }</p>
                <ul className="cue-example-menu__items cue-example-menu__items--children">
                    { item.examples.map(example => {
                        const isActive = example.slug === this.props.activeExample?.slug;
                        const linkClassnames = cx({
                            'is-active': isActive,
                        }, 'cue-example-menu__link');

                        return (
                            <li className="cue-example-menu__item" key={ example.slug }>
                                <button className={ linkClassnames }
                                        onClick={ () =>{ this.updateUrl(example) } }>
                                    <span className="cue-example-menu__text">{ example.title }</span>
                                </button>
                            </li>
                        );
                    })}
                </ul>
            </li>);
        }

        return (
            <div className="cue-example-menu">
                <div className="cue-example-menu__header">
                    <div className="cue-example-menu__search">
                        <label className="cue-example-menu__label" htmlFor="example-search">Search</label>
                        <input type="text" className="cue-example-menu__input"
                               name="example-search" id="example-search" placeholder="Search"
                               ref={ this.inputRef } onChange={ this.search.bind(this) }
                        />
                    </div>
                </div>
                <div className="cue-example-menu__content">
                    { this.state.filteredExamples.length ?
                        (<ul className="cue-example-menu__items">
                            { items }
                        </ul>)
                    : ( <p className="cue-example-menu__empty">No results found for search term</p>)}
                </div>
            </div>
        );
    }
}
