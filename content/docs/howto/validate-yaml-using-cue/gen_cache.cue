package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "MHUG9nFzUjaZgwEArqXDF7N6LnoTx8jpPqhfLOmjP3U="
								"initial x.cue":  "1awVjMM4QBZnzQUKJ3d6AIihZD9DieXe5WBnge3tu+8="
								"another person": "Pd1Da1bGoNFwLdKqBTlUgvF+3VstJrVUQcrchXqLJMo="
								"fixed yaml":     "UVLQst1eO0qoPI38rDX/R92gwCaZEufItfot0SG3jqU="
							}
							multi_step: {
								hash:       "B9SB7DNF8IHQMNSSIVVGI99SN1O55IGU6536H7MD4KTOD29O0TA0===="
								scriptHash: "7O25FPHJVUHC297BLS0S5A0O6M4E37ITUK3M1O5FHBH097GTHAAG===="
								steps: [{
									doc:      ""
									cmd:      "cue vet x.cue x.yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.yaml"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.cue:7:21
											    ./x.yaml:12:10

											"""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.yaml"
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
