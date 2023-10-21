## Continuous Delivery: Managing Continuous Delivery
#### Maturity Models (Jez Humble Maturity Model, <span style="color: brown">Qualitic Maturity Model</span>, <span style="color: brown">Google Test Certified Ladder</span>), Project Lifecycle, Risk Management Process, Common Delivery Problem (Symptoms and Causes)

<img src="assets/cd-pipeline.png"/>

<small><strong>Time to Read:</strong> ? Minutes</small>, <small><strong>Time to Present:</strong> ? Minutes</small>
<br>
<small><strong>Created By:</strong> Alireza Roshanzamir</small>
<br>
<small><strong>Keywords:</strong> Continuous Delivery, Continuous Integration, DevOps, Build, Test, Release, Deployment, Automation, Version Control, Deployment Pipeline</small>
<br>
<small style="color: darkred"><small>Press **"F"** to go fullscreen; some slides may not display properly otherwise.</small></small>

---
## Introduction
This chapter is written to provide guidance on how to make continuous delivery work within your organization.

CD is a whole new paradigm for running a business that depends on software. To understand why this is so, we need to examine a fundamental tension at the heart of corporate governance.

On the one hand, the business wants to get valuable new software out of the door as fast as possible in order to keep increasing revenue. On the other hand, people responsible for corporate governance want to ensure that the organization understands any risks that could lead to the business losing money or being shut down, such as violation of applicable regulations, and that processes are in place to manage these risks.

While everybody in the business ultimately has a shared goal, performance (mostly, for development teams) and conformance (mostly, for operations teams) are forces that can often come into conﬂict.

The deployment pipeline is designed to achieve performance by ensuring the delivery teams get constant feedback on the production-readiness of their application. It is also designed to help teams achieve conformance by making the delivery process transparent.

Using CD practices, even large organizations with complex applications can deliver new versions of their software rapidly and reliably. That means not only that businesses can get a faster return on their investment, but that they can do so with reduced risks and without incurring the opportunity cost of long development cycles—or worse, delivering software that is not ﬁt for purpose.

To use an analogy with lean manufacturing, software that is not being delivered frequently is like inventory stored up in a warehouse. It has cost you money to manufacture, but is not making you any money—indeed, it is costing you money to store it.

---
## Maturity Models
In discussing the topic of governance, it is extremely useful to have a clear view of the objectives of organizational change.

Maturity models helps to identify where an organization stands in terms of the maturity of its processes and practices and deﬁnes a progression that an organization can work through to improve.

The ultimate aim is for your organization to improve. The outcomes you want are:
- Reduced cycle time, so that you can deliver value to your organization faster and increase proﬁtability.
- Reduced defects, so that you can improve your efﬁciency and spend less on support.
- Increased predictability of your software delivery lifecycle to make planning more effective.
- The ability to adopt and maintain an attitude of compliance to any regulatory regime that you are subject to.
- The ability to determine and manage the risks associated with software delivery effectively.
- Reduced costs due to better risk management and fewer issues delivering software.

------
### Deming Cycle ([O]PDCA)
PDCA or plan-do-check-act is an iterative design and management method used in business for the control and continual improvement of processes and products:
- Plan: Establish objectives and processes required to deliver the desired results.
- Do: Implement the plan and carry out the activities.
- Check: Evaluate and measure the results to determine if they align with the goals.
- Act (Adjust): Take corrective actions based on the evaluation to improve the process.

<img src="assets/pdca-process.png">

------
### Jez Humble Maturity Model

<img src="assets/jez-humble-maturity-model.png">

The most important advice that we can offer is to implement change incrementally, and measure the impact as you go. If you try and go from level one to level ﬁve across your whole organization in one step, you will fail. Changing large organizations can take several years.

No matter how good you are, it is always possible to improve.

