package site

content: docs: howto: "fetch-json-data-http": page: {
	vars: {
		HOSTPORT: "127.1.2.3:4567"
		URI: {
			pattern:     "http://\(HOSTPORT)/"
			replacement: "https://proxy.golang.org/cached-only/cuelang.org/go/@v/v0.8.2.info"
		}
	}
}
