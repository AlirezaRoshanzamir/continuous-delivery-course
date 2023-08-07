## Continuous Delivery: The Problem of Delivering Software
Release Antipatterns, Goals, Criterias, Benefits, Release Candidate, Principles

<img src="assets/wall-of-confusion.png" style="max-width: 550px"/>

<small><strong>Lecturer:</strong> Alireza Roshanzamir</small>

<small><strong>Keywords:</strong> Continuous Delivery, Continuous Integration, DevOps, Build, Test, Release, Deployment, Automation, Version Control, Deployment Pipeline</small>

<small><small>Tir 1402/August 2023</small></small>

---
## Release Antipatterns
The day of a software release tends to be tense due to certain antipatterns:
- Manual Software Deployment:
  - Relying on detailed documentation for intricate step-by-step instructions and potential pitfalls
  - Conducting manual tests to verify proper application functionality
  - Frequently requiring communication with the development team
  - Making frequent adjustments to the release process
  - Managing environments within a cluster that possess varying configurations
  - Dealing with releases taking more than a few minutes
  - Facing unpredictable release outcomes, often leading to rollbacks
  - Finding oneself fatigued and staring at a screen at 2 A.M.

  Hence, a shift towards full automation in deployments is advisable.

- Delayed Production-like Deployment:
  - Software is initially deployed to a production-like environment (e.g., staging) once most development is finished
  - Releasing into staging is the first time that operations people interact with the new release.
  - Either a production-like environment is expensive enough that access to it is strictly controlled, or it is not in place on time, or nobody bothered to create one.
  - The development team assembles installers, configuration files, database migrations, and deployment guidelines for deployment personnel—untested in a production or staging setting.
  - There is little if any, collaboration between the development team and the people who perform deployments to create this collateral.
  - Thinking it's all about the DevOps team

  Therefore, the solution involves integrating testing, deployment, and release tasks into the development workflow. These tasks become routine and continuous during development, reducing risks during eventual production release. This approach entails rehearsing the release across multiple increasingly production-like test environments on numerous occasions.

- Manual Production Environment Configuration Management:
    - Adjustments like altering database connection settings or increasing thread count on an app server are managed manually for production environments.
    - Despite successful staging deployments, production deployment encounters failures.
    - The operations team spends significant time setting up the release environment.
    - Reverting to previous system configurations (OS, app server, web server, RDBMS, etc.) becomes unfeasible.
    - Clustered servers unintentionally run diverse OS versions, third-party infrastructure, libraries, or patches.
    - System configuration involves direct modifications to production systems.
    - Discrepancies in environment configurations across testing, staging, and production.

  Hence, all aspects of testing, staging, and production environments, especially configurations of third-party components, should be automatically applied from version control.

---
## Goals
Our goal is to describe the use of deployment pipelines, combined with high levels of automation of both testing and deployment and comprehensive configuration management to deliver push-button software releases. That is, 
push-button software releases to any deployment target-development, test, or production.

<img src="assets/release-push-button.avif" width="200"/>

---
## Refined Goal
We want to find ways to deliver **high-quality**, 
**valuable** software in an **efficient**, **fast**, and **reliable** manner by making releases:

- **Automated**
  - Not automated -> Not repeatable
  - Not automated -> Error prone
  - Not automated -> No review -> No quality
- **Frequent**
  - Not frequent -> High difference -> High risk -> Hard roll back
  - Not frequent -> Slower feedback

---
## Criterias
- Every Change Should Trigger the Feedback Process
  - Changing components: executable code, configuration, host environment, and data 
  - Feeback process: testing every change in a fully auto-mated fashion, as far as possible. Usually, code syntax check, unit-tests, quality metrics criterias such as test coverage, functional acceptance tests, non-functional tests (such as capacity, availability, security, etc.), exploratory tests.
- The Feedback Must Be Received as Soon as Possible
  - Free people to do the interesting work and leave repetition to machines
  - Commit stage of pipeline: fast, comprehensive (at least 75% of codebase), check only critical faults (not UI color), environment-neutral.
  - Other stages of pipeline: flow and more parallel, some of them may fail, run on production like environment, test deployment process
