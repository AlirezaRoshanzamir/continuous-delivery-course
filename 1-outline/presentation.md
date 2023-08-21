## Continuous Delivery: Course Outline
#### Reliable Software Releases through Build, Test, and Deployment Automation

<img src="assets/devops-loop.png" width="700"/>

<small><strong>Lecturer:</strong> Alireza Roshanzamir</small>

<small><strong>Keywords:</strong> Continuous Delivery, Continuous Integration, DevOps, Build, Test, Release, Deployment, Automation, Version Control, Deployment Pipeline</small>

<small><small>Tir 1402/August 2023</small></small>

<details>
<summary>Note</summary>
Mention the deploy vs release and why their order is different in different places (feature toggle, release candidate, library vs application, multiple release and versioning and one deployment).
</details>

---
## Lecturer
<table>
    <tr>
        <td><img src="assets/avatar.png" width="200" style="border: 1px solid gray; border-radius: 4px"></td>
        <td style="padding: 10px">
            <strong>Alireza Roshanzamir</strong>
            <br>
            Software Engineer, Independent Consultant
            <br>
            <br>
            Professional Experience:
            <ul>
                <li>Team Leader and Python Developer, <i>Mahsan</i> | <small>2020 - Present</small></li>
                <li>C++ Developer, <i>Mahsan</i> | <small>2018 - 2020</small></li>
                <li>Web and Mobile Developer, <i>Resaa</i> | <small>2016 - 2018</small></li>
            </ul>
            Education:
            <ul>
                <li>M.Sc. in Artificial Intelligence, <i>Sharif University of Technology</i> | <small>2018 - 2020</small></li>
                <li>B.Sc. in Computer Software Engineering, <i>University of Tehran</i> | <small>2014 - 2018</small></li>
            </ul>
        </td>
    </tr>
</table>

---
## Main References
<table class="books">
    <tr>
        <td><img src="assets/cd-book-cover.png"/></td>
        <td>
        Continuous Delivery: Reliable Software Releases through Build, Test, and Deployment Automation
        <br>
        <small>by Jez Humble and David Farley</small>
        </td>
    </tr>
    <tr>
        <td><img src="assets/accelerate-book-cover.png"/></td>
        <td>
            Accelerate: The Science of Lean Software and DevOps: Building and Scaling High-Performing Technology Organizations
            <br>
            <small>by Nicole Forsgren Ph.D., Jez Humble, and Gene Kim</small>
        </td>
    </tr>
</table>

---
## Auxiliary References
<table class="books">
    <tr>
        <td><img src="assets/site-reliability-engineering-book-cover.png" width="200"/></td>
        <td>
            Site Reliability Engineering: How Google Runs Production Systems
            <br>
            <small>by Betsy Beyer, Chris Jones, Jennifer Petoff, Niall Richard Murphy</small>
        </td>
        <td><img src="assets/effective-devops-book-cover.png" width="200"/></td>
        <td>
            Effective DevOps
            <br>
            <small>by Jennifer Davis, Ryn Daniels</small>
        </td>
    </tr>
    <tr>
        <td><img src="assets/releaseit-book-cover.png" width="200"/></td>
        <td>
            Release It!: Design and Deploy Production-Ready Software
            <br>
            <small>by Michael T. Nygard</small>
        </td>
        <td><img src="assets/devops-handbook-book-cover.png" width="200"/></td>
        <td>
            The DevOps Handbook: How to Create World-Class Agility, Reliability, and Security in Technology Organizations
            <br>
            <small>by Gene Kim, Patrick Debois, John Willis, Jez Humble, John Allspaw</small>
        </td>
    </tr>
    <tr>
        <td><img src="assets/the-phoenix-project-book-cover.png" width="200"/></td>
        <td>
            The Phoenix Project: A Novel about IT, DevOps, and Helping Your Business Win 
            <br>
            <small>by Gene Kim, Kevin Behr, George Spafford</small>
        </td>
        <td><img src="assets/website.jpg" width="200"/></td>
        <td>
            <ul>
                <li><a href="https://minimumcd.org/">Minimum Viable CD</a></li>
                <li><a href="http://bvajjala.github.io/projects/cd/continuous-delivery-patterns-and-antipatterns">Continuous Delivery Patterns & Antipatterns</a></li>
                <li><a href="https://www.youtube.com/watch?v=6DeWOrmvhRM">Adopting Continuous Delivery by Jez Humble</a></li>
                <li><a href="https://www.youtube.com/watch?v=i2DrLsnETk4">14 Step Continuous Delivery Checklist</a></li>
            </ul>
        </td>
    </tr>
</table>

