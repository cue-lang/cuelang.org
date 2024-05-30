package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "exytEFHELmhSmsAFWLy9wTkU6mlEMJiQUflFJ9kizGk="
								"schema.cue":         "TCM1J/WPKHyGL2liEaLoniioMalDhN6sDVyo8WTENbA="
								"split_pea.yml":      "z72cm8oe07S6JSaLhHqy1qQ0p0o04BekhD9lK3YlF5c="
								"pomodoro.yml":       "EbYJELSUIvxqEQozQICOHpzXnMt+ekftGMmJ/E0f8r8="
								"pomodoro.yml fixed": "Iolo1oOIJH65/+G8UwxCXaI0zUsbCGf12hMcuRmW36E="
							}
							multi_step: {
								hash:       "VAVTPMOMNO5GP4HV87I69MC61A4HKVD99O6SCN7J9BMQJ2DS4SR0===="
								scriptHash: "2H1HLF8MLQ185KCLUN5A8C2PGDEVV4KE1RC728N7NSJRN5BKQF6G===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.9.0-alpha.5
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
