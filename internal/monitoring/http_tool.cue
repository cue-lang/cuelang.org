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
				let Content = #"<meta http-equiv=refresh content="0; url=\#(schemeHost)\#(e.redirection)">"#
				statusCode: >=200 & <300
				body:       string & strings.Contains(Content)
			}
		}
	}}

	serverSide: {for e in netlifyRedirects {
		let Url = "\(schemeHost)\(e.path)"
		(Url): exec.Run & {
			// TODO: replace with http.Get if https://cuelang.org/issue/3896 allows.
			cmd: [
				"curl", "--silent",
				"--write-out", #"{"responseHeaders":%{header_json},"info":%{json}}"#,
				"-o", "/dev/null",
				Url,
			]
			stdout: string
			stderr: string & ""
			_check: json.Unmarshal(stdout) & {
				info: http_code: >=300 & <400
				responseHeaders: location: [e.redirection]
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
