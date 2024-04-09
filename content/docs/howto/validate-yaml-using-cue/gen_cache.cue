package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "LhJFE+VIl+B9dHlW8yRHvBHWoKzHCCOE1fMn4kO6g8c="
								"initial x.cue":  "povjRHaRAWDewTe/YZKAD7fVapUrPvb85Shp+3v6TAk="
								"another person": "C8gVtXcczAIb81X+14DJD6J+uOFmGIWrTbItTd2V66A="
								"fixed yaml":     "T6QMpKcUTPrSxIaOFKw7kY35XLMBZO1lgVeFo8672PI="
							}
							multi_step: {
								hash:       "Q7BFGEI9MS5ES30ABQOL0O52AVGE6N9G2EN2GCCAA79JP9U8NU4G===="
								scriptHash: "DE9VH3D0G7UR7VTKS164SH6455EO8BDDJ06SC0TH6SBBKB4RMM60===="
								steps: [{
									doc:      ""
									cmd:      "cue vet x.cue x.yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.yaml"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.cue:7:21
											    ./x.yaml:12:10

											"""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.yaml"
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
