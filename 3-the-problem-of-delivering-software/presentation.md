## Continuous Delivery: The Problem of Delivering Software
#### Release Antipatterns, Goals, Criterias, Benefits, Release Candidate, Principles

<img src="assets/wall-of-confusion.png" style="max-width: 550px"/>

<small><strong>Lecturer:</strong> Alireza Roshanzamir</small>

<small><strong>Keywords:</strong> Continuous Delivery, Continuous Integration, DevOps, Build, Test, Release, Deployment, Automation, Version Control, Deployment Pipeline</small>

<small><small>Tir 1402/August 2023</small></small>

---
## Release Antipatterns
The day of a software release tends to be tense due to certain antipatterns:
- Manual Software Deployment
- Delayed Production-like Deployment
- Manual Production Environment Configuration Management

<table>
  <tr>
    <td><img src="assets/antipattern.png" width="500"></td>
    <td><img src="assets/emontional-cycle-of-manual-delivery.png" width="600"></td>
  </tr>
</table>

------
### Release Antipatterns: Manual Software Deployment
Symptoms:
- Relying on detailed documentation for intricate step-by-step instructions and potential pitfalls  <!-- .element: class="fragment fade-in-then-semi-out" -->
- Conducting manual tests to verify proper application functionality  <!-- .element: class="fragment fade-in-then-semi-out" -->
- Frequently requiring communication with the development team  <!-- .element: class="fragment fade-in-then-semi-out" -->
- Making frequent adjustments to the release process  <!-- .element: class="fragment fade-in-then-semi-out" -->
- Managing environments within a cluster that possess varying configurations  <!-- .element: class="fragment fade-in-then-semi-out" -->
- Dealing with releases taking more than a few minutes  <!-- .element: class="fragment fade-in-then-semi-out" -->
- Facing unpredictable release outcomes, often leading to rollbacks  <!-- .element: class="fragment fade-in-then-semi-out" -->
- Finding oneself fatigued and staring at a screen at 2 A.M.  <!-- .element: class="fragment fade-in-then-semi-out" -->

Hence, a shift towards full automation in deployments is advisable.  <!-- .element: class="fragment fade-in" -->

------
### Release Antipatterns: Manual Software Deployment
Symptoms:
- Software is initially deployed to a production-like environment (e.g., staging) once most development is finished  <!-- .element: class="fragment fade-in-then-semi-out" -->
- Releasing into staging is the first time that operations people interact with the new release.  <!-- .element: class="fragment fade-in-then-semi-out" -->
- Either a production-like environment is expensive enough that access to it is strictly controlled, or it is not in place on time, or nobody bothered to create one.  <!-- .element: class="fragment fade-in-then-semi-out" -->
- The development team assembles installers, configuration files, database migrations, and deployment guidelines for deployment personnel-untested in a production or staging setting.  <!-- .element: class="fragment fade-in-then-semi-out" -->
- There is little if any, collaboration between the development team and the people who perform deployments to create this collateral.  <!-- .element: class="fragment fade-in-then-semi-out" -->
- Thinking it's all about the DevOps team  <!-- .element: class="fragment fade-in-then-semi-out" -->

Therefore, the solution involves integrating testing, deployment, and release tasks into the development workflow. These tasks become routine and continuous during development, reducing risks during eventual production release. This approach entails rehearsing the release across multiple increasingly production-like test environments on numerous occasions.  <!-- .element: class="fragment fade-in" -->

------
### Release Antipatterns: Manual Production Environment Configuration Management
Symptoms:
- Adjustments like altering database connection settings or increasing thread count on an app server are managed manually for production environments.  <!-- .element: class="fragment fade-in-then-semi-out" -->
- Despite successful staging deployments, production deployment encounters failures.  <!-- .element: class="fragment fade-in-then-semi-out" -->
- The operations team spends significant time setting up the release environment.  <!-- .element: class="fragment fade-in-then-semi-out" -->
- Reverting to previous system configurations (OS, app server, web server, RDBMS, etc.) becomes unfeasible.  <!-- .element: class="fragment fade-in-then-semi-out" -->
- Clustered servers unintentionally run diverse OS versions, third-party infrastructure, libraries, or patches.  <!-- .element: class="fragment fade-in-then-semi-out" -->
- System configuration involves direct modifications to production systems.  <!-- .element: class="fragment fade-in-then-semi-out" -->
- Discrepancies in environment configurations across testing, staging, and production.  <!-- .element: class="fragment fade-in-then-semi-out" -->

