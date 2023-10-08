## Continuous Delivery: Managing Infrastructure and Environments
#### Understanding Operation Team, Modeling and Managing Infrastructure, Managing Server Provisioning and Configuration, Managing the Configuration of Middleware, Managing Infrastructure Services, Virtualization, Cloud Computing, Monitoring Infrastructure and Applications

<img
  src="assets/cloud-architecture-layers.png"
  alt="https://www.researchgate.net/publication/263297688_Middleware_and_Methods_for_Customizable_SaaS" width="500"
/>

<small><strong>Time to Read:</strong> 14 Minutes</small>, <small><strong>Time to Present:</strong> 50 Minutes</small>
<br>
<small><strong>Created By:</strong> Alireza Roshanzamir</small>
<br>
<small><strong>Keywords:</strong> Continuous Delivery, Continuous Integration, DevOps, Build, Test, Release, Deployment, Automation, Version Control, Deployment Pipeline</small>
<br>
<small style="color: darkred"><small>Press **"F"** to go fullscreen; some slides may not display properly otherwise.</small></small>

---
## Introduction
An **environment** is all of the **resources** that your application **needs** to work and their **configuration**:
- The hardware configuration includes server details like **CPU count**, **memory**, **spindles**, **NICs**, and **networking**.  <!-- .element: class="fragment fade-in-parent custom" -->
- The configuration of the **OS** and **middleware** like **messaging systems**, **application/web servers** and **database servers** for running applications.  <!-- .element: class="fragment fade-in-parent custom" -->

"Infrastructure" encompasses all your **organization's environments and supporting services**, including **DNS**, **firewalls**, **routers**, **version control**, **storage**, **monitoring**, **mail servers**, etc.  <!-- .element: class="fragment fade-in-paragraph custom" -->

------
### Principles
Principles for **preparing** and **managing** environments **before** and **after deployment**:
- The desired state of your infrastructure should be specified through **version-controlled** configuration.  <!-- .element: class="fragment fade-in-parent custom" -->
- Infrastructure should be **autonomic**, meaning it **corrects itself** to the desired state automatically.  <!-- .element: class="fragment fade-in-parent custom" -->
- You should always **know the actual state** of your **infrastructure** through instrumentation and **monitoring**.  <!-- .element: class="fragment fade-in-parent custom" -->

Infrastructure should be **autonomic**, **but** it's crucial to keep it **easy to recreate**. So, in case of **hardware failure**, you can **quickly reestablish** a new known-good configuration. Therefore, **automate infrastructure provisioning** as well.  <!-- .element: class="fragment fade-in-paragraph custom" -->

**Automated provisioning** and **autonomic maintenance** ensure **predictable** infrastructure **rebuilding** in case of **failure**.  <!-- .element: class="fragment fade-in-paragraph custom" -->

------
### Subjects
In this session, we will talk about the following:
- The **operating system** and its **configuration**, for testing/production environments.  <!-- .element class="fragment highlight-current-blue-parent custom" -->
- The **middleware software stack** and its **configuration**, including **application servers**, **messaging systems**, and **databases**.  <!-- .element class="fragment highlight-current-blue-parent custom" -->
- Infrastructural software, such as **version control repositories**, **directory services**, and **monitoring systems**.  <!-- .element class="fragment highlight-current-blue-parent custom" -->
- External integration points, such as **external systems** and **services**.  <!-- .element class="fragment highlight-current-blue-parent custom" -->
- **Network infrastructure**, including **routers**, **firewalls**, **switches**, **DNS**, **DHCP**, and so on.  <!-- .element class="fragment highlight-current-blue-parent custom" -->
- The **relationship** between the application **development team** and the **infrastructure management team**.  <!-- .element class="fragment highlight-current-blue-parent custom" -->

---
## Understanding Operation Team
<img src="assets/operation-team-qos-explain-meme.jpeg" class="fragment start">

Most projects **fail** because of **people problems**, **not technical issues**.  <!-- .element: class="fragment fade-in-paragraph custom" -->

