## Continuous Delivery: Testing Strategy
#### Test Categories, Test Levels (Types), Test Doubles, <span style="color: blue">Test Coverage Criteria</span>, <span style="color: blue">TDD</span>

<img src="assets/v-model.png" style="max-width: 550px"/>

<small><strong>Created By:</strong> Alireza Roshanzamir</small>

<small><strong>Keywords:</strong> Continuous Delivery, Continuous Integration, DevOps, Build, Test, Release, Deployment, Automation, Version Control, Deployment Pipeline</small>

<small><small> Tir 1402/August 2023</small></small>

---
### Introduction
W. Edwards Deming:
> Cease dependence on mass inspection to achieve quality. Improve the process and build quality into the product in the first place.

Testing is a **cross-functional** activity that **involves the whole team**, and should be **done continuously** from the **beginning of the project**. Building quality in means **writing automated tests at multiple levels (unit, component, and acceptance)** and **running them as part of the deployment pipeline**, which is triggered every time a change is made to our application, its configuration, or the environment and software stack that it runs on. Manual testing is also an essential part of building quality in: **Showcases**, **usability testing**, and **exploratory testing** need to be done continuously throughout the project.  <!-- .element class="fragment fade-in-paragraph" -->

In our ideal project, testers collaborate with developers and users to write **automated tests from the start of the project**. These tests are written **before developers start work** on the features that they test. These tests do not just test the functional aspects of the system. **Capacity, security, and other nonfunctional requirements** are established early on, and automated test suites are written to enforce them.  <!-- .element class="fragment fade-in-paragraph" -->

The design of a testing strategy is primarily a process of identifying and prioritizing project risks and deciding what actions to take to mitigate them.  <!-- .element class="fragment fade-in-paragraph" -->

---
### Types of Tests
In this diagram, Brian Marick categorized tests according to whether they are **business-facing** or **technology-facing**, and whether they **support the development process** or are **used to critique the project**:

<img src="assets/types-of-tests.webp" width="600"/>

It is also called Agile testing quadrants.

You can find more information in the following book:  <!-- .element class="fragment fade-in-with-next" -->
<table>
  <tr>
    <td><img src="assets/agile-testing-cover-book.png" width="80"/></td>
    <td>
      Agile Testing: A Practical Guide for Testers and Agile Teams
      <br />
      <small>by Lisa Crispin, Janet Gregory</small>
    </td>
  </tr>
</table>

------
### Quadrant TL: Business-Facing Tests That Support the Development Process
Commonly known as **functional** or **acceptance** tests. [F/NF] Acceptance testing ensures that the **acceptance criteria** for a story are met. [F/NF] Acceptance tests should be written, and ideally automated, before development starts on a story. Acceptance tests that concern the functionality of the system are known as functional acceptance tests.

For developers, acceptance tests answer the **"How do I know when I am done?"** question. For users, it answers the **"Did I get what I wanted?"** question. So, in an ideal world, customers or users would write acceptance tests, since they define the success criteria for each requirement.  <!-- .element class="fragment fade-in-paragraph" -->

Using the mordern acceptance test frameworks and DSL, **it is possible for users to write the test scripts**, while developers and testers work together on the code that implements them.  <!-- .element class="fragment fade-in-paragraph" -->

Although it is correct to include **examples**, **prototypes**, and **simulations** in this quadrant, they are no longer fully automatic.  <!-- .element class="fragment fade-in-paragraph" -->

<img src="assets/types-of-tests-qtl.png" width="500">

------
### Quadrant TL: Given-When-Then
For each story or requirement there is a single canonical path through the application in terms of the actions that the user will perform. This is known as the **happy path**. However, any use case will, in all but the simplest of systems, allow for variations in the **initial state**, the **actions to be performed**, and the **final state** of the application. Sometimes, these variations constitute distinct use cases, which are then known as **alternate paths**. In other cases, they should cause error conditions, resulting in what is called **sad paths**. **Equivalence partitioning analysis** and **boundary value analysis** will reduce these combinations to a smaller set of cases that will completely test the requirement in question.

<img src="assets/happy-alternate-sad-path.png" width="200" class="fragment fade-in">

These are often expressed using the form:  <!-- .element class="fragment fade-in-with-next" -->
- **Given**: A few important characteristics of the state of the system when testing begins
- **When**: The user performs some set of actions
- **Then**: A few important characteristics of the new state of the system

Acceptance tests should be run when your system is in a **production-like mode**. Manual acceptance testing is typically done by putting an application in a user acceptance testing (UAT) environment which is as similar as possible to production both in configuration and in terms of the state of the application-although it might use mock versions of any external services.  <!-- .element class="fragment fade-in-paragraph" -->

