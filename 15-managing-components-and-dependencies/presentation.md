## Continuous Delivery: Managing Components and Dependencies
#### Keeping Application (Trunk) Releasable, <span style="color: brown">Dependencies</span>, <span style="color: purple">Components</span>, Managing Dependency Graph, <span style="color: purple">Managing Binaries</style>

<img src="assets/integration-pipeline.png" width="950"/>

<small><strong>Time to Read:</strong> ? Minutes</small>, <small><strong>Time to Present:</strong> ? Minutes</small>
<br>
<small><strong>Created By:</strong> Alireza Roshanzamir</small>
<br>
<small><strong>Keywords:</strong> Continuous Delivery, Continuous Integration, DevOps, Build, Test, Release, Deployment, Automation, Version Control, Deployment Pipeline</small>
<br><br>
<small style="color: darkred"><small>Press **"F"** to go fullscreen; some slides may not display properly otherwise.</small></small>

---
## Introduction
In CD, you have to keep your application releasable at all times. But what if you are engaged in a major refactoring or adding complex new functionality? Branching in version control might seem to be the solution to this problem. However, we feel strongly that this is the wrong answer.

One of the key techniques for this is componentization of larger applications, so we will treat componentization, including building and managing large projects with multiple components, at length.

Component is a horribly overloaded term in software. When we talk about components, we mean a reasonably large-scale code structure within an application, with a well-defined API, that could potentially be swapped out for another implementation.

The antithesis of a component-based (modular) system is a monolithic system with no clear boundaries or separation of concerns between elements responsible for different tasks. Monolithic systems typically have poor encapsulation, and tight coupling between logically independent structures breaks the Law of Demeter.

In Windows, a component is normally packaged as a DLL. In UNIX, it may be packaged as an SO file. In the Java world, it is probably a JAR file.

In this chapter, we also describe how to create and manage build systems for component-based applications.

Many projects are fine with a single version control repository and a simple deployment pipeline. However, many projects have evolved into an unmaintainable morass of code because nobody made the decision to create discrete compo-
nents when it was cheap to do so.

By the end of this chapter, we will have covered all three degrees of freedom in a build system: the deployment pipeline, branches, and components. It is not unusual, when working on large systems, to have all three of these dimensions in play at once. In such systems, components form a series of dependencies, which in turn depend on external libraries. Each component may have several release branches. Finding good versions of each of these components that can be assembled into a system which even compiles is an extremely difficult process that can resemble a game of whack-a-mole-we have heard of projects where it takes months. Only once you have done this can you start moving the system through the deployment pipeline.

---
## Keeping Application Releasable
These processes generally results in weeks or months between releases and prevents the application to always be in a releasable state:
- Sometimes need to make major architectural changes. During these activities the application is not releasable.
- Usually, before release, teams will stop developing new functionality and enter a stabilization phase during which only bugfixing takes place. When the application is released, a release branch is created in version control, and new development begins again on trunk.

One approach is to create branches in version control that are merged when work is complete, so that mainline is always releasable. We believe that this approach is suboptimal, since the application is not being continuously integrated if work happens on branches.

Instead, we advocate that everybody checks in on mainline. But, how?
- Hide new functionality until it is finished.
- Make all changes incrementally as a series of small changes, each of which is releasable.
- Use branch by abstraction to make large-scale changes to the codebase.
- Use components to decouple parts of your application that change at different rates.

We'll discuss the first three strategies here and talk about the forth one later.

------
### Hide New Functionality Until It Is Finished
One common problem with continuous deployment of applications is that a feature, or a set of features, can take a long time to develop.

It is often tempting to start new development on a branch in version control, and integrate when the functionality is ready, so as not to interrupt the work being done on the rest of a system, which might prevent it being released.

One solution is to put in the new features, but make them inaccessible to users. For example, consider a website that provides travel services. The company running the site wants to offer a new service: hotel bookings. In order to do so, work starts on this new offering as a separate component, reached through a separate URI root /hotel. This component can still be deployed along with the rest of the system if desired-so long as access is not permitted to its entry point (this could be accomplished by a configuration setting in your web server software).

An alternative way to ensure that semicompleted components can be shipped while not being accessible to users is to turn access to them on and off by means of configuration settings. For example, in a rich client application, you might have two menus-one with the new feature, and one without. You would use a configuration setting to switch between the two menus. This can be done either through the use of command-line options, or through other deploy-time or runtime configuration. The ability to switch features on and off (or swap them out for alternative implementations) through runtime configuration is also very useful when running automated tests.

