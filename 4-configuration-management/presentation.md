## Continuous Delivery: Configuration Management
#### <span style="color: purple">Version Control and Advices</span>, Managing Dependencies, Managing Software Configuration, <span style="color: purple">Managing Environments</span>

<img src="assets/gitops.webp" style="border: 1px solid black"/>

<small><strong>Time to Read:</strong> 12 Minutes</small>, <small><strong>Time to Present:</strong> 55 Minutes</small>
<br>
<small><strong>Created By:</strong> Alireza Roshanzamir</small>
<br>
<small><strong>Keywords:</strong> Continuous Delivery, Continuous Integration, DevOps, Build, Test, Release, Deployment, Automation, Version Control, Deployment Pipeline</small>
<br><br>
<small style="color: darkred"><small>Press **"F"** to go fullscreen; some slides may not display properly otherwise.</small></small>

---
## Definition
Configuration management is often used interchangeably with **version control**:

> Configuration management involves **storing**, **retrieving**, **uniquely identifying**, and **modifying** all **project-related artifacts** and their **relationships**.

Although **version control systems are the most obvious tool** in configuration management, the choice to use one (every team should use one, **no matter how small**) is the first step in shaping a configuration management strategy.  <!-- .element class="fragment fade-in-paragraph custom" -->

You should **be able to** say **"yes"** to these questions:  <!-- .element class="fragment fade-in-parent-with-next custom" -->
- Can I precisely **recreate** any of my **environments**, including the **OS version**, **patches**, **network setup**, **software stack**, **deployed apps**, and **their settings**?  <!-- .element class="fragment fade-in-then-semi-out-parent custom" -->
- Can I easily make an **incremental change** to any of these items and **deploy it to any or all of my environments**?  <!-- .element class="fragment fade-in-then-semi-out-parent custom" -->
- Can I easily **track** **environment changes** and find out **who** made them and **when**?  <!-- .element class="fragment fade-in-then-semi-out-parent custom" -->
<!-- - Can I satisfy all of the compliance regulations that I am subject to? !-->
- Can **everyone** on the team **access** the **necessary information** and **make required changes**? <!-- Or does the strategy get in the way of efficient delivery, leading to increased cycle time and reduced feedback? -->  <!-- .element class="fragment fade-in-then-semi-out-parent custom" -->

<details>
<summary>Note</summary>*
It doesn't only mean Git or something but almost means Git or something :)
</details>

---
## Version Control
<img src="assets/version-control-meme.webp" class="fragment start" width="800">

The version control:  <!-- .element class="fragment fade-in-with-next custom" -->
- **Keeps** and allows **access** to **all versions** of **every stored file**.  <!-- .element class="fragment fade-in-then-semi-out-parent custom" -->
- Enables **distributed teams** to **collaborate**, across space and time.  <!-- .element class="fragment fade-in-then-semi-out-parent custom" -->

Why?  <!-- .element class="fragment fade-in" -->

- What **constitutes** a **specific version** of your software? How can you **reproduce** a particular state of **binaries** and **configurations** that **existed in the production** ?  <!-- .element class="fragment fade-in-then-semi-out-parent custom" -->
- What was done **when**, by **whom**, and **why**? Not only **helps when issues arise**, but also **tells the story of your application**.  <!-- .element class="fragment fade-in-then-semi-out-parent custom" -->

------
### Version Control: Advices
- Keep Absolutely Everything in Version Control
- Check In Regularly to Trunk
- Use Meaningful Commit Messages

<details>
<summary>Note</summary>
<ul>
    <li>Mention the preference for using "version control" instead of "source control".</li>
    <li>If you don't have absolutely every source artifact of your project in version control, you won't enjoy any of the benefits that we discuss in this course.</li>
</ul>
</details>

