module: "github.com/cue-lang/cuelang.org@v0"
language: {
	version: "v0.15.0"
}
deps: {
	"cue.dev/x/githubactions@v0": {
		v:       "v0.3.0"
		default: true
	}
	"github.com/cue-lang/tmp/internal/ci@v0": {
		v:       "v0.0.13"
		default: true
	}
}
