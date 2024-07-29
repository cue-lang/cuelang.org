package site

content: docs: howto: "inject-system-information-into-evaluation-using-tag-variable": {
	page: comparators: [
		for prefix in ["cue export -T", "cue eval -T", "cue eval -Tt"] {
			{
				kind:          "patternComparator"
				commandPrefix: prefix
				pattern: expr: #"(?m)^[a-zA-Z0-9]+: *"?(.*)"?"#
			}
		},
	]
}
