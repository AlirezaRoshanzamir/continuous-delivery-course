## Continuous Delivery: Testing Strategy
#### <span style="color: purple">Types of Tests</span>, <span style="color: purple">Test Doubles</span>, <span style="color: brown">Test Coverage Criteria</span>, <span style="color: brown">TDD</span>, Real-Life Situations and Strategies, Integration Testing, Process

<img src="assets/v-model.webp" style="max-width: 600px"/>

<small><strong>Time to Read:</strong> 15 Minutes</small>, <small><strong>Time to Present:</strong> 105 Minutes</small>
<br>
<small><strong>Created By:</strong> Alireza Roshanzamir</small>
<br>
<small><strong>Keywords:</strong> Continuous Delivery, Continuous Integration, DevOps, Build, Test, Release, Deployment, Automation, Version Control, Deployment Pipeline</small>
<br><br>
<small style="color: darkred"><small>Press **"F"** to go fullscreen; some slides may not display properly otherwise.</small></small>

---
### Introduction
<img src="assets/quality-meaning-meme.webp" class="fragment start">

W. Edwards Deming:  <!-- .element class="fragment fade-in-with-next custom" -->
> Cease dependence on mass inspection to achieve quality. Improve the process and build quality into the product in the first place.

&shy;<!-- .element class="fragment fade-in" -->Testing is a **cross-functional** activity for **the entire team**, and should be **done continuously** from the **beginning of the project**.

&shy;<!-- .element class="fragment fade-in" -->**Building quality in** means **writing automated tests at multiple levels (unit, component, and acceptance)** and running them as part of the **deployment pipeline**.

&shy;<!-- .element class="fragment fade-in" -->**Manual testing** is also an essential part of building quality in: **Showcases**, **usability testing**, and **exploratory testing** need to be done continuously throughout the project.

&shy;<!-- .element class="fragment fade-in" -->**Testers**, **developers**, and **users** team up to write automated tests right **at the project's beginning**. Ideally, these tests come **before developers create features**. They cover not just **functional** but also **nonfunctional** aspects like capacity and security.

&shy;<!-- .element class="fragment fade-in" -->Designing a testing strategy is about **identifying** and **prioritizing** project **risks** and **choosing actions** to mitigate them.

---
### Types of Tests
Brian Marick categorized tests based on whether they're related to **business or technology**, and if they **aid development or critique the project**:

<img src="assets/types-of-tests.webp" width="600"/>

&shy;<!-- .element: class="fragment fade-in-with-next custom" -->It's also known as **Agile testing quadrants**. You can find more information in the following book:
<table>
  <tr>
    <td><img src="assets/agile-testing-cover-book.webp" width="100"/></td>
    <td>
      Agile Testing: A Practical Guide for Testers and Agile Teams
      <br />
      <small>by Lisa Crispin, Janet Gregory</small>
    </td>
  </tr>
</table>

------
### Quadrant TL: Business-Facing Tests That Support the Development Process
Called **functional** or **acceptance** tests. **F/NF acceptance** testing ensures that the **acceptance criteria** for a **story** are met. Acceptance tests should be written, and **ideally automated**, **before development starts on a story**. Acceptance tests that concern the functionality of the system are known as **functional acceptance tests**.

Acceptance tests answer:  <!-- .element class="fragment fade-in-with-next custom" -->
- For **developers**: **"How do I know when I am done?"**
- For **users**: **"Did I get what I wanted?"**

&shy;<!-- .element class="fragment fade-in" -->Ideally, with modern test frameworks and DSL, **users can write acceptance tests** (as they define the success criteria for each requirement), while **developers and testers work on the implementation**.

&shy;<!-- .element class="fragment fade-in" -->While including **examples**, **prototypes**, and **simulations** in this quadrant is right, they're **not entirely automatic** anymore.

<img src="assets/types-of-tests-qtl.webp" width="500">

------
### Quadrant TL: Given-When-Then
<img src="assets/given-when-then-meme.webp" class="fragment start" width="800">

