package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "aRegiUKFNQcl0oBG43wy3b7Hn0KeJVdEp/v/9q8b+D4="
								"schema.cue":         "kqaNZrenIyWU1MFP8lDTnzRYqNzeFWatmaO/l3Cucs0="
								"split_pea.yml":      "eFAsPRL0xzDXb7p5WMOF8Nv5XF21sYqwUXwxLLoFug4="
								"pomodoro.yml":       "Xvs+9r4u2lawZhyiJh3bgGJcvKICWeZPjf+tsoGXiMg="
								"pomodoro.yml fixed": "NuQg7hGXsgrIiK3fYPLDkUpGum8t/tasWmmN9jxDYD4="
							}
							multi_step: {
								"JC1503B2T6PC2RUHJ89DDM3LB6C3DVQKSB0N26RCIM0FQN95H630====": [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.8.0
											...

											"""
								}, {
									doc:      ""
									cmd:      "cue import -l '#restaurant:' -p cuisine schema.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cp schema.cue .schema.cue"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "diff -u .schema.cue schema.cue"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -d '#restaurant' schema.cue *.yml"
									exitCode: 1
									output: """
											tables.0.seats: invalid value 100 (out of bound <=10):
											    ./schema.cue:10:16
											    ./pomodoro.yml:4:12

											"""
								}, {
									doc:      ""
									cmd:      "cue vet -d '#restaurant' schema.cue *.yml"
									exitCode: 0
									output:   ""
								}]
							}
						}
					}
				}
			}
		}
	}
}
