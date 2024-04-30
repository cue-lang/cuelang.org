package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "ufmgRDR2Cdy6tieCZ07YinBIgrkDqaibuLy+oR9pXsM="
								"schema.cue":         "MKQeraaCsgo7iu3FY5zFe1hwt7TTWrkfQl2veGO0GcU="
								"split_pea.yml":      "VwGQhcO+6tEGRaQRajFFdbYl38bcPYXSrozQjiPAyEE="
								"pomodoro.yml":       "kUDApd5swZ7d49reVHiz1WPH3q9iDthoGpl5rcuVQzc="
								"pomodoro.yml fixed": "UcfzSvgkzpAafzmtw9wMPgRix3K873izi78nVvcnE2I="
							}
							multi_step: {
								hash:       "I81QRFR4VNUCSS7K525U9GOHSH08BSKHMIIOJUNO7174SKH5C0T0===="
								scriptHash: "2H1HLF8MLQ185KCLUN5A8C2PGDEVV4KE1RC728N7NSJRN5BKQF6G===="
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
