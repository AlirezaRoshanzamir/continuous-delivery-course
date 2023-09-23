## Continuous Delivery: Managing Infrastructure and Environments
#### ...

<img src="assets/cloud-architecture-layers.png" alt="https://www.researchgate.net/publication/263297688_Middleware_and_Methods_for_Customizable_SaaS"/>

<small><strong>Time to Read:</strong> 11 Minutes</small>, <small><strong>Time to Present:</strong> 50 Minutes</small>
<br>
<small><strong>Created By:</strong> Alireza Roshanzamir</small>
<br>
<small><strong>Keywords:</strong> Continuous Delivery, Continuous Integration, DevOps, Build, Test, Release, Deployment, Automation, Version Control, Deployment Pipeline</small>
<br><br>
<small style="color: darkred"><small>Press **"F"** to go fullscreen; some slides may not display properly otherwise.</small></small>

---
## Introduction
An **environment** is all of the **resources** that your application **needs** to work and their **configuration**:
- The hardware configuration of the servers that form the environment (such as the number and type of CPUs, amount of memory, spindles, NICs, and so on) and the networking infrastructure that connects them
- The configuration of the operating system and middleware (such as messaging systems, application and web servers, database servers) required to support the applications that will run within it

The general term infrastructure represents all environments in your organization, along with the services that support them, such as DNS servers, firewalls, routers, version control repositories, storage, monitoring applications, mail servers, and so on.

------
### Principles
Preparing environments for deployment and managing them after deployment principles:
- The desired state of your infrastructure should be specified through version-controlled configuration.
- Infrastructure should be autonomic-that is, it should correct itself to the desired state automatically.
- You should always know the actual state of your infrastructure through instrumentation and monitoring.

While infrastructure should be autonomic, it is also essential that it should be simple to re-create, so that, in the case of a hardware failure for example, you can quickly reestablish a new known-good configuration. This means that infrastructure provisioning should also be an automated process. This combination of automated provisioning and autonomic maintenance ensures that infrastructure can be rebuilt in a predictable amount of time in the event of failure.

------
### Subjects
In this session, we will talk about the following:
- The operating system and its configuration, for both testing and production environments
- The middleware software stack and its configuration, including application servers, messaging systems, and databases
- Infrastructural software, such as version control repositories, directory services, and monitoring systems
- External integration points, such as external systems and services
- Network infrastructure, including routers, firewalls, switches, DNS, DHCP, and so on
- The relationship between the application development team and the infrastructure management team

---
## Understanding Operation Team
It is axiomatic that most projects fail due to people problems rather than technical problems.

Almost all medium and large companies separate the activities of development and infrastructure management (or operations as it is often known). It is often the case that these two groups of stakeholders have an uneasy relationship (wall of confusion).

In small organizations, the development team is often responsible for operations.

Operations teams measure their effectiveness in terms of the key quality-of-service metrics such as mean time between failures (MTBF) and mean time to repair failures (MTTR). Often operations teams have service-level agreements (SLAs) they have to meet. Any change, including a change in process, which has an effect on operations teams' ability to meet these and any other targets (such as conformance to legal regulation), represents a risk.

------
### Operation Team Concerns
Here are some of the most important high-level concerns of operations teams:
- Documentation and Auditing
  - Any change to any environment they control is documented and audited
  - So that, if things go wrong, they can find the relevant changes that caused the problem
  - Member of the software development team have a responsibility to familiarize themselves with any such systems and processes (such as Change Management Processes) that the operations team has in place, and comply with them.
- Alerts for Abnormal Events
  - Alerted when an abnormal condition occurs in any of the systems they manage so that they can minimize any downtime
  - Using tools such as OpenNMS, Nagios, or HP's Operations Manager.
  - It is the development team's responsibility to determine the operations team's monitoring requirements and make them part of the release plan
- IT Service Continuity Planning
  - Each service the operations team manages will have a recovery point objective (RPO)-a
measure of the length of time prior to a disaster for which data loss is acceptable, and a recovery time objective (RTO)-the maximum length of time allowed before services are restored.
  - The RPO governs the data backup and restore strategy, since data must be backed up frequently enough that the RPO can be achieved
  - In order to meet the business’ desired RTO, it might be necessary to establish a copy of the production environments and infrastructure in a second location that can be used if the primary systems fail.
  - A related requirement is for archiving: The amount of data generated by an application in production may become very large very quickly.
- Use the Technology the Operations Team Is Familiar With
  - So they can own and maintain their environments.
  - It is quite common for operations teams to be well versed in Bash or PowerShell, but less likely that they will be Java or C# ninjas.
  - Operations teams may veto deployment systems they don’t have the skills to maintain.
  - Development team and operations team should sit down at the beginning of every project and decide how deployment of the application will be performed.

---
### Modeling and Managing Infrastructure
Everything in this session can be broadly considered a branch of configuration management.

Types of servers, divided up by level of abstraction:
<img src="assets/types-of-servers-and-their-configuration.png">

You must address each of the following questions:
- How will we provision our infrastructure?
- How will we deploy and configure the various bits of software that form part of our infrastructure?
- How do we manage our infrastructure once it is provisioned and configured?

You should keep everything you need to create and maintain your infrastructure under version control:
- Operating system install definitions (such as those used by Debian Preseed, RedHat Kickstart, and Solaris Jumpstart)
- Configuration for data center automation tools like Puppet or CfEngine
- General infrastructure configuration, such as DNS zone files, DHCP and SMTP server configuration files, firewall configuration files, and so forth
- Any scripts you use for managing your infrastructure

------
### Controlling Access to Your Infrastructure
If you have an existing system that is not under good control, you’ll need to work out how to get it under control. There are three parts to this:
- Controlling access to prevent anyone from making a change without approval
- Defining an automated process for making changes to your infrastructure
- Monitoring your infrastructure to detect any issues as soon as they occur

Avoid the _problem-solving heuristic_ process:
- Leads to service disruptions (people tend to try rebooting or applying service packs at random)
- If something goes wrong later, there is no record of who did what when, which means it’s impossible to work out the cause of whatever problem you’re facing.

Requests to make changes to your production and testing environments should go through a change management process. This need not be bureaucratic: As is
pointed out in The Visible Ops Handbook, many organizations which perform best in terms of the MTBF (mean time between failures) and MTTR (mean time to repair) “were doing 1000–1500 changes per week, with a change success rate of over 99%.”

------
### Making Changes to Infrastructure
Characteristics of an effective change management process:
- Every change, whether it’s updating firewall rules or deploying a new version of your ﬂagship service, should go through the same change management process.
- This process should be managed using a single ticketing system that everybody can log into and which generates useful metrics such as average cycle time per change.
- The exact change that is made should be logged so it can be easily audited later.
  - Prefer automation over documentation.
  - Written documentation is never a guarantee that the documented change was performed correctly, and the differences between what somebody claims they did and what they actually did are sufficient to cause a problem that may take hours or days to track down.
- It should be possible to see a history of changes made to every environment, including deployments.
- The change you want to make should first have been tested on one of your production-like testing environments, and automated tests should be run to ensure that it doesn’t break any of the applications that use the environment.
- The change should be made to version control and then applied through your automated process for deploying infrastructural changes.
- There should be a test to verify that the change has worked.
