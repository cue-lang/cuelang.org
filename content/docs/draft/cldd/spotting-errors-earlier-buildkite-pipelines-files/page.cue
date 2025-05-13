package site

content: docs: draft: cldd: "spotting-errors-earlier-buildkite-pipelines-files": page: {
	testUserAuthn: ["cue-user-new"]
	comparators: [
		{
			kind:          "patternComparator"
			commandPrefix: "! cue vet -c"
			// steps: field is required but not present:
			//     .cache/cue/mod/extract/cue.dev/x/buildkite@v0.1.0/schema.cue:16:2
			pattern: expr: "(?m)\\.cache/cue/mod/extract/cue.dev/x/buildkite@v(.*)\\.cue:([0-9]+):([0-9]+)$"
		},
	]

}
