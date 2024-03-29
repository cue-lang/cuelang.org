export interface SearchItem {
    objectID: string;
    title: string;
    link: string;
    summary: string;
    publishDate: string;
    content: string;
    breadcrumb: string[];
    contentType: string;
    tags: string | string[];
    authors: string | string[];
}

export interface FilterItem {
    name: string;
    color?: string;
}

export enum FilterOperator {
    AND = 'AND',
    OR = 'OR',
}

export enum SearchInputFacetName {
    AUTHOR = 'author',
    CONTENT_TYPE = 'contentType',
    TAG = 'tag',
}

export const FACET_INPUTS = [
    SearchInputFacetName.AUTHOR,
    SearchInputFacetName.CONTENT_TYPE,
    SearchInputFacetName.TAG,
];

export enum SearchFacet {
    AUTHORS = 'authors',
    CONTENT_TYPE = 'contentType',
    TAGS = 'tags',
}

export type SearchFacets = { [key in SearchFacet]?: string[] };

export interface ParsedQuery {
    cleanQuery: string;
    facets: SearchFacets;
}

export enum SearchEvents {
    FILTER = 'searchFilter',
}

export interface FilterEvent {
    facet: SearchFacet;
    value: string;
}
