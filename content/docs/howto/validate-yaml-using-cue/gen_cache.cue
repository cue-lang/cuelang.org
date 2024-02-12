package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "T/5gz+gcIDug3/Vko5BqF+SH/ZXCWKKQi6KvOqwjUsE="
								"initial x.cue":  "1+O+1efPZEoLT7OThOf+LbPXZyXnvYl3C9zUY4VUfzc="
								"another person": "cSkdxRlc9tRzl5iPJ5FNYWd/3vdDF4hdbE0RmFNlqfY="
								"fixed yaml":     "oUmkwQuBHJm9oDifxkIvGRK+jjfxs54KgY8t3tWfzIQ="
							}
							multi_step: {
								"0HSQ8852BN17H527B9I9K7OT2HA03PJGMOTO667CDS1PLHKVBDU0====": [{
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