------
### Qualitic Maturity Model (QMM)
[Qualitic Maturity Model (QMM)](https://maturity.qualitic.ir/QMM-in-detail) is a guiding principle to develop successful and quality software, following a set of clear and pragmatic rules. It is a new approach to measure, guide, and empower the quality of the product development process.

The biggest difference between QMM and other maturity models is that it tries to be more pragmatic, by demonstrating the technical details.

In early 2019, a group of software engineers at Sahab started to move from quality as an abstract concept, to an explicit and pragmatic definition. Through this journey, they tried to define (or collect) various maturity items. Some other companies like A’van and Hamravesh helped to validate the items, to ensure that they’re general (yet useful) enough as software quality items. After several sessions, an initial draft of quality items was created. Then the team tried to prioritize these items in the form of 5 levels of maturity. On 12 November 2019, the first conference of Qualitic was held in Tehran, announcing the maturity model, publicly, for the first time.

The items of the maturity model focus on different sides of product development:
- Test
- Environment
- Build and CI
- Delivery
  - Deployment Frequency
  - Lead Time
  - Time to Restore
  - Change Failure Rate

Baseline CI Pipeline:
- Commit Stage
- Code Review
- Acceptance Test Stage
- Performance Test Stage
- Staging

- Level 1
  - [T001](https://maturity.qualitic.ir/catalog/test/T001): Test coverage is measured at the commit stage.
  - [B001](https://maturity.qualitic.ir/catalog/build_ci/B001): All CI/CD scripts are kept in version control.
  - [T016](https://maturity.qualitic.ir/catalog/test/T016): No release with red tests.
- Level 2
  - [T002](https://maturity.qualitic.ir/catalog/test/T002): Commit stage test coverage > 10%
  - [T007](https://maturity.qualitic.ir/catalog/test/T007): Classify tests as commit, acceptance, and performance
  - [T011](https://maturity.qualitic.ir/catalog/test/T011): There are acceptance tests for at least one feature upon main use cases
  - [B002](https://maturity.qualitic.ir/catalog/build_ci/B002): A specific code style is enforced for main programming languages
  - [B004](https://maturity.qualitic.ir/catalog/build_ci/B004): Compiler warnings are prevented
  - [E001](https://maturity.qualitic.ir/catalog/environment/E001): All direct external dependencies for the software product are specified using fixed versions in version control and also managed with tools/scripts in version control
  - [E012](https://maturity.qualitic.ir/catalog/environment/E012): Secrets are not stored in version control
  - [D001](https://maturity.qualitic.ir/catalog/delivery/D001): Deployment frequency is once per month
  - [D005](https://maturity.qualitic.ir/catalog/delivery/D005): Lead time for changes is less than six months
  - [D009](https://maturity.qualitic.ir/catalog/delivery/D009): Time to restore service is less than one month
  - [D013](https://maturity.qualitic.ir/catalog/delivery/D013): Change failure rate is less than 60%
- Level 3
  - [T003](https://maturity.qualitic.ir/catalog/test/T003): Commit stage test coverage > 20%
  - [B005](https://maturity.qualitic.ir/catalog/build_ci/B005): Available analysis tools on new code are actively used, as submit gate (50% sonar-way, zero issue, incremental)
  - [T013](https://maturity.qualitic.ir/catalog/test/T013): "Requirement - Acceptance Test" mapping coverage > 5%
  - [E002](https://maturity.qualitic.ir/catalog/environment/E002): Automated application deployment from scratch
  - [E003](https://maturity.qualitic.ir/catalog/environment/E003): Automated application upgrade
  - [E013](https://maturity.qualitic.ir/catalog/environment/E013): All configuration in version control and all production configs from version control
  - [E006](https://maturity.qualitic.ir/catalog/environment/E006): Data is migrated using versioned script only
  - [D002](https://maturity.qualitic.ir/catalog/delivery/D002): Deployment frequency is once per week
  - [D006](https://maturity.qualitic.ir/catalog/delivery/D006): Lead time for changes is less than one month
  - [D010](https://maturity.qualitic.ir/catalog/delivery/D010): Time to restore service is less than one week
  - [D014](https://maturity.qualitic.ir/catalog/delivery/D014): Change failure rate is less than 45%
  - [E010](https://maturity.qualitic.ir/catalog/environment/E010): Same process (scripts) to deploy to every environment
- Level 4
  - [T004](https://maturity.qualitic.ir/catalog/test/T004): Commit stage test coverage > 50%
  - [T014](https://maturity.qualitic.ir/catalog/test/T014): "Requirement - Acceptance Test" mapping coverage > 20%
  - [B006](https://maturity.qualitic.ir/catalog/build_ci/B006): Available analysis tools are actively used on new code (80% of sonar-way)
  - [B007](https://maturity.qualitic.ir/catalog/build_ci/B007): Build environment can be automatically created from version control
  - [B008](https://maturity.qualitic.ir/catalog/build_ci/B008): No manual configuration of CI/CD agent machines
  - [E004](https://maturity.qualitic.ir/catalog/environment/E004): Automated infrastructure provisioning from scratch
  - [E007](https://maturity.qualitic.ir/catalog/environment/E007): Automated data migration while deploying
  - [E005](https://maturity.qualitic.ir/catalog/environment/E005): Automated infrastructure upgrade
  - [E014](https://maturity.qualitic.ir/catalog/environment/E014): All transitive dependency versions are defined
  - [D003](https://maturity.qualitic.ir/catalog/delivery/D003): Deployment frequency is once per day
  - [D007](https://maturity.qualitic.ir/catalog/delivery/D007): Lead time for changes is less than one week
  - [D011](https://maturity.qualitic.ir/catalog/delivery/D011): Time to restore service is less than one day
  - [D015](https://maturity.qualitic.ir/catalog/delivery/D015): Change failure rate less than 15%
- Level 5
  - [T015](https://maturity.qualitic.ir/catalog/test/T015): "Requirement - Acceptance Test" mapping coverage > 50%
  - [E008](https://maturity.qualitic.ir/catalog/environment/E008): Data migrations are tested
  - [D004](https://maturity.qualitic.ir/catalog/delivery/D004): Deployment is on-demand (multiple deploys per day)
  - [D008](https://maturity.qualitic.ir/catalog/delivery/D008): Lead time for changes is less than one hour
  - [D012](https://maturity.qualitic.ir/catalog/delivery/D012): Time to restore service is less than one hour
  - [E009](https://maturity.qualitic.ir/catalog/environment/E009): Data migration can be rolled back, automatically

------
### Google Test Certified Ladder (TC Ladder)
The [Test Certified](https://mike-bland.com/2011/10/18/test-certified) program was instrumental in getting the developer-testing culture ingrained at Google.

Test Certified started out as a contest. Can we get developers to take testing seriously if we make it a prestigious matter? If developers follow certain practices and achieve specific results, can we say they are "certified" and create a badge system that provides some bragging rights?

<img src="assets/test-certified-badges.png">

- Level 1
  - Set up test coverage bundles.
  - Set up a continuous build.
  - Classify your tests as Small, Medium, and Large (think "unit", "integration", and "system" for now).
  - Identify nondeterministic (aka flaky) tests.
  - Create a smoke test suite.
- Level 2
  - No releases with red tests.
  - Require a smoke test suite to pass before a submit.
  - Incremental coverage by all tests >= 50%.
  - Incremental coverage by small tests >= 10%.
  - At least one feature tested by an integration test.
- Level 3
  - Require tests for all nontrivial changes.
  - Incremental coverage by small tests >= 50%.
  - New significant features are tested by integration tests.
- Level 4
  - Automate running of smoke tests before submitting new code.
  - Smoke tests should take less than 30 minutes to run.
  - No nondeterministic tests.
  - Total test coverage should be at least 40%.
  - Test coverage from small tests alone should be at least 25%.
  - All significant features are tested by integration tests.
- Level 5
  - Add a test for each nontrivial bug fix.
  - Actively use available analysis tools.
  - Total test coverage should be at least 60%.
  - Test coverage from small tests alone should be at least 40%.

---
## Project Lifecycle
Every software development project is different, but it is not too hard to abstract common elements.

Every piece of software goes through several phases. An initial high-level picture might include the following phases: identiﬁcation, inception, initiation, development and deployment (release), and operation.

------
### Identification
Medium-sized and large organizations will have a governance strategy. Businesses will determine their strategic objectives, leading to programs of work being identiﬁed which will enable the business to achieve its strategic objectives. These programs are in turn broken down into projects.

It is very hard to do requirements gathering, and impossible to objectively prioritize the requirements thus gathered, without a business case (this also applies to services that are provided internally). Even with it, you can be certain that the application or service you end up with will differ signiﬁcantly from the solution you had in your head during the initial requirements gathering.

The other essential thing to have in place before you start gathering requirements is a list of stakeholders, the most important of whom is the business sponsor.

There should only be one business sponsor for each project or, inevitably, any reasonably sized project will collapse from political inﬁghting long before it is ﬁnished. This business owner is known in Scrum as the product owner, and in other agile disciplines as the customer.

------
### Inception
This is most simply described as the phase before any production code is written.

Typically, requirements are gathered and analyzed during this time, and the project is loosely scoped and planned.

This phase needs to be carefully planned and executed for a software project to be successful.

There are many deliverables from an inception, some of which will vary depending on methodology and the type of project. However, most inceptions should include the following:
- A business case, including the estimated value of the project.
- A list of high-level functional and nonfunctional requirements (addressing in particular capacity, availability, service continuity, and security) with just enough detail to be able to estimate the work involved and plan the project.
- A release plan which includes a schedule of work and the cost associated with the project. In order to get this information, it is usual to estimate the relative size of the requirements, coding effort required, risk associated with each requirement, and a stafﬁng plan.
- A testing strategy.
- A release strategy (more on this later).
- An architectural evaluation, leading to a decision on the platform and frameworks to use.
- A risk and issue log.
- A description of the development lifecycle.
- A description of the plan to execute this list.

A reasonable maximum project horizon, in our experience, is about three to six months—with a preference for the lower limit. A go/no-go decision should be made following the inception process as to whether the project should go ahead, based on the estimated value of the project, estimated costs, and the predicted risks.

The most important part of an inception—the bit that ensures that the project has a chance of success—is getting all the stakeholders together face-to-face. That means developers, customers, operations people, and management. The conversations between these people, leading to a shared understanding of the problem to be solved and the way to solve it, are the real deliverables.

These deliverables should be written down, but since they are living documents, we expect that each will change throughout the project. To keep track of these changes in a reliable way—so that everyone can easily see what the current picture is—you should commit these documents into a version control system.

One word of warning: Every decision you make at this stage of a project is based on speculation, and will change. What you produce is a best guess, based on the small amount of information you have. Expending too much effort at this stage of the project—the stage when you know the least that you will ever know about it—is a mistake. Detailed planning, estimation, or design at this stage of a project are wasted time and money. Broad-based decisions are the only kind of decisions durable at this stage.

------
### Initiation
In this phase, you should establish initial project infrastructure which will typically last one or two weeks:
- Making sure that the team (analysts and managers, as well as developers) has the hardware and software that they need to begin work
- Making sure that basic infrastructure is in place—such as an Internet connection, a whiteboard, paper and pens, a printer, food, and drinks
- Creating email accounts and assigning people permissions to access resources
- Setting up version control
- Setting up a basic continuous integration environment
- Agreeing upon roles, responsibilities, working hours, and meeting times (for example, stand-ups, planning meetings, and showcases)
- Preparing the work for the ﬁrst week and agreeing on targets (not deadlines)
- Creating a simple test environment and test data
- A slightly more detailed look at the intended system design: exploring the possibilities is really the aim at this stage
- Identify and mitigate any analysis, development, and testing risks by doing spikes (throwaway implementations of a particular requirement designed as a proof of concept)
- Developing the story or requirement backlog
- Setting up the project structure and using the simplest possible story, the architectural equivalent of a "hello world," including a build script and some tests to get continuous integration under way

This stage in the project is really targeted at getting the basic project infrastructure in place, and should not be treated as a true development iteration.

Pick the simplest possible requirement that you can ﬁnd that is, nevertheless, solving a real problem and establishing some initial directions in terms of design. Use this story to make sure that you can version-control the results properly, that you can run your tests in your CI environment, and that you can deploy the results to a manual test environment. The target is to get this story complete and demonstrable, and establish all of the supporting infrastructure, by the end of the initiation phase. Once you’re done, you can get started on actual development.

------
### Development and Release
Naturally, we would recommend an iterative and incremental process for developing and releasing software (even the
space shuttle software was implemented using an iterative process).

Basic conditions for an iterative process:
- Your software is always working, as demonstrated by an automated test suite including unit, component, and end-to-end acceptance tests that run every time you check in.
- You deploy working software, at every iteration, into a production-like environment to showcase it to users (this is what makes the process incremental in addition to being iterative).
- Iterations are no longer than two weeks.

There are several reasons for using an iterative process:
- If you prioritize features with high business value, you may ﬁnd that your software starts being useful long before the end of your project. There are often good reasons not to launch new software the moment that it has useful functionality—but there is no better way to turn worrying over the project’s eventual success into excitement over the new features than a working system that people can use.
- You get regular feedback from your customer or sponsor on what works and what requirements need clarifying or changing, which in turn means that what you are doing is considerably more likely to be useful. Nobody knows what they really want at the beginning of a project.
- Things are only really done when the customer signs them off. Having regular showcases where this happens is the only remotely reliable way to track progress.
- Having your software working at all times (because you have to showcase it) instills discipline in your team that prevents problems such as long integration phases, refactoring exercises that break everything, and experiments that lose focus and go nowhere.
- Perhaps most importantly, iterative methods place an emphasis on having production-ready code at the end of each iteration. This is the only really useful measure of progress in software projects, and one that only iterative
methods provide.

There are many approaches to iterative and incremental development. One of the most popular is Scrum, an agile development process. We have seen Scrum succeed on many projects, but we have also seen it fail. Here are the three most common reasons for failure:
- Lack of commitment. The transition to Scrum can be a scary process, especially for project leadership. Make sure that everybody meets regularly to discuss what is going on, and establish regular retrospective meetings to analyze performance and seek improvements. Agile processes rely on transparency, collaboration, discipline, and continuous improvement. The sudden wealth of useful information that appears when agile processes are
implemented can thrust inconvenient truths, previously hidden, into the spotlight. The key is to realize that these issues were there all along. Now that you know about them, you can ﬁx them.
- Ignoring good engineering. Martin Fowler, amongst others, has described what happens if people following Scrum think that you can ignore technical practices like test-driven development, refactoring, and continuous integration. A codebase mangled by junior developers won’t be automatically ﬁxed by any development process alone.
- Adapting until the process is no longer an agile one. It is common for people to “adapt” agile processes into something they think will work better in their particular organization. Agile processes are designed to be tailored to meet the needs of individual projects, after all. However, the elements of agile processes often interact in subtle ways, and it is very easy to misunderstand where the value lies, particularly for people with no background in these iterative processes. We can’t emphasize enough how important it is to start by assuming that what is written is correct, and ﬁrst follow the process as written. Only then, once you have seen how it works, should you start adapting it to your organization.

This last point was so troubling to Nokia that they created a test to evaluate whether their teams were really doing Scrum. It is divided into two parts:
- Are you doing iterative development?
  - Iterations must be time-boxed to less than four weeks.
  - Software features must be tested and working at the end of each iteration.
  - The iteration must start before the speciﬁcation is complete.
- Are you doing Scrum?
  - Do you know who the product owner is?
  - Is the product backlog prioritized by business value?
  - Does the product backlog have estimates created by the team?
  - Are there project managers (or others) disrupting the work of the team?

------
### Operation
Most projects  don’t stop at the point of ﬁrst release, and will continue to develop new functionality.

An interesting aspect of a genuinely iterative and agile process is that in many ways, the operational phase of a project is not necessarily any different from the regular development phase.

In this respect, making development and operation phases collapse together is one of the best ways to eliminate risk, and is at the core of continuous delivery as described in the rest of this book.

As we mentioned earlier in this section, it is very useful to pull the time of release to the earliest possible point that makes sense for any given system. The best feedback you will get is that from real users; the key here is to release your software for real use as soon as you can. Then you can react to any problems or feedback about the usability and utility of your software as quickly as possible. Despite this, there are some differences to consider between the phases of the project before and after the system has been released for general use. Change management, particularly that concerned with data generated by the application and its public interfaces, becomes a signiﬁcant issue once the ﬁrst public release has occurred.

---
## A Risk Management Process
Risk management is the process of making sure that:
- The main project risks have been identiﬁed.
- Appropriate mitigating strategies have been put in place to manage them.
- Risks continue to be identiﬁed and managed throughout the course of the project.

There are several key characteristics that a risk management process should have:
- A standard structure for project teams to report status
- Regular updates, following the standard, from the project team on their progress
- A dashboard where program managers can track current status and trends across all projects
- Regular audits by someone outside the project to ensure that risks are being managed effectively

There are several key characteristics that a risk management process should have:
- A standard structure for project teams to report status
- Regular updates, following the standard, from the project team on their progress
- A dashboard where program managers can track current status and trends across all projects
- Regular audits by someone outside the project to ensure that risks are being managed effectively

------
### Risk Management 101
It is important to note that not all risks need to have a mitigating strategy put in place. Some events are so catastrophic that, should they occur, nothing could be done to mitigate them.

There are often real-life project-speciﬁc risks that would lead to the project being cancelled, such as legislative or economic changes, changes to the management structure of an organization, or the removal of a key project sponsor.

A common model of risk management (See Dancing with Bears byTom DeMarco and Timothy Lister) categorizes all risks in terms of their:
- impact: how much damage (such as money) they would cause if they materialize
- likelihood: how likely they are to occur.

This allows you to make a very simple calculation when deciding what strategies to put in place to mitigate the risk: does the mitigation strategy cost more than the severity of the risk? If so, it’s probably not worth implementing.

------
### Risk Management Timeline
In terms of the project lifecycle model, the risk management process should begin at the end of the inception phase, be revisited at the end of the initiation phase, and then regularly revisited throughout the development and deployment phase:

- End of Inception
  - Deliverables
    - **Release strategy**
    - Plan for the initiation phase
- End of Initiation
  - The key here is to make sure that the team is ready to start developing software (by setting up deployment pipeline).
- Develop and Release Risk Mitigation
  - Several ways of identifying risks:
    - Look at the deployment plan.
    - Have regular project miniretrospectives after every showcase and get the team to brainstorm risks during this meeting.
    - Make risk identiﬁcation part of your daily stand up meeting.

------
### How to Do a Risk-Management Exercise