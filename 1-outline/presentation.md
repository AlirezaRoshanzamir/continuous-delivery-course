## Continuous Delivery: Course Outline
#### Reliable Software Releases through Build, Test, and Deployment Automation

<img src="assets/devops-loop.webp" width="700"/>

<small><strong>Time to Read:</strong> 4 Minutes</small>, <small><strong>Time to Present:</strong> 15 Minutes</small>
<br>
<small><strong>Created By:</strong> Alireza Roshanzamir</small>
<br>
<small><strong>Keywords:</strong> Continuous Delivery, Continuous Integration, DevOps, Build, Test, Release, Deployment, Automation, Version Control, Deployment Pipeline</small>
<br><br>
<small style="color: darkred"><small>Press **"F"** to go fullscreen; some slides may not display properly otherwise.</small></small>

---
## Created By
<table>
    <tr>
        <td><img src="assets/avatar.webp" width="200" style="border: 1px solid gray; border-radius: 4px"></td>
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
            <br>
            Education:
            <ul>
                <li>M.Sc. in Artificial Intelligence, <i>Sharif University of Technology</i> | <small>2018 - 2020</small></li>
                <li>B.Sc. in Computer Software Engineering, <i>University of Tehran</i> | <small>2014 - 2018</small></li>
            </ul>
            <br>
            Social:
            <ul>
                <li>a.roshanzamir1996@gmail.com</li>
                <li><a href="https://alirezaroshanzamir.github.io" target="_blank">alirezaroshanzamir.github.io</a></li>
            </ul>
            <br>
            Please <strong>star</strong> the <a href="https://github.com/AlirezaRoshanzamir/continuous-delivery-course">github.com/AlirezaRoshanzamir/continuous-delivery-course</a> repository.
        </td>
    </tr>
</table>

---
## Main References
<table class="books">
    <tr>
        <td><img src="assets/cd-book-cover.webp"/></td>
        <td>
        Continuous Delivery: Reliable Software Releases through Build, Test, and Deployment Automation
        <br>
        <small>by Jez Humble and David Farley</small>
        </td>
    </tr>
    <tr>
        <td><img src="assets/accelerate-book-cover.webp"/></td>
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
        <td><img src="assets/site-reliability-engineering-book-cover.webp" width="200"/></td>
        <td>
            Site Reliability Engineering: How Google Runs Production Systems
            <br>
            <small>by Betsy Beyer, Chris Jones, Jennifer Petoff, Niall Richard Murphy</small>
        </td>
        <td><img src="assets/effective-devops-book-cover.webp" width="200"/></td>
        <td>
            Effective DevOps
            <br>
            <small>by Jennifer Davis, Ryn Daniels</small>
        </td>
    </tr>
    <tr>
        <td><img src="assets/releaseit-book-cover.webp" width="200"/></td>
        <td>
            Release It!: Design and Deploy Production-Ready Software
            <br>
            <small>by Michael T. Nygard</small>
        </td>
        <td><img src="assets/devops-handbook-book-cover.webp" width="200"/></td>
        <td>
            The DevOps Handbook: How to Create World-Class Agility, Reliability, and Security in Technology Organizations
            <br>
            <small>by Gene Kim, Patrick Debois, John Willis, Jez Humble, John Allspaw</small>
        </td>
    </tr>
    <tr>
        <td><img src="assets/the-phoenix-project-book-cover.webp" width="200"/></td>
        <td>
            The Phoenix Project: A Novel about IT, DevOps, and Helping Your Business Win 
            <br>
            <small>by Gene Kim, Kevin Behr, George Spafford</small>
        </td>
        <td><img src="assets/website.webp" width="200"/></td>
        <td>
            <ul>
                <li><a href="https://minimumcd.org/">Minimum Viable CD</a></li>
                <li><a href="http://bvajjala.github.io/projects/cd/continuous-delivery-patterns-and-antipatterns">Continuous Delivery Patterns & Antipatterns</a></li>
                <li><a href="https://www.youtube.com/watch?v=6DeWOrmvhRM">Adopting Continuous Delivery by Jez Humble</a></li>
                <li><a href="https://www.youtube.com/watch?v=i2DrLsnETk4">14 Step Continuous Delivery Checklist</a></li>
                <li><a href="https://monorepo.tools">monorepo.tools</a></li>
            </ul>
        </td>
    </tr>
</table>

---
## Table of Contents: Foundations
<table>
    <tr>
        <td>
            <a href="../2-introduction" target="_blank">Introduction</a>
            <br>
            <small>
                Definition, <span style="color: brown">Minimum Viable CD</span>, <span style="color: purple">Ingredients</span>, Deployment Pipeline, Why?, <span style="color: green">Impacts (Software Delivery Performance, Culture)</span>, <span style="color: brown">Relation with Other Movements</span>, <span style="color: brown">Scrumfall</span>, Case Studies, <span style="color: brown">CD Patterns Mindmap</span>
            </small>
        </td>
        <td>45'</td>
    </tr>
    <tr>
        <td>
            <a href="../3-the-problem-of-delivering-software" target="_blank">The Problem of Delivering Software</a>
            <br>
            <small>
                Release Antipatterns, Goals, Criterias, Benefits, Release Candidate, Principles
            </small>
        </td>
        <td>30'</td>
    </tr>
    <tr>
        <td>
            <a href="../4-configuration-management" target="_blank">Configuration Management</a>
            <br>
            <small>
                <span style="color: purple">Version Control and Advices</span>, Managing Dependencies, Managing Software Configuration, <span style="color: purple">Managing Environments</span>
            </small>
        </td>
        <td>75'</td>
    </tr>
    <tr>
        <td>
            <a href="../5-continuous-integration" target="_blank">Continuous Integration</a>
            <br>
            <small>
                Implementation, Prerequisites, Practices, <span style="color: brown">Challenges</span>
            </small>
        </td>
        <td>60'</td>
    </tr>
    <tr>
        <td>
            <a href="../6-testing-strategy" target="_blank">Testing Strategy</a>
            <br>
            <small>
                <span style="color: purple">Types of Tests</span>, <span style="color: purple">Test Doubles</span>, <span style="color: brown">Test Coverage Criteria</span>, <span style="color: brown">TDD</span>, Real-Life Situations and Strategies, Integration Testing, Process
            </small>
        </td>
        <td>105'</td>
    </tr>
