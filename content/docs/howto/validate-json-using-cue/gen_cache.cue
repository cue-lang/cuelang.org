package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "qPO6PkIcpCLcD8hV3LWxsCktXvmA+QOacgefnGZm5ss="
								"x.cue":        "LRHMKPMRBM9QAFdTd1YVDmPDbcH0SjcahrdKIhRoig4="
								"x.json v2":    "1k4zfXedbU5+Z01zqnb4d0Az0Rb43zlI9v3CfANcVi4="
								"fixed x.json": "9LJEaOYu/Aov7e2mB8uvdqKqyH4vHes4fjvSe+assy0="
							}
							multi_step: {
								hash:       "2JBFCOF1EJSJTL5GL42G8F7FSFA9VKVUPIAUVJIBQ0F0V5CSGLAG===="
								scriptHash: "UMP1JTJB5F0SVS45CSPDVU8KSNKPQ7SI0OEVSC7IQVT5NDCE1PM0===="
								steps: [{
									doc:      ""
									cmd:      "cue vet x.cue x.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.json"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.cue:7:21
											    ./x.json:15:20

											"""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.json"
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
