package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "Khx7QYo97t/vp+59hfJh4bGwMl+LovRn+PI/aubWF34="
								"initial x.cue":  "+FtLkMtu2MLU68+YXLaqpSY0uUvkVvYLUmYQ3UVWr2Y="
								"another person": "TFCjR2341UWw150N9eUkyRQn7QnvpeAatZ8meAeaYh8="
								"fixed yaml":     "FRktgx3rADd5INaCOXfHQxVK+WfAGStrJf8WMUUrjlk="
							}
							multi_step: {
								hash:       "PUJPDOM072JQIRKS2MH05K9FHKHDIS5E2JU9JIS2F8OLQUNT28KG===="
								scriptHash: "7O25FPHJVUHC297BLS0S5A0O6M4E37ITUK3M1O5FHBH097GTHAAG===="
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
