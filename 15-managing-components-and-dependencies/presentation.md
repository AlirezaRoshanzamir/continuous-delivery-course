## Continuous Delivery: Managing Components and Dependencies
#### Keeping Application Releasable, <span style="color: purple">Dependencies</span>, <span style="color: purple">Components</span>, Managing Dependency Graph, <span style="color: purple">Managing Binaries</style>

<img src="assets/integration-pipeline.png" width="950"/>

<small><strong>Time to Read:</strong> 16 Minutes</small>, <small><strong>Time to Present:</strong> 75 Minutes</small>
<br>
<small><strong>Created By:</strong> Alireza Roshanzamir</small>
<br>
<small><strong>Keywords:</strong> Continuous Delivery, Continuous Integration, DevOps, Build, Test, Release, Deployment, Automation, Version Control, Deployment Pipeline</small>
<br><br>
<small style="color: darkred"><small>Press **"F"** to go fullscreen; some slides may not display properly otherwise.</small></small>

---
## Introduction
In CD, you should maintain a **releasable application** even during **major refactoring** or **adding complex features**. Using **branching** in version control may **appear as a solution**, but we believe it's **not the right answer**.

A key technique is **componentization** of larger apps. We'll delve into **building** and **managing** multi-component projects in detail.

Component is a **loaded** term in software. Here, it means a fairly **large code structure** within an app with a well-defined **API** that can be replaced with **another implementation**.

Opposite to **component-based (modular)** systems is **monolithic** ones **without clear boundaries**, **lacking encapsulation**, have **tight coupling** between unrelated structures, and **violating the Law of Demeter**.

In **Windows**, a component is normally packaged as a **DLL**. In **UNIX**, it might be an **SO** file, and in **Java**, it's likely a **JAR** file.

Many projects are **fine** with **one** version control **repository** and **a basic deployment pipeline**. But some have turned into **unmanageable code messes** because **no one** decided to create **distinct components** when it was feasible.

Build system **aspects**:
- Deployment Pipeline
- Branches
- Components

**Large systems** often **combine all three**. Components may have **dependencies** and use external libraries, each with **multiple release branches**. Creating a **working system** from these components can be **complex**, but necessary **for the deployment pipeline**.

---
## Keeping Application Releasable
These processes results in **weeks or months release gaps**, **prevents** the application to **always be in a releasable state**:
- **Major architectural changes**: During these activities the application is not releasable.
- **Before release**: Teams focus on bugfixing, not new features. After release, a branch is made, and new development starts on the main trunk.

One approach is creating branches, merged when work's done, to keep mainline releasable. But this **isn't ideal** as **CI isn't happening on branches**.