In most **medium to large** companies, **development** and **infrastructure management (operations)** are **separate**, often causing **tension** between these two stakeholder groups (aka **"wall of confusion"**).  <!-- .element: class="fragment fade-in-paragraph custom" -->

In **small** organizations, the **development team** typically **handles operations too**.  <!-- .element: class="fragment fade-in-paragraph custom" -->

**Operations teams** use **QoS metrics** like **mean time between failures** and **mean time to repair** to assess **performance**. They must meet **service-level agreements (SLAs)**. Any **change** poses a **risk** to meeting these goals and complying with regulations.  <!-- .element: class="fragment fade-in-paragraph custom" -->

------
### Operation Team Concerns
<img src="assets/dev-ops-meme.jpeg" class="fragment start">

Here are some of the most important **high-level** concerns of operations teams:
- Documentation and Auditing  <!-- .element: class="fragment insides-fade-in-then-out" -->
  - Any change to any environment they control is **documented** and **audited**.  <!-- .element class="fragment highlight-current-blue-parent custom" -->
  - So that, if things **go wrong**, they can find the **relevant changes** that **caused the problem**.  <!-- .element class="fragment highlight-current-blue-parent custom" -->
  - **Development team** should **learn** the **operations team's systems and processes** (e.g. **Change Management Processes**) and follow them.  <!-- .element class="fragment highlight-current-blue-parent custom" -->
- Alerts for Abnormal Events  <!-- .element: class="fragment insides-fade-in-then-out" -->
  - They should be **notified of abnormal conditions** in systems they manage to **minimize downtime**.  <!-- .element class="fragment highlight-current-blue-parent custom" -->
  - Using tools such as **OpenNMS**, **Nagios**, or **HP's Operations Manager**.  <!-- .element class="fragment highlight-current-blue-parent custom" -->
  - The **development team** must **consider** the operations team's **monitoring needs** within the release plan.  <!-- .element class="fragment highlight-current-blue-parent custom" -->
- IT Service Continuity Planning  <!-- .element: class="fragment insides-fade-in-then-out" -->
  - Each service managed by the operations team has a **RPO** (recovery point objective; acceptable data loss time before a disaster) and an **RTO** (recovery time objective; maximum allowed time for service restoration).  <!-- .element class="fragment highlight-current-blue-parent custom" -->
  - The **RPO** governs the **data backup** and **restore strategy**, ensuring **frequent backups to meet the RPO**.  <!-- .element class="fragment highlight-current-blue-parent custom" -->
  - To meet **RTO**, creating a **backup of the production setup** in **another location** for **main system failure** may be needed.  <!-- .element class="fragment highlight-current-blue-parent custom" -->
  - Another consideration is **archiving**, as production applications can generate a **significant amount of data rapidly**.  <!-- .element class="fragment highlight-current-blue-parent custom" -->
- Use the Technology the Operations Team Is Familiar With  <!-- .element: class="fragment insides-fade-in-then-out" -->
  - So they can **own** and **maintain** their environments.  <!-- .element class="fragment highlight-current-blue-parent custom" -->
  - Operations teams are typically **proficient in Bash or PowerShell**, but might **not have expertise in Java or C#**.  <!-- .element class="fragment highlight-current-blue-parent custom" -->
  - Operations teams may **veto deployment systems** they **don't have the skills to maintain**.  <!-- .element class="fragment highlight-current-blue-parent custom" -->
  - Development and operations teams should **plan application deployment** **together** at **project start**.  <!-- .element class="fragment highlight-current-blue-parent custom" -->

<details>
  <summary>Note</summary>
  IT Service Continuity Planning is the process of ensuring that IT services can continue or be quickly restored after a disruption or disaster.
</details>

---
## Modeling and Managing Infrastructure
Types of servers, divided up by **level of abstraction**:  <!-- .element class="fragment fade-in-parent-with-next custom" -->

<img src="assets/types-of-servers-and-their-configuration.png" width="1000">

