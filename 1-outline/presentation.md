## Continuous Delivery: Course Outline
Reliable Software Releases through Build, Test, and Deployment Automation

<img src="assets/devops-loop.png" style="max-width: 500px"/>

<small><strong>Lecturer:</strong>  Alireza Roshanzamir</small>

<small><strong>Keywords:</strong>  Continuous Delivery, Continuous Integration, DevOps, Build, Test, Release, Deployment, Automation, Version Control, Deployment Pipeline</small>

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
        <td><img src="assets/site-reliability-engineering-book-cover.png"/></td>
        <td>
            Site Reliability Engineering: How Google Runs Production Systems
            <br/>
            <small>by Betsy Beyer, Chris Jones, Jennifer Petoff, Niall Richard Murphy</small>
        </td>
    </tr>
    <tr>
        <td><img src="assets/effective-devops-book-cover.png"/></td>
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
                Definition, Before/After CD, Ingredients, Relation with Agile/Lean/DevOps, Performance Impact, Culture Impact
            </small>
        </td>
        <td>45'</td>
    </tr>
    <tr>
        <td>
            The Problem of Delivering Software
            <br/>
            <small>
                Antipatterns, Roadmap, Benefits, Release Candidate, Principles
            </small>
        </td>
        <td>30'</td>
    </tr>
    <tr>
        <td>
            Configuration Management
            <br/>
            <small>
                Version Control, Monorepo vs Polyrepo, Repository/Project Structure, Managing Dependencies, Managing Software Configuration, Managing Environments, Managing Assets/Resources, Managing Documentation, Managing Tests, Managing Code Style, Managing Code Generation, Version SSOT, Managing Changelogs
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
            Testing [and Documentation] Strategy
            <br/>
            <small>
                Test Categories, Test Levels (Types), Test Doubles, Unit-test Coverage Criteria, Effective Unit-testing, TDD, ATDD, BDD, Doctests, SphinX, Auto Documentation
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
                Build Tools, Principles and Practices, Tips and Tricks, Packaging Tools and Types, Infrastructure as a Code, Terraform, Ansible
            </small>
        </td>
        <td>45'</td>
    </tr>
    <tr>
        <td>
            Commit Stage
            <br/>
            <small>
                Linting, Language/Technology Specific Checks, Unit-testing, Building Documentation, Principles and Practices, Test Suite Principles and Practices, Results
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
                Release Strategy, Library vs Application, Deploying, Rolling Back Deployments, Zero-Downtime Releases, Emergency Fixes, Tips and Tricks
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
                Keeping Application (Trunk) Releasable, Dependency Management, Components, Dependency Graph, Managing Binaries, Dependency Pinning, Artifactories
            </small>
        </td>
        <td>45'</td>
    </tr>
    <tr>
        <td>
            Advanced Version Control
            <br/>
            <small>
                Brief history, Version Control Types, Branching and Merging, Gitflow, Develop on Mainline, Branch for Release, Branch by Feature, Branch by Team
            </small>
        </td>
        <td>45'</td>
    </tr>
    <tr>
        <td>
            Managing Continuous Delivery
            <br/>
            <small>
                Maturity Models (Jez Humble Maturity Model, QMM, Google Test Certified Ladder), Project Lifecycle, Risk Management Process, Common Delivery Problem (Symptoms and Causes)
            </small>
        </td>
        <td>60'</td>
    </tr>
</table>