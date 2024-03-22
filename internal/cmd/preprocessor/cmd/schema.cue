package preprocessor

#site: {
	_kind: {
		kind!: string // the discriminator field
	}

	_matcher: {
		// command or commandPrefix are ways of indicating to which commands
		// the sanitiser should apply.
		//
		// Implement a oneOf. Here both command and commandPrefix are strings
		// because we perform a comparison at the AST level.
		{
			command!:       string & !=""
			commandPrefix?: _|_
		} | {
			command?:       _|_
			commandPrefix!: string
		}
	}

	#sanitiser: _kind & {
		#patternSanitiser |
		#ellipsisSanitiser
	}
	#matchingSanitiser: {
		_matcher
		#sanitiser
	}

	#pattern: {
		expr!:    string
		longest?: bool
	}

	// Instances of #patternSanitiser define replacements that should be applied
	// to commands that match.
	#patternSanitiser: {
		_kind
		kind: "patternSanitiser"

		// pattern defines the text without the output of the matched command
		// to replace.
		pattern?: #pattern

		// replacement defines the text that replaces strings that match pattern.
		replacement?: string
	}

	#matchingPatternSanitiser: {
		_matcher
		#patternSanitiser
	}

	// Instances of #ellipsisSanitiser summarise long output with '...'
	#ellipsisSanitiser: {
		_kind
		kind: "ellipsisSanitiser"

		// start defines the line from which to consider an ellipsis
		start?: int & >=1
	}

	#comparator: _kind & (#patternComparator | #unstableLineOrderComparator)
	#matchingComparator: {
		_matcher
		#comparator
	}

	#patternComparator: {
		_kind
		kind: "patternComparator"

		// pattern defines the text without the output of the matched command for
		// which we loosen comparison.
		pattern?: #pattern
	}

	#matchingPatternComparator: {
		_matcher
		#patternComparator
	}

	#unstableLineOrderComparator: {
		_kind
		kind: "unstableLineOrderComparator"
	}

	#matchingUnstableLineOrderComparator: {
		_matcher
		#unstableLineOrderComparator
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
		sanitisers?: [...#matchingSanitiser]

		// comparators allow for some variance in output, variance that is
		// generally random. For example, a command where the order of lines can
		// vary, or test run time. All comparators that match for a given command
		// are applied, in order.
		comparators?: [...#matchingComparator]

		cache?: {
			upload?: [string]: string
			code?: [string]:   string
			multi_step?: [string]: [...{
				doc?:      string
				cmd?:      string
				output?:   string
				exitCode?: int
			}]
		}

		// userAuth is a list of GitHub usernames for which this page needs
		// Central Registry credentials to be made available as environemnt
		// variables (named after that username) in multi-step scripts.
		userAuthn?: [...string]

		randomVars?: [string]: {
			pattern!:     string
			replacement?: string
		}
	}

	content?: _siteContent

	_siteContent: {
		[!="page"]: _siteContent
		page?:      #page

		// Because this would otherwise be closed by #site
		...
	}

	// Just allow other fields for now. Things will break at a later date if we
	// bring other fields into the scope of #site that conflict with existing
	// usage, but that's fine for now.
	...
}
