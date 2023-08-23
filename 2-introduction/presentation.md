## Continuous Delivery: Introduction
#### Definition, <span style="color: blue">Minimum Viable CD</span>, Ingredients, Deployment Pipeline, <span style="color: green">Impacts (Software Delivery Performance, Culture)</span>, <span style="color: blue">Relation with Other Movements</span>, <span style="color: blue">Scrumfall</span>, Case Studies, <span style="color: blue">CD Patterns Mindmap</span>

<img src="assets/cd-phases.png" width="1100"/>

<small><strong>Lecturer:</strong> Alireza Roshanzamir</small>

<small><strong>Keywords:</strong> Continuous Delivery, Continuous Integration, DevOps, Build, Test, Release, Deployment, Automation, Version Control, Deployment Pipeline</small>

<small><small>Tir 1402/August 2023</small></small>

---
## Definition
Contiuous delivery is an **ability**, **development practice**, **discipline**, and **capability** to:

- Get changes of all types into the hands of users safely and quickly in a sustainable way.  <!-- .element: class="fragment fade-in-then-semi-out" -->
- The system can be deployed to production or end users at any time, on-demand (at least once a day).  <!-- .element: class="fragment fade-in-then-semi-out" -->
- The team prioritizes keeping the software in a deployable state over working on new features.  <!-- .element: class="fragment fade-in-then-semi-out" -->
- Fast feedback is available to all team members.  <!-- .element: class="fragment fade-in-then-semi-out" -->

<img src="assets/continuous-delivery-feedbacks.png">

---
## Minimum Viable CD
The **very** minimum activities required for CD are (some items have overlap and may be used interchangeably):

- Small autonomous teams, Small steps (work in small **batches**), Fast feedback, Informed decision making
- Version control (source code, tests, [technical] docs, application configuration, build and deployment scripts, etc.)
- Continuous integration, Trunk-based development
- Deployment pipeline, Traceability
- All feature work stops when the pipeline is red
- Automated testing
- Immutable artifacts
- One route to production, Automated deployment
- Production-like test environment
- Rollback on-demand
- Observability

