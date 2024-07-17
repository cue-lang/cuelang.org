import {
    FACET_INPUTS,
    FilterOperator,
    ParsedQuery,
    SearchFacet,
    SearchFacets,
    SearchInputFacetName,
} from '../interfaces/search';
import { cleanObject } from './cleaner';

export const getFacetForInputName = (inputName: SearchInputFacetName): SearchFacet => {
    switch (inputName) {
        case SearchInputFacetName.AUTHOR:
            return SearchFacet.AUTHORS;
        case SearchInputFacetName.CONTENT_TYPE:
            return SearchFacet.CONTENT_TYPE;
        case SearchInputFacetName.TAG:
            return SearchFacet.TAGS;
        default:
            return null;
    }
};

export const getInputNameForFacet = (facet: SearchFacet): SearchInputFacetName => {
    switch (facet) {
        case SearchFacet.AUTHORS:
            return SearchInputFacetName.AUTHOR;
        case SearchFacet.CONTENT_TYPE:
            return SearchInputFacetName.CONTENT_TYPE;
        case SearchFacet.TAGS:
            return SearchInputFacetName.TAG;
        default:
            return null;
    }
};

export const mapToAlgoliaFilters = (tagsByFacet: SearchFacets, operator: FilterOperator = FilterOperator.AND): string => {
    return Object.keys(tagsByFacet)
        .map((facet) => {
            const facetOperator = {
                [SearchInputFacetName.AUTHOR]: ' OR ',
                [SearchInputFacetName.CONTENT_TYPE]: ' OR ',
                [SearchInputFacetName.TAG]: ' AND ',
            }[facet] ?? ' AND ';

            return `(${ tagsByFacet[facet]
                .map((label: string) => `${ facet }:"${ label }"`)
                .join(facetOperator) })`;
        })
        .join(` ${ operator } `);
};

export const queryToUrlParams = (query: ParsedQuery): string => {
    let queryString = `q=${ query.cleanQuery }`;

    for (const [facet, values] of Object.entries(query.facets) ) {
        const inputName = getInputNameForFacet(facet as SearchFacet);
        queryString += ` ${ values.map((value: string) => {
            return `${ inputName }:${ value.includes(' ') ? `"${ value }"` : value }`;
        }).join(' ')}`;
    }

    return queryString;
};

// eslint-disable-next-line max-lines-per-function
export const parseQuery = (query: string): ParsedQuery => {
    if (!query) {
        return {
            cleanQuery: '',
            facets: {},
        };
    }

    let cleanQuery = query;

    const facets: SearchFacets = {
        [SearchFacet.AUTHORS]: [],
        [SearchFacet.TAGS]: [],
        [SearchFacet.CONTENT_TYPE]: [],
    };

    for (const facetInput of FACET_INPUTS) {
        const facet = getFacetForInputName(facetInput);

        if (!facet) {
            continue;
        }

        const regExp = new RegExp(`${ facetInput }:([^"]\\S+)`, 'g');
        const regExpWithQuotes = new RegExp(`${ facetInput }:"([^"]+)"|(\\+)`, 'g');
        const matches = [ ...query.matchAll(regExp), ...query.matchAll(regExpWithQuotes) ];

        for (const match of matches) {
            if (match) {
                if (match[1] && match[1] !== '') {
                    facets[facet].push(match[1]);
                }
                cleanQuery = cleanQuery.replace(match[0], '');
            }
        }
    }

    return {
        cleanQuery: cleanQuery.trim(),
        facets: cleanObject<SearchFacets>(facets),
    };
};

export const getHiddenInputFacets = (facetInputs: NodeListOf<HTMLInputElement>): SearchFacets => {
    if (!facetInputs) {
        return {};
    }

    const facets: SearchFacets = {
        [SearchFacet.TAGS]: [],
        [SearchFacet.CONTENT_TYPE]: [],
    };

    facetInputs.forEach((input) => {
        const name = input.getAttribute('name').replace('facet-', '');
        if (facets[name] && input.value && input.value !== '') {
            facets[name].push(input.value);
        }
    });

    return cleanObject<SearchFacets>(facets);
};
