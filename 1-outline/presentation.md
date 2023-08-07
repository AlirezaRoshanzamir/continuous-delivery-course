## Continuous Delivery: Course Outline
Reliable Software Releases through Build, Test, and Deployment Automation

<img src="assets/devops-loop.png" style="max-width: 500px"/>

<small><strong>Lecturer:</strong> Alireza Roshanzamir</small>

<small><strong>Keywords:</strong> Continuous Delivery, Continuous Integration, DevOps, Build, Test, Release, Deployment, Automation, Version Control, Deployment Pipeline</small>

<small><small>Tir 1402/August 2023</small></small>

<details>
<summary>Note</summary>
Mention the deploy vs release and why their order is different in different places (feature toggle, release candidate, library vs application).
</details>

---
## Main References
<table class="books">
    <tr>
        <td><img src="assets/cd-book-cover.png"/></td>
        <td>
        Continuous Delivery: Reliable Software Releases through Build, Test, and Deployment Automation
        <br/>
        <small>by Jez Humble and David Farley</small>
        </td>
    </tr>
    <tr>
        <td><img src="assets/accelerate-book-cover.png"/></td>
        <td>
            Accelerate: The Science of Lean Software and DevOps: Building and Scaling High-Performing Technology Organizations
            <br/>
            <small>by Nicole Forsgren Ph.D., Jez Humble, and Gene Kim</small>
        </td>
    </tr>
</table>

