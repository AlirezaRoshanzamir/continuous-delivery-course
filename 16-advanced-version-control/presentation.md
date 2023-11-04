## Continuous Delivery: Advanced Version Control
#### <span style="color: purple">Brief history</span>, Branching and Merging, Distributed Version Control Systems (DVCS), Stream-Based Version Control Systems, <span style="color: purple">Branching Patterns</span>, <span style="color: brown">Popular Branching Policies</span>

<table>
  <tr>
    <td><img src="assets/feature-branch-development.webp"></td>
    <td><img src="assets/trunk-based-development.webp"></td>
  </tr>
</table>

<small><strong>Time to Read:</strong> 13 Minutes</small>, <small><strong>Time to Present:</strong> 60 Minutes</small>
<br>
<small><strong>Created By:</strong> Alireza Roshanzamir</small>
<br>
<small><strong>Keywords:</strong> Continuous Delivery, Continuous Integration, DevOps, Build, Test, Release, Deployment, Automation, Version Control, Deployment Pipeline</small>
<br>
<small style="color: darkred"><small>Press **"F"** to go fullscreen; some slides may not display properly otherwise.</small></small>

---
## Introduction
&shy;<!-- .element class="fragment fade-in" -->Version control systems (aka source control, revision control systems) keep a full **history of changes** and help teams **collaborate** on different application parts while preserving the definitive codebase.

&shy;<!-- .element class="fragment fade-in" -->The aim of this chapter is to examine how teams can **work productively with version control**.

&shy;<!-- .element class="fragment fade-in-with-next custom" -->In short, in our opinion, there are three **acceptable reasons to branch** your code:
- &shy;<!-- .element: class="fragment insides-fade-in" -->**Releasing a new version** of your application.
  - &shy;<!-- .element: class="fragment highlight-current-blue" -->Lets **developers work on new features** without impacting the stable public release.
  - &shy;<!-- .element: class="fragment highlight-current-blue" -->**Bugs are fixed** in the relevant **public release branch first** and **then applied to the mainline**.
- &shy;<!-- .element: class="fragment insides-fade-in" -->When you need to **spike out** a new **feature/refactoring**.
  - &shy;<!-- .element: class="fragment highlight-current-blue" -->The spike branch gets **thrown away** and is **never merged**.
- &shy;<!-- .element: class="fragment insides-fade-in" -->**Short-lived** branch for **large changes** to the application that **can't be done using other methods like branch by abstraction**.
  - &shy;<!-- .element: class="fragment highlight-current-blue" -->An **extremely rare** scenario if your codebase is well structured.
  - &shy;<!-- .element: class="fragment highlight-current-blue" -->The sole purpose is to get the code to a state that **make incremental changes or branch by abstraction possible**.

---
## Brief History
<img src="assets/vcs-history.png">

---
## Branching and Merging
<img src="assets/branch-merge-meme.jpeg" class="fragment start" width="650">

&shy;<!-- .element: class="fragment fade-in-with-next custom" -->Creating branches (or streams) in a codebase is a **first-class** feature of every VCS, allowing **concurrent work without interference**:

<img src="assets/git-branch.png">

&shy;<!-- .element: class="fragment fade-in" -->Teams use branches for many reasons, often overlapping: **Physical**, **Functional**, **Environmental**, **Organizational**, and **Procedural**.

&shy;<!-- .element: class="fragment fade-in" -->In most cases where you branch, your entire codebase is going to **evolve separately** in **each branch**.

&shy;<!-- .element: class="fragment fade-in" -->Branching may **seem** to be a solution to **issues in software development** for **large teams**. But, **merging** branches highlights the need of **planning and processes** for each branch, including **policies**, **roles**, and **contributor access**:
- &shy;<!-- .element: class="fragment fade-in" -->A **small** team may have a **mainline open to all developers** and a **release branch controlled by the testing team**.
- &shy;<!-- .element: class="fragment fade-in" -->**Larger** ones may have **mainlines for components**, plus **integration/release/maintenance branches managed by operations**.

