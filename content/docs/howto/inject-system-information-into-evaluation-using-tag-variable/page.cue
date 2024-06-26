package site

content: docs: howto: "inject-system-information-into-evaluation-using-tag-variable": {
	page: comparators: [
		for cmd in ["export", "eval"] {
			{
				kind:          "patternComparator"
				commandPrefix: "cue \(cmd) -T"
				pattern: expr: #"^[a-zA-Z0-9]+: *"?(.*)"?"#
			}
		},
	]
}
