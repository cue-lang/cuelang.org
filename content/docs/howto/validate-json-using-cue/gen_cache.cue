package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "ZBei/k/+hdRTQQZhCahK1NINWHYMXVyiexN+Md8m9Fc="
								"x.cue":        "CHtZm2duzeb/sNEAK/Q6syZmgMO30Lney30HYX9RqBA="
								"x.json v2":    "NNBFuHclWXEiVdbrAP3ijCD3gKShUWUaIk6Ief8wWcI="
								"fixed x.json": "Ui2sKCWEq0lxfty5KqR+6WhAtuZKkGnFsn7JNkFEcxw="
							}
							multi_step: {
								hash:       "F2SA56QI54IQ6BKS4232T537B5TCVKPFK9R4I486IAKPNT8FTC4G===="
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
