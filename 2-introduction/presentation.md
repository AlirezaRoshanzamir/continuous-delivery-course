## Continuous Delivery: Introduction
#### Definition, <span style="color: brown">Minimum Viable CD</span>, <span style="color: purple">Ingredients</span>, Deployment Pipeline, Why?, <span style="color: green">Impacts (Software Delivery Performance, Culture)</span>, <span style="color: brown">Relation with Other Movements</span>, <span style="color: brown">Scrumfall</span>, Case Studies, <span style="color: brown">CD Patterns Mindmap</span>

<img src="assets/cd-phases.png" width="1100"/>

<small><strong>Time to Read:</strong> 12 Minutes</small>, <small><strong>Time to Present:</strong> 60 Minutes</small>

<small><strong>Created By:</strong> Alireza Roshanzamir</small>

<small><strong>Keywords:</strong> Continuous Delivery, Continuous Integration, DevOps, Build, Test, Release, Deployment, Automation, Version Control, Deployment Pipeline</small>

<small><small>Tir 1402/August 2023</small></small>

---
## Definition
Contiuous delivery is an **ability**, **development practice**, **discipline**, and **capability** to:

- Deliver **all kinds of changes** to users **safely**, **quickly**, and **sustainably**.  <!-- .element: class="fragment fade-in-then-semi-out-parent custom" -->
- The system can be **used by users** or put into **production** whenever needed (at least **once daily**).  <!-- .element: class="fragment fade-in-then-semi-out-parent custom" -->
- The team focuses on **maintaining deployable software** rather than **developing new features**.  <!-- .element: class="fragment fade-in-then-semi-out-parent custom" -->
- **Fast feedback** is available to **all team members**.  <!-- .element: class="fragment fade-in-then-semi-out-parent custom" -->

<img src="assets/continuous-delivery-feedbacks.png">

---
## Minimum Viable CD
<img src="assets/minimum-meme.jpg" class="fragment start">

The **very** minimum activities for CD include (some items can be used interchangeably):
- Small autonomous teams, Small steps (work in small batches), Fast feedback, Informed decision making  <!-- .element class="fragment highlight-current-blue" -->
- Version control (source code, tests, [technical] docs, application configuration, build and deployment scripts, etc.)  <!-- .element class="fragment highlight-current-blue" -->
- Continuous integration, Trunk-based development  <!-- .element class="fragment highlight-current-blue" -->
- Deployment pipeline, Traceability  <!-- .element class="fragment highlight-current-blue" -->
- All feature work stops when the pipeline is red  <!-- .element class="fragment highlight-current-blue" -->
- Automated testing  <!-- .element class="fragment highlight-current-blue" -->
- Immutable artifacts  <!-- .element class="fragment highlight-current-blue" -->
- One route to production, Automated deployment  <!-- .element class="fragment highlight-current-blue" -->
- Production-like test environment  <!-- .element class="fragment highlight-current-blue" -->
- Rollback on-demand  <!-- .element class="fragment highlight-current-blue" -->
- Observability  <!-- .element class="fragment highlight-current-blue" -->