------
### Quadrant TL: Automating Acceptance Tests
Automated acceptance tests have a number of valuable properties:
- Faster feedback loop (developers can run them without testers)  <!-- .element class="fragment fade-in" -->
- Workload reduction on testers  <!-- .element class="fragment fade-in" -->
- Testers can concentrate on exploratory testing  <!-- .element class="fragment fade-in" -->
- Powerful regression test (cross-cutting category to quadrant diagram) suite  <!-- .element class="fragment fade-in" -->
- If they were human readable, we have auto-generated, always updated requirements and documentations  <!-- .element class="fragment fade-in" -->

Automated acceptance tests can be **costly to maintain**. Done badly, they can inflict a significant cost on your delivery team. In general, we tend to limit our automated acceptance testing to **complete coverage of happy path** behaviors and only **limited coverage of the most important other parts**.  <!-- .element class="fragment fade-in-paragraph" -->

You can gain **80% coverage** with **60% unit** test coverage and **20% acceptance test** coverage.  <!-- .element class="fragment fade-in-paragraph" -->

A good rule of thumb is to **automate once you have repeated the same test a couple of times**, and when you are confident that you won't end up spending a lot of time maintaining the test.  <!-- .element class="fragment fade-in-paragraph" -->

A good question to ask yourself every now and again is, **"How often do my acceptance tests break due to real bugs, and how often due to changes in requirements?"**  <!-- .element class="fragment fade-in-paragraph" -->

Every story or requirement should have **at least one automated happy path acceptance test**.  <!-- .element class="fragment fade-in-paragraph" -->

------
### Quadrant BL: Technology-Facing Tests That Support the Development Process
There are two main and two optional kinds of tests that fall into this category:
- <!-- .element class="fragment highlight-current-blue" --> Unit tests
  - A particular piece of the code in isolation. For this reason, they often rely on simulating other parts of the system using test doubles.
  - These tests should also cover virtually every code-path in the system (a bare minimum of 80%).
  - Written in the same programming language as the application.
- <!-- .element class="fragment highlight-current-blue" --> Component (integration) tests
  - Verify the behavior of a larger part of the system, such as a group of classes that provide some service.
  - Written in the same programming language as the application.
- <!-- .element class="fragment highlight-current-blue" --> [System (end-to-end) tests]
  - Usually test things that the customer doesn't really care about, things like "Are database connections committed in the correct order".
- <!-- .element class="fragment highlight-current-blue" --> [Deployment tests]
  - Performed whenever you deploy your application. They check that the deployment worked.

<img src="assets/types-of-tests-qbl.png" width="400">

------
### Quadrant TR: Business-Facing Tests That Critique the Project
<img src="assets/do-not-automate-everything-meme.webp" class="fragment start" width="500">

These manual tests verify that the application will in fact deliver to the users the value they are expecting. This is not just a matter of verifying that the application meets its specifications; it is also about **checking that the specifications are correct**:  <!-- .element class="fragment fade-in-parent-with-next" -->
- <!-- .element class="fragment highlight-current-blue" --> Showcases
  - Agile teams perform showcases to users at the end of every iteration to demonstrate the new functionality that they have delivered.
- <!-- .element class="fragment highlight-current-blue" --> Exploratory testing
  - The tester simultaneously designs and performs tests, using critical thinking to analyze the results. Exploratory testing is a creative learning process that will not only discover bugs, but also lead to the creation of new sets of automated tests.
- <!-- .element class="fragment highlight-current-blue" --> Usability testing
  - Usability testing is done to discover how easy it is for users to accomplish their goals with your software. Usability testing is therefore the ultimate test that your application is actually going to deliver value to users (here, "Beta release" or "Canary Releasing" may help).
- <!-- .element class="fragment highlight-current-blue" -->  It is correct to put User Acceptance Testing (UAT) and Alpba\Beta Testing in this quadrant.

<img src="assets/types-of-tests-qtr.png" width="400">

------
### Quadrant BR: Technology-Facing Tests That Critique the Project
By nonfunctional tests, we mean all the **qualities of a system other than its functionality**, such as **capacity**, **availability**, **security**, and so forth. The distinction between functional and nonfunctional testing is in some ways bogus, as is the idea that these tests are not business-facing. Many people believe that "nonfunctional requirements" is a bad name, with alternatives suggested such as **cross-functional requirements** or **system characteristics**.

Whatever you call them, **nonfunctional acceptance criteria** should be specified as part of your application's requirements in **exactly the same way as functional acceptance criteria**.  <!-- .element class="fragment fade-in-paragraph" -->

These tests often require considerable resources such as special environments to run on and specialized knowledge to set up and implement, and they often take a long time to run (whether or not they are automated). Therefore, their implementation tends to be **deferred**.  <!-- .element class="fragment fade-in-paragraph" -->

We recommend that you **set up at least some basic nonfunctional tests towards the start** of any project, no matter how simple or inconsequential.  <!-- .element class="fragment fade-in-paragraph" -->

