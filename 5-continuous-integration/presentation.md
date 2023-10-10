## Continuous Delivery: Continuous Integration
#### Implementation, Prerequisites, Practices, <span style="color: brown">Challenges</span>

<img src="assets/ci.webp" width="700"/>

<small><strong>Time to Read:</strong> 12 Minutes</small>, <small><strong>Time to Present:</strong> 60 Minutes</small>
<br>
<small><strong>Created By:</strong> Alireza Roshanzamir</small>
<br>
<small><strong>Keywords:</strong> Continuous Delivery, Continuous Integration, DevOps, Build, Test, Release, Deployment, Automation, Version Control, Deployment Pipeline</small>
<br><br>
<small style="color: darkred"><small>Press **"F"** to go fullscreen; some slides may not display properly otherwise.</small></small>

---
## Introduction
<img src="assets/continuous-integration-spiderman-meme.webp" class="fragment complete-fade-out" width="700">

&shy;<!-- .element class="fragment fade-in" -->Common feature of many software projects is that for long periods of time during the development process the **application is not in a working state.**

&shy;<!-- .element class="fragment fade-in" -->No one tries **running app till done**. Developers check in changes, run unit tests, but **no one** tries **starting app in prodoction-like environment**. Doubly true for projects with **long-lived branches** or **deferred acceptance testing**.

&shy;<!-- .element class="fragment fade-in" -->On the other hand, we have seen projects that spend at most **a few minutes** in a **state** where their application is **not working with the latest changes**. The **difference is continuous integration**.

&shy;<!-- .element class="fragment fade-in" -->Continuous integration means that **whenever someone makes a change**, the whole app is **built** and **tested automatically**. **If it fails**, the **team stops and fixes it immediately**.

<img src="assets/broken-build-meme.webp" class="fragment fade-in" width="370">

&shy;<!-- .element class="fragment fade-in" -->Continuous integration was first mentioned in **Kent Beck**'s book "**Extreme Programming** Explained" (1999).

---
## Implementation
Continuous integration depends on teams using few essential practices.

------
### What You Need Before You Start
1. Version Control
2. An Automated Build
   - You must be able to start your **build** from the **command line**.
3. Agreement of the Team
   - Continuous integration is a **practice**, **not a tool**. It needs **commitment** and **discipline** from your team.

------
### A Basic Continuous Integration System
With your **chosen CI tool** (although it's not necessary) and the right conditions, you can begin in a few minutes. Just inform the tool about your **source code repository**, the **build script**, and the **automated commit tests**, and how to **notify you** if changes **break the software**.

Once you're ready to check in your latest change:  <!-- .element class="fragment fade-in" -->
1. &shy;<!-- .element class="fragment fade-in-then-semi-out" -->Check **if the build is running**. If so, **wait** for it to finish. **If it fails**, **collaborate** with the team to **make it green before check in**.
2. &shy;<!-- .element class="fragment fade-in-then-semi-out" -->**After it's done** and the tests pass, **update your code** in the development environment **from this version** in the repository to get any updates.
3. &shy;<!-- .element class="fragment fade-in-then-semi-out" -->Run the **build** script and **tests** on your **local machine** to confirm everything works **or** use your **CI tool's personal build** feature.
4. &shy;<!-- .element class="fragment fade-in-then-semi-out" -->**If** your local **build passes**, check your code **into version control**.
5. &shy;<!-- .element class="fragment fade-in-then-semi-out" -->**Wait** for your **CI tool** to run the build with your changes.
6. &shy;<!-- .element class="fragment fade-in-then-semi-out" -->**If it fails**, **stop** and **fix** the problem **immediately** on your development machine-**go to step 3**.
7. &shy;<!-- .element class="fragment fade-in-then-semi-out" -->**If the build passes**, **celebrate** and move on to your **next task**.

---
## Prerequisites
Continuous integration **won't fix the build process alone**. It can be **painful if started midproject**. **Effective CI** requires **these practices** before you start.

------
### Check In Regularly
The **key practice** for successful continuous integration is **regular check-ins** to trunk. Aim to check in **multiple times a day**:
- &shy;<!-- .element class="fragment fade-in-then-semi-out" -->Makes your **changes smaller**
- &shy;<!-- .element class="fragment fade-in-then-semi-out" -->**Less** likely to **break the build**
- &shy;<!-- .element class="fragment fade-in-then-semi-out" -->You have a **recent known good** version of the software to **revert** to when you make a mistake
- &shy;<!-- .element class="fragment fade-in-then-semi-out" -->Encourages **disciplined refactoring** and promotes **small**, **behavior-preserving changes**
- &shy;<!-- .element class="fragment fade-in-then-semi-out" -->**Less conflicts**
- &shy;<!-- .element class="fragment fade-in-then-semi-out" -->Forces regular breaks and **stretching muscles** to prevent **carpal tunnel syndrome** and **RSI**
- &shy;<!-- .element class="fragment fade-in-then-semi-out" -->In case of a **major issue (PC explosion :))** , you **won't lose much work**

