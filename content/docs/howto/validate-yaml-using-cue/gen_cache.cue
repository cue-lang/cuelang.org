package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"example.yaml":                   "R6aS2pQjW4EWolm+FNqGcaA03F3y4asW0LZ+4vJt9NM="
								"schema.cue: truncated":          "7SJPiAt/blPyESY8wns0IzUe9FcnWSUCLF8GTLkDnvQ="
								"schema.cue: commented":          "qwGk9GMKjCnvimdqChtBVF7C+PFvyo/uC5tuJFr2ZQs="
								"schema.cue - field constraints": "fu21yTBXBxbAMF30c54ywBUPRMhN+ykDPyzFXql8s2k="
								"another person":                 "oMyql5FjzZa5wVe9GyNFPSFRr8tOydbNx5EgxLU3asg="
								"fixed yaml":                     "D1VfVYWFJq8Fw8mpbsy0Cj34c5mttTZDaBqsXaW+a3U="
							}
							multi_step: {
								"L1LU6722MB4CK34TPJSI0DV9OON3JB9ALGD4K2MJ32S29JKPPCCG====": [{
									doc:      ""
									cmd:      "cue import -p validate example.yaml -l Schema: -o schema.cue -f"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cat schema.cue"
									exitCode: 0
									output: """
											package validate

											Schema: {
											\tteamName:   "Data Integrity"
											\tteamNumber: 139
											\tleader:     "Charlie Cartwright"
											\tmembers: [{
											\t\tname:  "Baker Shannon"
											\t\temail: "bakers@cue.example"
											\t}, {
											\t\tname:   "Rahim Cline"
											\t\temail:  "rahim@cue.example"
											\t\toffice: "42-139"
											\t}, {
											\t\tname:  "Mariam Shepard"
											\t\temail: "mariam.shepard@cue.example"
											\t}]
											\tissueTrackers: {
											\t\t"Data problems": {
											\t\t\turl:           "https://issue.corp.example/data-problems"
											\t\t\tticketPrefix:  "DATAPRB"
											\t\t\tmaxTicketLoad: 42
											\t\t}
											\t\t"New data sources": {
											\t\t\turl:           "https://issue.corp.example/data-sources"
											\t\t\tticketPrefix:  "DATASRC"
											\t\t\tmaxTicketLoad: 13.9
											\t\t}
											\t}
											\trooms: [
											\t\t"12F",
											\t\t"4.2.11",
											\t]
											\tteamNickname: "JSON and the Datanaughts"
											}

											"""
								}, {
									doc:      ""
									cmd:      "cue vet schema.cue example.yaml -d Schema"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cat schema.cue"
									exitCode: 0
									output: """
											package validate

											Schema: {
											\tteamName:   "Data Integrity"
											\tteamNumber: 139
											\tleader:     "Charlie Cartwright"
											\tmembers: [{
											\t\tname:   "Rahim Cline"
											\t\temail:  "rahim@cue.example"
											\t\toffice: "42-139"
											\t}]
											\tissueTrackers: {
											\t\t"New data sources": {
											\t\t\turl:           "https://issue.corp.example/data-sources"
											\t\t\tticketPrefix:  "DATASRC"
											\t\t\tmaxTicketLoad: 13.9
											\t\t}
											\t}
											\trooms: [
											\t\t"12F",
											\t]
											}


											"""
								}, {
									doc:      ""
									cmd:      "cat schema.cue"
									exitCode: 0
									output: """
											package validate

											Schema: {
											\tteamName:   "Data Integrity"     // required
											\tteamNumber: 139                  // required
											\tleader:     "Charlie Cartwright" // required
											\tmembers: [{
											\t\tname:   "Rahim Cline"       // required
											\t\temail:  "rahim@cue.example" // required
											\t\toffice: "42-139"            // optional
											\t}]
											\tissueTrackers: {
											\t\t"New data sources": {
											\t\t\turl:           "https://issue.corp.example/data-sources" // required
											\t\t\tticketPrefix:  "DATASRC"                                 // required
											\t\t\tmaxTicketLoad: 13.9                                      // required
											\t\t}
											\t}
											\trooms: [// required
											\t\t"12F",
											\t]
											}


											"""
								}, {
									doc:      ""
									cmd:      "cat schema.cue"
									exitCode: 0
									output: """
											package validate

											Schema: {
											\tteamName!:   "Data Integrity"     // required
											\tteamNumber!: 139                  // required
											\tleader!:     "Charlie Cartwright" // required
											\tmembers?: [{
											\t\tname!:   "Rahim Cline"       // required
											\t\temail!:  "rahim@cue.example" // required
											\t\toffice?: "42-139"            // optional
											\t}]
											\tissueTrackers?: {
											\t\t"New data sources"?: {
											\t\t\turl!:           "https://issue.corp.example/data-sources" // required
											\t\t\tticketPrefix!:  "DATASRC"                                 // required
											\t\t\tmaxTicketLoad!: 13.9                                      // required
											\t\t}
											\t}
											\trooms!: [// required
											\t\t"12F",
											\t]
											}


											"""
								}]
							}
						}
					}
				}
			}
		}
	}
}
