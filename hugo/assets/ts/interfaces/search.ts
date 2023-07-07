export interface SearchItem {
    objectID: string;
    title: string;
    link: string;
    summary: string;
    publishDate: string;
    content: string;
    contentType: string;
    tags: string | string[];
}

export enum FilterOperator {
    AND = 'AND',
    OR = 'OR',
}

export enum SearchInputFacetName {
    CONTENT_TYPE = 'contentType',
    TAG = 'tag',
}

export const FACET_INPUTS = [
    SearchInputFacetName.CONTENT_TYPE,
    SearchInputFacetName.TAG,
];

export enum SearchFacet {
    CONTENT_TYPE = 'contentType',
    TAGS = 'tags',
}

export type SearchFacets = { [key in SearchFacet]?: string[] };
