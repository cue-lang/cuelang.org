package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "HQW7PAIh0cRItkMS2K2I0iZNrPmV5kjmGRDCmnnnCc4="
								"schema.cue":         "V9BHHGwjik24133VkCsEo7kUQdxgPHodLgXW6wA/83g="
								"split_pea.yml":      "sQ8QJS7VYZOyao3NnOW0zgmYrIM8F3EhWswZAgtiy7g="
								"pomodoro.yml":       "OzcMsoUISuLguJlM8wZ+Zaj+IOfsPTl24tLd3Y2tvFk="
								"pomodoro.yml fixed": "es0n7oXhcDUzuZUTsebn++Ox97TTejP7v/FMz5JDe5g="
							}
							multi_step: {
								hash:       "VC5PDLUDNCUK3945ECKDVJK5M81QFC66G71RJ9BF0LCNUB0CU0QG===="
								scriptHash: "SC8SGCG7OC77MU3NRU2197NUIJQL5LQBB4CRB41VO0803644LJG0===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.9.0-alpha.3
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