Shipping semicompleted functionality along with the rest of your application is a good practice because it means you're always integrating and testing the entire system as it exists at any time. It ensures that the new components being developed are deployable along with the rest of the software from the beginning.

------
### Make All Changes Incrementally
The theory behind branching is that developers can move faster if they can make large, high-level changes which break the application and then wire everything back in afterwards. However, in practice, the wiring everything up ends up being the hard part. If other teams are working in
the meantime, the merge at the end can be hard-and the bigger the change, the harder it will be.

Even if turning large changes into a series of small, incremental changes is hard work while you're doing it, it means you're solving the problem of keeping the application working as you go along, preventing pain at the end. It also means you can stop at any time if you need to, avoiding the sunk cost involved in getting halfway through a big change and then having to abandon it.

Analysis plays an important part in being able to make large changes as a series of small changes. The thought process that goes into it is the same thought process used to break a requirement down into smaller tasks.

------
### Branch by Abstraction
Sometimes there are changes that are too hard to make in an incremental fashion. At this point, you should consider branching by abstraction.

This pattern is an alternative to branching when you need to make a large-scale change to an application.

Instead of branching, an abstraction layer is created over the piece to be changed. A new implementation is then created in parallel with the existing implementation, and then when it is complete, the original implementation and (optionally) the abstraction layer are removed.

Steps:
1. Create an abstraction over the part of the system that you need to change.
2. Refactor the rest of the system to use the abstraction layer.
3. Create a new implementation, which is not part of the production code path until complete.
4. Update your abstraction layer to delegate to your new implementation.
5. Remove the old implementation.
6. Remove the abstraction layer if it is no longer appropriate.

You can do branch by abstraction at a very high level, such as swapping out an entire persistence layer.You can also do it at a very low level-swapping out a class for another one using the strategy pattern, for example. Dependency injection is another mechanism that enables branch by abstraction. The trick is finding or creating the seams that allow you to insert an abstraction layer.

This is also an excellent pattern to use as part of a strategy for turning a monolithic codebase that uses the ball of mud "pattern" into a more modular, better structured form. Take part of the codebase that you want to separate out as a component or rewrite. Provided you can manage the entry points to this part of the codebase, perhaps using the façade pattern, you can localize the mess and use branch by abstraction to keep the application running with the old code while you create a new, modularized version of the same functionality. This strategy is sometimes known as "sweeping it under the rug" or "Potemkin village".

Nevertheless, sometimes it is just too hard to find a good seam in your codebase, and branching is the only solution. Use the branch to get your codebase to a state where you can then perform branch by abstraction.

Making large-scale changes to your application, whether through branching by abstraction or any other technique, benefits enormously from a comprehensive automated acceptance test suite. Unit and component tests are simply not coarsegrained enough to protect your business functionality when big chunks of your application are being changed.

---
## Dependencies
A dependency occurs whenever one piece of software depends upon another in order to build or run.

There are two distinctions that will be especially useful in this chapter:
- The distinction between components and libraries,
    - Libraries refer to software packages that your team does not control, other than choosing which to use. Libraries are usually updated rarely.
    - In contrast, components are pieces of software that your application depends upon, but which are also developed by your team, or other teams in your organization. Components are usually updated frequently.
- And that between build-time and runtime dependencies.
    - Build-time dependencies must be present when your application is compiled and linked (if necessary).
    - Runtime dependencies must be present when the application runs, performing its usual function.

Managing dependencies can be difficult. We'll start with an overview of the most common dependency problems that occur with libraries at run time.

------
### Dependency Hell (DLL Hell)
Dependency hell occurs when an application depends upon one particular version of something, but is deployed with a different version, or with nothing at all:
- In older versions of Windows, DLL hell was a common problem with shared libraries (DLLs) lacking versioning, causing overwriting of old versions.
- The .NET framework introduced assemblies with version numbers and a global assembly cache (GAC) to address DLL hell on Windows.
- Linux appends integers to .so files and uses soft links to manage library versions, requiring testing or source compilation for compatibility.
- Static compilation aggregates critical dependencies at compile time but has drawbacks, such as large binaries and OS version coupling.
- Dynamic languages like Rails ship frameworks and libraries with applications to allow different versions to coexist.
- Java faces runtime dependency issues due to classloader limitations, which the OSGi framework can resolve, but managing dependencies at build time is crucial.
- The diamond dependency problem arises when an application depends on two libraries with different versions of the same underlying library, potentially causing runtime issues.

