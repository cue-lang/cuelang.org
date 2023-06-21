export interface SearchItem {
    objectID: string;
    title: string;
    link: string;
    summary: string;
    publishDate: string;
    content: string;
    section: string;
    categories: string | string[];
    tags: string | string[];
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
