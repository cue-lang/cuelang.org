---
title: Step
weight: 31
---

With the step shortcode you can add for example a step-by-step walkthrough.

## Attributes

stepNumber
: required - add the number for the step. Without this, no step number will be shown/

group
: optional - if you want to use multiple step series, add a groupname per series.
This adds the groupname to the id, which makes it possible to link to the steps.

## Examples

Below, you can find two example step lists. Click on the numbers to see the url change.
Here you can also see the use of the group name.

### Step group example

````
{{</* step group="example" stepNumber="1" */>}}
Open a command prompt and create a new directory to hold this tutorial's files.
For example:

    ```
    {
        "firstName": "John",
        "lastName": "Smith",
        "age": 25
    }
    ```

{{</* /step */>}}

{{</* step group="example" stepNumber="2" */>}}
Create a data file named `charlie.yml` to hold Charlie the cat's details.
Place this information in it, including the deliberate mistake in the `species`
{{</* /step */>}}

````

Results in the following steps:

{{< step group="example" stepNumber="1" >}}
Open a command prompt and create a new directory to hold this tutorial's files.
For example:

```
{
    "firstName": "John",
    "lastName": "Smith",
    "age": 25
}
```

{{< /step >}}

{{< step group="example" stepNumber="2" >}}
Create a data file named `charlie.yml` to hold Charlie the cat's details.
Place this information in it, including the deliberate mistake in the `species`
{{< /step >}}

### Other step group example

````
{{</* step group="other" stepNumber="1" */>}}
Open a command prompt and create a new directory to hold this tutorial's files.
For example:

    ```
    {
        "firstName": "John",
        "lastName": "Smith",
        "age": 25
    }
    ```

{{</* /step */>}}

{{</* step group="other" stepNumber="2" */>}}
Create a data file named `charlie.yml` to hold Charlie the cat's details.
Place this information in it, including the deliberate mistake in the `species`
{{</* /step */>}}

````

Results in the following steps:

{{< step group="other" stepNumber="1" >}}
Open a command prompt and create a new directory to hold this tutorial's files.
For example:

```
{
    "firstName": "John",
    "lastName": "Smith",
    "age": 25
}
```

{{< /step >}}

{{< step group="other" stepNumber="2" >}}
Create a data file named `charlie.yml` to hold Charlie the cat's details.
Place this information in it, including the deliberate mistake in the `species`
{{< /step >}}
