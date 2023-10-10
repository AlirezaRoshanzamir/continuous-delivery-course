## Continuous Delivery: Introduction
#### Definition, <span style="color: brown">Minimum Viable CD</span>, <span style="color: purple">Ingredients</span>, Deployment Pipeline, Why?, <span style="color: green">Impacts (Software Delivery Performance, Culture)</span>, <span style="color: brown">Relation with Other Movements</span>, <span style="color: brown">Scrumfall</span>, Case Studies, <span style="color: brown">CD Patterns Mindmap</span>

<img src="assets/cd-phases.webp" width="1100"/>

<small><strong>Time to Read:</strong> 12 Minutes</small>, <small><strong>Time to Present:</strong> 45 Minutes</small>
<br>
<small><strong>Created By:</strong> Alireza Roshanzamir</small>
<br>
<small><strong>Keywords:</strong> Continuous Delivery, Continuous Integration, DevOps, Build, Test, Release, Deployment, Automation, Version Control, Deployment Pipeline</small>
<br><br>
<small style="color: darkred"><small>Press **"F"** to go fullscreen; some slides may not display properly otherwise.</small></small>

---
## Definition
Contiuous delivery is an **ability**, **development practice**, **discipline**, and **capability** to:

- &shy;<!-- .element class="fragment fade-in-then-semi-out" -->Deliver **all kinds of changes** to users **safely**, **quickly**, and **sustainably**.
- &shy;<!-- .element class="fragment fade-in-then-semi-out" -->The system can be **used by users** or put into **production** whenever needed (at least **once daily**).
- &shy;<!-- .element class="fragment fade-in-then-semi-out" -->The team focuses on **maintaining deployable software** rather than **developing new features**.
- &shy;<!-- .element class="fragment fade-in-then-semi-out" -->**Fast feedback** is available to **all team members**.

<img src="assets/continuous-delivery-feedbacks.webp">

---
## Minimum Viable CD
<img src="assets/minimum-meme.webp" class="fragment start">

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
<img src="assets/cd-ingredients-meme.webp" class="fragment start">

Ingredients:  <!-- .element: class="fragment fade-in-with-next custom" -->
- **Configuration management**
  - &shy;<!-- .element: class="fragment fade-in-then-semi-out" -->Any new environment reproduced from the **same configuration** is **identical**.
  - &shy;<!-- .element: class="fragment fade-in-then-semi-out" -->Everything is **versioned** and **automated**.
- **Continuous integration**
  - &shy;<!-- .element: class="fragment fade-in-then-semi-out" -->Developers integrate their work **into the trunk daily**.
  - &shy;<!-- .element: class="fragment fade-in-then-semi-out" -->**If it hurts, do it more** often and bring the pain forward (XP principle).
  - &shy;<!-- .element: class="fragment fade-in-then-semi-out" -->A set of **automated tests** is run both **before** and **after** the merge.
  - &shy;<!-- .element: class="fragment fade-in-then-semi-out" -->If the automated tests **fail**, the **team stops** what they are doing.
- **Automated and continuous testing**
  - &shy;<!-- .element: class="fragment fade-in-then-semi-out" -->Build **quality in**
  - &shy;<!-- .element: class="fragment fade-in-then-semi-out" -->Run various test types-**manual and automated**-continuously during the delivery process.
  - &shy;<!-- .element: class="fragment fade-in-then-semi-out" -->**Functional acceptance**, **usability**, **exploratory**, **unit**, **component**, **system**, and **non-functional acceptance** (capacity, security, availability) tests.

------
### CI Certification Test
<img src="assets/ci-certification-test.webp">

---
## Deployment Pipeline
A key **pattern** in CD from continuous integration and test automation:

<img src="assets/deployment-pipeline-sequence-diagram.webp" alt="Took from https://continuousdelivery.com/foundations/test-automation/" width="800px"/>

---
## Why?
<img src="assets/why-meme.webp" class="fragment start">

- &shy;<!-- .element class="fragment fade-in-then-semi-out" -->Make releases **painless** **low-risk** events
- &shy;<!-- .element class="fragment fade-in-then-semi-out" -->Reduce **time to market** 
- &shy;<!-- .element class="fragment fade-in-then-semi-out" -->Increase **software quality** and **stability**
- &shy;<!-- .element class="fragment fade-in-then-semi-out" -->Reduce the **cost** of ongoing software development
- &shy;<!-- .element class="fragment fade-in-then-semi-out" -->Increase **customer** and **employee satisfaction**

<img src="assets/idea-to-release.webp">

---
## Impacts
<img src="assets/cd-practices-are-useless-meme.webp" class="fragment start" style="border: 1px solid lightgray">

&shy;<!-- .element class="fragment fade-in" -->The following image is extracted from the book **Accelerate** and embodies a **four-year** research project initiated in **2013**. This study sought to explore vital **capabilities** and **practices** that accelerate software **development** and **delivery**, enhancing **company value**. To achieve this, researchers used rigorous **academic research methods**:

<img src="assets/accelerate-overall-research-program.webp" alt="Took from the Accelerate book and https://abinoda.com/book/accelerate" width="1050"/>