Hence, all aspects of testing, staging, and production environments, especially configurations of third-party components, should be automatically applied from version control.  <!-- .element: class="fragment fade-in" -->

---
## Goals
Our goal is to describe the use of **deployment pipelines**, combined with **high levels of automation** of both **testing** and **deployment** and **comprehensive configuration management** to deliver **push-button software releases**.

<img src="assets/push-button-to-ship.webp" width="800"/>

---
## Refined Goal
We want to find ways to deliver **high-quality**, **valuable** software in an **efficient**, **fast**, and **reliable** manner by making releases:

- **Automated**
  - Not automated -> Not repeatable  <!-- .element class="fragment highlight-current-blue" -->
  - Not automated -> Error prone  <!-- .element class="fragment highlight-current-blue" -->
  - Not automated -> No review -> No quality  <!-- .element class="fragment highlight-current-blue" -->
- **Frequent**
  - Not frequent -> High difference -> High risk -> Hard roll back  <!-- .element class="fragment highlight-current-blue" -->
  - Not frequent -> Slower feedback  <!-- .element class="fragment highlight-current-blue" -->

---
## Criterias
- Every Change Should Trigger the Feedback Process  <!-- .element: class="fragment insides-fade-in-then-out" -->
  - Changing components: executable code, configuration, host environment, and data  <!-- .element: class="fragment fade-in-then-semi-out" -->
  - Feeback process: testing every change in a fully auto-mated fashion, as far as possible. Usually, code syntax check, unit-tests, quality metrics criterias such as test coverage, functional acceptance tests, non-functional tests (such as capacity, availability, security, etc.), exploratory tests.  <!-- .element: class="fragment fade-in-then-semi-out" -->
- The Feedback Must Be Received as Soon as Possible  <!-- .element: class="fragment insides-fade-in-then-out" -->
  - Free people to do the interesting work and leave repetition to machines  <!-- .element: class="fragment fade-in-then-semi-out" -->
  - Commit stage of pipeline: fast, comprehensive (at least 75% of codebase), check only critical faults (not UI color), environment-neutral.  <!-- .element: class="fragment fade-in-then-semi-out" -->
  - Other stages of pipeline: flow and more parallel, some of them may fail, run on production like environment, test deployment process  <!-- .element: class="fragment fade-in-then-semi-out" -->
- Every Change Should Trigger the Feedback Process  <!-- .element: class="fragment insides-fade-in-then-out" -->
  - Changing components: executable code, configuration, host environment, and data  <!-- .element: class="fragment fade-in-then-semi-out" -->
  - Feedback process: testing every change in a fully auto-mated fashion, as far as possible. Usually, code syntax check, unit-tests, quality metrics criterias such as test coverage, functional acceptance tests, non-functional tests (such as capacity, availability, security, etc.), exploratory tests.  <!-- .element: class="fragment fade-in-then-semi-out" -->
- Every Change Should Trigger the Feedback Process  <!-- .element: class="fragment insides-fade-in-then-out" -->
  - Changing components: executable code, configuration, host environment, and data  <!-- .element: class="fragment fade-in-then-semi-out" -->
  - Feeback process: testing every change in a fully auto-mated fashion, as far as possible. Usually, code syntax check, unit-tests, quality metrics criterias such as test coverage, functional acceptance tests, non-functional tests (such as capacity, availability, security, etc.), exploratory tests.  <!-- .element: class="fragment fade-in-then-semi-out" -->
- The Feedback Must Be Received as Soon as Possible  <!-- .element: class="fragment insides-fade-in-then-out" -->
  - Free people to do the interesting work and leave repetition to machines  <!-- .element: class="fragment fade-in-then-semi-out" -->
  - Commit stage of pipeline: fast, comprehensive (at least 75% of codebase), check only critical faults (not UI color), environment-neutral.  <!-- .element: class="fragment fade-in-then-semi-out" -->
  - Other stages of pipeline: flow and more parallel, some of them may fail, run on production like environment, test deployment process  <!-- .element: class="fragment fade-in-then-semi-out" -->
