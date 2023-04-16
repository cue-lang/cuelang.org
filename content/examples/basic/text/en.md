---
title: Text elements
weight: 11
---

## Headings
To create a heading, add number signs (#) in front of a word or phrase. The number of number signs (`#`) you use should correspond to the heading level.

For example, to create a heading level three (`<h3>`), use three number signs (e.g., `### My Header`).

# \# Header 1

## \## Header 2

### \### Header 3

#### \#### Header 4

##### \##### Header 5

###### \###### Header 6

### Headings - Best Practices
You should also put blank lines before and after a heading for compatibility.
```
Try to put a blank line before...

# Heading

...and after a heading.
```

Also on simple detail page's you should generally not use a Heading 1 in the content for SEO purposes.
This is because the main title of the page is already a Heading 1.


### Heading - Custom Ids

Adding custom IDs allows you to link directly to headings. To add a custom heading ID, enclose the custom ID in curly braces on the same line as the heading.

```
### My Great Heading {#custom-id}
```

You can link to headings with custom IDs in the file by creating a standard link with a number sign (#) followed by the custom heading ID. These are commonly referred to as anchor links.

{{< columns >}}
```
[Go to Paragraphs](#paragraphs)
```
{{< columns-separator >}}
[Go to Paragraphs](#paragraphs)
{{< /columns >}}

---

## Paragraphs

To create paragraphs, use a blank line to separate one or more lines of text.

{{< columns >}}
```
I really like using Markdown.

I think I'll use it to format all of my documents from now on.
```
{{< columns-separator >}}
I really like using Markdown.

I think I'll use it to format all of my documents from now on.
{{< /columns >}}

### Paragraphs - Best Practices

Don't put tabs or spaces in front of your paragraphs.

Keep lines left-aligned like this.

---

## Line Breaks

To create a line break or new line (`<br>`), end a line with two or more spaces, and then type return. You can also use the `<br>` HTML tag.
And another option is typing a backslash (`\`) at the end of the line.

{{< columns >}}
```
This is the first line.\
And this is the second line.
```
{{< columns-separator >}}
This is the first line.\
And this is the second line.
{{< /columns >}}

### Line Breaks - Best Practices

You can use two or more spaces (commonly referred to as “trailing whitespace”) for line breaks in nearly every Markdown application, but it’s controversial.
It’s hard to see trailing whitespace in an editor, and many people accidentally or intentionally put two spaces after every sentence.

For this reason, you may want to use something other than trailing whitespace for line breaks. If your Markdown application supports HTML, you can use the `<br>` HTML tag.
Another option is typing a backslash (`\`) at the end of the line.

---

## Emphasis

You can add emphasis by making text bold or italic.

### Bold

To bold text, add two asterisks or underscores before and after a word or phrase. To bold the middle of a word for emphasis, add two asterisks without spaces around the letters.

{{< columns >}}
```
I just love **bold text**.

I just love __bold text__.

Love **is** bold
```
{{< columns-separator >}}
I just love **bold text**.

I just love __bold text__.

Love **is** bold
{{< /columns >}}

### Italic

To italicize text, add one asterisk or underscore before and after a word or phrase. To italicize the middle of a word for emphasis, add one asterisk without spaces around the letters.

{{< columns >}}
```
Italicized text is the *cat's meow*.

Italicized text is the _cat's meow_.

A *cat* meow
```
{{< columns-separator >}}
Italicized text is the *cat's meow*.

Italicized text is the _cat's meow_.

A *cat* meow
{{< /columns >}}

### Both Bold and Italic

To emphasize text with bold and italics at the same time, add three asterisks or underscores before and after a word or phrase. To bold and italicize the middle of a word for emphasis, add three asterisks without spaces around the letters.

{{< columns >}}
```
This text is ***really important***.

This text is ___really important___.

This text is __*really important*__.

This text is **_really important_**.

This is really ***very important*** text.
```
{{< columns-separator >}}
This text is ***really important***.

This text is ___really important___.

This text is __*really important*__.

This text is **_really important_**.

This is really ***very important*** text.
{{< /columns >}}

---

## Code

To denote a word or phrase as code, enclose it in backticks (\`).


{{< columns >}}
```
At the command prompt, type `nano`.
```
{{< columns-separator >}}
At the command prompt, type `nano`.
{{< /columns >}}

---

## Strikethrough

You can strikethrough words by putting a horizontal line through the center of them. This feature allows you to indicate that certain words are a mistake not meant for inclusion in the document.
To strikethrough words, use two tilde symbols (~~) before and after the words.


{{< columns >}}
```
~~The world is flat.~~ We now know that the world is round
```
{{< columns-separator >}}
~~The world is flat.~~ We now know that the world is round
{{< /columns >}}

---

## Links

To create a link, enclose the link text in brackets (e.g., \[Cue lang]) and then follow it immediately with the URL in parentheses (e.g., (https://https://cuelang.org)).


{{< columns >}}
```
My favorite project is [CUE](https://cuelang.org).
```
{{< columns-separator >}}
My favorite project is [CUE](https://cuelang.org).
{{< /columns >}}

You can optionally add a title for a link. This will appear as a tooltip when the user hovers over the link. To add a title, enclose it in quotation marks after the URL.

{{< columns >}}
```
My favorite project is [CUE](https://cuelang.org "CUElang.org").
```
{{< columns-separator >}}
My favorite project is [CUE](https://cuelang.org "CUElang.org").
{{< /columns >}}

---

## Escaping Characters

To display a literal character that would otherwise be used to format text in a Markdown document, add a backslash (\\) in front of the character.

{{< columns >}}
```
\* Without the backslash, this would be a bullet in an unordered list.
```
{{< columns-separator >}}
\* Without the backslash, this would be a bullet in an unordered list.
{{< /columns >}}

### Characters You Can Escape

You can use a backslash to escape the following characters.
{{< table >}}
| Char   | Name                | Note                        |
| :----: |---------------------|-----------------------------|
| \\     | Backslash           |                             |
| \`     | Backtick            | Double backticks also works |
| \*     | Asterisk            |                             |
| \_     | Underscore          |                             |
| \{ \}  | Curly braces        |                             |
| \[ \]  | Brackets            |                             |
| \< \>  | Angle brackets      |                             |
| \( \)  | Parentheses         |                             |
| \#     | Number sign         |                             |
| \+     | Plus sign           |                             |
| \-     | Minus sign (hyphen) |                             |
| \.     | Dot                 |                             |
| \!     | Exclamation sign    |                             |
| &#124; | Pipe                | In tables use `&#124;`      |
{{< /table >}}