---
## Table of Contents
<table>
    <tr>
        <td rowspan="5" style="writing-mode: vertical-lr; text-align: center">Foundations</td>
        <td>
            Introduction
            <br>
            <small>
                Definition, <span style="color: blue">Minimum Viable CD</span>, Ingredients, <span style="color: green">Impacts</span>, <span style="color: blue">Relation with Other Movements</span>, <span style="color: blue">Scrumfall</span>, Case Studies, <span style="color: blue">CD Patterns Mindmap</span>
            </small>
        </td>
        <td>45'</td>
    </tr>
    <tr>
        <td>
            The Problem of Delivering Software
            <br>
            <small>
                Release Antipatterns, Goals, Criterias, Benefits, Release Candidate, Principles
            </small>
        </td>
        <td>30'</td>
    </tr>
    <tr>
        <td>
            Configuration Management
            <br>
            <small>
                Version Control, Managing Dependencies, Managing Software Configuration, Managing Environments
            </small>
        </td>
        <td>90'</td>
    </tr>
    <tr>
        <td>
            Continuous Integration
            <br>
            <small>
                Implementation, Prerequisites, Practices, <span style="color: blue">Challenges</span>
            </small>
        </td>
        <td>45'</td>
    </tr>
    <tr>
        <td>
            Testing Strategy
            <br>
            <small>
                Test Categories, Test Levels (Types), Test Doubles, <span style="color: blue">Test Coverage Criteria</span>, <span style="color: blue">TDD</span>
            </small>
        </td>
        <td>90'</td>
    </tr>
</table>

---
## Table of Contents
<table>
    <tr>
        <td rowspan="6" style="writing-mode: vertical-lr; text-align: center">Deployment Pipeline</td>
        <td>
            Anatomy
            <br>
            <small>
                Stages, Practices, Commit Stage, Test Stages, Release and Deployment Stages, Metrics, Adoption
            </small>
        </td>
        <td>45'</td>
    </tr>
    <tr>
        <td>
            Build and Deployment Scripting
            <br>
            <small>
                Build Tools, <span style="color: blue">Monorepo vs Polyrepo</span>, Principles and Practices, <span style="color: blue">Package Managers</span>, <span style="color: blue">Code Generation</span>, <span style="color: blue">Sample Project Structure (Changelogs, Docs, Tests, Assets, Examples, Dependencies, Version, Pipelines, Linting, Formatting, Type-checking, Code Generation)</span>, Deployment Scripting, Tips and Tricks, <span style="color: blue">Infrastructure as a Code (Terraform, Ansible)</span>
            </small>
        </td>
        <td>45'</td>
    </tr>
    <tr>
        <td>
            Commit Stage
            <br>
            <small>
                <span style="color: blue">Linting</span>, <span style="color: blue">Language/Technology Specific Checks</span>, Unit-testing, <span style="color: blue">Building Documentation</span>, Principles and Practices, Test Suite Principles and Practices, Results
            </small>
        </td>
        <td>90'</td>
    </tr>
    <tr>
        <td>
            Automated Acceptance Testing
            <br>
            <small>
                Why?, Roles, Application Driver Layer, Implementation Patterns, Performance Practices
            </small>
        </td>
        <td>45'</td>
    </tr>
    <tr>
        <td>
            Testing Nonfunctional Requirements (Only Introduction)
        </td>
        <td>15'</td>
    </tr>
    <tr>
        <td>
            Deploying and Releasing Applications
            <br>
            <small>
                Release Strategy, Deploying, Rolling Back Deployments, Zero-Downtime Releases, Emergency Fixes, Continuous Deployment, Tips and Tricks, <span style="color: blue">Semantic Release</span>
            </small>
        </td>
        <td>45'</td>
    </tr>
</table>

---
## Table of Contents
<table>
    <tr>
        <td rowspan="6" style="writing-mode: vertical-lr; text-align: center">Deployment Pipeline</td>
        <td>
            Managing Infrastructure and Environments
            <br>
            <small>
                Operation Team Needs, Modeling and Managing Infrastructure, Provisioning and Configuration, Monitoring
            </small>
        </td>
        <td>30'</td>
    </tr>
    <tr>
        <td>
            Managing Data
            <br>
            <small>
                Database Scripting, Incremental Change, Rolling Back Databases and Zero-Downtime Releases, Managing Test Data
            </small>
        </td>
        <td>45'</td>
    </tr>
    <tr>
        <td>
            Managing Components and Dependencies
            <br>
            <small>
                Keeping Application (Trunk) Releasable, Dependencies (<span style="color: blue">Dependency Pinning</span>, <span style="color: blue">Library vs Application</span>), Components, Dependency Graph, Managing Binaries
            </small>
        </td>
        <td>45'</td>
    </tr>
    <tr>
        <td>
            Advanced Version Control
            <br>
            <small>
                Brief history, Version Control Types, Branching and Merging, <span style="color: blue">Gitflow</span>, Develop on Mainline, Branch for Release, Branch by Feature, Branch by Team
            </small>
        </td>
        <td>45'</td>
    </tr>
    <tr>
        <td>
            Managing Continuous Delivery
            <br>
            <small>
                Maturity Models (Jez Humble Maturity Model, <span style="color: blue">QMM</span>, <span style="color: blue">Google Test Certified Ladder</span>), Project Lifecycle, Risk Management Process, Common Delivery Problem (Symptoms and Causes)
            </small>
        </td>
        <td>60'</td>
    </tr>
</table>