For detailed information, visit [Minimum CD](https://minimumcd.org/minimumcd) and [14 Step Continuous Delivery Checklist](https://www.youtube.com/watch?v=i2DrLsnETk4).

---
## Ingredients

- **Configuration management**
  - Any new environment reproduced from the same configuration is identical.  <!-- .element: class="fragment fade-in-then-semi-out" -->
  - Everything is versioned and automated.  <!-- .element: class="fragment fade-in-then-semi-out" -->
- **Continuous integration**
  - Developers integrate all their work into the trunk at least daily.  <!-- .element: class="fragment fade-in-then-semi-out" -->
  - If it hurts, do it more often and bring the pain forward (XP principle).  <!-- .element: class="fragment fade-in-then-semi-out" -->
  - A set of automated tests is run both before and after the merge.  <!-- .element: class="fragment fade-in-then-semi-out" -->
  - If the automated tests fail, the team stops what they are doing.  <!-- .element: class="fragment fade-in-then-semi-out" -->
- **Automated and continuous testing**
  - Build quality in  <!-- .element: class="fragment fade-in-then-semi-out" -->
  - Run many different types of tests-both manual and automated-continually throughout the delivery process.  <!-- .element: class="fragment fade-in-then-semi-out" -->
  - Functional acceptance, usability, exploratory, unit, component, system, and non-functional acceptance (capacity, security, availability) tests.  <!-- .element: class="fragment fade-in-then-semi-out" -->

------
### CI Certification Test
<img src="assets/ci-certification-test.png">

---
## Deployment Pipeline
A key pattern in CD from continuous integration and test automation:

<img src="assets/deployment-pipeline-sequence-diagram.png" alt="Took from https://continuousdelivery.com/foundations/test-automation/" width="800px"/>

---
## Why?
Why continuous delivery?
- Make releases painless low-risk events  <!-- .element: class="fragment fade-in-then-semi-out" -->
- Reduce time to market  <!-- .element: class="fragment fade-in-then-semi-out" -->
- Increase software quality and stability  <!-- .element: class="fragment fade-in-then-semi-out" -->
- Reduce the cost of ongoing software development  <!-- .element: class="fragment fade-in-then-semi-out" -->
- Increase customer and employee satisfaction  <!-- .element: class="fragment fade-in-then-semi-out" -->

<img src="assets/idea-to-release.png">

---
## Impacts
The following image is extracted from the book **Accelerate** and represents the culmination of a four-year research project that began in 2013. This study aimed to investigate the crucial capabilities and practices that can accelerate software development and delivery, thereby adding value to companies. To achieve this, the researchers employed rigorous research methods typically associated with academia:

<img src="assets/accelerate-overall-research-program.png" alt="Took from the Accelerate book and https://abinoda.com/book/accelerate" width="1050"/>

------
### Impacts - Software Delivery Performance
Based on the results of the aforementioned research, the companies have been divided into three clusters:

<table>
  <tr>
    <td><img src="assets/accelerate-software-delivery-performance-for-2017.png" alt="Took from the Accelerate book"/></td>
    <td><img src="assets/accelerate-new-work-vs-unplanned-work.png" alt="Took from the Accelerate book"/></td>
  </tr>
</table>

Visit https://dora.dev/quickcheck/ to check your software delivery performance.

------
### Impacts - Software Delivery Performance over Time
The performance gap between the high and the low performers widens over time:

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
The model of how to change culture has changed:

<img src="assets/change-culture.png" width="500">

------
### Continued: Impacts - Westrum Organization Culture Model
The set of technical practices known as continuous delivery indeed has a significant impact on the organization's culture, leading to a more generative environment:

<img src="assets/accelerate-westrum-model.png" alt="Took from the Accelerate book" width="900px"/>

---
## Relation with Agile, DevOps, Lean
In short, they differ in their place of **origin**, **history**, **aspects covered**, and **principles**. However, there is a significant **reciprocal relationship** between these movements:

- **Agile:** Flexible, iterative software _development_ approach with short cycles and stakeholder involvement.<br/>
  _Keywords:_ Iterative, XP, Scrum, Kanban, Sprint, Epic, Feature, User Story, Product Owner, Scrum Master, Agile Manifesto
- **DevOps:** _Practices_ bridging development and operations for faster, higher-quality software delivery.<br/>
  _Keywords:_ Wall of Confusion, Collaboration, Automation, Continuous Delivery, Continuously Monitor, Respond to Changes, Feedback Loop, Cultural Transformation
- **Lean:** _Management practices_ aiming to eliminate waste and maximize value in software development.<br/>
  _Keywords:_ Waste Reduction, Define Value, Map the Value Stream, Create Flow, Establish Pull, Pursue Perfection, Lean Startup, MVP, Muda, Mura, Muri, Jidoka
- **Continuous Delivery:** _Automated_, _streamlined_ software deployment to ensure a deployable state at all times.<br/>
  _Keywords:_ Automation, Continuous Testing, Deployment Pipeline, Deployment Frequency, Continuous Deployment, Release Management, Version Control, Configuration Management, Canary Deployment, Rollback Strategies

------
### Continued: Relation with Agile, DevOps, Lean
Finally, look at the first principle behind the Agile manifesto:

<img src="assets/cd-in-agile-manifesto.png" width="600">

------
### Continued: Relation with Agile, DevOps, Lean
**Agile** aims to optimize software development specifically, without considering other parts of the IT value stream. **DevOps**, on the other hand, recognizes that this approach merely shifts the constraint downstream to Ops, and therefore, it strives to break down walls between development and operations. **Lean** takes a broader perspective, emphasizing the optimization of the entire value stream:

<img src="assets/lean-agile-devops.png" alt="Took from https://www.linkedin.com/pulse/how-lean-agile-devops-related-each-other-umesh-kumar" width="1100"/>

---
## Scrumfall (Water-Scrum-Fall)
Water-Scrum-Fall is a term to describe the reality of the current state of Agile as it exists in many organizations today. But, partial Scrum implementation can have negative consequences.
<table>
  <tr>
    <td><img src="assets/scrumfall-1.png" width="500"></img></td>
    <td><img src="assets/scrumfall-2.webp" width="500"></img></td>
  </tr>
</table>

---
## HP Laserjet Framework Case Study
Before CI:

<img src="assets/hp-2008.png" width="700">

------
## Continued: HP Laserjet Framework Case Study
The CI pipeline:

<img src="assets/hp-pipeline.png" width="700">

------
## Continued: HP Laserjet Framework Case Study
After CI:

<img src="assets/hp-2008-to-2011.png" width="700">

---
## CD Patterns Mindmap
<small><a href="https://app.zenflowchart.com/mindmap/ZLbSFGkwvQBEEnXBxG5V">Link to the mindmap</a></small>

<img src="assets/cd-patterns-mindmap.jpg" width="700">

---
## Summary
The practices at the heart of continuous delivery help us achieve several important benefits:
- Low risk releases
- Faster time to market
- Higher quality
- Lower costs
- Better products
  - This means we can avoid the **2/3 of features** we build that  deliver **zero** or **negative value** to our businesses.
- Happier teams

Continuous delivery is not magic. It's about **continuous, daily improvement**: the constant discipline of pursuing higher performance by following the heuristic **"if it hurts, do it more often, and bring the pain forward"**.

<img src="assets/continuous-improvement-meme.jpg" width="220">