</table>
<br>
<small>
Black: From the CD book, <span style="color: purple">Purple: Mostly from the CD book</span>, <span style="color: green">Green: Mostly from the Accelerate book</span>, <span style="color: brown">Brown: From the other references</span>
</small>

---
## Table of Contents: Deplyment Pipeline
<table>
    <tr>
        <td>
            <a href="../7-anatomy-of-the-deployment-pipeline" target="_blank">Anatomy</a>
            <br>
            <small>
                A Basic Deployment Pipeline, Practices, The Commit Stage, Test Stages, Release and Deployment Stages, Implementation, Metrics
            </small>
        </td>
        <td>45'</td>
    </tr>
    <tr>
        <td>
            <a href="../8-build-and-deployment-scripting" target="_blank">Build and Deployment Scripting</a>
            <br>
            <small>
                <span style="color: purple">Build Tools</span>, <span style="color: brown">Monorepo vs Polyrepo</span>, Principles and Practices, <span style="color: brown">Package Managers</span>, <span style="color: brown">Code Generation</span>, <span style="color: brown">Sample Project Structure</span>, Deployment Scripting, Tips and Tricks, <span style="color: brown">Infrastructure as Code</span>
            </small>
        </td>
        <td>90'</td>
    </tr>
    <tr>
        <td>
            <a href="../9-the-commit-stage" target="_blank">Commit Stage</a>
            <br>
            <small>
                Introduction, Principles and Practices, The Results, Commit Test Suite Principles and Practices
            </small>
        </td>
        <td>20'</td>
    </tr>
    <tr>
        <td>
            <a href="../10-automated-acceptance-testing" target="_blank">Automated Acceptance Testing</a>
            <br>
            <small>
                Introduction, Why?, Process and Roles, <span style="color: brown">Testing and Documentation</span>, The Application Driver Layer, Implementation, The Acceptance Test Stage, Performance Practices
            </small>
        </td>
        <td>50'</td>
    </tr>
    <tr>
        <td>
            <a href="../11-managing-nonfunctional-requirements" target="_blank">Managing Nonfunctional Requirements</a>
        </td>
        <td>15'</td>
    </tr>
    <tr>
        <td>
            <a href="../12-deploying-and-releasing-applications" target="_blank">Deploying and Releasing Applications</a>
            <br>
            <small>
                Introduction, Release Strategy, Deploying and Promoting Your Application, <span style="color: brown">Semantic Versioning</span>, <span style="color: purple">Rolling Back Deployments and Zero-Downtime Releases</span>, Emergency Fixes, Continuous Deployment, <span style="color: brown">Semantic Release</span>, Tips and Tricks
            </small>
        </td>
        <td>60'</td>
    </tr>
</table>

---
## Table of Contents: Delivery Ecosystem
<table>
    <tr>
        <td>
            <a href="../13-managing-infrastructure-and-environments" target="_blank">Managing Infrastructure and Environments</a>
            <br>
            <small>
                Understanding Operation Team, Modeling and Managing Infrastructure, Managing Server Provisioning and Configuration, Managing the Configuration of Middleware, Managing Infrastructure Services, Virtualization, <span style="color: purple">Cloud Computing</span>, <span style="color: purple">Monitoring Infrastructure and Applications</span>
            </small>
        </td>
        <td>75'</td>
    </tr>
    <tr>
        <td>
            <a href="../14-managing-data" target="_blank">Managing Data</a>
            <br>
            <small>
                Database Scripting, Incremental Change, Rolling Back Databases and Zero-Downtime Releases, Managing Test Data, Data Management and the Deployment Pipeline
            </small>
        </td>
        <td>45'</td>
    </tr>
    <tr>
        <td>
            Managing Components and Dependencies
            <br>
            <small>
                Keeping Application (Trunk) Releasable, <span style="color: purple">Dependencies</span>, <span style="color: purple">Components</span>, Managing Dependency Graph, <span style="color: purple">Managing Binaries</style>
            </small>
        </td>
        <td>45'</td>
    </tr>
    <tr>
        <td>
            Advanced Version Control
            <br>
            <small>
                <span style="color: purple">Brief history</span>, Branching and Merging, Distributed Version Control Systems (DVCS), Stream-Based Version Control Systems, <span style="color: purple">Branching Patterns</span>, <span style="color: brown">Popular Branching Policies</span>
            </small>
        </td>
        <td>45'</td>
    </tr>
    <tr>
        <td>
            Managing Continuous Delivery
            <br>
            <small>
                Maturity Models (Jez Humble Maturity Model, <span style="color: brown">QMM</span>, <span style="color: brown">Google Test Certified Ladder</span>), Project Lifecycle, Risk Management Process, Common Delivery Problem (Symptoms and Causes)
            </small>
        </td>
        <td>60'</td>
    </tr>
</table>