Each story/requirement has:  <!-- .element class="fragment fade-in-with-next custom" -->
- **Happy Path**: Single **canonical path** through the application in terms of **user actions**.
- **Alternete Paths**:  Different variations in **initial state**, **actions**, and **final state** that create distinct use cases.
- **Sad Paths**: Alternete paths that lead to **error conditions**.

<img src="assets/happy-alternate-sad-path.webp" width="200">

These are often expressed using the form:  <!-- .element class="fragment fade-in-with-next custom" -->
- **Given**: A few important characteristics of the state of the system when testing begins.
- **When**: The user performs some set of actions.
- **Then**: A few important characteristics of the new state of the system.

&shy;<!-- .element class="fragment fade-in" -->**Equivalence partitioning analysis** and **boundary value analysis** reduce cases for **comprehensive but minimal** testing.

&shy;<!-- .element class="fragment fade-in" -->Run acceptance test like it's in **production**: **system**, **environment**, **config**, **state** - even with **mock external services**.

------
### Quadrant TL: Automating Acceptance Tests
<img src="assets/write-vs-maintain-tests-meme.webp" class="fragment start" width="700">

Automated acceptance tests have valuable benefits:
- &shy;<!-- .element class="fragment fade-in-then-semi-out" -->Faster **feedback loop** (developers can run them without testers)
- &shy;<!-- .element class="fragment fade-in-then-semi-out" -->**Workload reduction** on **testers**
- &shy;<!-- .element class="fragment fade-in-then-semi-out" -->**Testers** can focus on **exploratory testing**
- &shy;<!-- .element class="fragment fade-in-then-semi-out" -->Powerful **regression test** (cross-cutting category to quadrant diagram) suite
- &shy;<!-- .element class="fragment fade-in-then-semi-out" -->If they were **human readable**, we have **auto-generated**, **always updated** **requirements** and **documentations**

&shy;<!-- .element class="fragment fade-in" -->Automated acceptance tests can be **costly to maintain**. If done poorly, they can **burden your team**. We mainly cover the **happy path** and **some key parts** to balance costs.

&shy;<!-- .element class="fragment fade-in" -->Achieving **80% regression testing coverage (for each unit, component, and acceptance)** is comprehensive. But relying solely on 60% unit tests and 20% acceptance tests may not be enough.

&shy;<!-- .element class="fragment fade-in" -->A handy guideline is to **automate** after **repeating the same test a couple of times** and being sure **maintenance won't be excessive**.

&shy;<!-- .element class="fragment fade-in" -->Ask periodically: **"Do my acceptance tests break due to real bugs or requirement changes?"**

&shy;<!-- .element class="fragment fade-in" -->Each **story/requirement** needs at least **one automated happy path acceptance test**.

------
### Quadrant BL: Technology-Facing Tests That Support the Development Process
**Two primary** and **two extra** test types fit here:
- <!-- .element class="fragment highlight-current-blue" --> Unit tests
  - Tests a code part **alone** and **isolated**, often using **test doubles** to simulate other parts.
  - These tests should span **almost all code paths** (**minimum 80%**).
  - Written in the **same programming language** as the app.
- <!-- .element class="fragment highlight-current-blue" --> Component (integration) tests
  - Check behavior of a **bigger system part**, such as a **group of classes that provide some service**.
  - Written in the **same programming language** as the app.
- <!-- .element class="fragment highlight-current-blue" --> [System (end-to-end) tests]
  - Usually test **less customer-focused** things, like **"Are database connections committed in the correct order?"**
- <!-- .element class="fragment highlight-current-blue" --> [Deployment tests]
  - Performed when deploying your app to check if the deployment worked.

<img src="assets/types-of-tests-qbl.webp" width="500">

------
### Quadrant TR: Business-Facing Tests That Critique the Project
<img src="assets/do-not-automate-everything-meme.webp" class="fragment start" width="500">

