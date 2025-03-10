package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "WIjvQLrRvETTWq/NFu3ZqxeK/WQg9jKIh9Ss3FAxQPs="
								"schema.cue":         "OlfOB40k9GOOxdis8uG+N1v72H7ZyV9v97pzK1OfCiI="
								"split_pea.yml":      "GrnQCWlb9SKGmylF07WvLmDOZH4vk2/Dz9n3TE6+5AI="
								"pomodoro.yml":       "NmjiSsbLkbdzfyp+J1dwt7rwyxj1+t9gNEEvDl5MRhw="
								"pomodoro.yml fixed": "tX9BK6EbXrsVWj8wU52BaNIrfiiPdbqnQ9UkdkJMYe4="
							}
							multi_step: {
								hash:       "9CPKE923CFVEB1HCDP9MNU4UILKD913SQL9CDI78A5SB3BRPHU70===="
								scriptHash: "EEKUOTTD6EPHLI57C8VDPJM17PGNAHR4LE3VPVJK8JJJ1NVQDBEG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.13.0-0.dev.0.20250310212608-931fecbeb96f
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
											    ./schema.cue:13:17
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
