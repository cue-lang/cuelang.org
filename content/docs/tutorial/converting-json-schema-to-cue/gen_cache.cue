package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "MwHD/qg9hEtf7FayP+eQjuRxHIFuV+M8ikN16gvx8eM="
								"schema.cue":         "vuqxSbGs4amqMAdi0DT6odvW/suhzRE7zAvJelcRu4s="
								"split_pea.yml":      "dmYLglsM6UgUBTTqZRar1Hu/UuyutPI70HADAG/A7Nk="
								"pomodoro.yml":       "09zZGsnvIZut5GVF0jXqywoFFx3Onhn32vGFD/aXRfw="
								"pomodoro.yml fixed": "Pm4BFs8/Ou/qxDccAJ+Qk+W3LiPmveIsr7yj8eZ9ECU="
							}
							multi_step: {
								hash:       "5PJP7RBCE6RRSDMSBE911KG93F3O97UMM15QS40K50R7U3DVPBM0===="
								scriptHash: "2H1HLF8MLQ185KCLUN5A8C2PGDEVV4KE1RC728N7NSJRN5BKQF6G===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.9.2
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
