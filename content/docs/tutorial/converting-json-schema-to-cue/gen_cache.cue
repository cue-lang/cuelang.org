package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "oi9cZJ4ByqY+6HcMt++qcnpigTiw4cVbqrJbTZ6EIds="
								"schema.cue":         "nYB/Q89wp8LCjQrk6YIQbCJy0jsvYVmaqtXl4w9Cyro="
								"split_pea.yml":      "JDDwt+x6lVBd3mxBx4VozItz9BPAdUXrKP14GPtylkk="
								"pomodoro.yml":       "rpzTC55lj9iEyUlzas6PCgHiduZzRUxo3Ex+2G/8qVY="
								"pomodoro.yml fixed": "Oq3E1z32kOL6gdpqUu3SZCt6zHvh9R5xvf7rBVcM09w="
							}
							multi_step: {
								hash:       "12T8T52RDPBCCQ5NDEPMMJO2776T6O4O4FMOMJK6BQLUQOV879J0===="
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