- The Delivery Team Must Receive Feedback and Then Act on It  <!-- .element: class="fragment insides-fade-in-then-out" -->
  - Everybody involved in the process of delivering software is involved in the feedback process: developers, testers, operations staff, database administrators, infrastructure specialists, and managers.  <!-- .element: class="fragment fade-in-then-semi-out" -->
  - React to feedback means broadcasting information: big, visible dashboards (which need not be electronic) and other notification mechanisms is central to ensuring that feedback is, indeed, fed-back and makes the final step into someone's head.  <!-- .element: class="fragment fade-in-then-semi-out" -->
  - It is the responsibility of the whole team to stop what they are doing and decide on a course of action.  <!-- .element: class="fragment fade-in-then-semi-out" -->

------
### Does This Process Scale?

<img src="assets/here-we-go-again.jpg">  <!-- .element: class="fragment complete-fade-out" -->

<p class="fragment fade-in">
  The techniques and principles that we describe have been <strong>proven in real projects</strong> in all kinds of organizations, both <strong>large</strong> and <strong>small</strong> in all kinds of situations. Much inspired by the philosophy and ideas of the <strong>lean movement</strong> which have been applied to <strong>huge organizations</strong> and <strong>even whole economies</strong>.
  <br>
  <img src="assets/it-works.jpeg" width="400">
</p>

---
## Benefits
<img src="assets/rubbing-hands-meme.webp" class="fragment complete-fade-out" width="500">

Repeatable, reliable, and predictable release process which in turn generates large reductions in cycle time, and hence gets features and bugfixes to users fast. Other benefits include:  <!-- .element: class="fragment fade-in" -->
- Empowering Teams  <!-- .element: class="fragment insides-fade-in-then-out" -->
  - Pull system: Allowing testers, operations or support personnel to self-service the version of the application they want into the environment of their choice. Often getting a good build requires endless emails being sent, tickets being raised.  <!-- .element: class="fragment fade-in-then-semi-out" -->
  - Testers can select older versions of an application to verify changes in behavior in newer versions.  <!-- .element: class="fragment fade-in-then-semi-out" -->
  - Support staff can deploy a released version of the application into an environment to reproduce a defect.  <!-- .element: class="fragment fade-in-then-semi-out" -->
  - Operations staff can select a known good build to deploy to production as part of a disaster recovery exercise.  <!-- .element: class="fragment fade-in-then-semi-out" -->
- Reducing Errors  <!-- .element: class="fragment insides-fade-in-then-out" -->
  - By managing everything that can change in version control, we allow computers to do what they are good at.  <!-- .element: class="fragment fade-in-then-semi-out" -->
  - Which configuration differences matter and which do not is not something that you want to discover by accident during your busiest trading period.  <!-- .element: class="fragment fade-in-then-semi-out" -->
- Lowering Stress  <!-- .element: class="fragment insides-fade-in-then-out" -->
  - Most people who have ever come anywhere near a software project that is approaching its release date will be aware that these are indeed stressful events.  <!-- .element: class="fragment fade-in-then-semi-out" -->
  - The key to reducing stress is to have the kind of automated deployment process that we have described, to perform it frequently, and to have a good story when it comes to your ability to back changes out should the worst happen.  <!-- .element: class="fragment fade-in-then-semi-out" -->
- Deployment Flexibility  <!-- .element: class="fragment insides-fade-in-then-out" -->
  - It should be a simple task to start your application in a new environment.  <!-- .element: class="fragment fade-in-then-semi-out" -->
  - Be able to use your automated deployment process to prepare the new environment for deployment and deploy the chosen version of your application to it.  <!-- .element: class="fragment fade-in-then-semi-out" -->
  - Be able to running enterprise software on a laptop.  <!-- .element: class="fragment fade-in-then-semi-out" -->
- Practice Makes Perfect  <!-- .element: class="fragment insides-fade-in-then-out" -->
  - There should not be a special QA deployment strategy, or a special acceptance test, or production deployment strategy.  <!-- .element: class="fragment fade-in-then-semi-out" -->
  - Use the same deployment approach whatever the deployment target (as much as possible for developer workstations).  <!-- .element: class="fragment fade-in-then-semi-out" -->

<img src="assets/cd-benefits.png" width="370">

