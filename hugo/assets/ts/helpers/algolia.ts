import { FACET_INPUTS, FilterOperator, SearchFacet, SearchFacets, SearchInputFacetName } from '../interfaces/search';
import { cleanObject } from './cleaner';

export const getFacetForInput = (inputName: SearchInputFacetName): SearchFacet => {
    switch (inputName) {
        case SearchInputFacetName.CATEGORY:
            return SearchFacet.CATEGORIES;
        case SearchInputFacetName.SECTION:
            return SearchFacet.SECTION;
        case SearchInputFacetName.TAG:
            return SearchFacet.TAGS;
        default:
            return null;
    }
};

export const mapToAlgoliaFilters = (tagsByFacet: SearchFacets, operator: FilterOperator = FilterOperator.AND): string => {
    return Object.keys(tagsByFacet)
        .map((facet) => {
            return `(${ tagsByFacet[facet]
                .map((label: string) => `${ facet }:"${ label }"`)
                .join(' OR ') })`;
        })
        .join(` ${ operator } `);
};

export const parseQuery = (query: string): { cleanQuery: string; facets: SearchFacets; } => {
    let cleanQuery = query;

    const facets: SearchFacets = {
        [SearchFacet.TAGS]: [],
        [SearchFacet.CATEGORIES]: [],
        [SearchFacet.SECTION]: [],
    };

    for (const facetInput of FACET_INPUTS) {
        const facet = getFacetForInput(facetInput);
        if (!facet) {
            continue;
        }

        const regExp = new RegExp(`${ facetInput }:(\\S+)?`, 'g');
        const matches =  [ ...query.matchAll(regExp) ];
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