------
### Impacts - Software Delivery Performance
Based on the results of the mentioned research, companies are categorized into **three clusters**:
<table>
  <tr>
    <td><img src="assets/accelerate-software-delivery-performance-for-2017.webp" alt="Took from the Accelerate book"/></td>
    <td><img src="assets/accelerate-new-work-vs-unplanned-work.webp" alt="Took from the Accelerate book"/></td>
  </tr>
</table>

Visit https://dora.dev/quickcheck/ to check your software delivery performance.

------
### Impacts - Software Delivery Performance over Time
The **performance gap** between high and low performers **increases over time**:

<table>
  <tr>
    <td><img src="assets/accelerate-change-lead-rate.webp" alt="Took from the Accelerate book" width="400px"/></td>
    <td><img src="assets/accelerate-change-failure-rate.webp" alt="Took from the Accelerate book" width="400px"/></td>
  </tr>
  <tr>
    <td><img src="assets/accelerate-deploy-frequency.webp" alt="Took from the Accelerate book" width="400px"/></td>
    <td><img src="assets/accelerate-mttr.webp" alt="Took from the Accelerate book" width="400px"/></td>
  </tr>
</table>

------
### Impacts - Westrum Organization Culture Model
The model of **how to change culture** has changed:

<img src="assets/change-culture.webp" width="500">

------
### Continued: Impacts - Westrum Organization Culture Model
The **continuous delivery** practices significantly impact the organization's culture, fostering a more **generative environment**.

<img src="assets/accelerate-westrum-model.webp" alt="Took from the Accelerate book" width="900px"/>

---
## Relation with Agile, DevOps, Lean
In short, they vary in **origin**, **history**, **covered aspects**, and **principles**. However, there's a notable **mutual relationship** between these movements:

- &shy;<!-- .element class="fragment highlight-current-blue" -->**Agile:** Flexible, **iterative** software **development** approach with short cycles and stakeholder involvement.<br/>
  _Keywords:_ Iterative, XP, Scrum, Kanban, Sprint, Epic, Feature, User Story, Product Owner, Scrum Master, Agile Manifesto
- &shy;<!-- .element class="fragment highlight-current-blue" -->**DevOps:** **Practices** bridging **development and operations** for faster, higher-quality software delivery.<br/>
  _Keywords:_ Wall of Confusion, Collaboration, Automation, Continuous Delivery, Continuously Monitor, Respond to Changes, Feedback Loop, Cultural Transformation
- &shy;<!-- .element class="fragment highlight-current-blue" -->**Lean:** **Management practices** aiming to **eliminate waste** and **maximize value** in software development.<br/>
  _Keywords:_ Waste Reduction, Define Value, Map the Value Stream, Create Flow, Establish Pull, Pursue Perfection, Lean Startup, MVP, Muda, Mura, Muri, Jidoka
- &shy;<!-- .element class="fragment highlight-current-blue" -->**Continuous Delivery:** **Automated**, **streamlined** software deployment to ensure a **deployable state at all times**.<br/>
  _Keywords:_ Automation, Continuous Testing, Deployment Pipeline, Deployment Frequency, Continuous Deployment, Release Management, Version Control, Configuration Management, Canary Deployment, Rollback Strategies

------
### Continued: Relation with Agile, DevOps, Lean
Finally, look at the **first principle** behind the **Agile manifesto**:

<img src="assets/cd-in-agile-manifesto.webp" width="600">

------
### Continued: Relation with Agile, DevOps, Lean
**Agile** optimizes **software development**, but doesn't address the full IT **value stream**. In contrast, **DevOps** breaks down **Dev and Ops barriers** for holistic optimization. **Lean** has a broader view, focusing on **entire value stream** improvement:

<img src="assets/lean-agile-devops.webp" alt="Took from https://www.linkedin.com/pulse/how-lean-agile-devops-related-each-other-umesh-kumar" width="1100"/>

---
## Scrumfall (Water-Scrum-Fall)
**Water-Scrum-Fall** describes how Agile is often used now. But, **partial Scrum implementation** can cause issues:
<table>
  <tr>
    <td><img src="assets/scrumfall-1.webp" width="500"></img></td>
    <td><img src="assets/scrumfall-2.webp" width="500"></img></td>
  </tr>
</table>

---
## HP Laserjet Framework Case Study
**Before CI:**

<img src="assets/hp-2008.webp" width="700">

------
## Continued: HP Laserjet Framework Case Study
**The CI pipeline:**

<img src="assets/hp-pipeline.webp" width="700">

------
## Continued: HP Laserjet Framework Case Study
**After CI:**

<img src="assets/hp-2008-to-2011.webp" width="600">

<img src="assets/continuous-delivery-rework-meme.webp" class="fragment fade-in" width="350">

---
## CD Patterns Mindmap
<small><a href="https://app.zenflowchart.com/mindmap/ZLbSFGkwvQBEEnXBxG5V">Link to the mindmap</a></small>

<img src="assets/cd-patterns-mindmap.webp" width="700">

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

&shy;<!-- .element: class="fragment fade-in-with-next custom" -->Continuous delivery isn't magic. It's about **continuous, daily improvement**: consistently striving for better results by embracing the principle **"if it hurts, do it more often, and bring the pain forward"**.

<img src="assets/continuous-improvement-meme.webp" width="250">
