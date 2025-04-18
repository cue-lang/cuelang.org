package monitoring

import (
	"encoding/json"
	"strings"
	"tool/exec"
	"tool/http"

	"github.com/cue-lang/cuelang.org/_public:aliases"
	"github.com/cue-lang/cuelang.org/internal/ci/netlify"
)

// This defaults to localhost to provoke a cue-cmd failure if it's not specified.
schemeHost: *"http://localhost" | string @tag(schemeHost)

command: checkEndpoints: redirections: {

	// clientSide iterates over a list of path/redirection field pairs, and
	// instantiates an http.Get for each pair that checks that fetching the path
	// returns a HTML meta-refresh element referencing the redirection's value.
	clientSide: {for e in hugoAliases let Url = "\(schemeHost)\(e.path)" {
		(Url): http.Get & {
			url: Url
			response: {
				let Content = #"<meta http-equiv="?refresh"? content="0; url=\#(schemeHost)\#(e.redirection)">"#
				statusCode: >=200 & <300
				body:       string & =~Content
			}
		}
	}}

	// serverSide iterates over a list of path/redirection field pairs, and
	// invokes curl for each pair's path, and then checks that the response
	// returned is a real HTTP 3xx redirect to the redirection field's value.
	// TODO: replace with http.Get if https://cuelang.org/issue/3896 allows.
	serverSide: {for e in netlifyRedirects let Url = "\(schemeHost)\(e.path)" {
		(Url): exec.Run & {
			// We can't use http.Get (as it follows an HTTP 3xx response for us)
			// so we need to fall back to this direct curl invocation; which:
			//   - doesn't emit a progress indicator (--silent);
			//   - doesn't emit any response body (-o /dev/null);
			//   - emits the response metadata as json (--write-out %{json}),
			//     which we can assert against after it's unmarshalled.
			// cf. https://everything.curl.dev/usingcurl/verbose/writeout.html#available---write-out-variables
			cmd: [
				"curl", "--silent",
				"-o", "/dev/null",
				"--write-out", "%{json}",
				Url,
			]
			stdout: string
			stderr: ""
			_check: json.Unmarshal(stdout) & {
				http_code:    >=300 & <400
				redirect_url: e.redirection
			}
		}
	}}
}

// content checks that specific endpoints serve required content via an HTTP 200.
command: checkEndpoints: content: {
	[_]: response: statusCode: 200

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
	for i in aliases {path: i.from, redirection: i.to},
]
let netlifyRedirects = [...#redirect] & [
	for e in netlify.redirects
	if (e.status == 301 || e.status == 302)
	let isCrossSiteRedirection = (strings.HasPrefix(e.to, "http://") || strings.HasPrefix(e.to, "https://"))
	let redirectedPath = strings.Replace(e.to, ":splat", dummyPath, 1) {

		path: strings.Replace(e.from, "*", dummyPath, 1)

		// Ensure a leading "http(s)://$fqdn" is present in the expected redirection.
		// This is done solely to align with the output of curl, used above, as its
		// redirect_url field also contains this normalisation. When testing
		// https://example.com, this encodes a redirection from /foo to /bar as
		//     { path: "/foo", redirection: "https://example.com/bar" }
		// and from /foo to https://cue.example/bar as
		//     { path: "/foo", redirection: "https://cue.example/bar" }
		if isCrossSiteRedirection {redirection: "\(redirectedPath)"}
		if !isCrossSiteRedirection {redirection: "\(schemeHost)\(redirectedPath)"}

	},
]
let #redirect = {
	path:        string & =~"^/"
	redirection: =~"^http://" | =~"^https://" | =~"^/"
}
let dummyPath = "internal/monitor"
