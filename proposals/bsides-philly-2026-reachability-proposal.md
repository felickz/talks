## Title

More Code, More Alerts: Triaging the Flood of Open Source Dependency Vulns

## Abstract

Open source maintainers and AppSec teams are drowning in dependency alerts: more code, more dependencies, more advisories. We chart why the volume keeps climbing, then switch between slides and live demos to follow a vulnerability from a private report to the Advisory Database, then down into your own repo's dependency graph and Dependabot alerts. Then we put Dependabot Reachability Analysis, powered by CodeQL static analysis, to work: should reachability reorder your queue or empty it?

## Description

Dependency vulnerability volume is climbing like a hockey stick: more code, more dependencies, more researchers and tools finding bugs, so more advisories and more alerts. We start with the data from the public GitHub Advisory Database and ask what is driving it and what it does to maintainers and AppSec teams.

Then we switch between slides and live demos to walk the mechanics for open source on GitHub: private vulnerability reporting and repository security advisories, CVE assignment, the Advisory Database (curation, community contributions, ecosystems), the dependency graph (manifests, lockfiles, dependency submission for transitive dependencies), and how Dependabot matches advisories to your graph to raise alerts.

Next, prioritization: what CVSS does and doesn't tell you, what EPSS and KEV add, and why a "critical" for a function you never call still lands in your queue.

Then static analysis. We introduce how CodeQL turns source into a queryable database, and how Dependabot Reachability Analysis uses it to ask a different question than a score: can your code actually reach the vulnerable function, including through transitive dependencies? And a question for the room: should reachability reorder your queue, or empty it?

Finally, automation. Did we really get this far without talking about AI? Agentic workflows run these AI flows in CI, and local AI tooling pulls alert data with all its scoring (CVSS, EPSS, reachability) into a context where an agent can weigh it with scope and recommend actions, without auto-dismissing anything.

You will leave with the data behind the flood, a map of the pipeline, and a reachability-aware triage policy you can apply to any repo today.