&shy;<!-- .element class="fragment fade-in" -->Continuous integration is **impossible** when **using branches** since, by definition, working on a **branch means your code isn't integrated** with others.

------
### Create a Comprehensive Automated Test Suite
<img src="assets/when-to-stop-testing-meme.webp" class="fragment complete-fade-out" width="600">

There are three kinds of tests we are interested in running from our continuous integration build:  <!-- .element class="fragment fade-in-with-next custom" -->
- Unit tests
  - &shy;<!-- .element class="fragment highlight-current-blue" -->Test small parts of your app, like **methods** or **functions**, **in isolation** or **interactions among a few**.
  - &shy;<!-- .element class="fragment highlight-current-blue" -->Usually, **don't** involve the **database**, **filesystem**, or **network**.
  - &shy;<!-- .element class="fragment highlight-current-blue" -->Run **quickly**. Even for large apps, the entire suite should finish in **under ten minutes**.
  - &shy;<!-- .element class="fragment highlight-current-blue" -->Written by **developers**.
- Component tests
  - &shy;<!-- .element class="fragment highlight-current-blue" -->Test the behavior of several **integrated components**, like API endpoints.
  - &shy;<!-- .element class="fragment highlight-current-blue" -->**Some** also **call them integration tests**. It depends on your **component size definition**.
  - &shy;<!-- .element class="fragment highlight-current-blue" -->**Some** authors say that **component testing is black-box** while **unit-testing is white-box**.
  - &shy;<!-- .element class="fragment highlight-current-blue" -->**Some** authors say that **component tests are written by developers and testers** together.
  - &shy;<!-- .element class="fragment highlight-current-blue" -->**Not always necessary** to **start the whole application**.
  - &shy;<!-- .element class="fragment highlight-current-blue" -->They **may** hit the **database**, the **filesystem**, or **other systems**.
- Acceptance tests
  - &shy;<!-- .element class="fragment highlight-current-blue" -->Check if the app meets **business acceptance criteria**, covering **functionality** and **characteristics** like **capacity**, **availability**, **security**, etc.
  - &shy;<!-- .element class="fragment highlight-current-blue" -->Run against the **whole app** in a **production-like environment**.
  - &shy;<!-- .element class="fragment highlight-current-blue" -->Can be **time-consuming**. They might take **more than a day when run sequentially**.

------
### Keep the Build and Test Process Short
If it takes **too long** to **build** and run the **unit tests**:
- &shy;<!-- .element class="fragment highlight-current-blue" -->People **avoid** doing a full **build** and **tests** **before check in**.
- &shy;<!-- .element class="fragment highlight-current-blue" -->Causing **multiple commits before the next build**, making it **difficult to find the broken commit**.
- &shy;<!-- .element class="fragment highlight-current-blue" -->People **check in less frequently** due to long waits.

&shy;<!-- .element class="fragment fade-in" -->Ideally, the **pre-check-in** and **CI server** **build** and **test** should last a short time (**90s >> 5min >> 10min**). It's comparable to **making tea**, **chatting**, email, or a **stretch**.

&shy;<!-- .element: class="fragment fade-in-with-next custom" -->However, this **shouldn't conflict** with **comprehensive tests**. Eventually, you'll need to **divide your testing into multiple stages**:
- **Commit stage**: Compile the software, run unit tests for individual classes, and create a deployable binary.
- **Acceptance test stage**: Use the **binaries from the commit stage** to run **acceptance**, **integration**, and **performance tests** if available.

------
### Managing Your Development Workspace
Developers should begin work from a **known-good point**. They must run the **build**, **tests**, and **deploy** in their **controlled environment**. **Shared environments** should be **exceptions**, **not the norm**.

Ensure **automated tests**, including smoke tests, **can run on developer machines**. A **good architecture** permits easy application **execution on a development machine**.

---
## Using Continuous Integration Software
Continuous integration software's core function is to **poll** your version control **for commits**. If found, it **check out** the latest version (to a server or build agent directory), compiles it using the **build** script, runs **tests**, and **notify** you of the outcomes:

