package site
{
	content: {
		docs: {
			introduction: {
				"why-cue": {
					page: {
						cache: {
							upload: {
								schema:          "VQrTnpffKJ6kqSH6lU6ecYjI5pEAGwcqlJnk0M7RvgQ="
								data:            "pcWBRgAT5+uEdmr49hLgfuiThnEU3v86ytQWr7X9WDQ="
								defaults:        "NFbs8tPk29l61aUu+thr0Sy1LZCa/Em/FGtB+OneJIA="
								"site.cue 2":    "bKdDDbntUdThZ4zlLdrjwSgAs2XYdY/ftr/TL+yCvYg="
								"broken update": "bK+LjIGNwDxlWCDqsGpjQD3elOgxFG3u1SKm+B2c2G4="
							}
							multi_step: {
								hash:       "9RA0MKUQ4H2M0MCJ09OOUTJD38JS94NR2CK8FBDK8T8AENV276H0===="
								scriptHash: "CTCHP9D7H7K2OMJFPBHMK9OP8J609364U36R5VJBDHGVBQBC39P0===="
								steps: [{
									doc:      ""
									cmd:      "cue vet"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue trim"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "mv site.cue .site.cue"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "diff site.cue .site.cue"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue export --out yaml"
									exitCode: 0
									output: """
											pages:
											  home:
											    title: Welcome to Widgets'R'We!
											    urlPath: /
											    summary: The homepage of Widgets'R'We - manufacturer and purveyor of the finest left-angled reverse-clockwise widgets in the North East.
											    isDraft: false
											    author: null
											    date: "1999-01-01T00:00:00Z"
											    file: pages/home.html
											  about:
											    title: About Widgets'R'We
											    summary: Information about the Widgets'R'We company.
											    isDraft: false
											    author: null
											    date: "1999-01-01T00:00:00Z"
											    urlPath: /about/
											    file: pages/about.html
											  contact:
											    title: Contact Widgets'R'We
											    summary: Contact information for the Widgets'R'We company.
											    author: Markus Marketing
											    isDraft: false
											    date: "1999-01-01T00:00:00Z"
											    urlPath: /contact/
											    file: pages/contact.html

											"""
								}, {
									doc:      ""
									cmd:      "cue vet"
									exitCode: 1
									output: """
											pages.about.title: conflicting values "Cyber Widgets 2000" and "About Widgets'R'We":
											    ./site.cue:13:12
											    ./updates.cue:4:16

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
