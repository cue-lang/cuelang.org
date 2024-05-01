package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "MTAtVYw0z31sUZu8H6/+3ukyiHtM4zGll6C5zI/3A1c="
								"schema.cue":         "SsaJoStTAbeYF2Io4+Sk9IetjBc2m1fOb8GvpTPC73A="
								"split_pea.yml":      "MCYYGjkf0zfVi4SBr0iO+D6eeBdVO0abZaWnlW4QnQM="
								"pomodoro.yml":       "8qFTumLbMvCUw2CZEWyakXXAle74EstVzr+2qnPqzzM="
								"pomodoro.yml fixed": "kNeNduVjuMWgUGfgkkjY3a1VTi3vkrTHGZuV+M2tpvs="
							}
							multi_step: {
								hash:       "PPET0FEJLV5J5T8MED9RHP355A3ALA2N0SJ26KDPL9IEV64HC1HG===="
								scriptHash: "2H1HLF8MLQ185KCLUN5A8C2PGDEVV4KE1RC728N7NSJRN5BKQF6G===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.9.0-alpha.4
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
