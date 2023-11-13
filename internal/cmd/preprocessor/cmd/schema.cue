package preprocessor

#site: {
	let _kindAndCommand = {
		kind!: string // the discriminator field

		// command or commandPrefix are ways of indicating to which commands
		// the sanitiser should apply.
		//
		// Implement a oneOf. Here both command and commandPrefix are strings
		// because we perform a comparison at the AST level.
		{
			command!:       string
			commandPrefix?: _|_
			step?:          _|_
		} | {
			command?:       _|_
			commandPrefix!: string
			step?:          _|_
		} | {
			command?:       _|_
			commandPrefix?: _|_
			step!:          string
		}
	}

	#sanitiser: _kindAndCommand & #patternSanitiser // build up a disjunction here if required

	#pattern: {
		expr!:     string
		longest?:  bool
		linewise?: bool
	}

	// Instances of #patternSanitiser define replacements that should be applied
	// to commands that match.
	#patternSanitiser: {
		_kindAndCommand
		kind: "patternSanitiser"

		// pattern defines the text without the output of the matched command
		// to replace.
		pattern?: #pattern

		// replacement defines the text that replaces strings that match pattern.
		replacement?: string
	}

	#comparator: _kindAndCommand & (#patternComparator | #unstableLineOrderComparator)

	#patternComparator: {
		_kindAndCommand
		kind: "patternComparator"

		// pattern defines the text without the output of the matched command for
		// which we loosen comparison.
		pattern?: #pattern
	}

	#unstableLineOrderComparator: {
		_kindAndCommand
		kind: "unstableLineOrderComparator"
	}

	#page: {
		// It's questionable whether these leftDelim and rightDelim should be
		// required or not. We can always relax this later.

		// leftDelim is the left hand delimiter used in text/template parsing for
		// root files in the page.
		leftDelim!: string

		// rightDelim is the right hand delimiter used in text/template parsing for
		// root files in the page.
		rightDelim!: string

		// sanitisers are transformations that apply to the output of commands.
		// They normalise output that would otherwise vary between different runs
		// of a multi-step script on a page. This can happen, for example, where
		// a multi-step script is re-run on a machine which has a different OS or
		// architecture. e.g. the output of go version. All sanitisers that match
		// are applied in order.
		sanitisers?: [...#sanitiser]

		// comparators allow for some variance in output, variance that is
		// generally random. For example, a command where the order of lines can
		// vary, or test run time. All comparators that match for a given command
		// are applied, in order.
		comparators?: [...#comparator]

		cache?: {
			upload?: [string]: string
			code?: [string]:   string
			multi_step?: [string]: [...{
				cmd:      string
				output:   string
				exitCode: int
			}]
		}
	}

	content?: _siteContent

	_siteContent: {
		[!="page"]: _siteContent
		page:       #page

		// Because this would otherwise be closed by #site
		...
	}

	// Just allow other fields for now. Things will break at a later date if we
	// bring other fields into the scope of #site that conflict with existing
	// usage, but that's fine for now.
	...
}