------
### Keep Absolutely Everything in Version Control
- All needed to **re-create** your app's **binaries** and their **running environments**, including **infrastructure details** and **scripts** (**GitOps: Git as the single source of truth**).  <!-- .element class="fragment semi-fade-out-parent custom" -->
- **Analysts** should store **requirements documents**.  <!-- .element class="fragment fade-in-then-semi-out-parent custom" -->
- **Testers** should keep their **test scripts** and procedures.  <!-- .element class="fragment fade-in-then-semi-out-parent custom" -->
- **Project managers** should save their **release plans**, **progress charts**, and **risk logs**.  <!-- .element class="fragment fade-in-then-semi-out-parent custom" -->
- Many projects also save **binary images** of app servers, **compilers**, VMs, and **toolchain** in version control (**excluding output binaries** that **multiply quickly**, **two commits** might exist for the same version, one for source code and one for binaries).  <!-- .element class="fragment fade-in-then-semi-out-parent custom" -->
- For handling **big files**, utilize **LFS plugins** like GitLFS. Otherwise, rely on **artifactories**, **storage**, and **file servers** (like JFrog, Nexus, Samba, MinIO, ...), and remember versioning.  <!-- .element class="fragment fade-in-then-semi-out-parent custom" -->

<img src="assets/which-version-i-used-meme.webp" width="350">

------
### Keep Absolutely Everything in Version Control: Documentation
<img src="assets/i-am-documentation-meme.webp" class="fragment start" width="600">

Having **documentation in version control** and the source code repository offers these advantages:  <!-- .element class="fragment fade-in-parent custom" -->
- **Auto-generating** **references** section from the **code**, **docstrings**, **tests**, **changelogs**, **Swagger APIs**, **Protobufs**, etc.  <!-- .element class="fragment fade-in-then-semi-out-parent custom" -->
- Ensuring **consistency** between documentation and **other entities**.  <!-- .element class="fragment fade-in-then-semi-out-parent custom" -->
- Taking advantages of the **doctests**.  <!-- .element class="fragment fade-in-then-semi-out-parent custom" -->
- Supporting **versioning** and **review mechanism**.  <!-- .element class="fragment fade-in-then-semi-out-parent custom" -->
- With **reStructuredText** or **Markdown**, you can create various views like **HTML**, **Latex**, **PDF**, **Confluence**, **Presentation**. This lets you **publish** them **anywhere** and in any **desired format**.  <!-- .element class="fragment fade-in-then-semi-out-parent custom" -->

<img src="assets/living-documentation.webp" width="800">