------
### Merging
&shy;<!-- .element: class="fragment fade-in-with-next custom" -->Merging takes time, but **VCS tools** can help when dealing with **conflicting** branch changes:

<img src="assets/merge-conflict-resolution-tool.png" width="1000">

&shy;<!-- .element: class="fragment fade-in" -->Resolving conflicts from **long merge gaps** may need extensive **code rewrites** and **discussions**, **weeks after the code** was written.

&shy;<!-- .element: class="fragment fade-in" -->**Semantic conflicts** not detected by version control systems can be especially **troublesome**.

------
### Continued: Merging
The **longer you delay merging** and involve **more people**, the **more challenging** it becomes:

<img src="assets/leroy-branch.jpg">

------
### Early/Deferred Branching
&shy;<!-- .element: class="fragment highlight-current-blue" -->Early branching (aka branch early and often):
- Create **more branches** to reduce the number of changes made to a given branch.
- For example, create a **branch every time you start** working on a feature.
- However, this means extra work to track all the branches, delaying future merges.
- <img src="assets/early-branching.gif">

&shy;<!-- .element: class="fragment highlight-current-blue" -->Deferred branching (aka lazy branching, and late branching):
- Be **parsimonious** about creating branches, perhaps creating a branch per release.
- To ease merging, **merge frequently**. Remember to do it regularly, like daily, for instance.
- <img src="assets/deferred-branching.gif">

------
### Branches, Streams, and Continuous Integration
<img src="assets/lean-inventory-waste.jpg" class="fragment start" width="900">

&shy;<!-- .element: class="fragment fade-in" -->There is a **tension** between using **branches and CI**.

&shy;<!-- .element: class="fragment fade-in" -->Some argue that branch work is **waste**, in the lean sense, **waste-inventory** that is not yet used in the final product.

<table class="fragment fade-in">
  <tr>
    <th>Poorly controlled branching</th>
    <th>More manageable branching</th>
  </tr>
  <tr>
    <td>
      <img src="assets/poorly-controlled-branching.png" width="700">
    </td>
    <td>
      <img src="assets/release-branching-strategy.png" width="700">
    </td>
  </tr>
</table>

&shy;<!-- .element: class="fragment fade-in" -->Things get much **worse** if merges are postponed until the **release's end**. In some projects, we've witnessed **weeks of conflict resolution and application setup** just to begin testing.

---
## Distributed Version Control Systems (DVCS)
<img src="assets/centralization-here-i-meme.jpg" class="fragment start">

&shy;<!-- .element: class="fragment fade-in" -->Several open-source DVCSs, like **Git** and **Mercurial**, are available. In this section, we'll explore their unique features and usage.

------
### What Is a Distributed Version Control System?
In DVCS, **each user** has a **standalone repository** on their computer, and a **conventional central repository** is used for **CI**. It offers:
- &shy;<!-- .element: class="fragment highlight-current-blue" -->**Quick setup**: Install it, commit changes locally.
- &shy;<!-- .element: class="fragment highlight-current-blue" -->**Individual updates**: Pull changes from others without a central repository.
- &shy;<!-- .element: class="fragment highlight-current-blue" -->**Selective pushes**: Share updates with specific users.
- &shy;<!-- .element: class="fragment highlight-current-blue" -->**Efficient patch handling**: Propagating patches among users for approval/rejection (aka cherry-picking).
- &shy;<!-- .element: class="fragment highlight-current-blue" -->**Offline work**: Commit changes without internet access.
- &shy;<!-- .element: class="fragment highlight-current-blue" -->**Incremental commits**: Safely save incomplete work locally without affecting others.
- &shy;<!-- .element: class="fragment highlight-current-blue" -->**Flexible commit management**: Rearrange and batching commits (aka rebasing).
- &shy;<!-- .element: class="fragment highlight-current-blue" -->**Easy experimentation**: Try ideas without creating a branch in central repos.
- &shy;<!-- .element: class="fragment highlight-current-blue" -->**Scalability**: Central repo is less burdened.
- &shy;<!-- .element: class="fragment highlight-current-blue" -->**High availability**: Establish and sync local proxy repos.
- &shy;<!-- .element: class="fragment highlight-current-blue" -->**Fault tolerance**: Multiple full copies enhance resilience.