------
### Managing Libraries
There are two ways of managing libraries in software projects:
- Check them into version control.
  - Works fine for small projects
  - Traditionally, a lib directory is used for this purpose.
  - Use nunit-2.5.5.dll instead of nunit.dll.
  - Over time, your checked-in library repository may become large and crufty, and it may become hard to know which of these libraries are still being used by your application.
  - Manually managing transitive dependencies across projects rapidly becomes painful (while package managers try to solve this problem themselve).
- Declare them and use a tool like Maven or Ivy to download libraries from Internet repositories or (preferably) your organization's own artifact repository.
  - <img src="assets/maven-dependency-pom.png" width="400">
  - Transitively resolving dependencies on other projects (if applicable) and ensuring that there are no inconsistencies in the project dependency graph.
  - Cache the libraries your project needs on your local machine
  - Manage your own artifact repository (Nexus, JFrog, etc.).
    - Makes it much easier to audit your libraries and prevent violations of legal constraints, such as using GPL-licensed libraries in BSD-licensed software.

Consider build-time, test-time, and runtime dependencies as well as testing, linting, building (app and docs), typing, packaging, running dependencies. You make create different files/subdirectories/sections for them. You may create directories or files that include another dependencies to prevent duplication or for developer convinience.

------
### Dependency Pinning (Locking)
Dependency pinning means fixing a specific version of a library or package in a project to ensure consistency and prevent unexpected updates. This practice can also be used recursively for the project's dependencies, ensuring that the entire dependency tree remains locked to specific versions:

<table>
  <tr>
    <th>Tool/Technology</th>
    <th>Direct Dependencies</th>
    <th>Pinned [Recursive] Dependencies</th>
  </tr>
  <tr>
    <td>Python/Pip/Pip-tools</td>
    <td><pre><code>portion>=2.2.0,&lt;3</pre></code></td>
    <td>
      <pre><code>portion==2.4.1 \
    --hash=sha256:9dcbf1808898f440aed304a5e9f0742a2859eca3b0ac7f1f58e50502852a8ef9 \
    --hash=sha256:e4b3d7a394382bed97de0d36458ba62d11a0cbbc01ea13163c2bbde5da6b4eba
    # via -r requirements.txt
sortedcontainers==2.4.0 \
    --hash=sha256:25caa5a06cc30b6b83d11423433f65d1f9d76c4c6a0c90e3379eaa43b9bfdb88 \
    --hash=sha256:a163dcaede0f1c021485e957a39245190e74249897e2ae4b2aa38595db237ee0
    # via portion</code></pre>
    </td>
  </tr>
  <tr>
    <td>Docker</td>
    <td><pre><code>FROM python:3</pre></code></td>
    <td><pre><code>FROM python:3.9.18-slim@sha256:f8bab700e49d929b44a0d95ea78617ab24d5e6028640f78e27ef20183ac2e54d</code></pre></td>
  </tr>
  <tr>
    <td>Java/Gradle</td>
    <td>
      <pre><code>org.springframework:spring-beans:[5.0,6.0)</code></pre>
    </td>
    <td>
      <pre><code>org.springframework:spring-beans:5.0.5.RELEASE=compileClasspath, runtimeClasspath
org.springframework:spring-core:5.0.5.RELEASE=compileClasspath, runtimeClasspath
org.springframework:spring-jcl:5.0.5.RELEASE=compileClasspath, runtimeClasspath
empty=annotationProcessor</code></pre>
    </td>
  </tr>
</table>

<details>
  <summary>Note</summary>
  Mention these considerations with the Debian packages and repositories:
  <ul>
    <li>Most standard repositories remove the old versions of a single package. So, the pinned version may not work in the future.</li>
    <li>Some repositories use version in the package name to support installing multiple versions at the same time (e.g. python packages in the deadsnakes repository).</li>
  </ul>
</details>