---
## Auxiliary References
<table class="books">
    <tr>
        <td><img src="assets/site-reliability-engineering-book-cover.png" width="145"/></td>
        <td>
            Site Reliability Engineering: How Google Runs Production Systems
            <br/>
            <small>by Betsy Beyer, Chris Jones, Jennifer Petoff, Niall Richard Murphy</small>
        </td>
    </tr>
    <tr>
        <td><img src="assets/effective-devops-book-cover.png" width="145"/></td>
        <td>
            Effective DevOps
            <br/>
            <small>by Jennifer Davis, Ryn Daniels</small>
        </td>
    </tr>
    <tr>
        <td><img src="assets/releaseit-book-cover.png"/></td>
        <td>
            Release It!: Design and Deploy Production-Ready Software
            <br/>
            <small>by Michael T. Nygard</small>
        </td>
    </tr>
    <tr>
        <td><img src="assets/devops-handbook-book-cover.png"/></td>
        <td>
            The DevOps Handbook: How to Create World-Class Agility, Reliability, and Security in Technology Organizations
            <br/>
            <small>by Gene Kim, Patrick Debois, John Willis, Jez Humble, John Allspaw</small>
        </td>
    </tr>
    <tr>
        <td><img src="assets/the-phoenix-project-book-cover.png"/></td>
        <td>
            The Phoenix Project: A Novel about IT, DevOps, and Helping Your Business Win 
            <br/>
            <small>by Gene Kim, Kevin Behr, George Spafford</small>
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
            <br/>
            <small>
                Definition, Ingredients, <span style="color: green">Impacts</span>, <span style="color: blue">Relation with Other Movements</span>
            </small>
        </td>
        <td>45'</td>
    </tr>
    <tr>
        <td>
            The Problem of Delivering Software
            <br/>
            <small>
                Release Antipatterns, Goals, Criterias, Benefits, Release Candidate, Principles
            </small>
        </td>
        <td>30'</td>
    </tr>
    <tr>
        <td>
            Configuration Management
            <br/>
            <small>
                Version Control, <span style="color: blue">Monorepo vs Polyrepo</span>, <span style="color: blue">Repository/Project Structure</span>, Managing Dependencies, Managing Software Configuration, Managing Environments, <span style="color: blue">Managing Assets/Resources</span>, <span style="color: blue">Managing Documentation</span>, <span style="color: blue">Managing Tests</span>, <span style="color: blue">Managing Code Style</span>, <span style="color: blue">Managing Code Generation</span>, <span style="color: blue">Version SSOT</span>, <span style="color: blue">Semantic Release</span>, <span style="color: blue">Managing Changelogs</span>
            </small>
        </td>
        <td>90'</td>
    </tr>
    <tr>
        <td>
            Continuous Integration
            <small>
                Implementation, Prerequisites, Practices
            </small>
        </td>
        <td>45'</td>
    </tr>
    <tr>
        <td>
            Testing <span style="color: blue">[and Documentation]</span> Strategy
            <br/>
            <small>
                Test Categories, Test Levels (Types), Test Doubles, <span style="color: blue">Unit-test Coverage Criteria</span>, <span style="color: blue">Effective Unit-testing</span>, <span style="color: blue">TDD</span>, <span style="color: blue">ATDD</span>, <span style="color: blue">BDD</span>, <span style="color: blue">Doctests</span>, <span style="color: blue">SphinX</span>, <span style="color: blue">Auto Documentation</span>
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
            <br/>
            <small>
                Stages, Practices, Commit Stage, Test Stages, Release and Deployment Stages, Metrics, Adoption
            </small>
        </td>
        <td>45'</td>
    </tr>
    <tr>
        <td>
            Build and Deployment Scripting
            <br/>
            <small>
                Build Tools, Principles and Practices, Tips and Tricks, <span style="color: blue">Packaging Tools and Types</span>, <span style="color: blue">Infrastructure as a Code</span>, <span style="color: blue">Terraform</span>, <span style="color: blue">Ansible</span>
            </small>
        </td>
        <td>45'</td>
    </tr>
    <tr>
        <td>
            Commit Stage
            <br/>
            <small>
                <span style="color: blue">Linting</span>, <span style="color: blue">Language/Technology Specific Checks</span>, Unit-testing, <span style="color: blue">Building Documentation</span>, Principles and Practices, Test Suite Principles and Practices, Results
            </small>
        </td>
        <td>90'</td>
    </tr>
    <tr>
        <td>
            Automated Acceptance Testing
            <br/>
            <small>
                Why?, Roles, Application Driver Layer, Implementation Patterns, Performance Practices
            </small>
        </td>
        <td>45'</td>
    </tr>
    <tr>
        <td>
            Testing Nonfunction Requirements (Only Introduction)
        </td>
        <td>15'</td>
    </tr>
    <tr>
        <td>
            Deploying and Releasing Applications
            <br/>
            <small>
                Release Strategy, <span style="color: blue">Library vs Application</span>, Deploying, Rolling Back Deployments, Zero-Downtime Releases, Emergency Fixes, Tips and Tricks
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
            <br/>
            <small>
                Operation Team Needs, Modeling and Managing Infrastructure, Provisioning and Configuration, Monitoring
            </small>
        </td>
        <td>30'</td>
    </tr>
    <tr>
        <td>
            Managing Data
            <br/>
            <small>
                Database Scripting, Incremental Change, Rolling Back Databases and Zero-Downtime Releases, Managing Test Data
            </small>
        </td>
        <td>45'</td>
    </tr>
    <tr>
        <td>
            Managing Components and Dependencies
            <br/>
            <small>
                Keeping Application (Trunk) Releasable, Dependency Management, Components, Dependency Graph, Managing Binaries, <span style="color: blue">Dependency Pinning</span>, <span style="color: blue">Artifactories</span>
            </small>
        </td>
        <td>45'</td>
    </tr>
    <tr>
        <td>
            Advanced Version Control
            <br/>
            <small>
                Brief history, Version Control Types, Branching and Merging, <span style="color: blue">Gitflow</span>, Develop on Mainline, Branch for Release, Branch by Feature, Branch by Team
            </small>
        </td>
        <td>45'</td>
    </tr>
    <tr>
        <td>
            Managing Continuous Delivery
            <br/>
            <small>
                Maturity Models (Jez Humble Maturity Model, <span style="color: blue">QMM</span>, <span style="color: blue">Google Test Certified Ladder</span>), Project Lifecycle, Risk Management Process, Common Delivery Problem (Symptoms and Causes)
            </small>
        </td>
        <td>60'</td>
    </tr>
</table>