You must address each of the following **questions**:  <!-- .element class="fragment fade-in-parent-with-next custom" -->
- How will we **provision** our infrastructure?
- How will we **deploy** and **configure** the **various bits** of software that form part of our infrastructure?
- How do we **manage** our infrastructure **once it is provisioned** and **configured**?

You should **keep everything** you **need** to **create** and **maintain** your infrastructure under **version control**:  <!-- .element class="fragment fade-in-parent-with-next custom" -->
- **OS install definitions** (such as those used by Debian Preseed, RedHat Kickstart, and Solaris Jumpstart).
- **Configuration** for data center **automation tools** like Puppet or CfEngine.
- **General infrastructure configuration**, such as DNS, DHCP and SMTP, and firewall configuration files.
- **Any scripts** you use for managing your infrastructure.

------
### Controlling Access to Your Infrastructure
<img src="assets/access-control-meme.jpeg" class="fragment start">

If you have a system that's **not well controlled**, you'll need to figure out how to **regain control**. This involves three steps:  <!-- .element class="fragment fade-in-parent-with-next custom" -->
- Controlling access to **prevent** anyone from **making a change without approval**.
- Defining an **automated process** for **making changes** to your infrastructure.
- **Monitoring** your infrastructure to detect any issues as soon as they occur.

Don't log in and **explore** to fix issues in that environment (called **problem-solving heuristic**):  <!-- .element class="fragment fade-in-parent-with-next custom" -->
- This can **disrupt services** as people might randomly reboot or apply updates.
- If something goes wrong later, there's **no record of actions taken**, making it **impossible** to determine the **cause of any issues**.

**Change requests** for **testing/production** environments should follow a **structured process**. This need **not be bureaucratic**: As noted in "The Visible Ops Handbook," **high-performing organizations** achieved **high MTBF** and **MTTR** with a **99%+ change success rate**, even with **1000-1500 weekly changes**.  <!-- .element class="fragment fade-in-paragraph custom" -->

<details>
  <summary>Note</summary>
  A problem-solving heuristic is an informal, intuitive, speculative procedure that leads to a solution in some cases but not in others
</details>

------
### Making Changes to Infrastructure
Characteristics of an **effective change management process**:
- All changes, like firewall rules updates or service deployments, must follow the **same change management process**.  <!-- .element class="fragment highlight-current-blue-parent custom" -->
- This process should be managed with a **single ticketing system** for all, **tracking metrics** like **average cycle time per change**.  <!-- .element class="fragment highlight-current-blue-parent custom" -->
- The exact change that is made should be **logged** so it can be easily audited later.  <!-- .element class="fragment highlight-current-blue-parent custom" -->
  - Prefer automation over documentation.
  - **Documentation** **doesn't** always ensure a **change was done right**. **Differences** between **claimed** and **actual** actions can cause **days of troubleshooting**.
- A **history of changes** in **every environment**, **including deployments**, should be visible.  <!-- .element class="fragment highlight-current-blue-parent custom" -->
- The changes should be checked with **automated tests** to **avoid disrupting other applications**.  <!-- .element class="fragment highlight-current-blue-parent custom" -->
- Changes should **go through version control** and be applied via the **automated process** for infrastructural updates.  <!-- .element class="fragment highlight-current-blue-parent custom" -->
- There should be a **test to verify** that the change has worked.  <!-- .element class="fragment highlight-current-blue-parent custom" -->

---
## Managing Server Provisioning and Configuration
Provisioning and configuring servers is often **neglected** in small to medium-sized operations because it **seems complicated**.

An example of automated provisioning and configuration of servers:  <!-- .element class="fragment fade-in-with-next custom" -->

<img src="assets/automated-provisioning-and-configuration-of-servers.png">