------
### Application vs Library
When developing a library:
- Support a range of third-party versions to ensure compatibility in various environments.
- Enforcing a specific version on clients can lead to conflicts.
- Pinned dependencies are only used during development for faster dependency resolution (instead of backtracking the dependency graph space).

When developing [and deploying] an application:
- Pin or lock the versions of the third-party libraries used, specifying exact versions.
- It enhances reliability and confidence by reducing the risk of unexpected issues.
- For shared environments with multiple apps, consider isolation if different library versions can't coexist.

------
### Dependency Refactoring
One really useful feature of dependency managers (Maven, Pants/Pip, etc.) is that it can analyze your project’s dependencies and tell you about both **undeclared dependencies** and **unused declared** dependencies.

It is also advised to extract common dependencies (names or only versions) and prevent duplication. If your dependency manager doesn't support it explicitly, you me define dummy project that only includes dependencies and depend your component to it:

<table>
  <td>
    Extracting [only] common dependency <strong>versions</strong> in the parent project
    <pre><code><project>
<modelVersion>4.0.0</modelVersion>
<parent>
<groupId>com.continuousdelivery</groupId>
<artifactId>parent</artifactId>
<version>1.0.0</version>
</parent>
<artifactId>simple</artifactId>
<packaging>jar</packaging>
<version>1.0-SNAPSHOT</version>
<name>demo</name>
<url>http://maven.apache.org</url>
<dependencies>
<dependency>
<groupId>junit</groupId>
<artifactId>junit</artifactId>
<scope>test</scope>
</dependency>
</dependencies>
</project></pre></code>
  </td>
  <td>
    Specifying another Pom file as a dependency
    <pre><code><project>
...
<dependencies>
...
  <dependency>
    <groupId>com.thoughtworks.golive</groupId>
    <artifactId>parent</artifactId>
    <version>1.0</version>
    <type>pom</type>
  </dependency>
</dependencies>
</project></code></pre>
  </td>
  <td>
    Including another requirements (using -r)
    <pre><code>-e .[all]
-r requirements-tests.txt
-r requirements-docs.txt
uvicorn[standard] >=0.12.0,&lt;0.23.0
pre-commit >=2.17.0,&lt;4.0.0
playwright</code></pre>
  </td>
</table>

---
## Components
Software systems consist of a collection of components. These components may be DLLs, JAR files, OSGi bundles, Perl modules, or something else.

Most applications start off as a single component. Some start off as two or three (for example, a client-server application).

Unless these relationships are managed effectively, it can compromise the ability to use them as part of a continuous integration system.

------
### How to Divide a Codebase into Components
A component is reusable, replaceable with something else that implements the same API, independently deployable, and encapsulates some coherent set of behaviors and responsibilities of the system.

Lower bound: A component should have a certain level of complexity before it can be considered an independent piece of your application (a single class is not considered a component and deployed independently).

Upper bound: Our aim in dividing a system into components is to increase our efficiency as a team. There are several reasons why components make the software development process more efficient:
1. They divide the problem into smaller and more expressive chunks.
2. Components often represent differences in the rates of change of different parts of the system, and have different lifecycles.
3. They encourage us to design and maintain software with clear delineation of responsibilities, which in turn limits the impact of change, and makes understanding and changing the codebase easier.
4. They can provide us with additional degrees of freedom in optimizing our build and deployment process.

A significant feature of most components is that they expose an API of some form: dynamic linking, static linking, a web service, file exchange, message exchange, and so forth.

It is the degree of coupling between components, both in terms of interface and behavior, that adds complexity when they are separated and treated as independent units in a build and deployment process.

Reasons to separate out a component from your codebase:
1. Part of your codebase needs to be deployed independently (for example, a server or a rich client).
2. You want to turn a monolithic codebase into a core and a set of plugins, perhaps to replace some part of your system with an alternative implementation, or to provide user extensibility.
3. The component provides an interface to another system (for example a framework or a service which provides an API).
4. It takes too long to compile and link the code.
5. It takes too long to open the project in the development environment.
6. Your codebase is too large to be worked on by a single team.
  - If you need more than ten people to develop at the speed you need to, one very effective way to do this is to divide your system into loosely coupled components, and divide the teams too.

