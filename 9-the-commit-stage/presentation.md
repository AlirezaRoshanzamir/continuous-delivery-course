## Continuous Delivery: The Commit Stage
#### Introduction, Principles and Practices, The Results, Commit Test Suite Principles and Practices

<img src="assets/the-commit-stage.png" width="600"/>

<small><strong>Created By:</strong> Alireza Roshanzamir</small>

<small><strong>Keywords:</strong> Continuous Delivery, Continuous Integration, DevOps, Build, Test, Release, Deployment, Automation, Version Control, Deployment Pipeline</small>

<small><small> Tir 1402/August 2023</small></small>

---
## Introduction
The commit stage is the point at which you should **begin the construction of your deployment pipeline**.

Somebody checks a **change into mainline (trunk)** in version control. Your continuous integration server detects the change, checks out the source code, and performs a series of tasks, including:  <!-- .element: class="fragment fade-in-parent-with-next" -->
- Compiling (if necessary)
- Creating binaries
- Performing any analysis
- Creating any other artifacts

The **binaries** and **reports** are then stored into your central **artifact repository** for use by your delivery team and by later stages in the pipeline.  <!-- .element: class="fragment fade-in-paragraph" -->

For **developers**, the commit stage is the **most important feedback cycle** in the development process.  <!-- .element: class="fragment fade-in-paragraph" -->

<img src="assets/the-commit-stage.png" width="350"/>

<details>
<summary>Note</summary>
Mention the preflight, pretested, pull-request, merge request builds.
</details>

---
## Principles and Practices
Some principles and practices that make for an effective commit stage:
- Provide Fast, Useful Feedback  <!-- .element: class="fragment insides-fade-in-then-out" -->
  - Provide a concise summary of the reasons for the failures, such as a list of failed tests, the compile errors, or any other error conditions.  <!-- .element: class="fragment fade-in-then-semi-out" -->
  - Do not fail fast in the commit stage (if possible) and present aggregated report for this stage.  <!-- .element: class="fragment fade-in-then-semi-out" -->
- What Should Break the Commit Stage?  <!-- .element: class="fragment insides-fade-in-then-out" -->
  - Compilation fails, tests break, or an environmental problem  <!-- .element: class="fragment fade-in-then-semi-out" -->
  - Increasing number of warnings  <!-- .element: class="fragment fade-in-then-semi-out" -->
  - Decreasing percentage of coverages  <!-- .element: class="fragment fade-in-then-semi-out" -->
  - Code-style breaches  <!-- .element: class="fragment fade-in-then-semi-out" -->
  - Don't fail the commit test for some reason that hasn't been agreed upon by the whole team  <!-- .element: class="fragment fade-in-then-semi-out" -->
- Tend the Commit Stage Carefully  <!-- .element: class="fragment insides-fade-in-then-out" -->
  - The build and test scripts should be treated with the same level of respect as you would treat any other part of your application.  <!-- .element: class="fragment fade-in-then-semi-out" -->
  - Many projects effectively grind to a halt under the weight of their build problems.  <!-- .element: class="fragment fade-in-then-semi-out" -->
  - Ensure that your scripts are modular (maybe task-based) but avoid environment-specific scripts  <!-- .element: class="fragment fade-in-then-semi-out" -->
- Give Developers Ownership  <!-- .element: class="fragment insides-fade-in-then-out" -->
  - It is a failure if we get to the point where only specialists can maintain the CI system.  <!-- .element: class="fragment fade-in-then-semi-out" -->
- Use a Build Master for Very Large Teams (over 20-30 individuals)  <!-- .element: class="fragment insides-fade-in-then-out" -->
  - It is useful to have someone to play the role of a "build master." to to encourage and enforce build discipline.  <!-- .element: class="fragment fade-in-then-semi-out" -->
  - The build master should never be a permanent role. Team members should rotate through it, perhaps on a weekly basis.  <!-- .element: class="fragment fade-in-then-semi-out" -->

---
## The Results
<img src="assets/manage-all-the-binaries-meme.webp" class="fragment start">

The commit stage inputs are **source code**, and the outputs are **binaries** and **reports** which need to be **stored somewhere** for reuse in the later stages of your pipeline, and for your team to be able to get hold of them:  <!-- .element: class="fragment fade-in-parent-with-next" -->
<img src="assets/role-of-artifact-repository.png">

---
## Commit Test Suite Principles and Practices
<img src="assets/tests-everywhere-meme.jpeg" class="fragment start">

Some important principles and practices governing the design of a commit test suite. Here, we only talk about unit-tests while it's recommended to include some acceptance and end-to-end tests in the commit stage test suit:  <!-- .element: class="fragment fade-in-with-next" -->
- The vast majority of your commit tests should be comprised of unit tests  <!-- .element: class="fragment insides-fade-in-then-out" -->
  <img src="assets/test-automation-pyramid.png" width="800">
- Should be very fast to execute  <!-- .element: class="fragment insides-fade-in-then-out" -->
- Should cover a large proportion of the codebase (around 80% is a good rule of thumb)  <!-- .element: class="fragment insides-fade-in-then-out" -->
- Avoid the User Interface  <!-- .element: class="fragment insides-fade-in-then-out" -->
  - It tends to involve a lot of components or levels of the software under test.
  - UI elements are desperately slow.
- Use Dependency Injection  <!-- .element: class="fragment insides-fade-in-then-out" -->
  - Makes it very easy to limit the scope of a test to just the classes that you want to test, not all of their dependent baggage too.
- Avoid the Database  <!-- .element: class="fragment insides-fade-in-then-out" -->
  - Dramatically slower to run
  - Statefulness of the tests can be a handicap when you want to repeat them
  - Complexity of the infrastructure setup
  - If it isn't simple to eliminate the database from your tests, it implies poor layering and separation of concerns in your code.
- Avoid Asynchrony in Unit Tests  <!-- .element: class="fragment insides-fade-in-then-out" -->
  - Synchronous wrapper around asynchronous entities may help.
  - Tests which rely on infrastructure, such as messaging (even in-memory), count as component tests, not unit tests.
  - More complex, slower-running component tests should be part of your acceptance test stage, not commit stage.
- Using Test Doubles  <!-- .element: class="fragment insides-fade-in-then-out" -->
- Minimizing State in Tests  <!-- .element: class="fragment insides-fade-in-then-out" -->
  - Do not affect state around the tests.
  - Minimize the dependency on state in your tests.
  - Do not fall into trap of building complex data structures to supporting the tests. It's better to have simple and fast setup-teardown.
- Faking Time  <!-- .element: class="fragment insides-fade-in-then-out" -->
- Ten Minutes Threshold  <!-- .element: class="fragment insides-fade-in-then-out" -->
  - When this limit is broken, developers check in less frequently and stop caring about whether or not the commit test suite passes.
  - Parallel execution on build grids may help (computing power is cheap and people are expensive).
  - Push long-running often passing tests to acceptance test stage.

---
## Summary
The commit stage should be focused on one thing: detecting, **as fast as possible**, the most **common failures** that changes to the system may introduce, and notifying the developers so they can fix the problems quickly.

The commit stage of your deployment pipeline should be run **every time someone introduces a change** into your application's code or configuration.  <!-- .element: class="fragment fade-in-paragraph" -->

The establishment of a commit stage-an automated process, launched on every change, that builds binaries, runs automated tests, and generates metrics-is the **minimum** you can do on the way to your adoption of the practice of **continuous integration**.  <!-- .element: class="fragment fade-in-paragraph" -->
