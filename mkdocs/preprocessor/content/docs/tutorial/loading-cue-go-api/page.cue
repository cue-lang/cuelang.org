package site

content: docs: tutorial: "loading-cue-go-api": {
	page: comparators: [
		{
			kind:    "patternComparator"
			command: "go test"
			pattern: expr: #"(?m)^ok .*\t(\d(\.\d+)?)s"#
		},
		{
			kind:    "unstableLineOrderComparator"
			command: "go test"
		},
	]
}
