package site

content: docs: draft: cldd: "spotting-errors-earlier-gitlab-cicd-files": page: {
	testUserAuthn: ["cue-user-new"]
	comparators: [
		{
			kind:          "patternComparator"
			commandPrefix: "! cue vet -c"
			// "create-pages".scripts: field not allowed:
			//     .cache/cue/mod/extract/cue.dev/x/gitlab@v0.1.0/gitlabci/schema.cue:293:17
			//     ./pipeline.yml:7:3
			pattern: expr: "(?m)\\.cache/cue/mod/extract/cue.dev/x/gitlab@v(.*)\\.cue:([0-9]+):([0-9]+)$"
		},
	]
}