------
### Provisioning Servers
There are several ways to create **operating system baselines**:
- <!-- .element class="fragment highlight-current-blue" --> A fully manual process: Not repeatable, reliable, and scalable.
- <!-- .element class="fragment highlight-current-blue" --> Automated remote installation
  - PXE (Preboot eXecution Environment)
    - PXE is a standard for booting boxes over Ethernet.
    - When you choose to boot via the network in your BIOS, what happens under the hood is PXE.
  - WDS (Windows Deployment Services)
    - It uses PXE under the hood.

  <table>
    <tr>
      <td><img src="assets/pxe.png" width="500"></td>
      <td><img src="assets/wds.png" width="500"></td>
    </tr>
  </table>
- <!-- .element class="fragment highlight-current-blue" --> Virtualization: We will discuss this later.

<img src="assets/pxe-old-days-memes.webp" class="fragment end" width="500">

------
### Ongoing Management of Servers
After installing the OS, it's essential to **prevent uncontrolled configuration changes**. This means:
- Nobody is able to log into the boxes except the operations team
- Any changes are performed using an automated system

The goal of **configuration management process** is to ensure that **configuration management** is **declarative** and **idempotent**.  <!-- .element class="fragment fade-in-paragraph custom" -->

On **Windows**, Microsoft provides **System Center Configuration Manager (SCCM)** to **manage your Microsoft infrastructure**. SCCM uses **ActiveDirectory (AD)** and **Windows Software Update Services** for **OS configuration**, **updates**, and **settings** across your organization. It also **deploys applications** and manages **virtual servers** like physical ones. **Access control** is via **Group Policy**, integrated with **AD**, and standard in Microsoft servers since Windows 2000.  <!-- .element class="fragment fade-in-paragraph custom" -->

In the **UNIX** realm, **LDAP** and **standard UNIX access controls** **regulate user permissions**. **Various tools are available** for **managing OS configuration**, **software**, and **updates**. Prominent options include **CfEngine**, **Puppet**, and **Chef**.  <!-- .element class="fragment fade-in-paragraph custom" -->

These tools work similarly. You define **the desired state** for your systems, and the **tool ensures** your **infrastructure matches that state**. They enforce **idempotence**, aiming for **autonomic (aka self-healing)** infrastructure.  <!-- .element class="fragment fade-in-paragraph custom" -->

------
### Ongoing Management of Servers: SCCM and CfEngine
<table>
  <tr>
    <td><img src="assets/sccm.png"></td>
    <td><img src="assets/cfengine.png"></td>
  </tr>
</table>

------
### Ongoing Management of Servers: Puppet
Puppet is one of the **most popular open source systems** currently available (along with CfEngine and Chef).

Puppet uses a **external DSL** to handle configuration in a **declarative** way.

The **central master server** runs the **Puppet master daemon (puppetmasterd)** which **has and controls a list of machines**.

Each machine has the **Puppet agent (puppetd)**, **communicates** with the server to **sync** servers with the **latest configuration**.

When a **configuration changes**, the **master updates the clients**, **installs/configures new software**, and **restarts servers as needed**.

<img src="assets/puppet.png">

**Declarative configuration** defines the **desired server state**, **applicable from any starting points**, including fresh VM copies or newly provisioned machines.

------
### Continued: Ongoing Management of Servers: Puppet
Example:

<pre class="puppet"><code style="font-size: 16px; line-height: normal;" data-trim data-noescape># /etc/puppet/modules/postfix/manifests/init.pp
class postfix {
  package { postfix: ensure => installed }
  service { postfix: ensure => running, enable => true }
  file { "/etc/postfix/main.cf":
    content => template("postfix/main.cf.erb"),
    mode => 755,
  }
}
</code></pre>

<pre class="puppet"><code style="font-size: 16px; line-height: normal;" data-trim data-noescape># /etc/puppet/manifests/site.pp
node default {
  package { tzdata: ensure => installed }
  file { "/etc/localtime":
    ensure => "file:///usr/share/zoneinfo/US/Pacific"
  }
}

node 'smtp.thoughtworks.com' {
  include postfix
}
</code></pre>