For detailed information, visit [Minimum CD](https://minimumcd.org/minimumcd) and [14 Step Continuous Delivery Checklist](https://www.youtube.com/watch?v=i2DrLsnETk4).

---
## Ingredients
<img src="assets/cd-ingredients-meme.jpg" class="fragment start">

Ingredients:  <!-- .element: class="fragment fade-in-with-next custom" -->
- **Configuration management**
  - Any new environment reproduced from the **same configuration** is **identical**.  <!-- .element: class="fragment fade-in-then-semi-out-parent custom" -->
  - Everything is **versioned** and **automated**.  <!-- .element: class="fragment fade-in-then-semi-out-parent custom" -->
- **Continuous integration**
  - Developers integrate their work **into the trunk daily**.  <!-- .element: class="fragment fade-in-then-semi-out-parent custom" -->
  - **If it hurts, do it more** often and bring the pain forward (XP principle).  <!-- .element: class="fragment fade-in-then-semi-out-parent custom" -->
  - A set of **automated tests** is run both **before** and **after** the merge.  <!-- .element: class="fragment fade-in-then-semi-out-parent custom" -->
  - If the automated tests **fail**, the **team stops** what they are doing.  <!-- .element: class="fragment fade-in-then-semi-out-parent custom" -->
- **Automated and continuous testing**
  - Build **quality in**  <!-- .element: class="fragment fade-in-then-semi-out-parent custom" -->
  - Run various test types-**manual and automated**-continuously during the delivery process.  <!-- .element: class="fragment fade-in-then-semi-out-parent custom" -->
  - **Functional acceptance**, **usability**, **exploratory**, **unit**, **component**, **system**, and **non-functional acceptance** (capacity, security, availability) tests.  <!-- .element: class="fragment fade-in-then-semi-out-parent custom" -->

------
### CI Certification Test
<img src="assets/ci-certification-test.png">

---
## Deployment Pipeline
A key **pattern** in CD from continuous integration and test automation:

<img src="assets/deployment-pipeline-sequence-diagram.png" alt="Took from https://continuousdelivery.com/foundations/test-automation/" width="800px"/>

---
## Why?
<img src="assets/why-meme.png" class="fragment start">

- Make releases **painless** **low-risk** events  <!-- .element: class="fragment fade-in-then-semi-out-parent custom" -->
- Reduce **time to market**   <!-- .element: class="fragment fade-in-then-semi-out-parent custom" -->
- Increase **software quality** and **stability**  <!-- .element: class="fragment fade-in-then-semi-out-parent custom" -->
- Reduce the **cost** of ongoing software development  <!-- .element: class="fragment fade-in-then-semi-out-parent custom" -->
- Increase **customer** and **employee satisfaction**  <!-- .element: class="fragment fade-in-then-semi-out-parent custom" -->

<img src="assets/idea-to-release.png">

---
## Impacts
<img src="assets/cd-practices-are-useless-meme.jpg" class="fragment start" style="border: 1px solid lightgray">

The following image is extracted from the book **Accelerate** and embodies a **four-year** research project initiated in **2013**. This study sought to explore vital **capabilities** and **practices** that accelerate software **development** and **delivery**, enhancing **company value**. To achieve this, researchers used rigorous **academic research methods**:  <!-- .element: class="fragment fade-in-paragraph custom" -->

<img src="assets/accelerate-overall-research-program.png" alt="Took from the Accelerate book and https://abinoda.com/book/accelerate" width="1050"/>

------
### Impacts - Software Delivery Performance
Based on the results of the mentioned research, companies are categorized into **three clusters**:
<table>
  <tr>
    <td><img src="assets/accelerate-software-delivery-performance-for-2017.png" alt="Took from the Accelerate book"/></td>
    <td><img src="assets/accelerate-new-work-vs-unplanned-work.png" alt="Took from the Accelerate book"/></td>
  </tr>
</table>

Visit https://dora.dev/quickcheck/ to check your software delivery performance.

------
### Impacts - Software Delivery Performance over Time
The **performance gap** between high and low performers **increases over time**:

<table>
  <tr>
    <td><img src="assets/accelerate-change-lead-rate.png" alt="Took from the Accelerate book" width="400px"/></td>
    <td><img src="assets/accelerate-change-failure-rate.png" alt="Took from the Accelerate book" width="400px"/></td>
  </tr>
  <tr>
    <td><img src="assets/accelerate-deploy-frequency.png" alt="Took from the Accelerate book" width="400px"/></td>
    <td><img src="assets/accelerate-mttr.png" alt="Took from the Accelerate book" width="400px"/></td>
  </tr>
</table>

------
### Impacts - Westrum Organization Culture Model
The model of **how to change culture** has changed:

<img src="assets/change-culture.png" width="500">

------
### Continued: Impacts - Westrum Organization Culture Model
The **continuous delivery** practices significantly impact the organization's culture, fostering a more **generative environment**.

<img src="assets/accelerate-westrum-model.png" alt="Took from the Accelerate book" width="900px"/>

---
## Relation with Agile, DevOps, Lean
In short, they vary in **origin**, **history**, **covered aspects**, and **principles**. However, there's a notable **mutual relationship** between these movements:

- **Agile:** Flexible, **iterative** software **development** approach with short cycles and stakeholder involvement.<br/>
  _Keywords:_ Iterative, XP, Scrum, Kanban, Sprint, Epic, Feature, User Story, Product Owner, Scrum Master, Agile Manifesto  <!-- .element class="fragment highlight-current-blue-parent custom" -->
- **DevOps:** **Practices** bridging **development and operations** for faster, higher-quality software delivery.<br/>
  _Keywords:_ Wall of Confusion, Collaboration, Automation, Continuous Delivery, Continuously Monitor, Respond to Changes, Feedback Loop, Cultural Transformation  <!-- .element class="fragment highlight-current-blue-parent custom" -->
- **Lean:** **Management practices** aiming to **eliminate waste** and **maximize value** in software development.<br/>
  _Keywords:_ Waste Reduction, Define Value, Map the Value Stream, Create Flow, Establish Pull, Pursue Perfection, Lean Startup, MVP, Muda, Mura, Muri, Jidoka  <!-- .element class="fragment highlight-current-blue-parent custom" -->
- **Continuous Delivery:** **Automated**, **streamlined** software deployment to ensure a **deployable state at all times**.<br/>
  _Keywords:_ Automation, Continuous Testing, Deployment Pipeline, Deployment Frequency, Continuous Deployment, Release Management, Version Control, Configuration Management, Canary Deployment, Rollback Strategies  <!-- .element class="fragment highlight-current-blue-parent custom" -->

------
### Continued: Relation with Agile, DevOps, Lean
Finally, look at the **first principle** behind the **Agile manifesto**:

<img src="assets/cd-in-agile-manifesto.png" width="600">

------
### Continued: Relation with Agile, DevOps, Lean
**Agile** optimizes **software development**, but doesn't address the full IT **value stream**. In contrast, **DevOps** breaks down **Dev and Ops barriers** for holistic optimization. **Lean** has a broader view, focusing on **entire value stream** improvement:

<img src="assets/lean-agile-devops.png" alt="Took from https://www.linkedin.com/pulse/how-lean-agile-devops-related-each-other-umesh-kumar" width="1100"/>

---
## Scrumfall (Water-Scrum-Fall)
**Water-Scrum-Fall** describes how Agile is often used now. But, **partial Scrum implementation** can cause issues:
<table>
  <tr>
    <td><img src="assets/scrumfall-1.png" width="500"></img></td>
    <td><img src="assets/scrumfall-2.webp" width="500"></img></td>
  </tr>
</table>

---
## HP Laserjet Framework Case Study
**Before CI:**
<img src="assets/hp-2008.png" width="700">

------
## Continued: HP Laserjet Framework Case Study
**The CI pipeline:**
<img src="assets/hp-pipeline.png" width="700">

------
## Continued: HP Laserjet Framework Case Study
**After CI:**
<img src="assets/hp-2008-to-2011.png" width="600">

<img src="assets/continuous-delivery-rework-meme.jpeg" class="fragment fade-in" width="350">

---
## CD Patterns Mindmap
<small><a href="https://app.zenflowchart.com/mindmap/ZLbSFGkwvQBEEnXBxG5V">Link to the mindmap</a></small>

<img src="assets/cd-patterns-mindmap.jpg" width="700">

---
## Summary
The practices of continuous delivery bring several important **benefits**:
- Low risk releases
- Faster time to market
- Higher quality
- Lower costs
- Better products
  - This means we can avoid the **2/3 of features** we build that  deliver **zero** or **negative value** to our businesses.
- Happier teams

Continuous delivery isn't magic. It's about **continuous, daily improvement**: consistently striving for better results by embracing the principle **"if it hurts, do it more often, and bring the pain forward"**.  <!-- .element: class="fragment fade-in-parent-with-next custom" -->
<img src="assets/continuous-improvement-meme.jpg" width="250">
