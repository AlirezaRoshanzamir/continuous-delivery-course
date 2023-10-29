## Continuous Delivery: Advanced Version Control
#### <span style="color: purple">Brief history</span>, Branching and Merging, Distributed Version Control Systems (DVCS), Stream-Based Version Control Systems, <span style="color: purple">Branching Patterns</span>, <span style="color: brown">Popular Branching Policies</span>

<img src="assets/gitflow.png" width="650"/>

<small><strong>Time to Read:</strong> ? Minutes</small>, <small><strong>Time to Present:</strong> ? Minutes</small>
<br>
<small><strong>Created By:</strong> Alireza Roshanzamir</small>
<br>
<small><strong>Keywords:</strong> Continuous Delivery, Continuous Integration, DevOps, Build, Test, Release, Deployment, Automation, Version Control, Deployment Pipeline</small>
<br>
<small style="color: darkred"><small>Press **"F"** to go fullscreen; some slides may not display properly otherwise.</small></small>

---
## Introduction
Version control systems (aka source control, revision control systems) keep a full history of changes and help teams collaborate on different application parts while preserving the definitive codebase.

The aim of this chapter is to examine how teams can work productively with version control.

There are three good reasons to branch your code:
- Releasing a new version of your application.
  - Lets developers work on new features without impacting the stable public release.
  - Bugs are fixed in the relevant public release branch first and then applied to the mainline.
- When you need to spike out a new feature/refactoring; the spike branch gets thrown away and is never merged.
- Short-lived branch for large changes to the application that can't be done using other methods like branch by abstraction.
  - An extremely rare scenario if your codebase is well structured.
  - The sole purpose is to get the code to a state that make incremental changes or branch by abstraction possible.

---
## Brief History

<img src="assets/vcs-history.png">

---
## Branching and Merging
The ability to create branches (or streams) in a codebase is a first-class feature of every VCS.

Branches primarily enable parallel development, allowing simultaneous work on multiple streams without interference.

Teams create branches for many reasons, which may overlap: Physical, Functional, Environmental, Organizational, and Procedural.

In most cases where you branch, your entire codebase is going to evolve separately in each branch.

Branching may seem like a great way to solve many problems affecting the process of software development on large teams.

Merging branches highlights the need of planning and processes for each branch, including policies, roles, and contributor access:
- A small team may have a mainline open to all developers and a release branch controlled by the testing team.
- Larger ones might have mainlines for components, plus integration/release/maintenance branches managed by operations.

------
### Merging
Merging can be very time-consuming, although pretty much every VCS on the market has some functionality to make it easier.

The real problem arises when two different and conflicting changes have been made in the two branches that you want to merge.

Long gaps between merges can lead to merge conflicts. Resolving them may require substantial code rewrites and discussions among authors, which may occur weeks after the original code was written.

Semantic conflicts not detected by version control systems can be especially troublesome.

The longer you delay merging and involve more people, the more challenging it becomes.

------
### Early/Deferred Branching
Early branching (aka branch early and often):
  - Create more branches to reduce the number of changes made to a given branch.
  - For example, create a branch every time you start working on a feature.
  - However, this means extra work to track all the branches, delaying future merges.
  - <img src="assets/early-branching.gif">

Deferred branching (aka lazy branching, and late branching):
  - Be parsimonious about creating branches, perhaps creating a branch per release.
  - To ease merging, merge frequently. Remember to do it regularly, like daily, for instance.
  - <img src="assets/deferred-branching.gif">

------
### Branches, Streams, and Continuous Integration
There is a tension between using branches and CI.

Some argue that branch work is waste, in the lean sense, waste-inventory that is not yet used in the final product.

<table>
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

Things get much worse if merges are postponed until the release's end. In some projects, we've witnessed weeks of conflict resolution and application setup just to begin testing.

---
## Distributed Version Control Systems (DVCS)
Several open-source DVCSs, like Git and Mercurial, are available. In this section, we'll explore their unique features and usage.

