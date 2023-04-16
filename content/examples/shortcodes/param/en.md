---
title: Param
weight: 27
description: "This page shows an example of the param shortcode"
---

With the param shortcode you can print a value from the Front Matter on your page, with a fallback to the site param value. It will log an ERROR if the param with the given key could not be found in either.

## Example

Below an example of Front Matter and the param shortcode. The result of this param is below the code block.

```
---
title: Param
weight: 25
description: "This page shows an example of the param shortcode"
---

**An example of the param shortcode with the title value**: {{</* param title */>}}

**An example of the param shortcode with the description value**: {{</* param description */>}}
```

**An example of the param shortcode with the title value**: {{< param title >}}

**An example of the param shortcode with the description value**: {{< param description >}}