&shy;<!-- .element: class="fragment fade-in" -->If DVCS feels like **everyone** having **their own SCCS or RCS**, **that's correct**!

------
### Continued: What Is a Distributed Version Control System?
It's a paradigm shift. Instead of **sending patches to a project owner**, people publish their versions for **experimentation**. This speeds up project evolution and accelerates feature/bugfix delivery. Clever ideas become usable, **reducing commit access bottlenecks**.

<img src="assets/dvcs-repository-tree.png" width="900">

------
### A Brief History of Distributed Version Control Systems
<img src="assets/linus-torvalds-git-meme.jpeg" class="fragment start">

&shy;<!-- .element: class="fragment fade-in" -->The **Linux kernel** was initially developed **without VCS**. Linus Torvalds shared code as **tarballs** and received changes as **patches**.

&shy;<!-- .element: class="fragment fade-in" -->In December 1999, Linux PowerPC adopted **BitKeeper**, a **proprietary DVCS**. Linus embraced it in February 2002, despite it not being open source, calling it the **best tool**. It was the **first widely used DVCS**, built **on SCCS**, treating **changes as first-class objects**.

&shy;<!-- .element: class="fragment fade-in" -->After that, open source DVCS projects emerged. Popular DVCSs include **Git** (created by **Linus Torvalds to maintain the Linux kernel**), **Mercurial** (by **Mozilla**, **OpenSolaris**, and **OpenJDK**), and **Bazaar** (by **Ubuntu**).