------
### What Is a Distributed Version Control System?
In DVCS, each user maintains a standalone repository on their computer, and a conventional central repository is used for CI. It offers:
- Quick setup: Install it, commit changes locally.
- Individual updates: Pull changes from others without a central repository.
- Selective pushes: Share updates with specific users.
- Efficient patch handling: Propagating patches among users for approval/rejection (aka cherry-picking).
- Offline work: Commit changes without internet access.
- Incremental commits: Safely save incomplete work locally without affecting others.
- Flexible commit management: Rearrange and batching commits (aka rebasing).
- Easy experimentation: Try ideas without creating a branch in central repos.
- Scalability: Central repo is less burdened.
- High availability: Establish and sync local proxy repos.
- Fault tolerance: Multiple full copies enhance resilience.

If DVCS feels like everyone having their own SCCS or RCS, that's correct!

------
### Continued: What Is a Distributed Version Control System?
It's a paradigm shift. Instead of sending patches to a project owner, people publish their versions for experimentation. This speeds up project evolution and accelerates feature/bugfix delivery. Clever ideas become usable, reducing commit access bottlenecks:

<img src="assets/dvcs-repository-tree.png" width="900">

------
### A Brief History of Distributed Version Control Systems
The Linux kernel was initially developed without source control. Linus Torvalds shared source code as tarballs and received changes as patches.

In December 1999, the Linux PowerPC project adopted BitKeeper, a proprietary DVCS. Linus embraced it in February 2002, despite it not being open source, calling it the best tool. It was the first widely used DVCS, built on SCCS, allowing users to treat changes as first-class objects.

After that, open source DVCS projects emerged. Popular DVCSs include Git (created by Linus Torvalds to maintain the Linux kernel and used by many other projects), Mercurial (by Mozilla, OpenSolaris, and OpenJDK), and Bazaar (by Ubuntu).

