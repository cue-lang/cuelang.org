package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-boilerplate-removal": {
					page: {
						cache: {
							code: {
								"intro: references": "+E4+D/5MCOkbZadol76UVRKva+66XUn3ykdkyRXkLGI="
							}
							upload: {
								"baseline input":   "IkE/UrKY37lQquLVDXlusYsEk4zO8Xolt+6K036BqaY="
								"baseline output":  "656gE8iKsU73WV5qWOVFiO4TpbVS4fFIQKKT9hHLwMY="
								schema:             "zZk0kpJfxa73Bc1EAcNwzts1422Oz3c0LIK4Ru6gd2c="
								"schema reupload":  "AgSYt7EP8dWQ2VysvUNrQSFjpGeJkAmr100YuWs8Z0s="
								"schema output":    "w+sOz5K8E311RPgsXgud4i0Ho+mW2uSEsgy8fFT+D7A="
								defaults:           "ie2u7RcTx3pL4dnE56zABXRb9xv8UEW14zILApd7x38="
								"defaults output":  "+pAWu10vPnriM7Py+f3VAG/1TBJh+n1zXWbvOPtX9fc="
								name:               "Zg7AMd8P5EgH1Q8bnliz81Co/ac63c17ng3jZ+Bx+cU="
								"name output":      "yhDHPD8Xcuyd6Kev+9GndnlV/Vah/1OglAeOFcqB+fQ="
								"extra app":        "xcqqCaXgaxb99tFDhlCl4K3fSrqbd+E7nsNyfnzdWws="
								"extra app output": "2RxKiUZdafdVrMdn2YsNSZ6i8Zi7jygDWDWlD0lSXfQ="
								"pre-trim source":  "RrdsfErPPv6yWYacpzgaB33N5UtjkkP4ANXCHiyAOBY="
								"post-trim alpha":  "SRd+WxQp4N7au6vX05wg2MauyRJa7TcIEBvn/AYX+Os="
								"post-trim beta":   "4n2i0EXl3gxqmEvcSMZoG+1udHb1eFYYRLfkY7SgJh8="
								"post-trim gamma":  "ErcaDbFyR9stuib5nVSI47XMmDJIMpqa2HdP4Cl4BFU="
								"post-trim output": "jHgSJw1vb7qoU0GMToDnopfD7gYsbORsCzeTEjodI4Y="
							}
							multi_step: {
								hash:       "D7Q0T740RJI04TAGR4C87LGIRE6JRK9OHPUDN19G14RV438F30AG===="
								scriptHash: "KOHOSQ50PPFAKGQVSRD4I3Q7TU957F05QL50M7RAI9OC7ASE4J9G===="
								steps: [{
									doc:      ""
									cmd:      "cue export -o configuration.yml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue export -o configuration.yml -f"
									exitCode: 1
									output: """
											app.alpha.port: conflicting values "8080" and int (mismatched types string and int):
											    ./a.cue:3:13
											    ./a.cue:6:12
											    ./schema.cue:6:13

											"""
								}, {
									doc:      ""
									cmd:      "cue export -o configuration.yml -f"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue export -o configuration.yml -f"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue export -o configuration.yml -f"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue export -o configuration.yml -f"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue trim"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue export -o configuration.yml -f"
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