<table class="fragment fade-in">
  <tr>
    <td><img src="assets/jenkins-pipeline-default.webp" width="550"/></td>
    <td><img src="assets/jenkins-pipeline-blueocean.webp" width="400"/></td>
  </tr>
  <tr>
    <td><img src="assets/gitlab-pipeline.webp" width="450"/></td>
    <td><img src="assets/github-actions-pipeline.webp" width="700"/></td>
  </tr>
</table>

------
### Bells and Whistles
**Visibility** is a **key advantage of using a CI server**. Many CI servers offer a **widget for your desktop** to display build status.

<img src="assets/state-led.webp" width="400"/>

------
### Predecessors to Continuous Integration
Several teams used a **nightly build**, a common practice at **Microsoft** for many years. Those who **broke it** had to **stay** and **monitor** **subsequent builds** until the next break.

<img src="assets/nightly-build-meme.webp" width="400">

---
## Essential Practices
CI system aims to **maintain working software** consistently. To achieve this, we enforce the following **practices** on our teams:
- Don't Check In on a Broken Build  <!-- .element class="fragment fade-in-then-semi-out" -->
- Always Run All Commit Tests Locally before Committing, or Get Your CI Server to Do It for You  <!-- .element class="fragment fade-in-then-semi-out" -->
- Wait for Commit Tests to Pass before Moving On  <!-- .element class="fragment fade-in-then-semi-out" -->
- Never Go Home on a Broken Build  <!-- .element class="fragment fade-in-then-semi-out" -->
- Always Be Prepared to Revert to the Previous Revision  <!-- .element class="fragment fade-in-then-semi-out" -->
- <!-- .element class="fragment fade-in-then-semi-out" --> Time-Box Fixing before Reverting
    - If the build **breaks** on check-in, attempt a **10-minute fix**; otherwise, **revert**.
- Don't Comment Out Failing Tests  <!-- .element class="fragment fade-in-then-semi-out" -->
- <!-- .element class="fragment fade-in-then-semi-out" --> Take Responsibility for All Breakages That Result from Your Changes
    - Even if **your tests pass** but **others fail after your commit**, the build is **still broken**.
- <!-- .element class="fragment fade-in-then-semi-out" --> Test-Driven Development (here, Test-First is intended)
    - The **only way** to get excellent **unit test coverage** is through test-driven development. 

---
## Suggested Practices
The following practices aren't required, yet they're useful:
- <!-- .element class="fragment fade-in-then-semi-out" --> Extreme Programming (XP) Development Practices
  - Pair programming
  - Coding standards
  - Sustainable pace
  - Test-driven development
  - Collective code ownership
  - ...
- Failing a Build for Architectural Breaches  <!-- .element class="fragment fade-in-then-semi-out" -->
- Failing the Build for Slow Tests  <!-- .element class="fragment fade-in-then-semi-out" -->
- Failing the Build for Warnings and Code Style Breaches  <!-- .element class="fragment fade-in-then-semi-out" -->
- <!-- .element class="fragment fade-in-then-semi-out" -->  Failing the Build for Documents Problems and Inconsistencies
  - Always use verifiable cross-references in your documentation.
  - For non-auto-generated elements, create basic tests to ensure consistency.

------
### Code Style and Static Analysis: Linting
<img src="assets/linter-is-coming-meme.webp" class="fragment complete-fade-out" width="400">

&shy;<!-- .element class="fragment fade-in" -->Linting is vital in your CI pipeline. It helps spot **known issues** and **coding standard violations**, thus **reducing bugs** and enhancing code maintainability.