We do not recommend making teams responsible for individual components. This is because in most cases, requirements don't divide along component boundaries. In our experience, cross-functional teams in which people develop features end-to-end are much more effective. Although one team per component may seem more efficient, this is not in fact the case:
  - It is often hard to write and test requirements for a single component in isolation, since usually implementing a piece of functionality will touch more than one component. If you group teams by component, you thus require two or more teams to collaborate to complete a feature, automatically adding a large and unnecessary communication cost.
  - People in component-centered teams tend to form silos and optimize locally, losing their ability to judge what is in the best interest of the project as a whole.
  - One of the more serious dangers of having a team per component is that the application as a whole won't work until the end of the project because nobody has the incentive to integrate the components.

It is better to split teams up so that each team takes on one stream of stories (perhaps all with a common theme), and touches whatever components they need to in order to get their work done:
- Organize teams by functional area rather than by component.
  - <img src="assets/component-vs-feature-teams.png">
- Ensure that everybody has the right to change any part of the codebase.
- Rotate people between teams regularly.
- Ensure that there is good communication between teams.
- Making all the components work together is everybody's responsibility, not just that of the integration team.
- Try to move from Feature Team to Product Team
  - <img src="assets/feature-vs-product-team.png">

Two common extreme failings:
- Components everywhere
- The one component to rule them all

Conway's Law: Organizations which design systems . . . are constrained to produce designs which are copies of the communication structures of these organizations:
- Open source projects where developers communicate only by email tend to be very modular with few interfaces.
- A product developed by a small, colocated team will tend to be tightly coupled and not modular.

Be careful of how you set up your development team-it will affect the architecture of your application (the Reverse Convey Maneuver).

&shy;<!-- .element: class="fragment fade-in-with-next custom" -->You can find more information in the following books and articles:
<table>
  <tr>
    <td><img src="assets/mirroring.png" width="100"/></td>
    <td>
      Exploring the Duality between Product and Organizational Architectures: A Test of the "Mirroring" Hypothesis
      <br />
      <small>by Alan MacCormack, John Rusnak, Carliss Baldwin</small>
    </td>
  </tr>
  <tr>
    <td><img src="assets/clean-architecture-cover-book.jpg" width="100"/></td>
    <td>
      Clean Architecture: A Craftsman's Guide to Software Structure and Design (Robert C. Martin Series)
      <br />
      <small>by by Robert Cecil Martin</small>
    </td>
  </tr>
  <tr>
    <td><img src="assets/principles-of-package-design-cover-book.jpg" width="100"/></td>
    <td>
      Principles of Package Design: Creating Reusable Software Components
      <br />
      <small>by Matthias Noback</small>
    </td>
  </tr>
</table>

------
### Pipelining Components
The simplest approach, and one that scales up to a surprising degree, is to have a single pipeline for your entire application and components. Every time a change is committed, everything is built and tested.

We would recommend building your system as a single entity until the process of getting feedback becomes too slow.

There is always some additional overhead to the management of a component-based build.

However, realistically there are many circumstances that benefit from splitting your system into several different pipelines:
- Parts of your application that have a different lifecycle (perhaps you build your own version of an OS kernel as part of your application, but you only need to do this once every few weeks).
- Functionally separate areas of your application that are worked on by different (perhaps distributed) teams may have components specific to those teams.
- Components that use different technologies or build processes.
- Shared components that are used by several other projects.
- Components that are relatively stable and do not change frequently.
- It takes too long to build your application, and creating builds for each component will be faster (but beware, the point at which this becomes true is much later than most people think).

Once the binaries (libraries, executables, etc.) have passed through their own mini release process (you will need to publish them to an artifact repository), they are ready for promotion to an integration build (more on this in the next section).

In general, the guiding principle should be to minimize the number of builds that you operate.

------
### The Integration Pipeline
The integration pipeline:
1. Takes as its starting point the binary outpu from each of the components.
2. Create a package (or packages) suitable for deployment by composing the appropriate collections of binaries.
3. Deploy the resulting application to a production-like environment and run smoke tests against it to give early indication of any basic integration problems (fail fast).
4. Move on to a conventional acceptance test stage, running whole application acceptance tests in the usual way.

<img src="assets/integration-pipeline.png">

Principles:
- Fast feedback
  - Feedback can be compromised by long pipelines, or chains of pipelines. If you find yourself in this situation and you have sufficient hardware, one solution is to trigger downstream pipelines as soon as binaries are created and the unit tests pass.