<pre class="puppet"><code style="font-size: 16px; line-height: normal; height: 200px" data-trim data-noescape># /etc/puppet/modules/apt/manifests/init.pp
class apt {
  if ($operatingsystem == "Debian") {
    file { "/etc/apt/sources.list.d/custom-repository":
      source => "puppet:///apt/custom-repository",
      ensure => present,
    }
    cron { apt-update:
      command => "/usr/bin/apt-get update",
      user => root,
      hour => 0,
      minute => 0,
    }
  }
}

define apt::key(keyid) {
  file { "/root/$name-gpgkey":
    source => "puppet:///apt/$name-gpgkey"
  }

  exec { "Import $keyid to apt keystore":
    path => "/bin:/usr/bin",
    environment => "HOME=/root",
    command => "apt-key add /root/$name-gpgkey",
    user => "root",
    group => "root",
    unless => "apt-key list | grep $keyid",
  }
}
</code></pre>

---
## Managing the Configuration of Middleware
**Middleware**-web servers, messaging systems, or commercial off-the-shelf software (COTS)-can be divided into **binaries**, **configuration**, and **data**.

Managing Configuration:  <!-- .element class="fragment fade-in-with-next custom" -->
- **Database schemas**, **web server configs**, **app server settings**, **message queue configs**, and **any other system components** needing changes should be **version-controlled**.
- For **database schemas** and **messaging queues**, consider using **code-first** or **class-first** approaches.
- If your middleware isn't part of the **standard OS packages**, package it using your **OS's package manager** and place it on your **internal package server**. This allows you to manage the middleware with your **server management system consistently**.

Effective **middleware evaluation** and **configuration strategies**:  <!-- .element class="fragment fade-in-parent-with-next custom" -->
- Research the Product  <!-- .element: class="fragment insides-fade-in-then-out" -->
  - When seeking a low-cost, low-energy solution, ensure the product has a **strong automated configuration option**.
  - Make sure that **there isn't a better option** before you move on.
  - We only want to **version-control** our **work in their product**. One vendor's response was, "We'll add **our version control** in a future release." However, even if they did, it wouldn't have helped with our **immediate** project's configuration **consistency**.
- Examine How Your Middleware Handles State  <!-- .element: class="fragment insides-fade-in-then-out" -->
  - If your middleware **lacks automated configuration**, try **version-controlling** its **state storage (e.g. state binary files)**:
    - A simplest method is to **store the binaries in version control** along with **an installation script**.
    - Consider creating your **installer** or a **package** (like an RPM for RedHat-based Linux) for your specific needs.
- Look for a Configuration API  <!-- .element: class="fragment insides-fade-in-then-out" -->
  - One approach is to define **your own configuration file** for the system and using custom build tasks to interpret the scripts and use the API for configuration.
  - The **"invent your own"** configuration files strategy **empowers control**, enabling **version control** and **automation**.
- Use a Better Technology  <!-- .element: class="fragment insides-fade-in-then-out" -->
  - **At some point** we would strongly recommend adopting an **alternate technology** which is **more tractable**.
  - Many organizations **hesitate to switch software platforms** due to the **money already invested (sunk cost fallacy)**. But this ignores the potential benefits of adopting better technology.

<img src="assets/sunk-cost-fallacy.jpg" class="fragment end" width="600">

---
## Managing Infrastructure Services
It's common for **infrastructure services** (like routers and directory services) **issues** to **break software in production** environments.

Michael Nygard shared a story about **mysterious daily shutdowns** caused by a firewall dropping **inactive TCP connections after an hour**. During **idle nights**, the **firewall silently discarded TCP packets** from **pooled database connections**.  <!-- .element class="fragment fade-in-paragraph custom" -->

