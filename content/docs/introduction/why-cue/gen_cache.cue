package site
{
	content: {
		docs: {
			introduction: {
				"why-cue": {
					page: {
						cache: {
							upload: {
								schema:          "MZpWsNlEuOkvs6z78/jgNaVj3jesjl4uJ9sBZG7QK2M="
								data:            "qzYul2lgZoRX2rY4Bpppwk9T5SYC1B07XDI7CQnl1pw="
								defaults:        "ZARvIo9iYQbs3fFRvsPFZJozsZ9k9nud5WDHAVat+IE="
								"site.cue 2":    "LdRRNH0IYt+3XMBNSBMz7mNHtFMWW8KvKoRkXIn+Wys="
								"broken update": "BI4tNzwSHPHhBq+5Q5QoXaiQdqcicBM5on770Pz98As="
							}
							multi_step: {
								hash:       "G1FKG4VKGQA4ILOCQG49SMP2PF55G57OCR5BUI76T6U6RD40UHEG===="
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
