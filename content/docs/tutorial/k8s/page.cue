package site

content: docs: tutorial: k8s: page: {
	comparators: [
		{
			kind:          "patternComparator"
			commandPrefix: "! diff"
			pattern: expr: #"(?m)^(?:---|\+\+\+)\s+(?:\S+)\s+(.+)$"#
		},
	]
}
