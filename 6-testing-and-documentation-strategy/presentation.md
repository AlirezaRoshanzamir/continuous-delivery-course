## Continuous Delivery: Testing and [Documentation] Strategy
Test Categories, Test Levels (Types), Test Doubles, <span style="color: blue">Unit-test Coverage Criteria</span>, <span style="color: blue">Effective Unit-testing</span>, <span style="color: blue">TDD</span>, <span style="color: blue">ATDD</span>, <span style="color: blue">BDD</span>, <span style="color: blue">Doctests</span>, <span style="color: blue">SphinX</span>, <span style="color: blue">Auto Documentation</span>

<img src="assets/v-model.png" style="max-width: 550px"/>

<small><strong>Lecturer:</strong> Alireza Roshanzamir</small>

<small><strong>Keywords:</strong> Continuous Delivery, Continuous Integration, DevOps, Build, Test, Release, Deployment, Automation, Version Control, Deployment Pipeline</small>

<small><small> Tir 1402/August 2023</small></small>

---
### Introduction
W. Edwards Deming:
> Cease dependence on mass inspection to achieve quality. Improve the process and build quality into the product in the first place.

Testing is a cross-functional activity that involves the whole team, and should be done continuously from the beginning of the project. Building quality in means writing automated tests at multiple levels (unit, component, and acceptance) and running them as part of the deployment pipeline, which is triggered every time a change is made to our application, its configuration, or the environment and software stack that it runs on. Manual testing is also an essential part of building quality in: Showcases, usability testing, and exploratory testing need to be done continuously throughout the project.

In our ideal project, testers collaborate with developers and users to write automated tests from the start of the project. These tests are written before developers start work on the features that they test. These tests do not just test the functional aspects of the system. Capacity, security, and other nonfunctional requirements are established early on, and automated test suites are written to enforce them.

The design of a testing strategy is primarily a process of identifying and prioritizing project risks and deciding what actions to take to mitigate them.

---
### Types of Tests
In this diagram, Brian Marick categorized tests according to whether they are business-facing or technology-facing, and whether they support the development process or are used to critique the project:

<img src="assets/types-of-tests.webp"/>

------
### Quadrant #1: Business-Facing Tests That Support the Development Process
Commonly known as **functional** or **acceptance tests**. [F/NF] Acceptance testing ensures that the **acceptance criteria** for a story are met. [F/NF] Acceptance tests should be written, and ideally automated, before development starts on a story. Acceptance tests that
concern the functionality of the system are known as functional acceptance tests.

For developers, acceptance tests answer the "How do I know when I am done?" question. For users, it answers the "Did I get
what I wanted?" question. So, in an ideal world, customers or users would write acceptance tests, since they define the success criteria for each requirement.

Using the mordern acceptance test frameworks and DSL, it is possible for users to write the test scripts, while developers and testers work together on the code that implements them.

------
### Quadrant #1: Given-When-Then
For each story or requirement there is a single canonical path through the application in terms of the actions that the user will perform. This is known as the **happy path**. However, any use case will, in all but the simplest of systems, allow for variations in the initial state, the actions to be performed, and the final state of the application. Sometimes, these variations constitute distinct use cases, which are then known as **alternate paths**. In other cases, they should cause error conditions, resulting in what is called **sad paths**.

These are often expressed using the form:
- Given

  A few important characteristics of the state of the system when testing begins
- When

  the user performs some set of actions
- Then
  
  A few important characteristics of the new state of the system


------
### Technology-Facing Tests That Support the Development Process

------
### Business-Facing Tests That Critique the Project

------
### Technology-Facing Tests That Critique the Project