&shy;<!-- .element: class="fragment fade-in-with-next custom" -->Manual tests confirm the app **delivers expected value to users**. It's not only about verifying the app meets specs but also about **validating the accuracy of those specs**:
- <!-- .element class="fragment highlight-current-blue" --> Showcases
  - Agile teams showcase **new functionality** to users at each **iteration's end**.
- <!-- .element class="fragment highlight-current-blue" --> Exploratory testing
  - Testers both **design and perform tests**, using critical thinking to analyze the results. Exploratory testing, a creative learning process, **discover bugs and inspires new automated tests**.
- <!-- .element class="fragment highlight-current-blue" --> Usability testing
  - Check **how easily** users achieve goals in your software. It's the **ultimate test** that your app **brings value to users**. **"Beta release"** or **"Canary Releasing"** can assist in this.
- &shy;<!-- .element class="fragment highlight-current-blue" -->It is correct to put **User Acceptance Testing (UAT)** and **Alpha/Beta Testing** in this quadrant.

<img src="assets/types-of-tests-qtr.webp" width="500">

------
### Quadrant BR: Technology-Facing Tests That Critique the Project
Nonfunctional tests address **system qualities beyond functionality**, like **capacity**, **availability**, and **security**. The line between functional and nonfunctional is **blurry**, as is the idea that these tests are not business-facing. "Nonfunctional requirements" name can be debated; alternatives include **"cross-functional requirements"** or **"system characteristics"**.

&shy;<!-- .element class="fragment fade-in" -->Regardless of the name, **nonfunctional acceptance criteria** should be defined **similarly to functional ones** within your app's requirements.

&shy;<!-- .element class="fragment fade-in" -->These tests can require **significant resources** like unique environments and specialized expertise for setup, and they **often run for a long time**, whether automated or not. Therefore, their implementation tends to be **deferred**.

&shy;<!-- .element class="fragment fade-in" -->We suggest **set up basic nonfunctional tests early** in any project, even if it's simple or inconsequential.

<img src="assets/types-of-tests-qbr.webp" width="500">

---
## Test Doubles
<img src="assets/test-doubles-meme.webp" class="fragment complete-fade-out" width="600">

&shy;<!-- .element: class="fragment fade-in-with-next custom" -->Automated testing often includes **substituting a system part** with a **simulated version** during runtime:
- **Dummy**: Never actually used.
- **Stub**: Provide canned answers.
- **Spy**: Record some information. Some resources, tell that it can also provide canned answers.
- **Mock**: Preprogrammed with expectations and the responses.
- **Fake**: Simulate different test objects through a different implementation (usage of in-memory database for testing).

<img src="assets/test-doubles.webp" width="500" class="fragment fade-in"/>

