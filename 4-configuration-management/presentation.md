## Continuous Delivery: Configuration Management
Version Control, <span style="color: blue">Monorepo vs Polyrepo</span>, <span style="color: blue">Repository/Project Structure</span>, Managing Dependencies, Managing Software Configuration, Managing Environments, <span style="color: blue">Managing Assets/Resources</span>, <span style="color: blue">Managing Documentation</span>, <span style="color: blue">Managing Tests</span>, <span style="color: blue">Managing Code Style</span>, <span style="color: blue">Managing Code Generation</span>, <span style="color: blue">Version SSOT</span>, <span style="color: blue">Semantic Release</span>, <span style="color: blue">Managing Changelogs</span>

<img src="assets/gitops.png" style="border: 1px solid black"/>

<small><strong>Lecturer:</strong> Alireza Roshanzamir</small>

<small><strong>Keywords:</strong> Continuous Delivery, Continuous Integration, DevOps, Build, Test, Release, Deployment, Automation, Version Control, Deployment Pipeline</small>

<small><small>Tir 1402/August 2023</small></small>

---
## Definition
Configuration management is a term that is widely used, often as a synonym for 
version control:

> Configuration management refers to the process by which all artifacts relevant to your project, and the relationships between them, are stored, retrieved, uniquely identified, and modified.

Although version control systems are the most obvious tool in configuration management, the decision to use one (and every team should use one, no matter how small) is just the first step in developing a configuration management strategy.

You should be able to say "yes" to these questions:

- Can I exactly reproduce any of my environments, including the version of the operating system, its patch level, the network configuration, the software 
stack, the applications deployed into it, and their configuration?
- Can I easily make an incremental change to any of these individual items and deploy the change to any, and all, of my environments?
- Can I easily see each change that occurred to a particular environment and trace it back to see exactly what the change was, who made it, and when 
they made it?
- Can I satisfy all of the compliance regulations that I am subject to?
- Is it easy for every member of the team to get the information they need, and to make the changes they need to make? Or does the strategy get in the way of efficient delivery, leading to increased cycle time and reduced feedback?

<details>
<summary>Note</summary>
It doesn't only mean Git or something but almost means Git or something :)
</details>

---
## Version Control
The version control:
- Retains, and provides access to, every version of every file that has ever been stored in it.
- Allows teams that may be distributed across space and time to collaborate.

Why?

- What constitutes a particular version of your software? How can you reproduce a particular state of the software’s binaries and configuration that existed in the production environment?
- What was done when, by whom, and for what reason? Not only is this useful to know when things go wrong, but it also tells the story of your application.

------
### Version Control: Advices
- Keep Absolutely Everything in Version Control
  - Everything required to re-create your application's binaries and the environments in which they run.
  - Analysts should store requirements documents.
  - Testers should keep their test scripts and procedures in version control.
  - Project managers should save their release plans, progress charts, and risk logs here. In short, every member of the team should store any document or file related to the project in version control.
  - Many projects also store binary images of their application servers, compilers, virtual machines, and other parts of their toolchain in version control (not output binaries which rapidly proliferate, there may be two commits for the same version, one for source code and another for the binaries).
- Check In Regularly to Trunk
  - They become public, instantly available to everybody else on the team.
  - Otherwise, the merges become too complex.
  - Ovoid branching
  - Use commit test suit (less than ten minutes)
  - Introduce changes incrementally -> Check-in minimum once a day