**Issues like this** can occur, and when they do, they can be **frustratingly hard to diagnose**. These are advices to make this easier:  <!-- .element class="fragment fade-in-parent-with-next custom" -->
- **Network component configurations**, like DNS, DHCP, firewalls, routers, and application services (e.g. SMTP), should be **version-controlled**.  <!-- .element class="fragment fade-in-then-semi-out-parent custom" -->
- Install a good **network monitoring system** like **Nagios**, OpenNMS, HP Operations Manager, or similar. Monitor **network connectivity** and **all ports used by your application routes**.  <!-- .element class="fragment fade-in-then-semi-out-parent custom" -->
- Log at **WARNING** when a **network connection times out/unexpectedly closes** and **INFO/DEBUG** when **opening/closing a connection** with **endpoint details**.  <!-- .element class="fragment fade-in-then-semi-out-parent custom" -->
- During **deployment**, ensure **smoke tests** check **all connections** for **routing or connectivity issues**.  <!-- .element class="fragment fade-in-then-semi-out-parent custom" -->
- For integration testing, replicate **production's network topology**, using the **same hardware/physical connections**.  <!-- .element class="fragment fade-in-then-semi-out-parent custom" -->
- For troubleshooting, you can use **forensic tools** like **Wireshark** and **Tcpdump** to inspect packets. For **file** and **socket insights**, rely on **Lsof (Unix)** or **Handle and TCPView (Windows)**.  <!-- .element class="fragment fade-in-then-semi-out-parent custom" -->

------
### Managing Infrastructure Services: Multihomed Systems
<img src="assets/multihomed-servers.png" width="600">

---
## Virtualization
<img src="assets/virtualization-meme.png" class="fragment start" width="1100">

Virtualization, in essence, adds a **layer of abstraction to computer resources**.

**Platform virtualization** involves simulating a computer system to run **multiple OS instances** concurrently on **one physical machine**. A **virtual machine monitor** (VMM) or **hypervisor** manages hardware, and **guest OSes** run on VMs managed by it. **Environment virtualization** extends this to **simulate one or more virtual machines** and **network connections** between them.  <!-- .element class="fragment fade-in-paragraph custom" -->

Virtualization, **developed** by **IBM in the 1960s**, offered an **alternative to multitasking time-sharing operating systems**.  <!-- .element class="fragment fade-in-paragraph custom" -->

Benefits:  <!-- .element class="fragment fade-in-with-next custom" -->
- **Fast response to changing requirements**: Need a new testing environment? A **new virtual machine can be provisioned in seconds** at no cost, versus **days or weeks to obtain a new physical environment**.  <!-- .element class="fragment fade-in-then-semi-out-parent custom" -->
- **Consolidation**: In immature organizations, teams often have separate CI and testing servers on physical machines. Virtualization helps by **unifying infrastructure into a service** for delivery teams, **improving hardware efficiency**.  <!-- .element class="fragment fade-in-then-semi-out-parent custom" -->
- **Standardizing hardware**: Functional differences between application subsystems **no longer need separate hardware setups**. Virtualization allows using a **single physical configuration** to run **various virtual environments and platforms**.  <!-- .element class="fragment fade-in-then-semi-out-parent custom" -->
- **Easier-to-maintain baselines**: Keep a library of **baseline images (OS, apps, and even environments)**, deploy them to a cluster with a click.  <!-- .element class="fragment fade-in-then-semi-out-parent custom" -->
- **Speed up long-running tests**: Instead of running them on a single machine, run them **parallel on a virtual machine grid** (e.g., from 13 hours to 45 minutes).  <!-- .element class="fragment fade-in-then-semi-out-parent custom" -->

------
### Managing Virtual Environments
A crucial **feature** of VMMs is that a virtual machine image is a **single file (aka disk image)**. Disk images are valuable because you can **copy** and **version** them, although **storing** them in **version control might be impractical**.

You can use them as **templates** or **baselines** (**known-good** versions for configuring and deploying the **rest** of your environments). Run automated process to **configure the OS and install software**. **Save a copy** of each box type in your environment **as a baseline**:  <!-- .element class="fragment fade-in-parent-with-next custom" -->

<table>
  <tr>
    <td>
      <small>Creating virtual environments from templates</small>
      <img src="assets/creating-virtual-environments-from-templates.png" width="550">
    </td>
    <td>
      <small>Creating VM templates</small>
      <img src="assets/creating-vm-templates.png" width="420">
    </td>
  </tr>