- The Delivery Team Must Receive Feedback and Then Act on It
  - Everybody involved in the process of delivering software is involved in the feedback process: developers, testers, operations staff, database administrators, infrastructure specialists, and managers.
  - React to feedback means broadcasting information: big, visible dashboards (which need not be electronic) and other notification mechanisms is central to ensuring that feedback is, indeed, fed-back and makes the final step into someone's head.
  - It is the responsibility of the whole team to stop what they are doing and decide on a course of action.

Does This Process Scale?

The techniques and principles that we describe in 
this book have been proven in real projects in all kinds of organizations, both large and small, in all kinds of situations. Much of this book is inspired by the philosophy and ideas of the lean movement which have been applied to huge organizations, and even whole economies.

---
## Benefits
Repeatable, reliable, and predictable release process which in turn generates large reductions in cycle time, and hence gets features and bugfixes to users fast. Other benefits include:
- Empowering Teams
  - Pull system: Allowing testers, operations or support personnel to self-service the version of the application they want into the environment of their choice. Often getting a good build requires endless emails being sent, tickets being raised.
  - Testers can select older versions of an application to verify changes in behavior in newer versions.
  - Support staff can deploy a released version of the application into an environment to reproduce a defect.
  - Operations staff can select a known good build to deploy to production as part of a disaster recovery exercise.
- Reducing Errors
  - By managing everything that can change in version control, we allow computers to do what they are good at.
  - Which configuration differences matter and which do not is not something that you want to discover by accident during your busiest trading period.
- Lowering Stress
  - Most people who have ever come anywhere near a software project that is approaching its release date will be aware that these are indeed stressful events.
  - The key to reducing stress is to have the kind of automated deployment process that we have described, to perform it frequently, and to have a good story when it comes to your ability to back changes out should the worst happen.
- Deployment Flexibility
  - It should be a simple task to start your application in a new environment.
  - Be able to use your automated deployment process to prepare the new environment for deployment and deploy the chosen version of your application to it.
  - Be able to running enterprise software on a laptop.
- Practice Makes Perfect
  - There should not be a special QA deployment strategy, or a special acceptance test, or production deployment strategy.
  - Use the same deployment approach whatever the deployment target (as much as possible for developer workstations).

---
## Release Candidate
Every merge to mainline is a "release candidate".
- Every Check-in Leads to a Potential Release
  - Continuous integration and fix the problem as soon as it occurs -> Always working state
  -  Sufficiently comprehensive and running tests on a sufficiently production-like environment -> Always releasable state

<figure style="text-align: center">
  <img src="assets/traditional-release-candidate.png"/>
  <figcaption>Traditional release candidate</figcaption>
</figure>


---
## Principles
These are the things that we can't imagine doing without if we want our delivery process to be effective:

- Create a Repeatable, Reliable Process for Releasing Software
- Automate Almost Everything
  - Automate gradually over time.
  - There are some things it is impossible to automate (such as exploratory tests).
- Keep Everything in Version Control
  - Everything you need to build, deploy, test, and release your application should be kept in some form of versioned storage. This includes requirement documents, test scripts, automated test cases, network configuration scripts, deployment scripts, database creation, upgrade, downgrade, and initialization scripts, application stack configuration scripts, libraries, toolchains, technical documentation, and so on.
  - New team member to sit down at a new workstation, check out the project's revision control repository, and run a single command to build and deploy the application to any accessible environment, including the local development workstation.
  - These change sets should have a single identifier, such as a build number or a version control change set number, that references every piece.
- If It Hurts, Do It More Frequently, and Bring the Pain Forward
  - If releasing software is painful, aim to release it every time somebody checks in a change that passes all the automated tests.
  - Gradually work to approach the ideal: Aim for intermediate goals, such as an internal release every few weeks or, if you're already doing that, every week.
- Build Quality In (stolen from the lean movement)
  - The earlier you catch defects, the cheaper they are to fix.
  - Testing is not a phase, and certainly not one to begin after the development phase.
  - Everybody on the delivery team is responsible for the quality of the application all the time.
- Done Means Released
  - There is no "80% done". Things are either done, or they are not.
  - "Done" means released into production and delivering value to users.
  - Next best option: Functionality is "done" once it has been successfully showcased, that is, demonstrated to, and tried by, representatives of the user community, from a production-like environment.
There is no 
- Everybody Is Responsible for the Delivery Process
- Continuous Improvement
  - The whole team should regularly gather together and hold a retrospective on the delivery process.
  - Deming cycle or [O]PDCA: [Observation], plan, do, study, act.