------
### Setup a Remote Git Repository on Ubuntu
You can setup a remote Git repository by (from [here](https://www.geeksforgeeks.org/how-to-setup-git-server-on-ubuntu/)):

- &shy;<!-- .element: class="fragment highlight-current-blue" -->Installing Git:

  <pre class="console"><code>sudo apt-get install git</pre></code>

- &shy;<!-- .element: class="fragment highlight-current-blue" -->Creating a new user to manage the repositories:

  <pre class="console"><code>sudo adduser git</pre></code>

- &shy;<!-- .element: class="fragment highlight-current-blue" -->Creating a repository directory and changing the ownership of the directory to the git user:

  <pre class="console"><code>sudo mkdir /usr/local/git
  sudo chown git:git /usr/local/git
  </pre></code>

- &shy;<!-- .element: class="fragment highlight-current-blue" -->Switching to the git user and initializing a new bare repository:

  <pre class="console"><code>su -l git
  git init -bare myproject.git
  </pre></code>

- &shy;<!-- .element: class="fragment highlight-current-blue" -->Configuring SSH access for the git user:

  <pre class="console"><code>ssh-keygen -t rsa -b 4096
  echo "ssh-rsa <your-public-key>" >> ~/.ssh/authorized_keys
  echo "AllowUsers git" >> /etc/ssh/sshd_config
  </pre></code>

- &shy;<!-- .element: class="fragment highlight-current-blue" -->Cloning the repository from the server:

  <pre class="console"><code>git clone git@server:/usr/local/git/myproject.git</pre></code>

------
### Distributed Version Control Systems in Corporate Environments
<img src="assets/svn-to-git-meme.jpeg" class="fragment start">

&shy;<!-- .element: class="fragment fade-in-with-next custom" -->Besides being **conservative**, some people have **concerns** about using DVCSs in companies:
- &shy;<!-- .element: class="fragment highlight-current-blue" -->Unlike centralized systems, DVCS stores the **entire history with local copies**.
- &shy;<!-- .element: class="fragment highlight-current-blue" -->**Auditing and workflow** are less defined in DVCS
  - Centralized systems require users to **check changes into a central repository**.
  - In DVCS, users can **send changes to each other** and **alter local history without central tracking**.
- &shy;<!-- .element: class="fragment highlight-current-blue" -->Git actually allows to **change history**, which can be problematic in regulated corporate environments. 
  - But you can **disable** it on most **VC Repository Hosting Platforms** (**GitLab**, **GitHub**, **BitBucket**, **Azure DevOps**, etc.).

&shy;<!-- .element: class="fragment fade-in-with-next custom" -->Once a **central repository is designated**, **all** of the properties of a centralized version control system are **available**:

<img src="assets/centralized-vs-decentralized-vcs.jpg">

------
### Using Distributed Version Control Systems
The key difference between distributed and centralized VCSs is that in DVCS, when you **commit**, it's to your **local copy** or branch. To share changes, you must perform **two extra actions**: **pulling** changes from a remote repository and **pushing** changes to it:

<table>
  <tr>
    <th>Subversion (Centralized VCS)</th>
    <th>Mercurial (Distributed VCS)</th>
  </tr>
  <tr>
    <td>
      <ol>
        <li><strong>svn up</strong>: Get the most recent revision.</li>
        <li><strong>Write some code.</strong></li>
        <li><strong>svn up</strong>: Merge my changes with any new updates to the central repo and fix any conflicts.</li>
        <li><strong>Run the commit build locally.</strong></li>
        <li><strong>svn ci</strong>: Check my changes into version control.</li>
      </ol>
    </td>
    <td>
      <ol>
        <li><strong>hg pull</strong>: Get the remote repo updates to your local one.</li>
        <li><strong>hg co</strong>: Update your working copy from your local repo.</li>
        <li><strong>Write some code.</strong></li>
        <li><strong>hg ci</strong>: Save your changes to your local repo.</li>
        <li><strong>hg pull</strong>: Get any new updates from the remote repo.</li>
        <li><strong>hg merge</strong>: This will update your local working copy with the results of the merge, but will not check in the merge.</li>
        <li><strong>Run the commit build locally.</strong></li>
        <li><strong>hg ci</strong>: This checks in the merge to your local repo.</li>
        <li><strong>hg push</strong>: Push your updates to the remote repo.</li>
      </ol>
    </td>
  </tr>
</table>

&shy;<!-- .element: class="fragment fade-in-with-next custom" -->You can **repeat steps 1-8** (in DVCs) **before moving to step 9** for sending your changes to the CI build. In **Mercurial** and **Git**, there's a feature called **"rebasing"** to **consolidate changes into a single commit for the master repository**.

<table>
  <tr>
    <td><img src="assets/git-merge.jpg" width="550"></td>
    <td><img src="assets/git-rebase.jpg" width="550"></td>
  </tr>
</table>

------
### Conitunued: Using Distributed Version Control Systems
DVCS workflow:

<table>
  <tr>
    <td>
      Mercurial
      <img src="assets/hg-workflow.png" width="600">
    </td>
    <td>
      Git
      <img src="assets/git-commands.png">
    </td>
  </tr>
</table>

---
## Stream-Based VCS
Stream-based VCSs like ClearCase and AccuRev aim to ease merging by allowing **applying changes to multiple branches at once**.

&shy;<!-- .element: class="fragment fade-in" -->Streams **replace branches** and **can inherit changes**. When you modify a stream, all its **descendant streams inherit those changes**.

&shy;<!-- .element: class="fragment fade-in" -->You **promote** the change in your branch to the common **ancestor** of branches needing the change. **Consumers** then update to receive these changes and create a new build with the change.

<table>
  <td><img src="assets/stream-based-development.png" width="470"></td>
  <td><img src="assets/stream-based-development-2.png"></td>
</table>

------
### Continued: Stream-Based VCS
&shy;<!-- .element: class="fragment fade-in" -->Changes in one stream don't affect other streams **until promoted**. Once promoted, they become **visible to all inheriting streams**.

&shy;<!-- .element: class="fragment fade-in" -->Without stream-based tools, you must **merge a bugfix manually** to apply it to all other branches simultaneously.

&shy;<!-- .element: class="fragment fade-in" -->In the stream development model, **promotion occurs at the source level, not the binary level**. As a result, each promotion requires checking out the source and **rebuilding the binary** (the problem exists with other branching models like branch by team).

&shy;<!-- .element: class="fragment fade-in-with-next" -->The Linux kernel developers use a similar process with **Git and branches**. Each branch has an **owner responsible for stability**, and **Linus Torvalds** oversees the **"release stream"**. In this hierarchy, changes are **pulled** by stream owners, **not pushed** to them:

<img src="assets/linux-kernel-development-hierarchy-2.ppm" width="800">

---
## Branching/Merging/Integration Patterns
In this section, we'll explore different branching/merging patterns, their pros and cons, and when to use them.

Some information is from Martin Fowler's highly recommended post on [Patterns for Managing Source Code Branches](https://martinfowler.com/articles/branching-patterns.html):

<img src="assets/martin-fowler-branching-patterns.png" width="630">

------
### Develop on Mainline (aka Mainline Integration)
In this pattern, developers almost always **check in to mainline**. Branches are used only **rarely**. The benefits include:
- &shy;<!-- .element: class="fragment highlight-current-blue" -->Ensuring that all code is **continuously integrated**.
- &shy;<!-- .element: class="fragment highlight-current-blue" -->Ensuring developers **pick up each others' changes immediately**.
- &shy;<!-- .element: class="fragment highlight-current-blue" -->**Avoiding "merge hell"** and "integration hell" at the end of the project.

<img src="assets/mainline-integration-integrate.png">

------
### &#9733; Continuous Integration [to Mainline]
If you do the **Mainline Integration** continuously, it becomes the **Continuous Integration** pattern:

> Developers do mainline integration as soon as they have a healthy commit they can share, usually less than a day's work

<table>
  <tr>
    <td>
      Low Frequency<br>
      <img src="assets/low-freq-conflict.png">
    </td>
    <td>
      High Frequency<br>
      <img src="assets/high-freq-conflict.png">
    </td>
  </tr>
</table>

------
### Branch for Release (aka Release Branch)
The time it's okay to create a branch is **just before a release**. After creating the release branch, testing, validation, and bugfixes of the release is done, while **new development continues on the mainline**:

<table>
  <tr>
    <td><img src="assets/release-branching-strategy.png" width="1000"></td>
    <td><img src="assets/apply-to-release.png"></td>
  </tr>
</table>

In this pattern:
- &shy;<!-- .element: class="fragment highlight-current-blue" -->Features are developed on the **mainline**.
- &shy;<!-- .element: class="fragment highlight-current-blue" -->A branch is created when code is **feature-complete for a release**, and work on new features begins.
- &shy;<!-- .element: class="fragment highlight-current-blue" -->Only **critical defect fixes** are committed on release branches and **merged into the mainline right away**.
- &shy;<!-- .element: class="fragment highlight-current-blue" -->When you perform an actual release, this branch is **optionally tagged**.

------
### &#9733; Release-Ready Mainline (Mixed Mainline and Healthy Branch Patterns)
With a **high release frequency**, around once a week, branching for releases may **no longer be necessary**:
- &shy;<!-- .element: class="fragment highlight-current-blue" -->Releasing a new software version is **cheaper** and easier than patching the release branch.
- &shy;<!-- .element: class="fragment highlight-current-blue" -->The **deployment pipeline**, with commit **tags**, **tracks release history**.

&shy;<!-- .element: class="fragment fade-in" -->So, **keep mainline sufficiently healthy** that the **head of mainline** can always be put **directly into production**.

<img src="assets/mainline-release.png" width="600">

<img src="assets/healthy-mainline-meme.jpeg" class="fragment end">

------
### Branch by Feature (aka Feature Branching)
<img src="assets/falling-down-joke-meme.jpg" class="fragment start">

&shy;<!-- .element: class="fragment fade-in" -->In this pattern, **stories/features** are developed on **separate branches**, and upon passing tests, they **merge into the mainline**.

&shy;<!-- .element: class="fragment fade-in" -->This pattern aims to keep the **mainline always releasable**, so development occurs on branches to **avoid interference with other developers or teams**. Also, some developers prefer to keep their work **private** until it's **fully completed**.

&shy;<!-- .element: class="fragment fade-in-with-next custom" -->Additionally, it **enriches VC history** when each **commit** represents a **whole feature/bugfix** (using **Squash merging**).

<img src="assets/squash-vs-merge.jpeg" width="800">

&shy;<!-- .element: class="fragment fade-in-with-next" -->For this pattern **to be effective**, several **prerequisites** are essential:
- &shy;<!-- .element: class="fragment highlight-current-blue" -->**Daily merging** of **mainline** changes **into all branches**.
- &shy;<!-- .element: class="fragment highlight-current-blue" -->**Short-lived** branches, ideally lasting a **few days**, **never more than an iteration**.
- &shy;<!-- .element: class="fragment highlight-current-blue" -->**Limited active branches**, matching the number of ongoing stories.
- &shy;<!-- .element: class="fragment highlight-current-blue" -->**Testing** and acceptance of stories **before merging**.
- &shy;<!-- .element: class="fragment highlight-current-blue" -->**Immediate** merging of **refactorings** to minimize conflicts.
- &shy;<!-- .element: class="fragment highlight-current-blue" -->The **tech lead** is responsible for a **releasable trunk** (by reviewing and rejecting disruptive changes).

------
### Continued: Branch by Feature (aka Feature Branching)
**Open source** projects on platforms like GitHub **speed up development** through **feature branches**. This works because:
- &shy;<!-- .element: class="fragment highlight-current-blue" -->Managed by a **small team** of **experienced developers** with authority to accept or reject patches.
- &shy;<!-- .element: class="fragment highlight-current-blue" -->**Flexible release dates**, giving committers the freedom to **reject suboptimal patches** (less common in commercial products).

&shy;<!-- .element: class="fragment fade-in-with-next custom" -->This pattern is **effective** in **open-source world** and **small, experienced core teams in commercial projects**. But, for **larger projects**, it **works when**:
- &shy;<!-- .element: class="fragment highlight-current-blue" -->Codebase is **modular** and well-structured.
- &shy;<!-- .element: class="fragment highlight-current-blue" -->Delivery team is **divided into small**, with **experienced leaders**.
- &shy;<!-- .element: class="fragment highlight-current-blue" -->Whole team is **committed to frequent mainline integration**.
- &shy;<!-- .element: class="fragment highlight-current-blue" -->The delivery team **isn't rushed to release**, so they can make better decisions.

&shy;<!-- .element: class="fragment fade-in" -->Even **ninja-level agile** teams can **struggle** with this, so it's better to **begin** with the **"develop on mainline" approach**, then, if you want to try branching by feature, **stick to the rules**.

&shy;<!-- .element: class="fragment fade-in-with-next custom" -->However, be aware that you are **"running with scissors"** when you adopt this pattern.

<img src="assets/running-with-scissors.png" width="200">

------
### Branch by Team (aka Team Integration Branch)
This pattern tackles the issue of managing a **large developer team** across **multiple work streams** while **maintaining a releasable mainline** (like branch by feature pattern).

Branches are created for **teams**, merging into the trunk only when **stable**. Merges to one branch should **promptly update all others**:

<img src="assets/branch-by-team.png" width="800">

&shy;<!-- .element: class="fragment fade-in-with-next custom" -->Here is the workflow for branching by team:
1. &shy;<!-- .element: class="fragment highlight-current-blue" -->Create small teams, each working on its own branch.
2. &shy;<!-- .element: class="fragment highlight-current-blue" -->Once a feature/story is completed, the branch is stabilized and merged to trunk.
3. &shy;<!-- .element: class="fragment highlight-current-blue" -->Any changes on trunk get merged to every branch daily.
4. &shy;<!-- .element: class="fragment highlight-current-blue" -->Unit and acceptance tests are run on every check-in on the branch.
5. &shy;<!-- .element: class="fragment highlight-current-blue" -->All tests, including integration tests, are run on trunk every time a branch is merged into it.

------
### Continued: Branch by Team (aka Team Integration Branch)
This pattern is **effective** when:
- &shy;<!-- .element: class="fragment highlight-current-blue" -->Multiple **small**, relatively **independent teams** work on **separate areas** of the system.
- &shy;<!-- .element: class="fragment highlight-current-blue" -->Each branch has an **owner** responsible for **setting and managing policies**, including check-in control.

&shy;<!-- .element: class="fragment fade-in" -->From a CI perspective, this approach's drawback is that the **unit of work** is an **entire branch**, not just an individual change.

&shy;<!-- .element: class="fragment fade-in" -->The **Linux kernel** team uses this pattern; **separate repositories (logical branches)** for various parts (e.g. scheduler and networking).

&shy;<!-- .element: class="fragment fade-in" -->Infrequent merges can harm this pattern, compromising CI. So, teams should **merge to the trunk after each story** and **daily from it**.

&shy;<!-- .element: class="fragment fade-in-with-next" -->In practice, this pattern is like branch by feature but with:
- &shy;<!-- .element: class="fragment highlight-current-blue" -->**+Pros**: There are **fewer branches**, so integration happens **more frequently**-at the team level at least.
- &shy;<!-- .element: class="fragment highlight-current-blue" -->**-Cons**: Brranches **diverge much more rapidly**, because a whole team is checking in to each branch.

------
### Other Patterns
<img src="assets/patterns-meme.jpg" class="fragment start">

- <!-- .element: class="fragment insides-fade-in-then-out custom highlight-current-blue" -->Maturity Branch
  - A branch whose head marks the latest version of a level of maturity of the code base.
  - <table>
      <tr>
        <td><img src="assets/production-branch.png"></td>
        <td>
          Variation: Long Lived Release Branch<br>
          <img src="assets/long-running-release.png">
        </td>
      </tr>
    </table>
- <!-- .element: class="fragment insides-fade-in-then-out custom highlight-current-blue" -->Environment Branch
  - Configure a product to run in a new environment by applying a source code commit.
  - <table>
      <tr>
        <td><img src="assets/environment-branch.png"></td>
        <td><img src="assets/environments-branch-3.png"></td>
      </tr>
    </table>
- <!-- .element: class="fragment insides-fade-in-then-out custom highlight-current-blue" -->Hotfix Branch
  - A branch to capture work to fix an urgent production defect.
  - <img src="assets/hotfix-branch.png">
- <!-- .element: class="fragment insides-fade-in-then-out custom highlight-current-blue" -->Experimental Branch
  - Collects together experimental work on a code base, that's not expected to be merged directly into the product.
- <!-- .element: class="fragment insides-fade-in-then-out custom highlight-current-blue" -->Future Branch
  - A single branch used for changes that are too invasive to be handled with other approaches.
- <!-- .element: class="fragment insides-fade-in-then-out custom highlight-current-blue" -->Collabration Branch
  - A branch created for a developer to share work with other members of the team without formal integration.
  - A collaboration branch is usually temporary and closed off once the work in integrated into mainline.
- <!-- .element: class="fragment insides-fade-in-then-out custom highlight-current-blue" -->Pre-Integration Review
  - Every commit to mainline is peer-reviewed before the commit is accepted.

------
### SCM Patterns Perspective
Some of SCM patterns and their relationships (from [here](https://www.bradapp.com/acme/branching/scm-pats-intro.html)):

<img src="assets/scm-patterns.gif" width="600">

---
## Popular Branching Policies
Lots of branching approaches have been described over the years. But, there are many branching policies which gathers these patterns and some other rules and concepts together:
- Gitflow
- GitHub Flow
- Trunk-Based Development

------
### Gitflow
[Gitflow](https://nvie.com/posts/a-successful-git-branching-model/) has become one of the most common branching policies which was written by Vincent Driessen in 2010.

&shy;<!-- .element: class="fragment fade-in" -->Gitflow uses **Mainline** (referred to as "develop") in a single "origin" repository, **Feature Branching** to coordinate developers, and encourages personal repositories as **Collaboration Branches** for coordination on similar work.

&shy;<!-- .element: class="fragment fade-in" -->In traditional Git, the core branch is named "master". In Gitflow, "master" serves as a Production **Maturity Branch**. Gitflow also uses a **Release Branch** for transitioning work from "develop" to "master". Hotfixes are managed through **Hotfix Branch**es.

&shy;<!-- .element: class="fragment fade-in" -->Gitflow doesn't specify feature branch length or integration frequency. It doesn't specify if the mainline should be a **Healthy Branch** or not. The presence of release branches suggests it **isn't** a **Release-Ready Mainline**.

<img src="assets/gitflow.png">

------
### GitHub Flow
Many who claim to use Gitflow often follow a different approach. In reality, their practice aligns more closely with GitHub Flow.

&shy;<!-- .element: class="fragment fade-in" -->GitHub Flow assumes one version in production, frequently integrating onto a **Release-Ready Mainline**. The **Release Branch** and **Hotfix Branch** are **unnecessary** and the production issues are fixed in the same way as regular features.

&shy;<!-- .element: class="fragment fade-in" -->In GitHub, the pull-request mechanism is a part of **Mainline Integration**, involving **Pre-Integration Review**.

<img src="assets/github-flow.png">

------
### Trunk-Based Development
We have talked a lot about its practices (**incremental changes**, **branch by abstraction**, etc.) in the **previous sessions**.

&shy;<!-- .element: class="fragment highlight-current-blue" -->Trunk-based development (from [here](https://trunkbaseddevelopment.com/))
<table>
  <tr>
    <td>
      Without feature branching (for smaller teams):
      <br>
      <img src="assets/trunk-based-development-for-small-teams.png" width="800">
    </td>
    <td>
      With short-lived feature branching (Scaled):
      <br>
      <img src="assets/trunk-based-development-at-scale.png" width="800">
    </td>
  </tr>
</table>

&shy;<!-- .element: class="fragment highlight-current-blue" -->You may use short-lived **Feature Branching** and **Release Branch** or **Release-Ready Mainline**.

---
## Summary
Controlling assets in software development is crucial for **project success**, **regardless of its size**.

&shy;<!-- .element: class="fragment fade-in-with-next custom" -->In GitHub, the pull-request mechanism is a part of **Mainline Integration**, involving **Pre-Integration Review**.We focus on version control patterns for two reasons:
1. They are integral to designing your **deployment pipeline**.
2. **Poor** version control practices often **hinder fast, low-risk releases**.

&shy;<!-- .element: class="fragment fade-in-with-next custom" -->We've invested time in comparing various **VCS paradigms**:
- Centralized model
- Distributed model
- Stream-based model

&shy;<!-- .element: class="fragment fade-in" -->There's a fundamental **tension** between **CI and branching**. Each branching decision involves some **compromise**.
