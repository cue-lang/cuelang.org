package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "/eG3U9qEIgeL6SYjSOGUJh3Na7KCjDcZuBMZC1r69bg="
								"initial x.cue":  "kZARu2SLbgs/RbQv4iSrbqJAaiSACyDtS8T4ajeHGow="
								"another person": "efb9yaD07d8GbMceJGkAIYsG8KrqWDosK3npBmtj9Ms="
								"fixed yaml":     "d574dz8XB+KN+6dsqLvaf1cU99yZTw944LhuFZ0SknE="
							}
							multi_step: {
								"B7DEBCCS1VA9HQAGFMQOOPIPEG9QFQDS74J33FN9U5C0DI6N9IN0====": [{
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
