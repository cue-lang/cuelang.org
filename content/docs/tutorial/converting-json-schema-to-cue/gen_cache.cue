package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "xh9n/pDBE3a/pmU69BkyV7laaSiGou3CAPg4mHxbaQk="
								"schema.cue":         "Sw4LwoTTQ6y4Q1i+qE+pdkANZLd66dy/cCmcK5Oh7gc="
								"split_pea.yml":      "I8XQXfr0wiAL4+L186+dAv/MKyWVr+JFUqhdZOrD1ow="
								"pomodoro.yml":       "gnnm5Gmmk8WaH26vQ4einmNq+NSqOarH8PWEWoErFYo="
								"pomodoro.yml fixed": "8COdKjeUnvUPAgOr26Cweq6Inl8do6m82dNV7sAyoeg="
							}
							multi_step: {
								hash:       "RGURI2O72AND3GPHTA3B389IEVSPSP1PHR1ILK484MOQNFCPJCI0===="
								scriptHash: "SHPTQ81E95CP9JF83F3444BQ9IR0272SFCR8SS5QR85P2VR8OGV0===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.8.0
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