- Use Meaningful Commit Messages
  - A message like "fix obsecure bug." makes debugging very hard.
  - Include a link to the identifier in your project management tool for the feature or bug you’re working on.
  - Specify a convention and follow it.
  - e.g. "Support specifying server's port number from the CLI using the --port option (see #1247)."
  - Multiparagraph commit message: the first paragraph is a summary and the following paragraphs add more detail.
  - Check commit messages automatically.
  - [Conventional commit messages](https://www.conventionalcommits.org/en/v1.0.0/#specification)

<details>
<summary>Note</summary>
<ul>
    <li>Mention the preference for using "version control" instead of "source control".</li>
    <li>If you don’t have absolutely every source artifact of your project in version control, you won’t enjoy any of the benefits that we discuss in this book.</li>
</ul>
</details>

---
## Managing Dependencies
External dependencies are:
- Third-party libraries
- Components or modules under development of other teams

Key issues of dependency management:
- Managing External Libraries:
  - There is some debate as to whether or not to version-control libraries.
  - Keep copies of your external libraries somewhere locally (such as Maven repository, PyPI, generic Artifactory, etc.)
- Managing Components:
  - It's common to have binary dependencies between your pipelines rather than source dependencies. Recompiling dependencies is not only less efficient; it also means you’re creating an artifact that is potentially different from the one that you already tested.
  - Easy deveopment over multiple components should be considered: It should be relatively easy to make changes in some of them and run a single command that rebuilds the necessary bits in the right order, creates the appropriate binaries, and runs relevant tests.

---
## Managing Software* Configuration
Configuration is one of the three key parts that comprise an application, along with its binaries and its data. Configuration information can be used to change the behavior of software at build time, deploy time, and run time.

Treat the configuration of your system in the same way you treat your code. Make it subject to proper management and testing.

------
### Configuration and Flexibility
  
  Flexibility is a continuoum: At one end, there is single-purpose software that does one job well but has little or no ability to have its behavior modified. At the other end of the spectrum is a programming language that you can use to write a game, an application server, or a stock control system (ultimate configurability antipattern):
  - It frequently leads to analysis paralysis
  - The system becomes so complex to configure that many of the benefits of its flexibility are lost.
Configuration is not inherently evil. But it needs to be managed carefully and consistently. 

------
### Types of Configuration
Configuration information can be injected into your application at several points in your:
- Build time
- Packaing time
- Deployment time
- Run time (or startup time)

Generally, its bad practice to inject configuration information at build or packaging time (such as J2EE specification and war files). This follows from the principle that you should be able to deploy the same binaries to every environment so you can ensure that the thing that you release is the same thing that you tested.

There should be a single source of configuration to change, manage, version-control, and override (if necessary). 

------
### Managing Application Configuration
- How do you represent your configuration information?
- How do your deployment scripts access it?
- How does it vary between environments, applications, and versions of applications?

There are a few obvious choices for where to store your application configuration: a database, a version control system, or a directory or registry.

Keep the actual configuration information specific to 
each of your application’s testing and production environments in a repository separate from your source code. This information generally changes at a different rate to other version-controlled artifacts (you will have to be careful to track which versions of configuration information match with which versions of the application).

Databases, directories, and registries are convenient places to store configuration since they can be accessed remotely. However, make sure to keep the history of changes to configuration for the purposes of audit and rollback. Either have a system that automatically takes care of this, or treat version control as your system of reference for configuration and have a script that loads the appropriate version into your database or directory on demand.

- Accessing Configuration
  - Storage and access type: File-system, RDBMS, LDAP, REST API, ESCAPE, Apache Zookepeer
  - Isolate the details of technology using a Facade
- Modeling Configuration
  - Set of tuples, JSON, YAML, XML, Protobuf, INI, TOML, gRPC, OpenAPI, and etc.
  - You may need versioning.
  - You may consider backward/forward compatibility.
  - You may consider adding new environments, creating new version of application, promoting a new version of application, relocating database, virtualization, and etc.
- Testing System Configuration
  - Ensure that references to external services in your configuration settings are good (connection to databases, message buses, etc.).
  - Run some smoke tests once your application is installed to make sure it is operating as expected
------
### Managing Configuration across Applications

Keep a catalogue of all the configuration options that each of your applications has, where they are stored, what their lifecycle is, and how they can be changed.

If possible, such information should be generated automatically from each application’s code as part of the build process. But where this is not possible, it should be collected in a wiki or other document management system.

Deploy and runtime: It is important to know what the current configuration of each running application is. Tools such as Nagios, OpenNMS, and HP OpenView may help. Countless hours have been lost by one application having a few configuration options set wrongly and thereby bringing down an entire set of services. 

------
### Principles of Managing Application Configuration
- Consider where in your application's lifecycle it makes sense to inject a particular piece of configuration.
- Keep the available configuration options for your application in the same repository as its source code, but keep the values somewhere else.
- Configuration should always be performed by automated processes using values taken from your configuration repository.
- Your configuration system should be able to provide different values to your application (including its packaging, installation, and deployment scripts) based on the application, its version, and the environment it is being deployed into.
- Use clear naming conventions for your configuration options. Try to imagine someone reading the configuration file without a manual.
- Ensure that your configuration information is modular and encapsulated.
- Don't repeat yourself: define the elements of your 
configuration so that each concept has only one representation in the set of configuration information.
- Be minimalist: Keep the configuration information as simple and as focused as possible.
- Avoid overengineering the configuration system.
- Ensure that you have tests for your configuration that are run at deployment or installation time.

---
## Managing Environments
Make the environments creation a fully automated process:

- Removes the problem of having random pieces of infrastructure around.
- Fixing is harder than recreation.
- Be able to create copies of production environments for testing purposes.

The kinds of environment configuration information:
- OS: versions, patch levels, and configuration settings.
- Additional software packages: versions and configuration.
- External services: versions and configuration
- Networking topology
- Any other data or state

Two principles:
- Keep binary files independent from configuration information.
- Keep all configuration information in one place.
Hence, creating new environments, upgrading parts of your system, and rolling out new configurations without making your system 
unavailable becomes a simple, automated process.

Managing third party products:
- Can we deploy it?
- Can we version its configuration effectively?
- How will it fit into our automated deployment strategy?

Essentially, you should treat your environment the same way you treat your code-changing it incrementally and checking the changes into version control. 

------
### Tools to Manage Environments
<img src="assets/environment-management-tools-responsibilities.png"/>

<img src="assets/environment-management-tools-comparison.png"/>

------
### Managing the Change Process
A production environment should be completely locked down. It 
should not be possible for anybody to make a change to it without going through your organization’s change management process.

A change to your environment is just like a change to your software. It has to go through your build, deploy, test, and release process in exactly the same way as a change to the application’s code.

Testing environments should be treated the same as production 
environments but the approval process will usually be simpler.

---
## Summary
Configuration management is the foundation of everything in CD. It 
is impossible to do continuous integration, release management, and deployment 
pipelining without it:

- Could you completely re-create your production system, excluding produc-
tion data, from scratch from the version-controlled assets that you store?
- Could you regress to an earlier, known good state of your application?
- Can you be sure that each deployed environment in production, in staging, 
and in test is set up in precisely the same way?

If not, then your organization is at risk. In particular, we recommend having 
a strategy for storing baselines and controlling changes to:

- Your applications' source code, build scripts, tests, documentation, 
requirements, database scripts, libraries, and configuration files
- Your development, testing, and operations toolchains
- All environments used in development, testing, and production
- The entire application stack associated with your applications-both binaries 
and configuration
- The configuration associated with every application in every environment 
it runs in, across the entire application lifecycle (building, deployment, 
testing, operation)