</table>

Virtualization helps **shift from manual to automated** environment management **gradually**. Create **templates** based on known-good systems **instead of automating from scratch**.  <!-- .element class="fragment fade-in-paragraph custom" -->

Virtualization helps with software that your application relies on that **cannot be installed or configured** in an **automated** way.  <!-- .element class="fragment fade-in-paragraph custom" -->

---
## Cloud Computing
<img src="assets/cloud-computing-meme.jpeg" class="fragment start">

In cloud computing, **information is stored on the internet** and **accessed** and **managed** through **online software services**.  <!-- .element class="fragment fade-in-paragraph custom" -->

Cloud computing's key feature is **scalability**, where **resources** like **CPU**, **memory**, and **storage** can **grow or shrink as needed**, with **costs based on usage**. It **encompasses** both **software services** and the underlying **hardware/software environments**.  <!-- .element class="fragment fade-in-paragraph custom" -->

Cloud types:  <!-- .element class="fragment fade-in-with-next custom" -->
- Infrastructure in the Cloud
  - e.g. Amazon Elastic Compute Cloud (AWS EC2)
- Platforms in the Cloud 
  - e.g. Google App Engine, Force.com

**One Size Doesn't Have to Fit All**:  You can host **static content and video on AWS**, the **application on Google App Engine**, and a **proprietary service on your own infrastructure**.  <!-- .element class="fragment fade-in-paragraph custom" -->

------
## Cloud Computing: Google App Engine
<img src="assets/google-app-engine.png">

---
## Monitoring Infrastructure and Applications
It is essential to have insight into what is going on in your production environments for three reasons:
- Businesses can get feedback on their strategies much faster if they have real-time business intelligence, such as how much revenue
they are generating and where that revenue is coming from.
- When something goes wrong, the operations team needs to be informed immediately that there is an incident, and have the necessary tools to track down the root cause of the incident and fix it.
- Historical data is essential for planning purposes. If you don't have detailed data on how your systems behaved when there was an unexpected spike in demand, or when new servers were added, it's impossible to plan evolving your infrastructure to meet your business
requirements.

There are four areas to consider when creating a monitoring strategy:
- Instrumenting your applications and your infrastructure so you can collect the data you need
- Storing the data so it can easily be retrieved for analysis
- Creating dashboards which aggregate the data and present it in a format suitable for operations and for the business
- Setting up notifications so that people can find out about the events they care about

------
### Collecting Data
Monitoring data can come from the following sources:
- Your hardware, via out-of-band management (also known as lights-out management or LOM). Almost all modern server hardware implements the Intelligent Platform Management Interface (IPMI) which lets you monitor voltages, temperatures, system fan speeds, peripheral health, and so forth, as well as perform actions such as power cycling or lighting an identification light on the front panel, even if the box is powered off.
- The operating system on the servers comprising your infrastructure. All operating systems provide interfaces to get performance information such as memory usage, swap usage, disk space, I/O bandwidth (per disk and NIC), CPU usage, and so forth. It's also useful to monitor the process table to work out the resources each process is consuming. On UNIX, Collectd is the standard way to gather this data. On Windows, it's done using a system called performance counters, which can also be used by other providers of performance data.
- Your middleware. This can provide information on the usage of resources such as memory, database connection pools, and thread pools, as well as information on the number of connections, response time, and so forth.
- Your applications. Applications should be written so that they have hooks to monitor things that both operations and business users care about, such as the number of business transactions, their value, conversion rate, and so forth. Applications should also make it easy to analyze user demographics and behavior. They should record the status of connections to external systems that they rely on. Finally, they should be able to report their version number and the versions of their internal components, if applicable.

There are many tools that will gather everything described above across your whole data center, store it, produce reports, graphs, and dashboards, and provide notification mechanisms:
- Zabbix
- Grafana
- Prometheus
- Pro
- Nagios
- OpenNMS
- Flapjack
- Zenoss
- IBM Tivoli
- HP Operations MAnager
- Splunk

