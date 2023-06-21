export interface SearchItem {
    objectID: string;
    title: string;
    link: string;
    categories: string | string[];
    summary: string;
    publishDate: string;
    content: string;
}

export enum FilterOperator {
    AND = 'AND',
    OR = 'OR',
}

export enum SearchInputFacetName {
    CATEGORY = 'category',
    SECTION = 'section',
    TAG = 'tag',
}

export const FACET_INPUTS = [
    SearchInputFacetName.CATEGORY,
    SearchInputFacetName.SECTION,
    SearchInputFacetName.TAG,
];

export enum SearchFacet {
    CATEGORIES = 'categories',
    SECTION = 'section',
    TAGS = 'tags',
}

export type SearchFacets = { [key in SearchFacet]?: string[] };
