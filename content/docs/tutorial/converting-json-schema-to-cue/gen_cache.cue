package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "apcPs0YRdTdam4sg8MmUCfsyDs64mmKbc0ZLb4kX8N4="
								"schema.cue":         "GBgeoy76MeXsxgmZHChk6L6YFCbClST7GyjWk/0zAwc="
								"split_pea.yml":      "oltzyVQFU84SVpPOg3VM17t/FFg2fzZW2AP7tbNN5tA="
								"pomodoro.yml":       "FLdu3dZOO4nClz1VHNI1dnQSWGd3bBsv/1f+rp06Slo="
								"pomodoro.yml fixed": "Q3cR4TLBax1AfYRHNjtSSW0dl+rI6Vzot4JoTXvc6Ho="
							}
							multi_step: {
								hash:       "8MRIU4CSTFUT9IOFBLCU42LSM5O9F7SH0LUIG9P4QE8Q855525QG===="
								scriptHash: "2H1HLF8MLQ185KCLUN5A8C2PGDEVV4KE1RC728N7NSJRN5BKQF6G===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.9.1
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
