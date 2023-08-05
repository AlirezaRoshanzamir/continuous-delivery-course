## Continuous Delivery: The Problem of Delivering Software
Release Antipatterns, Roadmap, Benefits, Release Candidate, Principles

<img src="assets/devops-loop.png" style="max-width: 500px"/>

<small><strong>Lecturer:</strong>  Alireza Roshanzamir</small>

<small><strong>Keywords:</strong>  Continuous Delivery, Continuous Integration, DevOps, Build, Test, Release, Deployment, Automation, Version Control, Deployment Pipeline</small>

<small><small>Tir 1402/August 2023</small></small>

<details>
<summary>Note</summary>
Mention the deploy vs release and why their order is different in different places (feature toggle, release candidate, library vs application).
</details>

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
  - Either a production-like environment is expensive enough that access to it  is strictly controlled, or it is not in place on time, or nobody bothered to create one.
  - Development team assembles installers, configuration files, database migrations, and deployment guidelines for deployment personnel—untested in a production or staging setting.
  - There is little, if any, collaboration between the development team and the people who actually perform deployments to create this collateral.
  - Thinking it's all about the DevOps team

  Therefore, the solution involves integrating testing, deployment, and release tasks into the development workflow. These tasks become routine and continuous during development, reducing risks during eventual production release. This approach entails rehearsing the release across multiple increasingly production-like test environments on numerous occasions.

- Manual Production Environment Configuration Management:
    - Adjustments like altering database connection settings or increasing thread counts on an app server are managed manually for production environments.
    - Despite successful staging deployments, production deployment encounters failures.
    - Operations team spends significant time setting up the release environment.
    - Reverting to previous system configurations (OS, app server, web server, RDBMS, etc.) becomes unfeasible.
    - Clustered servers unintentionally run diverse OS versions, third-party infrastructure, libraries, or patches.
    - System configuration involves direct modifications on production systems.
    - Discrepancies in environment configurations across testing, staging, and production.

  Hence, all aspects of testing, staging, and production environments, especially configurations of third-party components, should be automatically applied from version control.
