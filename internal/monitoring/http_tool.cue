package monitoring

import (
	"list"
	"strings"
	"tool/http"

	"github.com/cue-lang/cuelang.org/_public:aliases"
	"github.com/cue-lang/cuelang.org/internal/ci/netlify"
)

// This defaults to localhost to provoke a cue-cmd failure if it's not specified.
schemeHost: *"http://localhost" | string @tag(schemeHost)

command: checkEndpoints: redirections: {

	// serverSide iterates over a list of path/redirection field pairs, and
	// invokes curl for each pair's path, and then checks that the response
	// returned is a real HTTP 3xx redirect to the redirection field's value.
	serverSide: {for e in list.Concat([netlifyRedirects, hugoAliases]) let Url = "\(schemeHost)\(e.path)" {
		(Url): http.Get & {
			url:             Url
			followRedirects: false
			response: {
				statusCode: >=300 & <400
				header: Location: [e.redirection]
			}
		}
	}}
}

// content checks that specific endpoints serve required content via an HTTP 200.
command: checkEndpoints: content: {

	[_]: {
		followRedirects: false
		response: statusCode: 200
	}

	let metaGoImport = #"<meta name="go-import" content="cuelang.org/go git https://review.gerrithub.io/cue-lang/cue">"#

	// cuelang.org/go Go module root.
	"go get cuelang.org/go": {
		let Url = "\(schemeHost)/go?go-get=1"
		(Url): http.Get & {
			url: Url
			response: body: strings.Contains(metaGoImport)
		}
	}
	// Some package inside the cuelang.org/go Go module.
	"go get cuelang.org/go/\(dummyPath)": {
		let Url = "\(schemeHost)/go/\(dummyPath)?go-get=1"
		(Url): http.Get & {
			url: Url
			response: body: strings.Contains(metaGoImport)
		}
	}
}

let hugoAliases = [...#redirect] & [
	for i in aliases {
		path:        i.from
		redirection: i.to
	},
]
let netlifyRedirects = [...#redirect] & [
	for e in netlify.redirects
	if (e.status == 301 || e.status == 302) {
		path:        strings.Replace(e.from, "*", dummyPath, 1)
		redirection: strings.Replace(e.to, ":splat", dummyPath, 1)
	},
]
let #redirect = {
	path:        string & =~"^/"
	redirection: =~"^http://" | =~"^https://" | =~"^/"
}
let dummyPath = "internal/monitor"
