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

	clientSide: {for e in hugoAliases {
		let Url = "\(schemeHost)\(e.path)"
		(Url): http.Get & {
			url: Url
			response: {
				let Content = #"<meta http-equiv="?refresh"? content="0; url=\#(schemeHost)\#(e.redirection)">"#
				statusCode: >=200 & <300
				body:       string & =~Content
			}
		}
	}}

	serverSide: {for e in netlifyRedirects {
		let Url = "\(schemeHost)\(e.path)"
		(Url): exec.Run & {
			// TODO: replace with http.Get if https://cuelang.org/issue/3896 allows.
			cmd: [
				"curl", "--silent",
				"--write-out", "%{json}",
				"-o", "/dev/null",
				Url,
			]
			stdout: string
			stderr: string & ""
			_check: json.Unmarshal(stdout) & {
				http_code: >=300 & <400

				// Curl fully resolves its "redirect_url" output, adding the
				// current site's prefix if a host isn't present. This requires
				// some munging to match our input data. Using curl's
				// "%{header_json}", above, would make this neater, but the
				// version available in the GHA runner we currently use
				// (ubuntu-22.04) is just slightly too old.
				// TODO: rewrite when we upgrade runner versions in CI.
				let expectedCrossSiteRedirection = strings.HasPrefix(e.redirection, "http://") || strings.HasPrefix(e.redirection, "https://")
				if expectedCrossSiteRedirection {
					redirect_url: e.redirection
				}
				if !expectedCrossSiteRedirection {
					redirect_url: "\(schemeHost)\(e.redirection)"
				}
			}
		}
	}}
}

command: checkEndpoints: content: {
	"go get cuelang.org/go": {
		let Url = "\(schemeHost)/go/\(dummyPath)?go-get=1"
		let Content = #"<meta name="go-import" content="cuelang.org/go git https://review.gerrithub.io/cue-lang/cue">"#
		(Url): http.Get & {
			url: Url
			response: {
				statusCode: 200
				body:       string & strings.Contains(Content)
			}
		}
	}
}

hugoAliases: [...#redirect] & [
	for i in aliases {path: i.from, redirection: i.to},
]
netlifyRedirects: [...#redirect] & [
	for e in netlify.redirects if e.status >= 300 if e.status < 400 {
		path:        strings.Replace(e.from, "*", dummyPath, 1)
		redirection: strings.Replace(e.to, ":splat", dummyPath, 1)
	},
]
#redirect: {path: string & =~"^/", redirection: string}
dummyPath: "internal/monitor"