Instead, we suggest everyone **checks in on the mainline**. But how?
- **Hide** new functionality **until completion**.
- Implement changes gradually in **small**, **releasable** increments.
- Use **branch by abstraction** for significant codebase alterations.
- Use **components** to decouple parts of your application that **change at different rates** (we'll discuss later).

------
### Hide New Functionality Until It Is Finished
What if a feature (a set of features) takes a long time to develop?
- **- Branching**: Start development on a new branch and integrate when the functionality is complete to avoid disrupting ongoing system work, which could delay its release.
- **+ Deploying semi-completed functionalities (with rest of the system)**: Add new features but hide them from users.

For example, introducing hotel bookings on a travel website through a **separate URL** (e.g., /hotel), **deploying with rest** of the system, but **controlling user access** using web server settings.

You can also control access with **configuration settings**. For example, **have two menus**, one with the new feature and one without. Use a setting to **switch** between them via **CLI** or **config (deploy-time or runtime)**. It is also valuable for running automated tests.

It is good practice because it allows **CI** and **testing** of the **entire** system, ensuring **new components** can be **deployed alongside existing software** from the beginning.

------
### Make All Changes Incrementally
**Branching** claims that developers can make large, high-level changes, break the application, and reconnect later to work faster. However, **in practice**, **reintegration can be challenging**, especially with **concurrent team work** and **larger changes**.

**Breaking large changes** into **small**, **incremental** ones can be **tough**, but it ensures that the **application works**, prevents future pains, and allows for flexibility to **stop at any point if necessary**, avoiding the sunk cost of abandoning a big change midway.

**Analysis** is vital for breaking large changes into smaller ones, using a process **like breaking down requirements into smaller tasks**.

------
### Branch by Abstraction
Some changes are **too hard to make incrementally**. Therefore, consider **branching by abstraction** as an **alternative to branching**:
1. Create an **abstraction** over the **part to change**.
2. Refactor the system to **use this abstraction**.
3. Develop a **new implementation** separately.
4. Update the abstraction layer to **delegate to the new implementation**.
5. **Remove** the **old** implementation.
6. **Remove** the **abstraction** if **no longer needed**.

Branch by abstraction can be **high-level** (changing an entire persistence layer) or **low-level** (swapping classes with the strategy pattern). **Dependency injection** also supports it. The **key** is **finding or creating points** for an abstraction layer.

It's ideal for moving from a **messy monolithic to a modular one**. **Pick the part** to separate or rewrite, **manage entry points (facade pattern)**, and **use branch by abstraction** to keep working with the old code while you create a new, modularized version of the same functionality (known as **"sweeping it under the rug"** or **"Potemkin village"**).

At times, finding a **good seam** in code is **tough**, and **branching** is the **only option**. Use it **only to prepare for branch by abstraction**.

For **big changes** (using **any** technique), **rely** on a **full acceptance test** suite. **Unit/component** tests **can't** fully **protect business** functionality during major changes.

---
## Dependencies
A dependency occurs when one software piece **depends** on another to **build** or **run**.

Regarding dependencies, there are **distinctions** between:
- Components and libraries
    - Libraries are software packages **your team doesn't control**, **chosen for use** and **updated infrequently**.
    - Components are software parts your **application relies on**, **made by your team or other teams in your organization**, and **updated more frequently**.
- Build-time and runtime dependencies
    - Build-time dependencies are required during application **compilation and linking (if necessary)**.
    - Runtime dependencies are needed **when the application runs** and performs its regular function.

**Managing dependencies can be hard**. We'll start with an overview of **common runtime library dependency issues**.

------
### Dependency Hell (DLL Hell)
Dependency hell occurs when an application **depends on one version** but is **deployed** with a **different version or none** at all:
- In **older Windows**, DLL hell was common due to **shared libraries (DLLs) lacking versioning**, **causing overwrites of old versions**.
- The **.NET** introduced **versioned assemblies** and a **global assembly cache (GAC)** to address DLL hell on Windows.
- Linux uses **integers in .so files** and **soft links** for version management, needing **testing** or **source compilation** for **compatibility**.
- **Static compilation** bundles dependencies at **compile time** but leads to **large binaries** and **OS version coupling**.
- **Dynamic** languages like Rails **ship frameworks and libraries** with apps to **allow different versions** to coexist.
- **Java** faces **runtime dependency** issues due to **classloader limits**, addressed by the OSGi framework, but managing dependencies at build time is crucial.
- The **diamond dependency** issue arises when an app depends on **two libraries** with **different versions of the same underlying library**, potentially causing runtime problems.

------
### Managing Libraries
Two ways to manage libraries in software projects:
- Check them into version control
  - Suitable for small projects.
  - Traditionally, a lib directory is used for this purpose.
  - Use nunit-2.5.5.dll instead of nunit.dll.
  - Over time, the repository may grow large and messy.
  - Managing transitive dependencies across projects is painful, while package managers aim to address this issue.
- Declare and use tools like Maven or Ivy to download libraries from the Internet or (preferably) your organization's repository
  - <img src="assets/maven-dependency-pom.png" width="300">
  - Transitively resolving dependencies on other projects and avoiding inconsistencies in the project dependency graph.
  - Local caching.
  - Try to maintain your own artifact repository (Nexus, JFrog, etc.).
    - Simplifies library auditing and avoid legal issues, like using GPL-licensed libraries in BSD-licensed software.

**Organize** dependencies into **files/subdirectories/sections** for **build-time**, **test-time**, and **runtime** as well as for **testing**, **linting**, **building (app and docs)**, **development**, **packaging**, and **running** to **avoid duplication** and **improve developer convenience**.

------
### Dependency Pinning (Locking)
Dependency pinning means **fixing** a **library's version** to ensure **consistency** and **prevent updates**. This can also be done **recursively** for project dependencies, keeping the **entire tree locked** to specific versions:

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
When developing a **library**:
- Support a **range of third-party versions** for **compatibility in various** environments.
- **Enforcing a specific version** on clients can **lead to conflicts**.
- **Pinning** is used only during **development** for **faster dependency resolution** (**avoiding backtracking** the graph space).

When developing [and deploying] an **application**:
- **Pin or lock the versions** of the third-party libraries used, specifying exact versions.
- It **enhances reliability and confidence** by reducing the risk of unexpected issues.
- For **shared environments with multiple apps**, consider **isolation if different library versions can't coexist**.

------
### Dependency Refactoring
A valuable feature of dependency managers like Maven, Pants/Pip, etc., is their ability to identify **undeclared or unused declared dependencies** in your project.


**Consolidate common dependencies** (names or only versions) to **avoid duplication**. If your dependency manager lacks direct support, create a **dummy project containing these dependencies** and have your component depend on it:

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
Software systems include various components. These components **may** be **DLL**s, **JAR**s, **OSGi bundle**s, **Perl module**s, and etc.

Most apps **begin as a single component**, while **some start as two or three**, like a **client-server app**, for instance.

If these relationships **aren't managed** well, it can **compromise** the ability to use **them as part of a CI** system.

------
### How to Divide a Codebase into Components
A component is **reusable**, **replaceable** with something else that **implements the same API**, **independently deployable**, and **encapsulates** some **coherent behaviors and responsibilities** of the system.

**Lower bound**: A component should have a **minimum level of complexity** before it can be considered an independent piece of your application (a **class is not a component** and deployed independently).

**Upper bound**: We split a system into components to **boost team and software development efficiency**, because components:
1. Break down the **problem into smaller, clearer parts**.
2. Reflect **different change rates** and lifecycles in the system parts.
3. Motivate to design with **clear duties**, **reducing change impacts** and **enhancing code understanding/modification**.
4. Provide us with additional **degrees of freedom** in **optimizing our build/deployment** process.

Most components have **kind of APIs**: dynamic linking, static linking, web services, file exchange, message exchange, and more. When they treated independent in build/deployment, the interface/behaviour coupling adds complexity.

**Reasons** to separate out a component from your codebase:
1. Part of your codebase needs to be **deployed independently** (for example, a server or a rich client).
2. You want to turn a **monolithic codebase into a core and plugins**, maybe to replace a system part or allow user extensions.
3. The component **provides an interface** to another system (for example a framework or a service which provides an API).
4. It takes **too long to compile and link** the code.
5. Your codebase is too **large to be worked on by a single team**.
   - To speed up development with over ten people, consider splitting the system into separate components and teams.

------
### Continued: How to Divide a Codebase into Components
We **discourage assigning teams to components** as **requirements often don't divide along component boundaries**. **Cross-functional** teams, where people **handle features end-to-end**, are more efficient, despite the seem efficiency of one team per component:
  - **Writing and testing requirements** for **one component is hard** as functions involve multiple components. Grouping teams by components forces them collaborate on features, **increasing communication costs**.
  - Component-focused teams often create **isolated silos** and **local optimizations**, **forgetting** the **project**'s broader goals.
  - A key issue with component teams is the **entire app may not function** until the **project ends** due to no integration.

Split teams to focus on **specific story streams** with a common theme and access necessary components to complete their tasks:
- &shy;<!-- .element: class="fragment fade-in-then-semi-out" -->Organize teams by **functional area** rather than by component.
  - &shy;<!-- .element: class="fragment complete-fade-out custom" --><img src="assets/component-vs-feature-teams.png" width="700">
- &shy;<!-- .element: class="fragment fade-in-then-semi-out" -->**Everybody** has the **right to change** any part of the codebase.
- &shy;<!-- .element: class="fragment fade-in-then-semi-out" -->**Rotate** people between teams regularly.
- &shy;<!-- .element: class="fragment fade-in-then-semi-out" -->Ensure that there is good communication between teams.
- &shy;<!-- .element: class="fragment fade-in-then-semi-out" -->**Everyone** is responsible for making **all components work together**, not just the integration team.
- &shy;<!-- .element: class="fragment fade-in-then-semi-out" -->Try to move from [Feature Team to Product Team](https://wind4change.com/product-team-feature-team-difference-marty-cagan-inspired-empowered)
  - &shy;<!-- .element: class="fragment complete-fade-out custom" --><table>
      <tr>
        <th>Feature Team</th>
        <th>Product Team</th>
      </tr>
      <tr>
        <td>
          - Serve the Business<br>
          - Deliver features<br>
          - Not involved in product discovery<br>
          - Not responsible for impact<br>
          - "Mercenaries"
        </td>
        <td>
          - Partner with Business to serve Customer<br>
          - Solve problems<br>
          - Involved in product discovery<br>
          - Empowered and responsible for impact<br>
          - "Missionaries"
        </td>
      </tr>
    </table>

&shy;<!-- .element: class="fragment fade-in-with-next custom" -->There are **no fixed rules** for component organization, just design principles. Yet, two common **extreme failures** exist:
- Components everywhere
- The one component to rule them all

------
### Continued: How to Divide a Codebase into Components
Conway's Law:
> Organizations which design systems, are constrained to produce designs which are copies of the communication structures of these organizations.
- **Open source** projects where developers communicate **only by email** tend to be **very modular with few interfaces**.
- A product developed by a **small, colocated team** will tend to be **tightly coupled and not modular**.

Be careful of your **development team setup** as it **impacts** your application's **architecture** (**Reverse Conway** Maneuver).

&shy;<!-- .element: class="fragment fade-in-with-next custom" -->You can find more information in the following books and articles:
<table>
  <tr>
    <td><img src="assets/clean-architecture-cover-book.jpg" width="100"/></td>
    <td>
      Clean Architecture: A Craftsman's Guide to Software Structure and Design
      <br />
      <small>by Robert Cecil Martin</small>
    </td>
    <td><img src="assets/principles-of-package-design-cover-book.jpg" width="100"/></td>
    <td>
      Principles of Package Design: Creating Reusable Software Components
      <br />
      <small>by Matthias Noback</small>
    </td>
  </tr>
  <tr>
    <td><img src="assets/mirroring.png" width="100"/></td>
    <td colspan="3">
      Exploring the Duality between Product and Organizational Architectures: A Test of the "Mirroring" Hypothesis
      <br />
      <small>by Alan MacCormack, John Rusnak, Carliss Baldwin</small>
    </td>
  </tr>
</table>

------
### Pipelining Components
A **simple** and **weirdly scalable** approach is **one pipeline** for the **entire app** and its components. **All changes** trigger **full build/testing**.

**Try** to build your system as **one entity** **until feedback becomes too slow**, as **component-based builds add management overhead**.

In **reality**, there are situations where dividing your system into **multiple pipelines is beneficial**:
- Parts of your application may have **different lifecycles** (e.g. you may need build your OS kernel, but only every few weeks).
- **Different and [distributed] teams** work on **separate functional areas** of your app over specific components.
- Components that use **different technologies** or build processes.
- **Shared components** that are used by several other projects.
- Components that are relatively stable and **do not change frequently**.
- If your **app's build is slow**, creating individual component builds can speed up, although it occurs **later than many expect**.

After **binaries** (libraries, executables, etc.) pass through their **mini-release process** (including **publishing to an artifact repository**), they're ready for **integration** into the next build phase.

In general, the **guiding principle** is to **minimize** the **number of builds** you operate.

------
### The Integration Pipeline
The integration pipeline:
1. Begins with the **binary output** from **each component**.
2. Creates **deployable package**(s) by **combining the necessary binaries**.
3. **Deploys** the app in a **production-like environment**, running **smoke tests** to quickly spot **basic integration issues (fail fast)**.
4. Proceeds to **conventional acceptance test stage**, running whole application acceptance tests as usual.

<img src="assets/integration-pipeline.png" width="1000">

------
### Continued: The Integration Pipeline
Principles:
- <!-- .element: class="fragment insides-fade-in-then-out" -->Fast feedback
  - **Long** or **chained pipelines** can impact feedback.
  - One solution here is to **trigger downstream** pipelines **as soon as binaries are created and the unit tests pass**.
- &shy;<!-- .element: class="fragment insides-fade-in-then-out" -->Provide **visibility** into the **status of the build** for **all interested parties**
  - **Backward**: Ability to trace back from an integration build to the versions of each component that contributed to it.
  - **Forward**: The team working on the components should be aware of which versions of their component ended up in a green integration pipeline. These are the **truly "green"** versions of the components.

An example of triggering downstream pipelines in GitLab:  <!-- .element: class="fragment fade-in-with-next" -->

<table>
  <tr>
    <td><img src="assets/gitlab-parent-child-pipelines.jpg" width="490"></td>
    <td><img src="assets/gitlab-parent-child-pipelines-2.png" width="680"></td>
  </tr>
</table>

If **several components** change between integration pipeline **runs**, it's probable that it will spend much of its time broken:
- &shy;<!-- .element: class="fragment insides-fade-in-then-out" -->**Best and simplest approach**: Build **all possible combinations** of good component versions. Suitable when:
  - Your components don't change that often.
  - You have sufficient computing power on your build grid.
- &shy;<!-- .element: class="fragment insides-fade-in-then-out" -->**Next good approach**: Build **as many versions** of your application as you can:
  - Use the latest version of each component to assemble your app as often as possible.
  - If this process is quick, run a brief smoke test for each app version.
  - You could then have some manual way to "Assemble these and create an instance of integration pipeline with them".

---
## Managing Dependency Graphs
**Versioning dependencies** (e.g., libraries and components) is **essential**; otherwise, **reproducing builds becomes impossible**.

Components may depend on other components and third-party libraries. When you draw the dependencies, it **should form a directed acyclic graph (DAG)**.

If your graph has **cycles** you have a **pathological dependency problem**, which we'll address later.

------
### Building Dependency Graphs
In the diagram, **left is "upstream"** and **right is "downstream"** dependency (CDS pricing library is third-party):

<img src="assets/dependency-graph.png" width="700">

Each component **may** have **its own pipeline**. When it **changes**, **triggers a recursive rebuild/test** of **itself and all downstream components** respectively. If any **immediate/intermediate upstream fail**, **downstreams are not initiated**.

Imagine if the **framework and pricing engine change**, requiring a **full graph rebuild**. But, there are **various possibilities**:
- The **happy path** is that all three **intermediate components pass** with the new framework and CDS pricing library versions.
- If **settlement engine fails**, **portfolio management app** should**n't** use **new faulty framework**. So, you **may want** it to use **new pricing engine**, built with **new CDS pricing library** and **old green framework**. But, **no such pricing engine version exists**.

The **key constraint** is the **portfolio app** should use **one framework version**. **Avoid** **pricing engine with one version** and **settlement engine with another**, which causes the **diamond dependency, build-time analgue of the runtime "dependency hell"**:

<img src="assets/dependency-diamond.png">

------
### Pipelining Dependency Graphs
The pipelines should provide **rapid feedback on breakages** and **follow the dependency building rules**:

<img src="assets/component-pipeline.png" width="1000">

- To **speed up** feedback, **dependent projects trigger** when the **commit stage** of each project's pipeline finishes.
- **All triggers are automatic**, except for deployments to manual testing and production environments.

------
### Continued: Pipelining Dependency Graphs
Teams must be able to **trace the origins** of the components in a particular build of the application:

<table>
  <td>
    Visualizing upstream dependencies
    <img src="assets/visualizing-upstream-dependencies.png">
  </td>
  <td>
    Visualizing downstream dependencies
    <img src="assets/visualizing-downstream-dependencies.png">
  </td>
</table>

------
### When Should We Trigger Builds?
The discussed examples **assume** triggering new builds with **any upstream changes**, which is **good but not common** in many teams. They often **update dependencies** when their **codebase is stable**, emphasizing **stability but risking more integration time later**.

Updating dependencies brings **tension**. Staying **updated** give you the **latest features/fixes**, but **integrating each new version** can be **costly due to fixing issues**. Many teams compromise by updating all dependencies **after a release** when the **risks are lower**.

A key consideration when deciding how often to update dependencies is how much you **trust new versions** of these dependencies:
- If you have components depending upon a component **also developed by your team**, fixing API changes is **quick** and **simple**, so **integrating often is best**. For **small** components, having a **single whole application build** is best for the fastest feedback.
- If upstream dependencies are from **another team**, build them **separately in their pipeline**. You can **choose whether** to use the latest version when they update or stick with a specific version based on their **update frequency** and **response to issues**.

Find a **balance** between **quick integration feedback** and **excessive builds** that report irrelevant issues.

------
### Cautious Optimism
This model suggests three **"static"**, **"guarded"**, or **"fluid"** states for **upstream dependencies** in dependency graph:
- **Changes** in **static** upstream dependencies **do not trigger** new builds.
- **Changes** in **fluid** upstream dependencies **always trigger** new builds. If a **fluid dependency update fails**, it **becomes guarded** and the **component sticks to the known-good version of the upstream dependency**.
- A **guarded** upstream dependency is **similar to a static** one, not accepting new changes. However, **it signals an issue** that the development team needs to address with the upstream dependency.

<img src="assets/cautious-optimisim-triggering.png" width="900">

You can begin with an **"informed pessimism" strategy** where **triggers are set to static**, but **notify developers** of **new upstream dependency versions**.

------
### Circular Dependencies
The **worst dependency problem** is the circular dependency, when **component A depends on component B, and B depends on A**.

You may **never begin** a project **with circular dependencies**-they **tend to creep in later**.

You can manage this issue if necessary, though it's **not recommended**. You need **a version of A to build B**, then **use the new B to build the new A**, forming a **"build ladder"**:

<img src="assets/circular-dependency-build-ladder.png" width="380">

Build systems **don't naturally** handle this, so you'll need to tweak your toolchain. You **should only** use the build ladder as a **temporary fix** until you resolve the issue.

---
## Managing Binaries
Usually, components should have **binary rather than source-level dependencies**.

Store **generated build artifacts (binaries, packages, etc.)** in the **artifact repository** for **later [stages] use**:
- An artifact repository's should only contain **reproducible items**. You should be **able to delete it without losing valuable data**, as you'll need to free up space eventually.
- So, your **version control** must include **all needed to recreate binaries**.
- The **simplest** artifact repository is a **directory structure on disk**, ideally on RAID or SAN to prevent unexpected data loss. It should **enable linking a binary to the source control version that created it**.
- If a shared drive isn't your choice, you can use a **web service for storing and retrieving artifacts**. At this point, consider using available **free or commercial solutions**.

<table>
  <td>
    JFrog
    <img src="assets/jfrog-repository-types.webp" width="500">
  </td>
  <td>
    Nexus
    <img src="assets/nexus-repository-formats.png" width="700">
  </td>
</table>

---
## Summary
The principle is to ensure teams get **fast feedback** on the **effect of their changes** on the **production-readiness of the application**:
- Ensure **every change** is **broken down into small**, **incremental steps** which are checked into mainline.
- **Break** your application down into **components**.

**Until your application becomes large**, you can **use a single pipeline** to **build the entire application** in the initial stage.

Emphasizing on **fast commit builds/unit-testing** and **acceptance testing grids** can drive **significant project growth**. A team of up to **20 full-time people** over a **couple of years** need'**nt create multiple pipelines** but should **still separate their app into components**.

Exceeding these limits needs **components**, **dependency-based pipelines**, and **artifact management** for better delivery/feedback.
