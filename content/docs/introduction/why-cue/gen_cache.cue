package site
{
	content: {
		docs: {
			introduction: {
				"why-cue": {
					page: {
						cache: {
							upload: {
								schema:          "YSta6VD479+ycSMzotdJ1KHAFWvpAm3NFClFSLDwsQU="
								data:            "UndjhMs+v4H7cCFshH9y97ZqfTDDEXxzRrW0VzE3Ry4="
								defaults:        "LSWTNP5jzE6s1Ub9QQK6H2+yG63JnWen7JMObojCTJw="
								"site.cue 2":    "Q/62Q3vufTty1vw1kKioQ8Da2sM6n8+GTW2CQXm50oQ="
								"broken update": "jW6v6+U/B1Iz0cBVLbVqiykp7fD/xvfbQ6KPchrnOVI="
							}
							multi_step: {
								hash:       "NANDAHHQC1TV9U96MK14C590B35URJHKC3C15L9HJ9Q5EG49EJ8G===="
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
