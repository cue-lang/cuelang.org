const algoliasearch = require('algoliasearch');

const appId = process.env.ALGOLIA_APP_ID;
if (!appId) {
    throw new Error('Please provide `process.env.ALGOLIA_APP_ID`');
}

const indexName = process.env.ALGOLIA_INDEX_NAME;
if (!indexName) {
    throw new Error('Please provide `process.env.ALGOLIA_INDEX_NAME`');
}

const adminKey = process.env.ALGOLIA_ADMIN_KEY;
if (!adminKey) {
    throw new Error('Please provide `process.env.ALGOLIA_ADMIN_KEY`');
}

const client = algoliasearch(appId, adminKey);
const index = client.initIndex(indexName);

index.setSettings({
    queryLanguages: ['en'],
    searchableAttributes: ['title', 'content', 'summary', 'tags', 'contentType'],
    attributesForFaceting: ['tags', 'contentType'],
    distinct: true,
    attributeForDistinct: 'link',
    highlightPreTag: '<mark>',
    highlightPostTag: '</mark>',
    attributesToSnippet: ['summary'],
    attributesToHighlight: ['title', 'summary', 'content'],
}).then(() => {
    console.log('Updating Algolia Settings successful');
}).catch((error) => {
    console.log('Updating Algolia Settings failed:', error);
});