&shy;<!-- .element class="fragment fade-in" -->Linting is a form of **static analysis** (doesn't run code). The name "linter" comes from Bell Labs' 1978 same name tool.

Some types of linting issues or features:  <!-- .element class="fragment fade-in-with-next custom" -->
<table>
  <tr>
    <td>
      <ul>
        <li>Naming Conventions</li>
        <li>Uninitialized Variables</li>
        <li>Unreachable Code</li>
        <li>Security Vulnerabilities</li>
        <li>Unused Variables and Imports</li>
        <li>Aliasing Variables</li>
        <li>Long Function Signatures</li>
        <li>Deeply Nested Code</li>
        <li>Inconsistent Ordering in Imports</li>
        <li>Implicit Type Conversions</li>
      </ul>
    </td>
    <td>
      <ul>
        <li>Duplicated Code</li>
        <li>Typos</li>
        <li>Incorrectly Scoped Variables</li>
        <li>Class Members Order</li>
        <li>Literals and Initializations Conventions</li>
        <li>Commented Code</li>
        <li>Test Names</li>
        <li>Line Length</li>
        <li>Docstring Style</li>
        <li><strong>Type Checks (for dynamically typed languages)</strong></li>
      </ul>
    </td>
  </tr>
<table>

------
### Code Style and Static Analysis: Formatting
<img src="assets/our-repo-meme.webp" class="fragment complete-fade-out" width="700">

&shy;<!-- .element class="fragment fade-in" -->Refers to **arranging code elements** consistently to enhance **readability** and **maintainability**.

Some common features and aspects of existing formatters:  <!-- .element class="fragment fade-in-with-next custom" -->
- Indention
- Spacing
- Length
- Brace Placement
- Literals and Initializations
- Imports Orders
- Class Members Order
- Remove Unused Imports
- Auto Update to Modern Language Idioms

&shy;<!-- .element class="fragment fade-in" -->Ensure your code formatter **aligns with your linters**. Additionally, run formatters with **only-check** flags as linters.

&shy;<!-- .element class="fragment fade-in" -->Formatters are essential for **removing code-style comments** in **reviews**. Focus on **consistency** and **don't spend too much time** on **style details**.

---
## Challenges
<img src="assets/pr-rejection-meme.webp" class="fragment start">

**Tooling usually isn't the problem**. The question **"Why can't we deliver working changes to the trunk today?"** points to the issues to address. Common team challenges include:
- Code review takes too long / has too many approvers  <!-- .element: class="fragment insides-fade-in-then-out" -->
  - Having more than one reviewer on a PR is a process smell for issues with the quality process.  <!-- .element: class="fragment highlight-current-blue" -->
  - Linting, formatting, type-checking, ... should be automated.  <!-- .element: class="fragment highlight-current-blue" -->
  - Worst: Code reviews are done solo and comments are sent back to the developer. This adds the most drag.  <!-- .element: class="fragment highlight-current-blue" -->
  - Less bad: Reviewer and author work together to fix issues, reducing waiting time and increasing efficiency.  <!-- .element: class="fragment highlight-current-blue" -->
  - Best: Pair programming builds code review into the flow.  <!-- .element: class="fragment highlight-current-blue" -->
- Tests are deferred or skipped  <!-- .element: class="fragment insides-fade-in-then-out" -->
  - Never push untested changes.  <!-- .element: class="fragment highlight-current-blue" -->
  - Timelines are irrelevant if we deliver things on time that are broken.  <!-- .element: class="fragment highlight-current-blue" -->
- The team lacks knowledge on how to write tests for CI  <!-- .element: class="fragment insides-fade-in-then-out" -->
  - Learn effective testing and test patterns.  <!-- .element: class="fragment highlight-current-blue" -->
  - People often push back on TDD, but that is most commonly because they never learned how to do it correctly.  <!-- .element: class="fragment highlight-current-blue" -->
  - It takes time to be good at testing.  <!-- .element: class="fragment highlight-current-blue" -->
- Individual tasks are too big  <!-- .element: class="fragment insides-fade-in-then-out" -->
  - <!-- .element: class="fragment highlight-current-blue" --> Use Evolutionary coding methods such as:
    - Keystone Interfaces (aka. Dark Launching)
    - Branch by Abstraction
    - Feature Flags
  - Decompose tasks into hours of work rather than days  <!-- .element: class="fragment highlight-current-blue" -->
- Stories are too big & lack testable acceptance criteria  <!-- .element: class="fragment insides-fade-in-then-out" -->
  - Focus on BDD instead of "story format"  <!-- .element: class="fragment highlight-current-blue" -->
  - Practice work decomposition techniques  <!-- .element: class="fragment highlight-current-blue" -->
- The team uses a push system for work  <!-- .element: class="fragment insides-fade-in-then-out" -->
  - &shy;<!-- .element: class="fragment highlight-current-blue" -->Focusing solely on individual tasks instead of team goals **isn't optimal**.
  - A team works together to deliver the highest priority on the backlog.  <!-- .element: class="fragment highlight-current-blue" -->
  - Everyone on the team should be invested in everything the team does.  <!-- .element: class="fragment highlight-current-blue" -->

---
## Summary
&shy;<!-- .element class="fragment fade-in" -->CI make a step change to the **productivity of software development teams.**

&shy;<!-- .element class="fragment fade-in" -->Implementing continuous integration changes your team's approach significantly. Without CI, **your application is broken until you prove otherwise**.

&shy;<!-- .element class="fragment fade-in" -->CI creates a tight **feedback loop** to identify issues **early**, when they're **less costly to address**.

&shy;<!-- .element class="fragment fade-in" -->Implementing CI **enforces** two other practices: good **configuration management** and establishing an **automated build and test process**.