---
## Release Candidate
Every merge to mainline is a "release candidate".
- Every Check-in Leads to a Potential Release
  - Continuous integration and fix the problem as soon as it occurs -> Always working state  <!-- .element class="fragment highlight-current-blue" -->
  -  Sufficiently comprehensive and running tests on a sufficiently production-like environment -> Always releasable state  <!-- .element class="fragment highlight-current-blue" -->

<figure style="text-align: center">
  <img src="assets/traditional-release-candidate.png"/>
  <figcaption>Traditional release candidate</figcaption>
</figure>

---
## Principles
These are the things that we can't imagine doing without if we want our delivery process to be effective:

- Create a Repeatable, Reliable Process for Releasing Software  <!-- .element: class="fragment insides-fade-in-then-out" -->
- Automate Almost Everything  <!-- .element: class="fragment insides-fade-in-then-out" -->
  - Automate gradually over time.  <!-- .element: class="fragment fade-in-then-semi-out" -->
  - There are some things it is impossible to automate (such as exploratory tests).  <!-- .element: class="fragment fade-in-then-semi-out" -->
- Keep Everything in Version Control  <!-- .element: class="fragment insides-fade-in-then-out" -->
  - Everything you need to build, deploy, test, and release your application should be kept in some form of versioned storage. This includes requirement documents, test scripts, automated test cases, network configuration scripts, deployment scripts, database creation, upgrade, downgrade, and initialization scripts, application stack configuration scripts, libraries, toolchains, technical documentation, and so on.  <!-- .element: class="fragment fade-in-then-semi-out" -->
  - New team member to sit down at a new workstation, check out the project's revision control repository, and run a single command to build and deploy the application to any accessible environment, including the local development workstation.  <!-- .element: class="fragment fade-in-then-semi-out" -->
  - These change sets should have a single identifier, such as a build number or a version control change set number, that references every piece.  <!-- .element: class="fragment fade-in-then-semi-out" -->
- If It Hurts, Do It More Frequently, and Bring the Pain Forward  <!-- .element: class="fragment insides-fade-in-then-out" -->
  - If releasing software is painful, aim to release it every time somebody checks in a change that passes all the automated tests.  <!-- .element: class="fragment fade-in-then-semi-out" -->
  - Gradually work to approach the ideal: Aim for intermediate goals, such as an internal release every few weeks or, if you're already doing that, every week.  <!-- .element: class="fragment fade-in-then-semi-out" -->
- Build Quality In (stolen from the lean movement)  <!-- .element: class="fragment insides-fade-in-then-out" -->
  - The earlier you catch defects, the cheaper they are to fix.  <!-- .element: class="fragment fade-in-then-semi-out" -->
  - Testing is not a phase, and certainly not one to begin after the development phase.  <!-- .element: class="fragment fade-in-then-semi-out" -->
  - Everybody on the delivery team is responsible for the quality of the application all the time.  <!-- .element: class="fragment fade-in-then-semi-out" -->
- Done Means Released  <!-- .element: class="fragment insides-fade-in-then-out" -->
  - There is no "80% done". Things are either done, or they are not.  <!-- .element: class="fragment fade-in-then-semi-out" -->
  - "Done" means released into production and delivering value to users.  <!-- .element: class="fragment fade-in-then-semi-out" -->
  - Next best option: Functionality is "done" once it has been successfully showcased, that is, demonstrated to, and tried by, representatives of the user community, from a production-like environment.  <!-- .element: class="fragment fade-in-then-semi-out" -->
- Everybody Is Responsible for the Delivery Process  <!-- .element: class="fragment insides-fade-in-then-out" -->
- Continuous Improvement  <!-- .element: class="fragment insides-fade-in-then-out" -->
  - The whole team should regularly gather together and hold a retrospective on the delivery process.  <!-- .element: class="fragment fade-in-then-semi-out" -->
  - Deming cycle or [O]PDCA: [Observation], plan, do, study, act.  <!-- .element: class="fragment fade-in-then-semi-out" -->

---
## Summary
By adopting the techniques of automated build, test, and deployment, we gain the ability to verify changes, to make the process **reproducible** across a range of environments, and to largely eliminate the opportunity for errors to creep into production.

<div class="fragment fade-in">
  We also gain the ability to spend more weekends with <strong>our families</strong> and friends and to live our lives with less stress, while at the same time being more productive.
  <br>
  <img src="assets/family-meme.jpg">
</div>