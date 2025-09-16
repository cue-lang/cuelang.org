package site

content: docs: howto: "fetch-json-data-http": page: {
	vars: {
		// A random /32+port from the loopback's 127.0.0.1/8 to reduce the chance
		// of pages with network listeners colliding (if indeed they even share the
		// IP range, because Docker).
		HOSTPORT: "127.1.2.3:4567"
		URI: {
			pattern:     "http://\(HOSTPORT)/"
			replacement: "https://proxy.golang.org/cached-only/cuelang.org/go/@v/v0.8.2.info"
		}
	}
}
