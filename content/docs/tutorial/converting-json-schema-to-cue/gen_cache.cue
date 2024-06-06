package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "sg9uQb7H68QWGSeH/alTMNJMl8TqqpxTUzt8qX6vFdI="
								"schema.cue":         "3/mpU33ThO9O0aBttt74qFJMBEon97a5QUJ32Jvr9as="
								"split_pea.yml":      "dM6xNx82mmp8ehPCAm6Ec6c5N6aETcUEGAVFG8gvZgI="
								"pomodoro.yml":       "BsU25XZfYYZSjVZKb7ES4tOOwI+pD/qeDmt4QvD4+aw="
								"pomodoro.yml fixed": "5Ll9QnywnuMX7WuO90CjujO9Jf+ESpg/k0qdXTnJPKY="
							}
							multi_step: {
								hash:       "2CRR755BEOV5RMMBKKQQ2MNMOJ9I2VM7CEL7EGG2K8M7U1NGFRI0===="
								scriptHash: "2H1HLF8MLQ185KCLUN5A8C2PGDEVV4KE1RC728N7NSJRN5BKQF6G===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.9.0
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