------
### Collecting Data: SNMP
<img src="assets/snmp-not-my-problem-meme.jpg" class="fragment start">

SNMP is the most venerable and ubiquitous standard for monitoring:
- Managed Devices (physical systems such as servers, switches, firewalls, and so forth)
- Agents (talk to the individual applications or devices that you want to monitor and manage via SNMP)
- Network Management System (monitors and controls managed devices)

<img src="assets/snmp-architecture.png" width="300">

In SNMP, everything is a variable. You monitor systems by watching variables and control them by setting variables. Which variables are available for any given type of SNMP agent, with their descriptions, their types, and whether they can be written to or are read-only, is described in a MIB (Management Information Base), an extensible database format.

Each vendor defines MIBs for the systems it provides SNMP agents for, and the IANA maintains a central registry.

<img src="assets/mib-file-example.jpg" width="200">

Most operating systems, most common middleware (Apache, WebLogic, and Oracle, for example), as well as many devices have SNMP built-in.

<img src="assets/snmp-meme.jpg" class="fragment end">

------
### Logging
<img src="assets/log-well-meme.webp" class="fragment start">

Logging is **essential** in your **monitoring strategy**. Treat it as a **key part of auditability**, just like other **non-functional requirements**.  <!-- .element class="fragment fade-in-paragraph custom" -->

Pay attention to **log levels** but ensure **configurability at runtime/deployment** to show different levels when debugging is needed:  <!-- .element class="fragment fade-in-parent-with-next custom" -->

<img src="assets/log-levels.png" width="800">

The operations team is the **main consumer of log files**.  <!-- .element class="fragment fade-in-paragraph custom" -->

------
### Creating Dashboards
It's essential that the operations team has a big visible display where they can see at a high level if there are any incidents

All the open source and commercial tools offer this kind of facility, including the ability to view historical trends and do some kind of reporting:

<img src="assets/nagios-dashboard.png">

There are potentially thousands of things that you could monitor, and it is essential to plan ahead so your operations dashboard isn't drowned in noise. Come up with a list of risks, categorized by probability and impact.

In terms of aggregating data, the red-amber-green traffic light aggregation is well understood and commonly used. Green means all of the following are true:
- All expected events have occurred.
- No abnormal events have occurred.
- All metrics are nominal (within two standard deviations for this time period).
- All states are fully operational.
Amber means at least one of the following is true:
- An expected event has not occurred.
- At least one abnormal event, with a medium severity, has occurred.
- One or more parameters are above or below the nominal values.
- A noncritical state is not fully operational (for example, a circuit breaker has cut off a noncritical feature).
Red means at least one of the following is true:
- A required event has not occurred.
- At least one abnormal event, with a high severity, has occurred.
- One or more parameters are far above or below the nominal values.
- A critical state is not fully operational (for example, "accepting requests" is false where it should be true).

------
### Behavior-Driven Monitoring [Infrastructure]
Operations personnel can write automated tests to verify the behavior of their infrastructure

You can start by writing the test, verifying that it fails, and then defining a Puppet manifest (or whatever your configuration management tool of choice is) that puts your infrastructure into the expected state. You then run the test to verify that the configuration worked correctly and your infrastructure behaves as expected.

Example (can be run by [Cucumber Nagios](https://auxesis.github.io/cucumber-nagios/)):

<pre class="gherkin"><code style="font-size: 17px; line-height: normal;" data-trim data-noescape>Feature: google.com
  It should be up
  And I should be able to search for things

  Scenario: Searching for things
    When I go to "http://www.google.com.au/"
    And I fill in "q" with "wikipedia"
    And I press "Google Search"
    Then I should see "www.wikipedia.org"
</code></pre>

<img src="assets/cucumber-nagios.png">

---
## Summary
When **assessing third-party products** for your enterprise system, **prioritize compatibility with** your **automated configuration management strategy**.

Have an **infrastructure management strategy** from the **project's start** and **involve** both **development and operations** teams' stakeholders.