------
### Setup a Remote Git Repository on Ubuntu
You can setup a remote Git repository by (from [here](https://www.geeksforgeeks.org/how-to-setup-git-server-on-ubuntu/)):

- Installing Git:

  <pre class="console"><code>sudo apt-get install git</pre></code>

- Creating a new user to manage the repositories:

  <pre class="console"><code>sudo adduser git</pre></code>

- Creating a repository directory and changing the ownership of the directory to the git user:

  <pre class="console"><code>sudo mkdir /usr/local/git
  sudo chown git:git /usr/local/git
  </pre></code>

- Switching to the git user and initializing a new bare repository:

  <pre class="console"><code>su -l git
  git init -bare myproject.git
  </pre></code>

- Configuring SSH access for the git user:

  <pre class="console"><code>ssh-keygen -t rsa -b 4096
  echo "ssh-rsa <your-public-key>" >> ~/.ssh/authorized_keys
  echo "AllowUsers git" >> /etc/ssh/sshd_config
  </pre></code>

- Cloning the repository from the server:

  <pre class="console"><code>git clone git@server:/usr/local/git/myproject.git</pre></code>

------
### Distributed Version Control Systems in Corporate Environments
Apart from conservatism, there are some objections to the use of DVCSs in companies:
- Unlike centralized systems, DVCS stores the entire history with local copies.
- Auditing and workflow are less defined in DVCS
  - Centralized systems require users to check changes into a central repository.
  - In DVCS, users can send changes to each other and alter local history without central tracking.
- Git actually allows to change history, which can be problematic in regulated corporate environments. 
  - Although, you can disable it on most VC Repository Hosting Platforms (GitLab, GitHub, BitBucket, Azure DevOps, etc.).

Once a central repository is designated, all of the properties of a centralized version control system are available.

------
### Using Distributed Version Control Systems
The key difference between distributed and centralized VCSs is that in DVCS, when you commit, it's to your local copy or branch. To share changes, you must perform two extra actions: pulling changes from a remote repository and pushing changes to it:

<table>
  <tr>
    <th>Subversion (Centralized VCS)</th>
    <th>Mercurial (Distributed VCS)</th>
  </tr>
  <tr>
    <td>
      <ol>
        <li>svn up - Get the most recent revision.</li>
        <li>Write some code.</li>
        <li>svn up - Merge my changes with any new updates to the central repository and fix any conflicts.</li>
        <li>Run the commit build locally.</li>
        <li>svn ci - Check my changes, including my merge, into version control.</li>
      </ol>
    </td>
    <td>
      <ol>
        <li>hg pull - Get the updates from the remote repository into your local one.</li>
        <li>hg co - Update your local working copy from your local repository.</li>
        <li>Write some code.</li>
        <li>hg ci - Save your changes to your local repository.</li>
        <li>hg pull - Get any new updates from the remote repository.</li>
        <li>hg merge - This will update your local working copy with the results of the merge, but will not check in the merge.</li>
        <li>Run the commit build locally.</li>
        <li>hg ci - This checks in the merge to your local repository.</li>
        <li>hg push - Push your updates to the remote repository.</li>
      </ol>
    </td>
  </tr>
</table>

You can repeat steps 1-8 (in DVCs) before moving to step 9 for sending your changes to the CI build. In Mercurial and Git, there's a feature called "rebasing" to consolidate changes into a single commit for the master repository.

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
## Stream-Based Version Control Systems
Stream-based version control systems such as ClearCase and AccuRev are designed to ameliorate the merge problem by making it possible to apply sets of changes to multiple branches at once.

In the stream paradigm, branches are replaced by the more powerful concept of streams, which have the crucial distinction that they can inherit from each other. Thus, if you apply a change to a given stream, all of its descendent streams will inherit those changes:

With stream-based version control, you simply promote the change in your branch to the common ancestor of all the branches that need the change. Consumers of these branches can then update to get these changes, and create a new build which includes the fix.

<table>
  <td><img src="assets/stream-based-development.png"></td>
  <td><img src="assets/stream-based-development-2.png"></td>
</table>

Making changes to one stream won't affect any other stream, unless those changes are promoted. Once promoted, they will be visible to every other stream that inherits from the original stream.

How do you apply that bugfix to all other branches of your code at the same time? Without stream-based tools, the answer is to manually merge it.

One of the problems with the stream model of development is that promotion is done at the source level, not the binary level. As a result, every time you promote a change to a higher stream, you have to check out source and rebuild the binary (this problem also exists with similar branching models such as branch by team).

The Linux kernel development team uses a process (but, using Git and branches) very similar to that described above, but each branch has an owner whose job it is to keep that stream stable, and of course the "release stream" is maintained by Linus Torvalds who is very choosy about what he pulls in to his stream. The way the Linux kernel team works, there is a hierarchy of streams with Linus' at the top, and changes are pulled by the stream owners, rather than pushed up to them.

---
## Branching Patterns
In the following sections, we'll look at various patterns for branching and merging, their various advantages and disadvantages, and the circumstances under which they are appropriate.

------
### Develop on Mainline
In this pattern, developers almost always check in to mainline. Branches are used only rarely. The benefits of developing on mainline include:
- Ensuring that all code is continuously integrated
- Ensuring developers pick up each others' changes immediately
- Avoiding "merge hell" and "integration hell" at the end of the project

------
### Branch for Release
The one situation when it's always acceptable to create a branch is shortly before a release. Once the branch is created, testing and validation of the release is done from code on the branch, while new development is performed on mainline.

By creating a release branch, developers can keep checking in to mainline, while changes to the release branch are made for critical bugfixes only:

<img src="assets/release-branching-strategy.png">

In this pattern:
- Features are always developed on mainline.
- A branch is created when your code is feature-complete for a particular release and you want to start working on new features.
- Only fixes for critical defects are committed on branches, and they are merged into mainline immediately.
- When you perform an actual release, this branch is optionally tagged.

Once you achieve a certain frequency of releases, around once a week or so, it no longer makes sense to branch for release. In this scenario, it's cheaper and easier to simply put out a new version of the software instead of patching on the release branch. Instead, your deployment pipeline keeps a record of which releases were performed (along with tagging on released commit), when, and what revision in version control they came from (**Release-Ready** Mainline pattern).

------
### Branch by Feature
In this pattern, every story or feature is developed on a separate branch. Only after a story is accepted by testers, it is merged to mainline so as to ensure that mainline is always releasable.

This pattern is generally motivated by the desire to keep the trunk always releasable, and therefore do all of the development on a branch so you don't interfere with other developers or teams.

Many developers don't like to have their work exposed and publicly available until they are completely done.

In addition, it makes version control history more semantically rich if each commit represent a complete feature or a complete bugfix (using Squash merging).

There are some prerequisites for this pattern to work at all, let alone well:
- Any changes from mainline must be merged onto every branch on a daily basis.
- Branches must be short-lived, ideally less than a few days, never more than an iteration.
- The number of active branches that exist at any time must be limited to the number of stories in play. Nobody should start a new branch unless the branch representing their previous story is merged back to mainline.
- Consider having testers accept stories before they are merged. Only allow developers to merge to trunk once a story has been accepted.
- Refactorings must be merged immediately to minimize merge conflicts. This constraint is important but can be painful, and further limits the utility of this pattern.
- Part of the technical lead's role is to be responsible for keeping the trunk releasable. The tech lead should review all merges, perhaps in patch form. The tech lead has the right to reject patches that may potentially break the trunk.

Open source projects that use GitHub (for example) can achieve large gains in development speed by making it easy for users to branch a repository to add a feature and then make the branch available to a committer to pull from. However, there are some key attributes of open source projects that make them especially suitable for this pattern:
- Although many people can contribute to them, they are managed by a relatively small team of experienced developers who have the ultimate power to accept or reject patches.
- Release dates are relatively flexible, allowing the committers of open source projects a wide degree of latitude in rejecting suboptimal patches. While this can also be true of commercial products, it is not the norm.

Therefore, in the open source world this pattern can be very effective. It can also work for commercial projects where the core development team is small and experienced. It can work in larger projects, but only where the following conditions apply:
- The codebase is modular and well factored.
- The delivery team is split into several small teams, each with experienced leaders.
- The whole team is committed to checking in and integrating with mainline frequently.
- The delivery team is not subject to unduer pressure to release which might lead to suboptimal decision making.

We have seen even small, experienced, ninja-level agile teams mess this pattern up, so there is little hope for the rest of us. You should always start with the "develop on mainline" pattern and then, if you want to try branching by feature, proceed rigidly according to the rules above.

However, be aware that you are "running with scissors" when you adopt this pattern.

------
### Branch by Team
This pattern is an attempt to address the problem of having **a large team of developers** working on multiple work streams while still maintaining a mainline that can always be released (similar to branch by feature pattern).

A branch is created for every team, and merged into trunk only when the branch is stable. Every merge to any given branch should immediately be pulled into every other branch:

<img src="assets/branch-by-team.png">

Here is the workflow for branching by team:
1. Create small teams, each working on its own branch.
2. Once a feature/story is completed, the branch is stabilized and merged to trunk.
3. Any changes on trunk get merged to every branch daily.
4. Unit and acceptance tests are run on every check-in on the branch.
5. All tests, including integration tests, are run on trunk every time a branch is merged into it.

This pattern works when you have several small, relatively independent teams working on functionally independent areas of the system. Crucially, every branch needs to have an owner responsible for defining and maintaining its policy, including governing who checks in to the branch.

From a CI perspective, this strategy has this drawback which the unit of work under this strategy is scoped to a whole branch, not just a particular change.

The Linux kernel development team uses a version of this pattern, keeping logical branches for different parts of the operating system-the scheduler and the networking stack, for example-in independent repositories.

If merges aren't sufficiently frequent, this pattern suffers from the same drawback as every pattern where the whole team does not check in directly to trunk: True continuous integration is compromised. For this reason, Kniberg recommends that every team merges to trunk whenever a story is completed, and merges from trunk every day.

In practice, this pattern is not dissimilar to branch by feature. Its advantage is that there are fewer branches, so integration happens more frequently-at the team level at least. Its disadvantage is that branches diverge much more rapidly, because a whole team is checking in to each branch.

------
### Other Branching Patterns
This section and the whole next sections are retrieved from Martin Fowler post about [Patterns for Managing Source Code Branches](https://martinfowler.com/articles/branching-patterns.html). It's very valuable to read it.

Some branching patterns:

- Maturity Branch
  - A branch whose head marks the latest version of a level of maturity of the code base.
- Environment Branch
  - Configure a product to run in a new environment by applying a source code commit.
- Hotfix Branch
  - A branch to capture work to fix an urgent production defect.
- Experimental Branch
  - Collects together experimental work on a code base, that's not expected to be merged directly into the product.
- Future Branch
  - A single branch used for changes that are too invasive to be handled with other approaches.
- Collabration Branch
  - A branch created for a developer to share work with other members of the team without formal integration.
- Team Integration Branch
  - Allow a sub-team to integrate with each other, before integrating with mainline.

Some other patterns:
- Realease-Ready Mainline
  - Keep mainline sufficiently healthy that the head of mainline can always be put directly into production
  - <img src="assets/mainline-release.png">
- Pre-Integration Review
  - Every commit to mainline is peer-reviewed before the commit is accepted.

---
## Popular Branching Policies
Lots of branching approaches have been described over the years. But, there are many branching policies which gathers these patterns and some other rules and concepts together:
- Gitflow
- GitHub Flow
- Trunk-Based Development
  - You may use short-lived **Feature Branching** and **Release Branch** or **Release-Ready Mainline**.

------
### Gitflow
Gitflow has become one of the most common branching policies which was written by Vincent Driessen in 2010.

Gitflow uses **Mainline**, (calling it “develop”) in a single "origin" repository. It uses **Feature Branching** to coordinate multiple developers. Developers are encouraged to use their personal repositories as **Collaboration Branch** to coordinate with other developers working in similar work.

The traditionally named core branch of git is "master", in git-flow, master is used as a Production **Maturity Branch**. Gitflow uses a **Release Branch** so that work passes from "develop" through the release branch to "master". Hotfixes are organized through a Hotfix Branch.

Gitflow doesn't say anything about the length of feature branches, hence nor the expected integration frequency. It's also silent on whether mainline should be a Healthy Branch and if so what level of health is needed. The presence of release branches implies it isn't a Release-Ready Mainline.

<img src="assets/gitflow.png">

------
### GitHub Flow
It's common to find people who say they are using gitflow are actually doing something quite different. Often their actual approach is closer to GitHub Flow.

GitHub Flow assumes a single version in production with high-frequency integration onto a **Release-Ready Mainline**. With that context, **Release Branch** isn't needed. Production issues are fixed in the same way as regular features, so there's no need for **Hotfix Branch**.

<img src="assets/github-flow.png">

Being GitHub, the pull-request mechanism is part of Mainline Integration and uses **Pre-Integration Review**.

---
## Summary
Effective control of the assets that you create and depend upon in the course of software development is essential for the success of a project of any size.

The reason we spend so much time on this arguably tangential topic is twofold:
- Version control patterns are central to the way you design your deployment pipeline.
- It has been our experience that poor version control practices are one of the most common barriers to fast, low-risk releases.

We have spent some time comparing different version control system paradigms:
- Centralized model
- Distributed model
- Stream-based model

There is a fundamental tension between the desire for continuous integration and the desire to branch. Every time you make a decision to branch in a CI-based development system, you compromise to some degree.
>>>>>>> 48716bf1dc0f64621e230246acd1706655720440