&shy;<!-- .element class="fragment fade-in" -->[Mocks are not stubs](https://martinfowler.com/articles/mocksArentStubs.html): Stub uses state verification while the mock uses behavior verification.

You can find more information in the following books:  <!-- .element class="fragment fade-in-with-next custom" -->
<table>
  <tr>
    <td><img src="assets/xunit-test-patterns-book-cover.webp" width="70"/></td>
    <td>
      XUnit Test Patterns: Refactoring Test Code
      <br />
      <small>by Gerard Meszaros</small>
    </td>
  </tr>
</table>

<details>
<summary>Note</summary>
Mention the Classical vs Mockist testing and TDD dichotomy.
</details>

---
## Test Coverage Criteria (Criteria-Based Testing)
Test coverage is a **metric** used in software testing to gauge how extensively a software system's **features**, **requirements**, or **code components** are tested by a set of **test cases**. It aims to **provide insight** into testing's **quality**.

&shy;<!-- .element: class="fragment fade-in-with-next custom" -->Start by **creating a model** of the source code or target components for testing. Next, **define coverage criteria** to be met. Then, create thorough **test plans** and **develop tests** aligned with these coverage criteria:

<img src="assets/software-modeling-structures.webp">

------
### Code Coverage Criteria (Code Coverage-Based Testing)
<img src="assets/tests-folder-meme.webp" class="fragment start" width="500">

&shy;<!-- .element: class="fragment fade-in-with-next custom" -->Code coverage-based unit testing is a form of **white-box** testing. It assesses the **portion of executed code by test cases**, aiming for thorough **examination of the software's internal logic and pathways**:

<img src="assets/code-line-coverage.webp">

<details>
  <summary>Note</summary>
  "Code coverage" differs from "test coverage." The former measures how the code is covered by tests, while the latter is a superset of the former, encompassing various entities such as source code, requirements, and use cases, and assessing how they are covered by tests.
</details>

------
### Mutation Testing
<img src="assets/mutation-testing-meme.webp" class="fragment start" width="500">

&shy;<!-- .element: class="fragment fade-in-with-next custom" -->Mutation testing is a software method involving **changing specific statements in the source code**, then evaluating whether the **tests can detect errors**:
<table>
  <tr>
    <td><img src="assets/mutation-based-testing.webp" width="400"></td>
    <td><img src="assets/pitest-sample-report.webp" width="700"></td>
  </tr>
</table>

------
### Property-Based Testing (Hypothesis Testing)
<img src="assets/property-based-testing-meme.webp" class="fragment start" width="500">

&shy;<!-- .element class="fragment fade-in" -->In **typical testing**, you run code and verify the **result matches your expected outcome**. In **property-based testing**, you create tests to **check that the results satisfy certain properties**.

Steps:  <!-- .element class="fragment fade-in-with-next custom" -->
- For all data matching some specification.
- Perform some operations on the data.
- Assert something about the result.

<img src="assets/hypothesis-testing.webp" class="fragment fade-in">

---
## Test-Driven Development (TDD)
Test-driven development (TDD) is a **software programming approach** that interlaces unit testing, programming and refactoring on source code:

<table>
  <tr>
    <td><img src="assets/tdd-loop.webp" width="400"></td>
    <td><img src="assets/green-bar-patterns.webp" width="500"></td>
  </tr>
</table>

You can find more information in the following books:  <!-- .element class="fragment fade-in-with-next custom" -->
<table>
  <tr>
    <td><img src="assets/tdd-book-cover.webp" width="70"/></td>
    <td>
      Test Driven Development by Example
      <br />
      <small>by Kent Beck</small>
    </td>
  </tr>
</table>

---
## Real-Life Situations and Strategies
Typical scenarios faced by teams deciding for test automation:

- New Projects
- Midproject
- Legacy Systems

------
### Real-Life Situations and Strategies: New Projects
<img src="assets/new-project-friends-meme.webp" class="fragment complete-fade-out" width="600">

&shy;<!-- .element class="fragment fade-in" -->In this case, the key is to begin writing automated acceptance tests right **from the start**.

To achieve this, you'll need:  <!-- .element class="fragment fade-in-with-next custom" -->
- &shy;<!-- .element class="fragment highlight-current-blue" -->Choose a **technology platform** and **testing tools**.
- &shy;<!-- .element class="fragment highlight-current-blue" -->Set up a **simple**, **automated build**.
- &shy;<!-- .element class="fragment highlight-current-blue" -->Work out **stories** and **acceptance criteria** that follow the **INVEST** principles (**Independent**, **Negotiable**, **Valuable**, **Estimable**, **Small**, and **Testable**).

You can then implement a strict process:  <!-- .element class="fragment fade-in-with-next custom" -->
- &shy;<!-- .element class="fragment highlight-current-blue" -->**Customers**, **analysts**, and **testers** define **acceptance criteria**. 
- &shy;<!-- .element class="fragment highlight-current-blue" -->**Testers work with developers** to **automate acceptance tests** based on the acceptance criteria. 
- &shy;<!-- .element class="fragment highlight-current-blue" -->**Developers code behavior** to fulfill the acceptance criteria. 
- &shy;<!-- .element class="fragment highlight-current-blue" -->If **any automated tests fail** (whether unit, component, or acceptance tests), developers **make it a priority to fix** them. 

------
### Real-Life Situations and Strategies: Midproject
To introduce automated testing effectively, start with the **most common**, **important**, and **high-value** **use cases** of the app. From customer discussions, **automate happy path tests** covering these high-value scenarios.

&shy;<!-- .element class="fragment fade-in" -->Automating only the happy path means you'll **need more manual testing** to ensure full functionality. When you find yourself testing the same function **manually multiple times**, assess if the functionality **won't likely change** and consider **automating the test**.

&shy;<!-- .element class="fragment fade-in" -->Once you **spot a bug**, write a **test that captures it**, and then **proceed to fix it**.

------
### Real-Life Situations and Strategies: Legacy Systems
A legacy system is an **old** or **outdated** system, technology, or software application that an organization **still uses**.

&shy;<!-- .element class="fragment fade-in" -->If it doesn't exist, create an **automated build process** and build an **automated functional test framework around it**. **Test the code that you change** and gradually include **new tests for added behavior**. These serve as your **legacy system's smoke tests**.

&shy;<!-- .element class="fragment fade-in" -->Legacy systems often suffer from **unmodular**, **poorly structured**, and **hard-to-test** code.

&shy;<!-- .element class="fragment fade-in" -->If you have **time**, you can test the **alternate paths** of the story.

&shy;<!-- .element class="fragment fade-in" -->Remember to focus on writing automated tests where they **add value**.

------
### Integration Testing
**Integration testing** and **component testing** can be **blurred** (due to overloaded integration testing term). In our literature, integration tests confirm **each app part works well with its dependent services**.

&shy;<!-- .element class="fragment fade-in" -->Test harnesses complexity depends on whether the **doubled-up service retains state**. If the external system **remembers state**, harness behavior changes **based on sent requests**. Here, **black box tests are highly valuable**. Cover all **potential responses**, each with **its own test**. The **mock external system** should **identify requests** and provide the **suitable response** or an **exception for unexpected ones**.

<img src="assets/integration-testing.webp">

---
## Process
Have a session with all **stakeholders** at each iteration's start. Gather **customers**, **analysts**, and **testers** for **highest-priority test scenarios**. Tools like Cucumber, JBehave, Concordion, and Twist let you write **acceptance criteria in natural language** and code them. Refactoring test code updates the test specifications too.

&shy;<!-- .element class="fragment fade-in" -->Use a **domain-specific language (DSL)** for testing. This enables **entering acceptance criteria in the DSL**. Initially, ask customers for **basic acceptance tests covering happy paths**. Later, **after the meeting**, additional data sets can be added to **enhance test coverage**.

&shy;<!-- .element class="fragment fade-in" -->These acceptance tests, along with short descriptions, serve as the **starting point for developers** tackling the stories. **Testers and developers should collaborate** early on to review the acceptance tests **prior to development**. This offers developers an **overview of the story** and insight into **important scenarios**.

&shy;<!-- .element class="fragment fade-in" -->**Tight cooperation between developers and testers** during story development is crucial for a smooth path to release.

------
### Managing Defect Backlogs
Two main approaches:
- &shy;<!-- .element class="fragment highlight-current-blue" -->Having **zero defects**: Whenever a bug is found, it is **immediately fixed**.
- &shy;<!-- .element class="fragment highlight-current-blue" -->Handle defects **like features**: **Prioritize** them **compared to features**. Consider **"critical"**, **"blockers"**, **"medium"**, or **"low"** categories.

<img src="assets/hide-defects-memes.webp" class="fragment fade-in" width="600">

---
## Summary
<img src="assets/quality-responsiblity-meme.webp" class="fragment start" style="border: 1px solid lightgray">

&shy;<!-- .element class="fragment fade-in" -->For high-quality software, **everyone in the project** must share testing duties from the start till the end.

&shy;<!-- .element class="fragment fade-in" -->The **shortest feedback loops** come from **automated tests run on every change**. These tests span all levels, **from unit to acceptance** (both functional and nonfunctional).

&shy;<!-- .element class="fragment fade-in" -->Combine automated tests with **manual methods** like **exploratory testing** and **showcases**.