- Provide visibility into the status of the build for all interested parties
  - Backward: Ability to trace back from an integration build to the versions of each component that contributed to it.
  - Forward: The team working on the components should have visibility into which versions of their component actually ended up in a green integration pipeline (and can thus be considered good for integration). Only these versions of the components are in fact really "green."

<img src="assets/gitlab-parent-child-pipelines.jpg">

<img src="assets/gitlab-parent-child-pipelines-2.png">

If several components change between one run of the integration pipeline and the next, it is probable that it will spend much of its time broken:
- The best and simplest approach: Build every single possible combination of the good versions of your components. It's good when:
  - Your components don't change that often.
  - you have sufficient computing power on your build grid, you can do this.
- The next good approach: Build as many versions of your application as you can:
  - Takes the latest version of every component and assembles your application as frequently as it can.
  - If this operation is sufficiently fast, you can run a short smoke test suite against each version of your app.
  - You could then have some manual way to say "Assemble these and create an instance of my integration pipeline with them".

---
## Managing Dependency Graphs
It is vital to version dependencies, including libraries and components.

Components can have dependencies on other components, including third-party libraries. If you draw a diagram of the dependencies between components, it should be a directed acyclic graph (DAG).

If your graph has cycles you have a pathological dependency problem, which we'll address shortly.

------
### Building Dependency Graphs
We refer to a component further to the left of the diagram as an "upstream" dependency, and a component further to the right as a "downstream" dependency (CDS pricing library is a third-party):

<img src="assets/dependency-graph.png">

Each component could have its own pipeline, triggered by changes in that component's source code or by changes to any upstream dependency. Downstream dependencies will be triggered by this component passing all of its automated tests.

When an upstream component changes, it triggers a recursive rebuild and test of itself and all downstream components respectively. If any immediate/intermediate upstream fail, downstreams are not initiated.

When a change is made to the framework and the pricing engine. In this case, the whole graph needs to be rebuilt. But there are several possible outcomes, each with its own considerations:
- The happy path is that all three intermediate components pass with the new versions of the framework and the CDS pricing library.
- But what if the settlement engine fails? Clearly the portfolio management application should not build against the new (but broken) version of the framework. However, you might well want the portfolio management application to build with the new version of the pricing engine, which (crucially) should be built against the new version of the CDS pricing library and the old (known good) version of the framework. Of course now you're in trouble, because no such version of the pricing library exists.

The most important constraint on these scenarios is that the portfolio management application should only build against one version of the framework. We particularly don't want to end up with a version of (say) the pricing engine built against one version of the framework, and the settlement engine built against another version. This is the classic "diamond dependency” problem-which is the build-time analogue of the runtime "dependency hell” problem.

<img src="assets/dependency-diamond.png">

------
### Pipelining Dependency Graphs
The key elements of the pipeline are that the team must get feedback as rapidly as possible on any breakages, and that we should obey the rules for building dependencies described above:

<img src="assets/component-pipeline.png">

Features:
- To increase the speed of feedback, dependent projects are triggered once the commit stage of each project's pipeline is complete.
- All of the triggers are automatic (with the exception of deployments to the manual testing and production environments)

It is essential that teams can trace the origins of the components that went into a particular build of the application:

<table>
  <td><img src="assets/visualizing-upstream-dependencies.png"></td>
  <td><img src="assets/visualizing-downstream-dependencies.png"></td>
</table>

------
### When Should We Trigger Builds?
All of the examples discussed above assume that we trigger a new build whenever there is any change to upstream dependencies. This is the right thing to do, but it is not the norm in many teams-rather, they tend to only update their dependencies once their codebase is stable, perhaps at integration time, or when development has reached some other milestone. This behavior emphasizes stability, but at the cost of potential risk of spending a great deal of time integrating.

It can be seen that there is a tension in the development process where dependencies are involved. On one hand, it is best to keep up with the newest versions of upstream dependencies to make sure that you have the most up-to-date features and bugfixes. On the other hand, there can be a cost to integrating the latest version of every dependency, because you can spend all your time fixing breakages caused by these new versions. Most teams compromise and do a refresh of all their dependencies after every release, when the risks of updating are low.