------
### Keep Absolutely Everything in Version Control: Documentation
For example, consider the Python [Click](https://click.palletsprojects.com/) CLI library:

<table>
  <tr>
    <td><img src="assets/click-home-page.webp" width="350"/></td>
    <td><img src="assets/click-api.webp" width="550"/></td>
    <td rowspan="2"><img src="assets/click-repository.webp" width="550"/></td>
  </tr>
  <tr class="simple">
    <td><img src="assets/click-pdf.webp" width="200"/></td>
    <td><img src="assets/click-example.webp" width="550"/></td>
  </tr>
</table>

------
### Check In Regularly to Trunk
- They become **public**, **instantly** available to the whole **team**.  <!-- .element class="fragment fade-in-then-semi-out-parent custom" -->
- Otherwise, **merges** become too **complex**.  <!-- .element class="fragment fade-in-then-semi-out-parent custom" -->
- **Avoid branching**  <!-- .element class="fragment fade-in-then-semi-out-parent custom" -->
- Use **commit test suit** (less than **ten minutes**)  <!-- .element class="fragment fade-in-then-semi-out-parent custom" -->
- **Incremental changes** and **check-in** minimum **once a day**  <!-- .element class="fragment fade-in-then-semi-out-parent custom" -->

------
### Use Meaningful Commit Messages
<img src="assets/commit-message-meme.webp" width="800" class="fragment complete-fade-out" style="border: 1px solid gray">

- A message like **"fixed obscure bug"** **complicates debugging**.  <!-- .element class="fragment fade-in-then-semi-out-parent custom" -->
- Add a **link** to the **feature or bug's identifier** in your **project management tool**.  <!-- .element class="fragment fade-in-then-semi-out-parent custom" -->
- Set a **convention** and stick to it.  <!-- .element class="fragment fade-in-then-semi-out-parent custom" -->
- For example, "**Enable** server port specification through CLI with --port option (**see #1247**)."  <!-- .element class="fragment fade-in-then-semi-out-parent custom" -->
- **Multiparagraph** commit message: first paragraph is a **summary**, followed by paragraphs for **additional details**.  <!-- .element class="fragment fade-in-then-semi-out-parent custom" -->
- **Automatically verify** commit messages.  <!-- .element class="fragment fade-in-then-semi-out-parent custom" -->
- Consider **[Conventional Commit Messages](https://www.conventionalcommits.org)**.  <!-- .element class="fragment fade-in-then-semi-out-parent custom" -->

---
## Managing Dependencies
**External** dependencies include:
- Third-party libraries
- Components or modules being developed by **other teams**

Key issues of **dependency management**:  <!-- .element class="fragment fade-in-parent-with-next custom" -->
- Managing **External Libraries**:
  - There's a **debate** about **version-controlling libraries**.  <!-- .element class="fragment fade-in-then-semi-out-parent custom" -->
  - Maintain **local copies** of external libraries (e.g., in **Maven repository**, **PyPI**, generic **Artifactory**).  <!-- .element class="fragment fade-in-then-semi-out-parent custom" -->
- Managing **Components**:
  - **Binary dependencies** are usual **between pipelines**, **not source dependencies**. **Recompiling** them is **less efficient** and may lead to **artifacts differing from tested ones**.  <!-- .element class="fragment fade-in-then-semi-out-parent custom" -->
  - **Easy development** across **multiple components** is **essential**. Making changes in some and running a **single command** that **rebuilds** necessary parts, **creates binaries**, and **performs tests** should be straightforward.  <!-- .element class="fragment fade-in-then-semi-out-parent custom" -->

---
## Managing Software* Configuration
**Configuration** is one of the three key parts that comprise an application, along with its **binaries** and **data**. Configuration info alters software behavior at **build time**, **deploy time**, and **run time**.

**Treat** your system's configuration **like your code**. **Manage** and **test** it properly.  <!-- .element class="fragment fade-in-parent custom" -->

------
### Configuration and Flexibility
Flexibility is a **spectrum**: On one side, single-purpose software excels at a specific task but lacks adjustable behavior. On the opposite end, a programming language can create diverse systems (**ultimate configurability antipattern**):
- It often leads to analysis paralysis  <!-- .element class="fragment highlight-current-blue" -->
- When configuring becomes overly complex, the advantages of flexibility can be lost.  <!-- .element class="fragment highlight-current-blue" -->

------
### Types of Configuration
Configuration information can be **injected into your application** at several points in your:
- Build time
- Packaing time
- Deployment time
- Run time (or startup time)

Normally, it's **not recommended** to inject configuration during **build** or **packaging** (e.g., J2EE specs and war files). This aligns with the **principle of deploying identical binaries** to **every environment** to ensure the **released** and **tested versions match**.  <!-- .element class="fragment fade-in-paragraph custom" -->

<!-- There should be a single source of configuration to change, manage, version-control, and override (if necessary). -->

------
### Managing Application Configuration
- How do you **represent** your configuration information?
- How do your **deployment scripts** access it?
- How does it vary between **environments**, **applications**, and **versions of applications**?

There are a few obvious choices for where to **store** your application configuration: a **database**, a **version control system**, or a **directory** or **registry**.  <!-- .element class="fragment fade-in-paragraph custom" -->

Keep the actual configuration for **testing** and **production** **separate from source code** in another repository. This data **changes at a different rate** (but, track **matching configuration and app versions**).  <!-- .element class="fragment fade-in-paragraph custom" -->

**Databases**, **directories**, and **registries** are convenient for remote configuration **storage**. However, **track changes** for **audits** and **rollbacks**. For this, use an **automated system** or **version control as your reference, with a script** to load the correct version when needed.  <!-- .element class="fragment fade-in-paragraph custom" -->

------
### Continued: Managing Application Configuration
- Accessing Configuration
  - **Storage** and **access** type: File-system, RDBMS, LDAP, REST API, ESCAPE, Apache Zookepeer  <!-- .element class="fragment fade-in-then-semi-out-parent custom" -->
  - **Isolate** the details of technology using a **Facade**  <!-- .element class="fragment fade-in-then-semi-out-parent custom" -->
- Modeling Configuration
  - Set of tuples, JSON, YAML, XML, Protobuf, INI, TOML, gRPC, OpenAPI, programming language data types, etc.  <!-- .element class="fragment fade-in-then-semi-out" -->
  - You may need **versioning**.  <!-- .element class="fragment fade-in-then-semi-out-parent custom" -->
  - You may consider **backward/forward compatibility**.  <!-- .element class="fragment fade-in-then-semi-out-parent custom" -->
  - You could think about **adding new environments**, **creating app versions**, **promoting a new version**, **relocating databases**, **virtualizing**, and more.  <!-- .element class="fragment fade-in-then-semi-out-parent custom" -->
- Testing System Configuration
  - Check that **external service references** in your configuration are **correct** (e.g., **database connections**, **message buses**).  <!-- .element class="fragment fade-in-then-semi-out-parent custom" -->
  - After **installation**, run **smoke tests** to ensure your **application functions correctly**.  <!-- .element class="fragment fade-in-then-semi-out-parent custom" -->

------
### Managing Configuration across Applications
**Keep a catalogue** of configuration **options** for **each application**, detailing **where they're stored**, their **lifecycle**, and **how they can be changed**.

**If feasible**, such info should be **automatically generated** from the app's code during building. **If not**, put it in a **wiki** or **document system**.  <!-- .element class="fragment fade-in-paragraph custom" -->

Deployment and runtime: Understanding the **current configuration of running apps** is crucial. Tools like Nagios, OpenNMS, and HP OpenView can help. **Errors in a few configuration options** of one app can lead to **significant downtime** across services.  <!-- .element class="fragment fade-in-paragraph custom" -->

------
### Principles of Managing Application Configuration
- Think about the **right stage in your app's lifecycle** to **introduce specific configuration**.  <!-- .element class="fragment fade-in-then-semi-out-parent custom" -->
- **Keep** available app configuration **options with source code**, but **values somewhere else**.  <!-- .element class="fragment fade-in-then-semi-out-parent custom" -->
- **Automated processes** must **handle configuration** using values from your **configuration repository**.  <!-- .element class="fragment fade-in-then-semi-out-parent custom" -->
<!-- - Your configuration system should be able to provide different values to your application (including its packaging, installation, and deployment scripts) based on the application, its version, and the environment it is being deployed into.  -->
- Use clear **naming conventions** for configuration options. Imagine someone **reading the file without a manual**.  <!-- .element class="fragment fade-in-then-semi-out-parent custom" -->
- Ensure **modular**, **encapsulated** configuration information.  <!-- .element class="fragment fade-in-then-semi-out-parent custom" -->
- **Don't repeat yourself**: define configuration elements so **each concept is represented just once** in the configuration data.  <!-- .element class="fragment fade-in-then-semi-out-parent custom" -->
- **Be minimalist**: Keep configuration information **simple** and **focused**.  <!-- .element class="fragment fade-in-then-semi-out-parent custom" -->
- **Avoid overengineering** the configuration system.  <!-- .element class="fragment fade-in-then-semi-out-parent custom" -->
- Have **tests** for configuration, **executed during deployment or installation**.  <!-- .element class="fragment fade-in-then-semi-out-parent custom" -->

---
## Managing Environments
<img src="assets/production-environment-meme.webp" class="fragment start">

**Automate environment creation** completely:
- **Removes** the problem of having **random pieces of infrastructure around**.  <!-- .element class="fragment fade-in-parent custom" -->
- Fixing is **harder** than recreation.  <!-- .element class="fragment fade-in-parent custom" -->
- Be able to **create copies** of **production** environments **for testing** purposes.  <!-- .element class="fragment fade-in-parent custom" -->

The kinds of environment configuration information:  <!-- .element class="fragment fade-in" -->
- OS: versions, patch levels, and configuration settings.  <!-- .element class="fragment fade-in" -->
- Additional software packages: versions and configuration.  <!-- .element class="fragment fade-in" -->
- External services: versions and configuration  <!-- .element class="fragment fade-in" -->
- Networking topology  <!-- .element class="fragment fade-in" -->
- Any other data or state  <!-- .element class="fragment fade-in" -->

------
### Continued: Managing Environments
<!-- Two principles:
- Keep binary files independent from configuration information.
- Keep all configuration information in one place.

Hence, creating new environments, upgrading parts of your system, and rolling out new configurations without making your system 
unavailable becomes a simple, automated process.  -->

Managing **third party** products:  <!-- .element class="fragment fade-in-parent-with-next custom" -->
- Can we deploy it?  <!-- .element class="fragment highlight-current-blue" -->
- Can we version its configuration effectively?  <!-- .element class="fragment highlight-current-blue" -->
- How will it fit into our automated deployment strategy?  <!-- .element class="fragment highlight-current-blue" -->

**Treat** your environment **like code**: **Change it incrementally**, **check changes into version control**.  <!-- .element class="fragment fade-in-paragraph custom" -->

------
### Tools to Manage Environments
<img src="assets/environment-management-tools-responsibilities.webp" width="600"/>

<img src="assets/environment-management-tools-comparison.webp" width="900"/>

------
### Managing the Change Process
<img src="assets/fix-production-bug-meme.webp" class="fragment complete-fade-out" width="500">

A production environment must be **locked down**. **No** changes allowed **without** following your **change management process**.  <!-- .element class="fragment fade-in-paragraph custom" -->

**Environment changes** are **like software changes**. They **follow** the same **build**, **deploy**, **test**, and **release** process **as code**.  <!-- .element class="fragment fade-in-paragraph custom" -->

**Testing environments** should be **treated** the same **as production environments**, with a **simpler approval process**.  <!-- .element class="fragment fade-in-paragraph custom" -->

---
## Summary
**Configuration management** is **key** to CD. There is **no** continuous integration, release, or deployment pipelining **without it**:
- Could you fully **re-create** your **production system**, **excluding production data**, from **version-controlled assets**?  <!-- .element class="fragment highlight-current-blue-parent custom" -->
- Could you **go back** to a previous, **known good state** of your application?  <!-- .element class="fragment highlight-current-blue-parent custom" -->
- Are you confident **each deployed environment** (production, staging, test) is set up **the same way**?  <!-- .element class="fragment highlight-current-blue-parent custom" -->

**If not**, your project is **at risk**. It's **crucial** to have a strategy for storing baselines and **controlling changes to**:  <!-- .element class="fragment fade-in-parent-with-next custom" -->
- App **source code**, **build scripts**, **tests**, **docs**, **requirements**, **DB scripts**, **libraries**, **config files**  <!-- .element class="fragment highlight-current-blue-parent custom" -->
- Your **development**, **testing**, and **operations** **toolchains**  <!-- .element class="fragment highlight-current-blue-parent custom" -->
<!-- - All environments used in development, testing, and production -->
- The **application** stack **associated with your applications**-both **binaries** and **configuration**  <!-- .element class="fragment highlight-current-blue-parent custom" -->
- Configuration for **each app** in all environments **throughout its lifecycle** (build, deploy, test, operation)  <!-- .element class="fragment highlight-current-blue-parent custom" -->