<img src="assets/types-of-tests-qbr.png" width="450">

---
## Test Doubles
<img src="assets/test-doubles-meme.png" class="fragment complete-fade-out" width="600">

A key part of automated testing involves replacing part of a system at run time with a simulated version:  <!-- .element class="fragment fade-in-with-next" -->
- **Dummy**: Never actually used.
- **Stub**: Provide canned answers.
- **Spy**: Record some information. Some resources, tell that it can also provide canned answers.
- **Mock**: Preprogrammed with expectations and the responses.
- **Fake**: Simulate different test objects through a different implementation (usage of in-memory database for testing).
<img src="assets/test-doubles.png"/>

[Mocks are not stubs](https://martinfowler.com/articles/mocksArentStubs.html). Stub uses state verification while the mock uses behavior verification.  <!-- .element class="fragment fade-in-paragraph" -->

You can find more information in the following books:  <!-- .element class="fragment fade-in-with-next" -->
<table>
  <tr>
    <td><img src="assets/xunit-test-patterns-book-cover.png" width="100"/></td>
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
Test coverage is a **metric** used in software testing to quantify the degree to which a software system's **features**, **requirements**, or **code components** are **exercised by a set of test cases**. It aims to **provide insight** into the **quality** and thoroughness of testing by assessing the extent to which different aspects of the software have been validated.

Begin by **creating a model** of the source code or the specific components you intend to test. Afterward, **establish coverage criteria** that need to be met. Subsequently, **formulate comprehensive test plans** and **develop tests** that align with these coverage criteria:

<img src="assets/software-modeling-structures.png">

------
### Code Coverage Criteria (Code Coverage-Based Testing)
Code coverage-based unit-testing is a kind of **white-box** testing which assesses the proportion of code that is executed by the test cases, aiming to ensure comprehensive testing of the software's internal logic and pathways:

<img src="assets/code-line-coverage.png">

<details>
  <summary>Note:</summary>
  "Code coverage" differs from "test coverage." The former measures how the code is covered by tests, while the latter is a superset of the former, encompassing various entities such as source code, requirements, and use cases, and assessing how they are covered by tests.
</details>

------
### Mutation Testing
Mutation testing is a kind of software that includes **mutating** or **changing** of the **particular statements in the source code** and assesses that whether the **tests can identify the errors or not**:

<table>
  <tr>
    <td><img src="assets/mutation-based-testing.png" width="400"></td>
    <td><img src="assets/pitest-sample-report.webp" width="700"></td>
  </tr>
</table>

------
### Property-Based Testing (Hypothesis Testing)
In normal testing, you run your code and then check if the **result you got matches the reference result you expected**. However, in property-based testing, you write tests that **check that the results satisfy certain properties**:
- For all data matching some specification.
- Perform some operations on the data.
- Assert something about the result.

<img src="assets/hypothesis-testing.png">

---
## Test-Driven Development (TDD)
Test-driven development (TDD), is a method of implementing software programming that interlaces unit testing, programming and refactoring on source code:

<table>
  <tr>
    <td><img src="assets/tdd-loop.png" width="400"></td>
    <td><img src="assets/green-bar-patterns.webp" width="500"></td>
  </tr>
</table>

You can find more information in the following books:  <!-- .element class="fragment fade-in-with-next" -->
<table>
  <tr>
    <td><img src="assets/tdd-book-cover.png" width="70"/></td>
    <td>
      Test Driven Development by Example
      <br />
      <small>by Kent Beck</small>
    </td>
  </tr>
</table>

---
## Real-Life Situations and Strategies
Typical scenarios faced by teams who have decided to automate their tests:

- New Projects
- Midproject
- Legacy Systems

------
### Real-Life Situations and Strategies: New Projects
<img src="assets/new-project-friends-meme.jpeg" class="fragment complete-fade-out" width="600">

In this situation, the important thing is to start writing automated acceptance tests from the **very beginning**.  <!-- .element class="fragment fade-in-paragraph" -->

In order to do this, you'll need:  <!-- .element class="fragment fade-in-with-next" -->
- Choose a technology platform and testing tools.  <!-- .element class="fragment highlight-current-blue" -->
- Set up a simple, automated build.  <!-- .element class="fragment highlight-current-blue" -->
- Work out stories that follow the INVEST principles (they should be Independent Negotiable, Valuable, Estimable, Small, and Testable), with acceptance criteria.  <!-- .element class="fragment highlight-current-blue" -->

You can then implement a strict process:  <!-- .element class="fragment fade-in-with-next" -->
 - Customers, analysts, and testers define acceptance criteria.  <!-- .element class="fragment highlight-current-blue" -->
 - Testers work with developers to automate acceptance tests based on the acceptance criteria.  <!-- .element class="fragment highlight-current-blue" -->
 - Developers code behavior to fulfill the acceptance criteria.  <!-- .element class="fragment highlight-current-blue" -->
 - If any automated tests fail (whether unit, component, or acceptance tests), developers make it a priority to fix them.  <!-- .element class="fragment highlight-current-blue" -->

------
### Real-Life Situations and Strategies: Midproject
The best way to introduce automated testing is to begin with the **most common**, **important**, and **high-value** **use cases** of the application. Based on the conversations you made with customer, you should **automate happy path tests** that cover these high-value scenarios.

Since you are only automating the happy path, you will have to perform a correspondingly larger amount of manual testing to ensure that you system is working fully as it should. The **moment you discover you are testing the same function manually more than a couple of times**, check and see if that functionality **is not likely to change**, **automate the test**.  <!-- .element class="fragment fade-in-paragraph" -->

After **identifying each bug**, write a **test that captures it**, and then proceed to fix it.  <!-- .element class="fragment fade-in-paragraph" -->

------
### Real-Life Situations and Strategies: Legacy Systems
A legacy system is an **old** or **out-of-date** system, technology or software application that **continues to be used** by an organization.

Create an **automated build process** if one doesn't exist, and then create an **automated functional test scaffolding around it**. **Test the code that you change**. You will be adding new tests incrementally later for the new behavior that you add. These are essentially smoke tests for your legacy system.  <!-- .element class="fragment fade-in-paragraph" -->

A particular problem of legacy systems is that the code is often **not too modular and well structured and testable**.  <!-- .element class="fragment fade-in-paragraph" -->

If you have time, you can test the alternate paths of the story.  <!-- .element class="fragment fade-in-paragraph" -->

It is important to remember that you should **only write automated tests where they will deliver value**.  <!-- .element class="fragment fade-in-paragraph" -->

------
### Integration Testing
The line between **integration testing** and **component testing** is **blurry** (not least because integration testing is a somewhat overloaded term). We use the term integration testing to refer to tests which **ensure that each independent part of your application works correctly with the services it depends on**.

Test harnesses can be quite sophisticated, depending, in particular, on whether the service it doubles up for remembers state or not. If the external system remembers state, your harness will behave differently according to the requests that you send. The highest-value tests that you can write in this situation are black box tests, in which you consider all the possible responses your external system can give and write a test for each of these responses. Your mock external system needs some way of identifying your request and sending back the appropriate response, or an exception if it gets a request it's not expecting.  <!-- .element class="fragment fade-in-paragraph" -->

---
## Process
Have a single meeting with all of the **stakeholders** at the beginning of each iteration. We get **customers**, **analysts**, and **testers** in a room together and **come up with the highest-priority scenarios to test**. Tools like Cucumber, JBehave, Concordion, and Twist allow you to write acceptance criteria down in natural language in a text editor and then write code to make these tests executable. Refactorings to the test code also update the test specifications.  <!-- .element class="fragment fade-in-paragraph" -->

Use a **domain-specific language (DSL)** for testing. This allows **acceptance criteria to be entered in the DSL**. As a minimum, we will ask the customers to write the simplest possible acceptance tests covering the happy paths of these scenarios there and then. Later, after this meeting, people will often add more sets of data to use to improve the coverage of the tests.  <!-- .element class="fragment fade-in-paragraph" -->

These acceptance tests, and the short descriptions of their objectives, then become the **starting point for developers** working on the stories concerned. **Testers and developers should get together** as early as possible to discuss the acceptance tests before starting development. This allows developers to get a good overview of the story and understand what the most important scenarios are.  <!-- .element class="fragment fade-in-paragraph" -->

**Close collaboration between developers and testers** throughout the development of a story is essential to a smooth path to the release.  <!-- .element class="fragment fade-in-paragraph" -->

------
### Managing Defect Backlogs
Two main approaches:
- Having zero defects: Whenever a bug is found, it is immediately fixed.  <!-- .element class="fragment highlight-current-blue" -->
- Treat defects the same way as features: Prioritizing the relative importance of a particular bug against the features. Classifying bugs as "critical", "blockers", "medium", and "low" priority helps.  <!-- .element class="fragment highlight-current-blue" -->

<img src="assets/hide-defects-memes.jpg" class="fragment fade-in-paragraph" width="600">

---
## Summary
High-quality software is only possible if testing becomes the responsibility of everybody involved in delivering software and is practiced right from the beginning of the project and throughout its life.  <!-- .element class="fragment fade-in-paragraph" -->

The **shortest feedback loops** are created through **sets of automated tests that are run upon every change to the system**. Such tests should run at all levels-from unit tests up to acceptance tests (both functional and nonfunctional). Automated tests should be supplemented with manual testing such as exploratory testing and showcases.  <!-- .element class="fragment fade-in-paragraph" -->