A key consideration when deciding how often to update dependencies is how much you trust new versions of these dependencies:
- If you have a few components depending upon a component also developed by your team, you can usually fix breakages caused by API changes very quickly and simply, so integrating often is best. If the components are sufficiently small, it is preferable to have a single build for the whole application-giving the fastest feedback of all.
- If the upstream dependencies are developed by another team within your own organization, it is probably best if these components are built independently in their own pipeline. You can then decide whether or not to take the latest version of these upstream components each time that they are changed, or stick with a particular version. This decision is based on how frequently they change, and how fast the teams working on them respond to problems.

You need to strike a balance between getting fast feedback on whether your application is going to integrate and having hyperactive builds that continually spam you with breakages that you don't care about.

------
### Cautious Optimism
Alex Chaffee suggests adding a new state to the dependency graph: "static," "guarded," or "fluid" for upstream dependencies:
- Changes in a static upstream dependency do not trigger a new build.
- Changes in a ﬂuid upstream dependency always trigger a new build. If a change in a "ﬂuid” upstream dependency triggers a build and the build fails, the upstream dependency is marked "guarded,” and the component is pinned to the known-good version of the upstream dependency.
- A "guarded” upstream dependency behaves like a static one-it doesn't take new changes-but it serves to remind the development team that there is a problem that needs to be resolved with the upstream dependency.

<img src="assets/cautious-optimisim-triggering.png">

Chaffee mentions a strategy called "informed pessimism” as a starting point for any implementation of a dependency tracking algorithm. In this strategy, every trigger is set to "static,” but developers working on downstream dependencies are notified when a new version of their upstream dependency becomes available.

------
### Circular Dependencies
Probably the nastiest dependency problem is the circular dependency.

The simplest example is that you have a component, A, that depends on another component, B. Unfortunately component B in turn depends on component A.

The key point is that you never begin a project with circular dependencies-they tend to creep in later.

It is possible, but not recommended if you can avoid it, to survive this problem so long as there is a version of component A that you can use to build component B. You can then use the new version of B to build the new version of A. This results in a kind of "build ladder":

<img src="assets/circular-dependency-build-ladder.png">

No build system supports such a configuration out of the box, so you have to hack your toolchain to support it.

Always try to get rid of circular dependencies; but if you find yourself working in a codebase that has them, don't despair-you can use the build ladder as a temporary workaround until you can eliminate the problem.

---
## Managing Binaries
In most cases, components should have binary rather than source-level dependencies on one other.

In this section, we’ll discuss the general principles behind the workings of an artifact repository.

- How an Artifact Repository Should Work
  - The most important property of an artifact repository is that it should not contain anything that cannot be reproduced. You should be able to delete your artifact repository without worrying that you won’t be able to regain anything valuable. Ultimately you’ll need to delete them in order to free up space.
  - So, your version control system needs to contain everything required to re-create any given binary, including the automated build scripts.
  - The simplest artifact repository is a directory structure on disk. Generally, this directory structure will be on a RAID or a SAN, because while artifacts should be disposable, you should be the one deciding that they can be deleted, not some badly behaved piece of hardware. The most important constraint on this directory structure is that it should enable you to to associate a binary with the version from source control that was used to create it.
  - If you don’t want to use a shared drive for your artifact repository, you can add a web service to store and retrieve artifacts. However, if you have reached this point, you should consider using one of the many free or commercial products on the market.

  <table>
    <td>
      <img src="assets/jfrog-repository-types.webp">
      JFrog
    </td>
    <td>
      <img src="assets/nexus-repository-formats.png" width="700">
      Nexus
    </td>
  </table>
- How Your Deployment Pipeline Should Interact with the Artifact Repository
  - Your deployment pipeline implementation needs to do two things: Store artifacts generated by the build process into the artifact repository, and then retrieve them for later use.

---
## Summary
The principle is to ensure that teams get fast feedback on the effect of their changes on the production-readiness of the application:
- Ensure every change is broken down into small, incremental steps which are checked into mainline.
- Break your application down into components.

Until your application gets sufficiently large, there is no need to build your components individually-the simplest thing is to have a single pipeline that builds your whole application at once as the first stage.

If you concentrate on efficient commit builds and fast unit testing, and implement build grids for acceptance testing, your project can grow to a much larger degree that you might think possible. A team of up to **20 people working full-time** for a **couple of years** should **not need to create multiple build pipelines**, although of course they should **still separate their application into components**.

Once you exceed these limits, though, the use of components, dependency-based build pipelines, and effective artifact management are the key to efficient delivery and fast feedback.