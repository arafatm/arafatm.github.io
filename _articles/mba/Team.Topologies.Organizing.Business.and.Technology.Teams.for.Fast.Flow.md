---
categories: mba
source: https://www.amazon.com/Team-Topologies-Organizing-Business-Technology/dp/1942788819
author: Matthew Skelton, Manuel Pais, and Ruth Malan
title: Team Topologies - Organizing Business and Technology Teams for Fast Flow
---




# Overview

Part I of the book explores Conway’s law,

Part II, we investigate a set of static team patterns that have been proven in
the industry and the implications of choosing one pattern over another

Part III, we deal with ways to evolve the organization design to provide
powerful capabilities for innovation and rapid delivery

![teams and interactions](/assets/img/team.topologies/0.1.team.interaction.png)
Figure 0.1: The Four Team Types and Three Interaction Modes

Here are some scenarios with corresponding ways to read the book that might
match
- I need more **clarity about different team types** and which team types are
  effective. Review Chapter 1 (overview), then Chapter 4 (static topologies),
  then Chapter 5 (fundamental topologies).
- I need to **split up a large, monolithic software system**. Review Chapter 6
  (boundaries) and then Chapter 3 (the team).
- I need to **improve the architecture of the software system**. Review Chapter
  2 (Conway’s law), then Chapter 4 (static topologies), then Chapter 6
  (boundaries).
- I need to improve the **effectiveness of software development teams**. Review
  Chapter 3 (the team), then Chapter 6 (boundaries), then Chapter 5
  (fundamental topologies).
- I need to **improve morale and effectiveness within teams**. Review Chapter 3
  (the team) and then Chapter 5 (fundamental topologies).
- I need to **understand where to invest effort to help with projected
  growth**.  Review Chapter 1 (overview), then Chapter 5 (fundamental
  topologies), then Chapter 8 (topology evolution).
- I need to **understand how to evolve team topologies to meet changing
  business needs**. Review Chapter 7 (dynamic aspects) and then Chapter 8
  (topology evolution and organizational sensing).

## CONCLUSION The Next-Generation Digital Operating Model

> A second effect on performance of creating small, empowered units is to
> increase the likely speed of adaptation to new information. 
> -- John Roberts, The Modern Firm

An obsession with “feature delivery” ignores the human-related and team-related
dynamics inherent in modern software, leading to a lack of engagement from
staff, especially when the cognitive load is exceeded.

The real implications of Conway’s law are almost completely ignored by most
organizations, leading to, at best, happy accidents with architectural choices
and, at worst, significant ongoing friction as the organization spends time and
effort “fighting” the homomorphic force.

![](/assets/img/team.topologies/9.1.core.png) Figure 9.1: Core Ideas of Team Topologies

### Four Team Types and Three Interaction Modes

1. **Stream aligned**: a team aligned to the main flow of business change, with
   cross-functional skills mix and the ability to deliver significant
   increments without waiting on another team.  
2. **Platform**: a team that works on the underlying platform supporting
   stream-aligned teams in delivery. The platform simplifies otherwise complex
   technology and reduces cognitive load for teams that use it.
3. **Enabling**: a team that assists other teams in adopting and modifying
   software as part of a transition or learning period.
4. **Complicated subsystem**: a team with a special remit for a subsystem that
   is too complicated to be dealt with by a normal stream-aligned team or
   platform team. Optional and only used when really necessary.

### Interaction modes

1. **Collaboration mode**: two teams work together on a shared goal,
   particularly during discovery of new technology or approaches. The overhead
   is valuable due to the rapid pace of learning.
2. **X-as-a-Service mode**: one team consumes something provided by another
   team (such as an API, a tool, or a full software product). Collaboration is
   minimal.
3. **Facilitating mode**: one team (usually an enabling team) facilitates
   another team in learning or adopting a new approach.

### Team-First Thinking: Cognitive Load, Team API, Team-Sized Architecture

To increase the clarity of purpose and define the boundary of responsibility of
teams, choose a fundamental team type and an interaction mode.

The Team Topologies approach treats the team as the fundamental means of
delivery, where a team is not simply a collection of individuals with the same
manager but an entity with its own learning, goals, mission, and reasonable
autonomy.

To avoid software becoming ever larger and eventually overwhelming a team, the
size of subsystems (or components) are limited to that manageable by a single
team. Specifically, exceeding the maximum cognitive load that a team can deal
with as a team is avoided,

### Strategic Application of Conway’s Law

> Research which leads to techniques permitting more efficient communication
> among designers will play an extremely important role in the technology of
> system management.
> -- Mel Conway

**Team structures must match the required software architecture or risk
producing unintended designs**.

### Evolve Organization Design for Adaptability and Sensing

Organizations should expect teams to collaborate to discover new patterns and
execution models, then push these down into the platform and supporting
tooling.

### Team Topologies Alone Are Not Sufficient for IT Effectiveness

Important additional ingredients of success include:
- **A healthy organizational culture**: an environment that supports the
  professional development of individuals and teams—one in which people feel
  empowered and safe to speak out about problems, and the organization expects
  to learn continuously.
- **Good engineering practices**: test-first design and development of all
  aspects of the systems, a focus on continuous delivery and operability
  practices, pairing and mobbing for code review, avoiding the search for a
  single “root cause” for incidents, designing for testability, and so on.
- **Healthy funding and financial practices**: avoiding the pernicious effects
  of a CapEx/OpEx split between different parts of the IT organization (or at
  least mitigating the worst aspects of this by estimating CapEx/OpEx through
  sampling the work), avoiding project-driven deadlines and large-batch
  budgeting wherever possible, and allocating training budgets to teams or
  groups rather than individuals.
- **Clarity of business vision**: the executive or leadership provides a clear,
  non-conflicting vision and direction for the rest of the organization, with
  horizons at human-relevant timescales (such as three months, six months,
  twelve months) and clear reasoning behind the priorities, so people in the
  organization can understand how and why these were chosen.

### Next Steps: How to Get Started with Team Topologies

##### 1: Start with the Team

What does the team need in order to: 
1. Act and operate as an effective team? 
2. Own part of the software effectively? 
3. Focus on meeting the needs of users? 
4. Reduce unnecessary cognitive load? 
5. Consume and provide software and information to other teams?

##### 2: Identify Suitable Streams of Change

Some typical streams might be:
- Citizen-oriented tasks for government online services: applying for a
  passport, paying taxes, or registering for a set of healthcare options
  (task-oriented streams).
- Business banking products: online money management, automation of bank
  transactions, invoicing clients (role-oriented streams).
- Online ticket purchasing: searching for tickets, purchasing tickets, managing
  “My Account” and refunds (activity streams).
- Regional products: European market, North American market, Asian market, etc.
  (geographical streams).
- Market segment: consumer, small and medium business, enterprise, large
  corporate (user-type streams).

##### 3: Identify a Thinnest Viable Platform (TVP)

A platform can be **“just big enough”** to meet the flow needs for the streams:
anything from a set of documentation on a wiki that helps teams use the
underlying services to a full, in-house, custom-technology solution built to
meet the specialist needs of the stream-aligned teams.

Remember: **technology is only ever a part of the platform**; roadmaps, guided
evolution, clear documentation, a concern for DevEx, and appropriate
encapsulation of underlying complexity are all key parts of an effective
delivery platform for stream-aligned teams.

##### 4: Identify Capability Gaps in Team Coaching, Mentoring, Service Management, and Documentation

You need people who understand and practice: 
- **Team coaching Mentoring** (especially of senior staff) 
- **Service management** (for all kinds of teams and areas, not just for
  production systems) 
- **Well-written documentation** 
- **Process improvement**

##### 5: Share and Practice Different Interaction Modes and Explain Principles behind New Ways of Working

Explain the basics of Conway’s law, and how the conscious design of teams and
intercommunications can help improve the software architecture

**Emphasize the humanistic** aspects of Team Topologies: 
1. the focus on the team, 
2. the explicit limits on cognitive load, 
3. the reduction in noise and interruptions due to team-fist office space, 
4. and a limit on free-for-all communications.

# PART I Teams As the Means of Delivery

## KEY TAKEAWAYS

CHAPTER 1: Conway’s law suggests major gains from designing software
architectures and team interactions together, since they are similar forces.
Team Topologies clarifies **team purpose and responsibilities**, increasing the
effectiveness of their interrelationships. Team Topologies takes a humanistic
approach to building software systems while setting up organizations for
strategic adaptability.

CHAPTER 2: Organizations are constrained to **produce designs that reflect
communication paths**. The design of the organization constrains the “solution
search space,” limiting possible software designs. Requiring everyone to
communicate with everyone else is a recipe for a mess. Choose software
architectures that encourage team-scoped flow. Limiting communication paths to
well-defined team interactions produces modular, decoupled systems.

CHAPTER 3: **The team is the most effective means of software delivery, not
individuals**. Limit the size of multi-team groupings within the organization
based on Dunbar’s number. Restrict team responsibilities to match the maximum
team cognitive load. Establish clear boundaries of responsibility for teams.
Change the team working environment to help teams succeed.

## 1 The Problem with Org Charts

Actual communication lines look quite different from the org chart,

![Figure 1.1: Org Chart with Actual Lines of Communication](/assets/img/team.topologies/1.1.org.chart.comm.png) 
In practice, people communicate laterally or “horizontally” with people from
other reporting lines in order to get work done. This creativity and problem
solving needs to be nurtured for the benefit of the organization, not
restricted to optimize for top-down/bottom-up communication and reporting.

Pflaeging suggests that the key to successful knowledge work organizations is
in the **interactions between the informal structure and the value creation
structure** (that is, the interactions between people and teams).

Naomi Stanford lists five rules of thumb for designing organizations:
1. Design when there is a compelling reason.
2. Develop options for deciding on a design.
3. Choose the right time to design.
4. Look for clues that things are out of alignment.
5. Stay alert to the future.

Team Topologies provides **four fundamental team types**
- stream aligned
- platform
- enabling
- complicated subsystem

**Three core team interaction modes**
- collaboration, 
- X-as-a-Service
- facilitating

Be aware of **Conway’s law**, **team cognitive load**, and how to become a
**sensing organization**.

Allan Kelly calls the “homomorphic force.”
- This homomorphic force tends to make things the **same shape between the
  software architecture and team structures**.

Eric Raymond stated this in a humorous way in his book The New Hacker’s
Dictionary: 
> “If you have four groups working on a compiler, you’ll get a 4-pass
> compiler.”

**Team structures must match the required software architecture or risk producing unintended designs**.

James Lewis, Technical Director at Thoughtworks, and others came up with the
idea of applying an **“inverse Conway maneuver”** (or reverse Conway maneuver),
whereby an organization focuses on organizing team structures to match the
architecture they want the system to exhibit rather than expecting teams to
follow a mandated architecture design.

The key takeaway here is that **thinking of software architecture as a
standalone concept that can be designed in isolation and then implemented by
any group of teams is fundamentally wrong**.

When cognitive load isn’t considered, teams are spread thin trying to cover an
excessive amount of responsibilities and domains. Such a team lacks bandwidth
to pursue mastery of their trade and struggles with the costs of switching
contexts.

Dan Pink’s three elements of intrinsic motivation: 
- **autonomy** (quashed by constant juggling of requests and priorities from
  multiple teams)
- **mastery** (“jack of all trades, master of none”)
- **purpose** (too many domains of responsibility).11

The number of services and components for which a product team is responsible
(in other words, the demand on the team) typically keeps growing over time.

However, the development of new services is often planned as if the team had
full-time availability and zero cognitive load to start with.

![Figure 1.2: Obstacles to Fast Flow](/assets/img/team.topologies/1.2.obstacles.to.flow.png)

The eel sneaks into the crevices and scares off smaller fish, which are then
forced to come out and become easy prey for the grouper. Enable the groupers
and eels in your organization to join forces for better flow and business
outcomes!

## 2 Conway’s Law and Why It Matters

> [Conway’s law] creates an imperative to keep asking: “Is there a better
> design that is not available to us because of our organization?” 
> -- Mel Conway, Toward Simplifying Application Development, in a Dozen Lessons

> If the architecture of the system and the architecture of the organization
> are at odds, the architecture of the organization wins.
> -- Ruth Malan provides what could be seen as the modern version of Conway’s law

An organization that is arranged in functional silos (where teams specialize in
a particular function, such as QA, DBA, or security) is unlikely to ever
produce software systems that are well-architected for end-to-end flow.

To increase an organization’s chances of building effective software systems optimized for flow, a reverse Conway maneuver (or inverse Conway maneuver) can be undertaken to reconfigure the team intercommunications before the software is finished.

> Our research lends support to what is sometimes called the “inverse Conway
> maneuver,” which states that organizations should evolve their team and
> organizational structure to achieve the desired architecture. The goal is for
> your architecture to support the ability of teams to get their work done—from
> design through to deployment—without requiring high-bandwidth communication
> between teams.
> -- Accelerate: The Science of Dev Ops by Nicole Forsgren, PhD, Jez Humble, and Gene Kim

![Figure 2.1: Four Teams Working on a Software System](/assets/img/team.topologies/2.1.four.teams.png) 
Figure 2.1: Four Teams Working on a Software System
- Four separate teams consisting of front-end and back-end developers work on a
  software system. Front-end devs communicate only with back-end devs, who
  communicate with a single DBA for the database changes.

![Figure 2.2: Software Architecture from Four-Team Organization](/assets/img/team.topologies/2.2.arch.four.teams.png) 
Figure 2.2: Software Architecture from Four-Team Organization
- Four separate applications, each with a separate user interface (UI) and a
  back-end application tier that communicate with a single shared database.
  This reflects and matches the team communication architecture from Figure
  2.1; the diagram has simply been rotated ninety degrees.

The use of a shared DBA team is likely to drive the emergence of a single
shared database; and the use of separate front-end and back-end developers is
likely to drive a separation between UI and app tiers,

![](/assets/img/team.topologies/2.3.micro.arch.png)
Figure 2.3: Microservices Architecture with Independent Services and Data Stores 
- A microservices-based architecture with four separate services, each with its
  own data store, API layer, and front-end client.

![](/assets/img/team.topologies/2.4.team.design.micro.arch.png)
Figure 2.4: Team Design for Microservices Architecture with Independent Services and Data Stores 
- An organization design that anticipates the homomorphic force behind Conway’s
  law to help produce a software architecture with four independent
  microservices. (Again, this is basically the diagram in Figure 2.3 rotated
  ninety degrees.)

#### Software Architectures that Encourage Team-Scoped Flow

> Team assignments are the first draft of the architecture
> -- Michael Nygard 

Follow proven software-architecture good practices:
1. **Loose coupling** components do not hold strong dependencies on other
   components
2. **High cohesion** components have clearly bounded responsibilities, and
   their internal elements are strongly related
3. Clear and appropriate **version compatibility**
4. Clear and appropriate **cross-team testing**

By keeping things team sized, we help to achieve what MacCormack and colleagues
call 
> an ‘architecture for participation’ that promotes ease of understanding by
> limiting module size, and ease of contribution by minimizing the propagation
> of design changes.

> If we have managers deciding... which services will be built, by which teams,
> we implicitly have managers deciding on the system architecture.
> -- Ruth Malan

> More than ever I believe that someone who claims to be an Architect needs
> both technical and social skills, they need to understand people and work
> within the social framework. They also need a remit that is broader than pure
> technology. They need to have a say in organizational structures and personnel
> issues, i.e. they need to be a manager too.
> -- Allan Kelly’s view of a software architect’s role expands further on this idea: 

One key implication of Conway’s law is that **not all communication and collaboration is good**.

What we need is focused communication between specific teams.

> managers should focus their efforts on understanding the causes of
> unaddressed design interfaces... and unpredicted team interactions... across
> modular systems.
> -- Manuel Sosa and colleagues found in their 2004 research into aircraft manufacturing, 

![](/assets/img/team.topologies/2.5.inter.team.comm.png)
Figure 2.5: Inter-Team Communication Communication within teams is high
bandwidth. 
- Communication between two “paired” teams can be mid bandwidth. Communication
  between most teams should be low bandwidth.

With open-plan offices and, particularly, with ubiquitous, instant
communication via chat tools, anyone can communicate with anyone else. In this
situation, one can accidentally fall into a pattern of communication and
interaction where **everyone needs to communicate with everyone else**.

From the viewpoint of Conway’s law, this will drive unintended consequences for
the software systems, especially a **lack of modularity between subsystems**.

If the organization has an expectation that “everyone should see every message
in the chat” or “everyone needs to attend the massive standup meetings” or
“everyone needs to be present in meetings” to approve decisions, then we have
an organization design problem.

Conway’s law suggests that this kind of many-to-many communication will tend to
produce monolithic, tangled, highly coupled, interdependent systems that do not
support fast flow. More communication is not necessarily a good thing.

Conway’s law tells us that an organization is constrained to produce designs
that are copies of its communication structures.

We therefore need to be mindful of the effect of shared tools on the way teams
interact.
- If we want teams to collaborate, then shared tools make sense.
- If we need a clear responsibility boundary between teams, then separate tools
  (or separate instances of the same tool) may be best.

In summary, **don’t select a single tool for the whole organization without
considering team inter-relationships first**.

Generally speaking, we need to **optimize for fast flow**, so stream-aligned
teams are preferred.

Regular reorganizations for the sake of management convenience or reducing
headcount actively destroy the ability of organizations to build and operate
software systems effectively.

## 3 Team-First Thinking

Driskell and Salas found that teams working as a cohesive unit perform far
better than collections of individuals for knowledge-rich, problem-solving
tasks that require high amounts of information.

Research by Google on their own teams found that **who is on the team matters
less than the team dynamics**; and that when it comes to measuring performance,
teams matter more than individuals.

In this book, “team” has a very specific meaning. By team, we mean a stable
grouping of five to nine people who work toward a shared goal as a unit.

We consider the team to be the smallest entity of delivery within the
organization. Therefore, an organization should never assign work to
individuals; only to teams.

**Dunbar found fifteen to be the limit** of the number of people one person can
trust deeply. From those, only around five people can be known and trusted
closely.
- Around five people is limit of people with whom we can hold close personal
  relationships and working memory
- Around fifteen people is limit of people with whom we can experience deep
  trust
- Around fifty people is limit of people with whom we can have mutual trust
- Around 150 people is limit of people whose capabilities we can remember

Some researchers have identified possible limits to effective social
relationships at around 500 and 1,500 (there is roughly a three times
multiplier at work here).

Consciously limit the size of team groupings to Dunbar’s number to help achieve
predictable behavior and interactions from those teams:
- A single team: around five to eight people
- Families (“tribes”): groupings of teams of no more than fifty people
- Divisions/streams/profit & loss (P&L) lines: groupings of no more than 150 or
  500 people

![](/assets/img/team.topologies/3.1.scaling.teams.png)
Figure 3.1: Scaling Teams Using Dunbar’s Number 
- Organizational groupings should follow Dunbar’s number
- beginning with around five people (or eight for software teams)
- then increasing to around fifteen people
- then fifty, then 150, then 500, and so on.

Typically, a team can take from **two weeks to three months** or more to become a
cohesive unit.

> adding new people to a team doesn’t immediately increase its capacity
> -- The Mythical Man-Month

The Tuckman model describes how teams perform in four stages:
- **Forming**: assembling for the first time
- **Storming**: working through initial differences in personality and ways of
  working
- **Norming**: evolving standard ways of working together
- **Performing**: reaching a state of high effectiveness

Research by people like Pamela Knight has found that this model is not quite
accurate, and that **storming actually takes places continually** throughout
the life of the team.

Team ownership helps to provide the vital “continuity of care” that modern
systems need

Team ownership also enables a team to think in multiple “horizons”, from
exploration stages to exploitation and execution

The danger of allowing multiple teams to change the same system or subsystem is
that no **one owns either the changes made or the resulting mess**.

When a single team owns the system or subsystem, and the team has the autonomy
to plan their own work, then that team can make sensible decisions

Team ownership of code should not be a territorial thing.

Instead, teams should view themselves as **stewards** or caretakers as opposed
to private owners. Think of code as gardening, not policing.

For teams to work, team members should put the needs of the team above their
own. They should:
- Arrive for stand-ups and meetings on time.
- Keep discussions and investigations on track.
- Encourage a focus on team goals.
- Help unblock other team members before starting on new work.
- Mentor new or less experienced team members.
- Avoid “winning” arguments and, instead, agree to explore options.

one study found that “collectively oriented team members were more likely to
attend to the task inputs of other team members and to improve their
performance during team interaction than egocentric team members.”

Recent research in both civilian and military contexts strongly suggests that
**teams with members of diverse backgrounds tend to produce more creative
solutions** more rapidly and tend to be better at empathizing with other teams’
needs.

This diverse mix of people also appears to foster better results, as team
members make fewer assumptions about the context and needs of their software
users.

Deming, author of Out of the Crisis and a pivotal figure in the Lean
manufacturing movement, identified one of his key fourteen points for
management as **"abolishment of the annual or merit rating and of management by
objective."**

Looking to reward individual performance in modern organizations tends to drive
poor results and damages staff behavior.

Nokia during its hugely successful years in the 1990s and 2000s was: “Pay
differences across the organization were muted. Bonuses were small and
typically paid on a team basis and on overall company performance, not
individually.”

The same can be applied to training budgets. If the team wants to send the same
person to six or seven conferences during the year because they are so good at
reporting back to the team, that should be the team’s decision.

A team-first approach to cognitive load means limiting the size of the software
system that a team is expected to work with; that is, organizations should not
allow a software subsystem to grow beyond the cognitive load of the team
responsible for the software.

Cognitive load was characterized in 1988 by psychologist John Sweller as “the
total amount of mental effort being used in the working memory.”

Three different kinds of cognitive load:
- **Intrinsic** cognitive load: relates to aspects of the task fundamental to
  the problem space (e.g., “What is the structure of a Java class?” “How do I
  create a new method?”)
- **Extraneous** cognitive load: relates to the environment in which the task
  is being done (e.g., “How do I deploy this component again?” “How do I
  configure this service?”)
- **Germane** cognitive load: relates to aspects of the task that need special
  attention for learning or high performance (e.g., “How should this service
  interact with the ABC service?”)

Organizations should attempt to **minimize intrinsic cognitive load** (through
training, good choice of technologies, hiring, pair programming, etc.)

**Eliminate extraneous cognitive load** altogether (boring or superfluous tasks
or commands that add little value to retain in the working memory and can often
be automated away),

**Leaving more space for germane cognitive load** (which is where the “value
add” thinking lies).

A simple and quick way to assess cognitive load is to ask the team, in a
non-judgmental way: **“Do you feel like you’re effective and able to respond in
a timely fashion to the work you are asked to do?”**

Trying to determine the cognitive load of software using simple measures such
as lines of code, number of modules, classes, or methods is misguided.

Identify distinct domains that each team has to deal with, and classify these
domains
- **simple** (most of the work has a clear path of action),
- **complicated** (changes need to be analyzed and might require a few
  iterations on the solution to get it right),
- **complex** (solutions require a lot of experimentation and discovery).

The **first heuristic is to assign each domain to a single team**.

If a domain is too large for a team, instead of splitting responsibilities of a
single domain to multiple teams, first split the domain into subdomains and
then assign each new subdomain to a single team.

The **second heuristic is that a single team (considering the golden
seven-to-nine team size) should be able to accommodate two to three “simple”
domains**.

The **third heuristic is that a team responsible for a complex domain should
not have any more domains assigned to them—not even a simple one**.

The **last heuristic is to avoid a single team responsible for two complicated
domains**.

![](/assets/img/team.topologies/3.2.domain.per.team.png)
Figure 3.2: No More than One Complicated or Complex Domain per Team 
- Before: a larger team is spread thin across four domains (two complicated and
  two complex) and struggles to perform well. Intra-team morale is negatively
  affected, with frequent context switches and individual disengagement. 
- After: with multiple smaller teams each focusing on a single domain,
  motivation rises and the team delivers faster and more predictably. Low
  bandwidth inter-team collaboration allows solving occasional issues affecting
  two or more domains.

Instead of choosing between a monolithic architecture or a microservices
architecture, design the software to **fit the maximum team cognitive load**.

![](/assets/img/team.topologies/3.3.boundaries.png)
Figure 3.3: Typical vs. Team-First Software Subsystem Boundaries

Tune the ecosystem in which the team works in order to maximize the cognitive
capacity of the team

Provide a team-first working environment (physical or virtual).

Minimize team distractions during the workweek by limiting meetings, reducing
emails, assigning a dedicated team or person to support queries, and so forth.

Change the management style by **communicating goals and outcomes** rather than
obsessing over the “how,” what McChrystal calls “Eyes On, Hands Off” in Team of
Teams.

Increase the quality of developer experience (DevEx) for other teams using your
team’s code and APIs through good documentation, consistency, good UX, and
other DevEx practices.

Use a platform that is explicitly designed to reduce cognitive load for teams
building software on top of it.

Define “Team APIs” that Include Code, Documentation, and User Experience

The team API includes:
- **Code**: runtime endpoints, libraries, clients, UI, etc. produced by the
  team
- **Versioning**: how the team communicates changes to its code and services
  (e.g., using semantic versioning [SemVer] as a “team promise” not to break
  things)
- **Wiki and documentation**: especially how-to guides for the software owned
  by the team
- **Practices and principles**: the team’s preferred ways of working
- **Communication**: the team’s approach to remote communication tools, such as
  chat tools and video conferencing
- **Work information**: what the team is working on now, what’s coming next,
  and overall priorities in the short to medium term
- **Other**: anything else that other teams need to use to interact with the
  team

Each team at AWS must assume that “every [other team] becomes a potential DOS
[denial of service] attacker requiring service levels, quotas, and throttling.”

# PART II Team Topologies that Work for Flow

## KEY TAKEAWAYS

CHAPTER 4
- Ad hoc or constantly changing team design slows down software delivery.
- There is no single definitive team topology but several inadequate topologies
  for any one organization.
- Technical and cultural maturity, org scale, and engineering discipline are
  critical aspects when considering which topology to adopt.
- In particular, the feature-team/product-team pattern is powerful but only
  works with a supportive surrounding environment.
- Splitting a team’s responsibilities can break down silos and empower other
  teams.

CHAPTER 5
- The four fundamental team topologies simplify modern software team
  interactions.
- Mapping common industry team types to the fundamental topologies sets up
  organizations for success, removing gray areas of ownership and
  overloaded/underloaded teams.
- The main topology is (business) stream-aligned; all other topologies support
  this type.
- The other topologies are enabling, complicated-subsystems, and platform.
- The topologies are often “fractal” (self-similar) at large scale: teams of
  teams.

CHAPTER 6
- Choose software boundaries using a team-first approach.
- Beware of hidden monoliths and coupling in the software-delivery chain.
- Use software boundaries defined by business-domain bounded contexts.
- Consider alternative software boundaries when necessary and suitable.

## 4 Static Team Topologies

> Instead of structuring teams according to technical know-how or activities,
> organize teams according to business domain areas. 
> -- Jutta Eckstein, “Feature Teams—Distributed and Dispersed,” in Agility Across Time and Space

#### Team Anti-Patterns

The first anti-pattern is ad hoc team design.

The other common anti-pattern is shuffling team members.

Given our skills, constraints, cultural and engineering maturity, desired
software architecture, and business goals, which team topology will help us
deliver results faster and safer?

#### Design for Flow of Change

> an organization has a better chance of success if it is reflectively designed.
> -- Naomi Stanford

“The Spotify Model,” technical staff at Spotify are arranged into small,
autonomous, cross-functional squads, each with a long-term mission
- Squads that work on similar areas are collected into a tribe,
- Engineers within a tribe with similar skills and competencies share practices
  through a chapter.
- Spotify also uses a more diffuse “guild,” akin to a community of practice,
  that can include people from across multiple tribes, chapters, and squads.

**Many organizations have mistakenly copied the Spotify model without
understanding the underlying purpose, culture, dynamics, or trajectory**

> We didn’t invent this model. Spotify is (like any good Agile company)
> evolving fast. This article is only a snapshot of our current way of
> working—a journey in progress, not a journey completed.
> -- Kniberg and Ivarsson 

#### Shape Team Intercommunication to Enable Flow and Sensing

Organizations seem to assume that software delivery is a one-way process,
leading from specification to design, from design to coding, from coding to
testing and releasing, and from releasing to business as usual

![](/assets/img/team.topologies/4.1.flow.of.change.png)
Figure 4.1: Organization not Optimized for Flow of Change 
- Traditional flow of change in an organization not optimized for flow, with a
  series of groups owning different activities and handing over the work to the
  next team.

![](/assets/img/team.topologies/4.2.optimized.flow.of.change.png)
Figure 4.2: Organization Optimized for Flow of Change 
- Organizations set up for fast flow avoid hand-offs by keeping work within the
  stream-aligned team, and they ensure that the rich set of operational
  information flows back into the team.

> we must... ensure delivery teams are cross-functional, with all the skills
> necessary to design, develop, test, deploy, and operate the system on the
> same team.
> -- Accelerate

many organizations adopting Agile were not explicitly addressing the gap
between software delivery speed and operations teams’ capacity to provide
resources or deploy updates.

A key contribution of DevOps was to raise awareness of the problems lingering
in how teams interacted (or not) across the delivery chain,

#### DevOps Topologies

The DevOps Topologies catalog, originally created by Matthew Skelton in 2013
and later expanded by Manuel Pais, is an online collection of team design and
interactions patterns and anti-patterns

The DevOps Topologies reflect two key ideas:
1. There is no one-size-fits-all approach
2. There are several topologies known to be detrimental (anti-patterns)

#### Feature Teams Require High-Engineering Maturity and Trust

We consider a feature team to be a cross-functional, cross-component team that
can take a customer facing feature from idea all the way to production, making
them available to customers and, ideally, monitoring its usage and performance.

#### Product Teams Need a Support System

The key for the team to remain autonomous is for external dependencies to be
non-blocking, meaning that new features don’t sit idle, waiting for something
to happen beyond the control of the team.

#### Cloud Teams Don’t Create Application Infrastructure

Cloud teams that are, for the most part, a rebranding of traditional
infrastructure teams will fail to take advantage of the speed and scalability
that the cloud offers.

There needs to be a split between the responsibility of designing the cloud
infrastructure process (by the cloud team) and the actual provisioning and
updates to application resources (by the product teams).

#### SRE Makes Sense at Scale

> SRE is “what happens when you ask a software engineer to design an operations
> function.
> -- Ben Treynor, Vice President of Engineering at Google

> Downscale the SRE support if your project is shrinking in scale, and finally
> let your development team own the SRE work if the scale doesn’t require SRE
> support
> -- Ben Treynor, not every development team at Google uses SRE. 

![](/assets/img/team.topologies/4.3.sre.png)
Figure 4.3: Relationship between SRE Team and Application Team

The relationship between an SRE team and an application-development team
**changes at different points** of the software’s life and even month by month.

Initially (#1 in Figure 4.3), the application development team alone builds and
runs the software in production until the scale merits SRE help.

During a second stage (#2 in Figure 4.3), as the application usage increases,
SRE provides guidance (represented in green) to the application development
team on how to make the application work better at global scale.

Later, SRE becomes fully involved by running and supporting the application
(but still collaborating with the application team) when the scale merits it

If at some point (#4 in Figure 4.3) the application becomes too difficult to
support due to lack of operability, or if the application usage drops off, the
application team takes on operational responsibility again.

Recognize that building and running software systems is a sociotechnical
activity, not an assembly line in a factory.

### Considerations When Choosing a Topology

##### Technical and Cultural Maturity

For example, by 2013, both Amazon and Netflix had a well-established strategy,
using cross-functional teams with end-to-end responsibility for the services
they provided to the rest of the organization.

Meanwhile, traditional organizations adopting Agile—moving to smaller batches
of delivery—often lacked the mature engineering practices required to keep a
sustainable pace over time

They could benefit from a temporary DevOps team with battle-tested engineers to
bring in expertise

However, without a clear mission and expiration date for such a DevOps team,
it’s easy to cross the thin line between this pattern and the corresponding
anti-pattern of yet another silo (DevOps team) with compartmentalized knowledge

On the other hand, for a large enterprise where successful DevOps adoption
across the board requires both top-down and bottom-up alignment, it makes sense
to invest in a team of DevOps evangelists that raise awareness and are vocal
about initial achievements

##### Organization Size, Software Scale, and Engineering Maturity

![](/assets/img/team.topologies/4.4.scale.png)
Figure 4.4: Influence of Size and Engineering Maturity on Choice of Topologies 
- Organization size (or software scale) and engineering discipline influence
  the effectiveness of team interaction patterns.

##### Splitting Responsibilities to Break Down Silos

Importance of thinking about teams’ capabilities (or lack thereof) and how that
causes dependencies between teams.

Instead of simply replicating teams or adding more people when workload
increases, it’s important to think about which dependencies between teams we
should remove and which we should explicitly accept,

##### Dependencies and Wait Times between Teams

In Making Work Visible, Dominica DeGrandis recommends the use of a Physical
Dependency Matrix or “dependency tags” on kanban cards to identify and track
dependencies,

In their 2012 paper, “A Taxonomy of Dependencies in Agile Software
Development,” Diane Strode and Sid Huff propose **three different categories of
dependency**: knowledge, task, and resource dependencies.

## 5 The Four Fundamental Team Topologies

> The architecture of the system gets cemented in the forms of the teams that
> develop it. 
> -- Ruth Malan, “Conway’s Law”

Four fundamental team topologies: 
1. Stream-aligned team 
2. Enabling team 
3. Complicated-subsystem team 
4. Platform team

![](/assets/img/team.topologies/5.1.topologies.png)
Figure 5.1: The Four Fundamental Team Topologies

### Stream-Aligned Teams

A “stream” is the continuous flow of work aligned to a business domain or
organizational capability.

A stream-aligned team is a team aligned to a single, valuable stream of work;
this might be a single product or service, a single set of features, a single
user journey, or a single user persona.

Different streams can coexist in an organization: specific customer streams,
business-area streams, geography streams, product streams, user-persona
streams, or even compliance streams

In a modern software organization, we expect **most teams to be stream aligned**.

The flow of work is clear, and each stream has a steady, expectable flow of
work for the stream-aligned team to prioritize.

##### Capabilities within a Stream-Aligned Team

Application security Commercial and operational viability analysis Design and
architecture Development and coding Infrastructure and operability Metrics and
monitoring Product management and ownership Testing and quality assurance User
experience (UX)

(SRE) teams, pioneered by Google, are really a special kind of stream-aligned
team in the sense that they are responsible for the reliability of large-scale
applications running in production. SRE teams interact primarily with one or
more stream-aligned teams responsible for developing applications, and the flow
of software change is very much aligned to a stream.

##### Why Stream-Aligned Team, Not “Product” or “Feature” Team?

Customers interact not just with a discrete piece of software but with a range
of products and devices

Customers also interact with brands via multiple channels

In this multi-channel, highly connected context, a “product” can mean very
different things, making it hard to understand what the responsibilities of a
“product team” are.

##### Expected Behaviors

A stream-aligned team aims to produce a steady flow of feature delivery.

A stream-aligned team is quick to course correct based on feedback from the
latest changes.

A stream-aligned team uses an experimental approach to product evolution,
expecting to constantly learn and adapt.

A stream-aligned team has minimal (ideally zero) hand-offs of work to other
teams.

A stream-aligned team is evaluated on the sustainable flow of change it
produces (together with some supporting technical and team-health metrics).

A stream-aligned team must have time and space to address code quality changes
(sometimes called “tech debt”) to ensure that changing the code remains safe
and easy to do.

A stream-aligned team proactively and regularly reaches out to the supporting
fundamental-topologies teams (complicated subsystem, enabling, and platform).

Members of a stream-aligned team feel they have achieved or are in the path to
achieving “autonomy, mastery, and purpose,” the three key components of engaged
knowledge workers, according to Daniel Pink.

### Enabling Teams

How can a stream-aligned team with end-to-end ownership find the space for
researching, reading about, learning, and practicing new skills?

An enabling team is composed of specialists in a given technical (or product)
domain, and they help bridge this capability gap.

Enabling teams have a strongly collaborative nature; they thrive to understand
the problems and shortcomings of stream-aligned teams in order to provide
effective guidance.

Enabling teams actively avoid becoming “ivory towers” of knowledge, dictating
technical choices for other teams to follow, while helping teams to understand
and comply with organization-wide technology constraints. This is akin to the
idea of “servant leadership” but applied to team interactions rather than
individuals.

Often they are focused on more specific areas, such as build engineering,
continuous delivery, deployments, or test automation for particular client
technology (e.g., desktop, mobile, web).

##### Expected Behaviors

An enabling team proactively seeks to understand the needs of stream-aligned
teams, establishing regular checkpoints and jointly agreeing when more
collaboration is needed.

An enabling team stays ahead of the curve in keeping abreast of new approaches,
tooling, and practices in their area of expertise, well before an actual need
is expected from stream-aligned teams. In the past, this has been the mission
of architecture or innovation teams, but the focus on enabling other teams
creates a better dynamic.

An enabling team acts as a messenger of both good news (e.g., “There’s a new UI
automation framework that can reduce our custom test code by 50%.”) and bad
news (e.g., “Javascript framework X, which we’re using extensively, is no
longer actively maintained.”). This helps with management of the technology
life cycle.

Occasionally, the enabling team might act as a proxy for external (or internal)
services that are currently too difficult for stream-aligned teams to use
directly.

An enabling team promotes learning not only inside the enabling team but across
stream-aligned teams, acting as a curator that facilitates appropriate
knowledge sharing inside the organization (supporting what Tom DeMarco and Tim
Lister call a “key learning function.”

##### Case Study: Engineering Enablement Team within a Large Legal Organization

The enablement team consisted of a number of people with strong skills and
awareness across software engineering disciplines

Focus to improve the following metrics: 
1. Time taken per successful deployment 
2. Absolute number of successful deployments per day 
3. Time taken to fix a failing deployment 
4. Time from code commit to deployment (cycle time)

### Enabling Team versus Communities of Practice (CoP)

The members of an enabling team work on enabling activities full-time, whereas
a CoP is a more diffuse grouping of interested individuals from across several
teams, with an aim to share practices and improve working methods on a weekly
(or monthly) basis.

##### Enabling teams and CoP can co-exist

An enabling team is a small, long-lived group of specialists focused on
building awareness and capability for a single team (or a small number of
teams) at any one point in time,

a CoP usually seeks to have more widespread effects, diffusing knowledge across
many teams.

### Complicated-Subsystem Teams

A complicated-subsystem team is responsible for building and maintaining a part
of the system that depends heavily on specialist knowledge, to the extent that
most team members must be specialists in that area of knowledge in order to
understand and make changes to the subsystem.

Goal of this team is to reduce the cognitive load of stream-aligned teams
working on systems that include or use the complicated subsystem. The

We can’t expect to embed the necessary specialists in all the stream-aligned
teams that make use of the subsystem;

A complicated-subsystem team is mindful of the current stage of development of
the subsystem and acts accordingly: 
- high collaboration with stream-aligned teams during early exploration and
  development phases; 
- reduced interaction and focus on the subsystem interface and feature
  evolution and usage during later stages, when the subsystem has stabilized.

With a complicated-subsystem team, delivery speed and quality for the subsystem
is clearly higher than if/when the subsystem was being developed by a
stream-aligned team (before the decision to split).

The complicated-subsystem team correctly prioritizes and delivers upcoming work
respecting the needs of the stream-aligned teams that use the complicated
subsystem.

### Platform Teams

The purpose of a platform team is to enable stream-aligned teams to deliver
work with substantial autonomy.

The platform team provides internal services to reduce the cognitive load that
would be required from stream-aligned teams to develop these underlying
services.

> Technical-service teams should always regard themselves as pure service
> providers for the domain teams.
> -- Jutta Eckstein 

In practice, platform teams are expected to focus on providing a smaller number
of services of acceptable quality rather than a large number of services with
many resilience and quality problems. There

Don Reinertsen recommends using internal pricing (for infrastructure and
services) to regulate demand, helping to avoid everyone asking for premium
level. An example could be tracking cloud-infrastructure costs by team or
service.

A platform team uses strong collaboration with stream-aligned teams to
understand their needs.

A platform team relies on fast prototyping techniques and involves
stream-aligned team members for fast feedback on what works and what does not.

A platform team has a strong focus on usability and reliability for their
services (treating the platform as a product), and regularly assesses if the
services are still fit for purpose and usable.

A platform team leads by example: using the services they provide internally
(when applicable), partnering with stream-aligned teams and enabling teams, and
consuming lower level platforms (owned by other platform teams) whenever
possible.

A platform team understands that adoption of internal new services, like new
technologies, is not immediate, but instead evolves along an adoption curve.

##### Compose the Platform from Groups of Other Fundamental Teams

From the viewpoint of the product owner of the platform, there are clear
internal streams of value within the platform to which stream-aligned teams
align to help them deliver value to the customers of the platform: the teams
that use the platform

![](/assets/img/team.topologies/5.2.flow.png)
Figure 5.2: Platform Composed of Several Fundamental Team Topologies 
- In a large organization, the platform is composed of several other
  fundamental team topologies: stream-aligned Dev teams, complicated-subsystem
  teams, and a lower-level platform.

From the viewpoint of the Dev teams, the platform is a single entity that
provides them with a service that they simply consume via an API:

### Avoid Team Silos in the Flow of Change

This model also works poorly for safe and rapid flow of change; instead, we
combine stream-aligned teams that support and operate software in production
together with platform teams that provide the underlying “substrate” for
stream-aligned teams.

Organizations that optimize for a safe and rapid flow of change tend to use
mixed-discipline or cross-functional teams aligned to the flow of change—

### The Thinnest Viable Platform

We should aim for a thinnest viable platform (TVP) and avoid letting the
platform dominate the discourse.

> software developers love building platforms and, without strong product
> management input, will create a bigger platform than needed.
> -- Allan Kelly 

### Cognitive Load Reduction and Accelerated Product Development

> The most important part of the platform is that it is built for developers.
> -- Kenichi Shibata of global publishing company Conde Nast International 

### Compelling, Consistent, Well-Chosen Constraints

An attention to good UX/DevEx will make the platform compelling to use, and the
platform will feel consistent in the way the APIs and features work. How-to

The platform attempts to “get out of the way” of Dev teams, enabling them to
build what they need with few pre-conceptions about how teams need to do that.
A good test for DevEx is how easy it is to onboard a new Developer to the
platform.

### Built On an Underlying Platform

Every software application and every software service is built on a platform.
Often the platform is implicit or hidden, or perhaps not noticed much by the
team that builds the software, but the platform is still there.

> it’s turtles all the way down.
> -- philosophical expression

#### Manage as a Live Product or Service

In order to help the Dev team users to be as effective as possible, we need to:
(1) treat the platform as a live/production system, with any downtime planned
and managed, and (2) use software-product-management and service-management
techniques.

When we treat the platform as a live or production system, we need to undertake
all the normal activities and practices that we would with any other live
system: define the hours of operation, define the response time for incidents
and support, ensure we have an on-call rota to support the platform, manage
incidents and unplanned downtime with suitable communication channels (such as
service status pages), and so on. Naturally,

### Convert Common Team Types to the Fundamental Team Topologies

### Move to Mostly Stream-Aligned Teams for Longevity and Flexibility

#### Infrastructure Teams to Platform Teams

![](/assets/img/team.topologies/5.3.infra.png)
Figure 5.3: Traditional Infrastructure Team Organization 
- Many traditional infrastructure teams (on the right) blocked flow by being
  responsible for all changes to production infrastructure, including
  application changes, frequently gated by ITIL change processes. 
- Work from Dev teams (on the left) was handed over to infrastructure or Ops
  teams for deployment, preventing flow.

#### Component Teams to Platform or Other Team Types

Existing teams based on a technology component should either be dissolved, with
the work going into stream-aligned teams or converted into another team type

For example, database-administrator (DBA) teams can often be converted to
enabling teams if they stop doing work at the software-application level and
focus on spreading awareness of database performance, monitoring, etc. to
stream-aligned teams.

#### Tooling Teams to Enabling Teams or Part of the Platform

Tooling teams are typically better run either as enabling teams—with a
short-lived and highly focused remit—or as part of the platform (with a clear,
well-informed roadmap).

### Converting Support Teams

The model for IT support that consistently seems to work best has two aspects:
1. support teams aligned to the stream of changes
2. dynamic cross-team activity to resolve live service incidents.

If dedicated support teams are needed, they are aligned to the stream of
change, alongside a team or squad building the software systems.

![](/assets/img/team.topologies/5.4.support.png)
Figure 5.4: Support Teams Aligned to Stream of Change 
- The new model for support teams: aligned to the flow of change, usually
  paired with one or more stream-aligned Dev teams. 
- Incidents are handled with dynamic “swarming.”

### Converting Architecture and Architects

The most effective pattern for an architecture team is as a part-time enabling
team (if one is needed at all).

The team **being part-time is important**: it emphasizes that many decisions
should be taken by implementing teams rather than left to the architecture
team.

> Architects should collaborate closely with their users—the engineers who
> build and operate the systems through which the organization achieves its
> mission to help them achieve better outcomes and provide them the tools and
> technologies that will enable these outcomes.
> -- Accelerate, 

### Summary

Use Loosely Coupled, Modular Groups of Four Specific Team Types

## 6 Choose Team-First Boundaries

> -- Eric Evans, Domain-Driven Design
> When code doesn’t work... the problem starts in how teams are organized and
> [how] people interact. 

Flow is difficult to achieve when each team depends on a complicated web of
interactions with many other teams. For a fast flow of change to software
systems, we need to remove hand-offs and align most teams to the main streams
of change within the organization.

### A Team-First Approach to Software Responsibilities and Boundaries

Many problems in delivering software come from accidentally unclear boundaries
between different teams and their responsibilities.

### Software Boundaries or “Fracture Planes”

Splitting software can reduce the consistency between different parts of the
software and can lead to accidental data duplication across multiple
subsystems.

A **fracture plane is a natural seam in the software system that allows the
system to be split** easily into two or more parts.

It is usually best to try to align software boundaries with the different
business domain areas.

### Fracture Plane: Business Domain Bounded Context

A **bounded context** is a unit for partitioning a larger domain (or system)
model into smaller parts, each of which represents an internally consistent
business domain area

Identifying bounded contexts requires a fair amount of business knowledge and
technical expertise, so it’s normal to make mistakes initially.

Other advantages of applying DDD include 
- focusing on core complexity and opportunities within a bounded context for a
  given business domain
- exploring models via collaboration between business experts (because there
  are now smaller domains to think about)
- building software that expresses these models explicitly
- having both business owners and technologists speaking an ubiquitous language
  within a bounded context.

##### Fracture Plane: Regulatory Compliance

##### Fracture Plane: Change Cadence

##### Fracture Plane: Team Location

We’d argue that for a team to communicate efficiently, the options are between
full colocation (all team members sharing the same physical space) or a true
remote-first approach (explicitly restricting communication to agreed
channels—such as messaging and collaboration apps—that everyone on the team has
access to and consults regularly).

##### Fracture Plane: Risk

##### Fracture Plane: Performance Isolation

##### Fracture Plane: Technology

##### Fracture Plane: User Personas

#### Natural “Fracture Planes” for Your Specific Organization or Technologies

Figure 6.1: Mobile, Cloud, and IoT Technology Fracture Plane Scenario With
three very disparate technologies (mobile, cloud, and IoT), an organization
must decide on an approach to fracture planes that makes sense based on the
cognitive load and the change cadence in each area.

### Summary: Choose Software Boundaries to Match Team Cognitive Load

When optimizing for flow, stream-aligned teams should be responsible for a
single domain.

We need to look for natural ways to break down the system (fracture planes)
that allow the resulting parts to evolve as independently as possible.
Consequently,

need to beware and sense for other fracture planes, such as change cadence,
risk, regulatory compliance, and so on. Often, a combination of fracture planes
will be required.

# PART III Evolving Team Interactions for Innovation and Rapid Delivery

## KEY TAKEAWAYS

CHAPTER 7 
- Choose specific team interaction modes to enhance software delivery.
- Choose between three team interaction modes—collaboration, X-as-a-Service,
  and facilitating—to help teams provide and evolve services to other teams.
- Collaboration can be a powerful driver for innovation but can also reduce
  flow.  X-as-a-Service can help other teams deliver quickly but only if the
  boundary is suitable. 
- Facilitating helps to avoid cross-team challenges and detects problems.

CHAPTER 8 
- Use different team topologies simultaneously for strategic advantage.
- Change team topologies and team interactions to accelerate adoption of new
  approaches. 
- Differentiate between explore, exploit, sustain, retire phases using team
  topologies. 
- Expect multiple, simultaneous team topologies to meet different needs. 
- Recognize triggers for organization change. 
- Treat operations as high-fidelity sensory input for self-steering.

CONCLUSION 
- Combine a team-first approach with Conway’s law, the four fundamental
  topologies, team interaction modes, topology evolution, and organizational
  sensing. 
- Get started: begin with the team, identify streams, identify the thinnest
  viable platform, identify capability gaps, and practice team interactions.

## 7 Team Interaction Modes

Technologies and organizations should be redesigned to intermittently isolate
people from each other’s work for best collective performance in solving
complex problems. —Ethan Bernstein, Jesse Shore, and David Lazer, “How
Intermittent Breaks in Interaction Improve Collective Intelligence”

Simply arranging teams into patterns is not enough for high effectiveness; it
is also necessary to identify how these teams interact and when to change the
teams and their interactions.

### Well-Defined Interactions Are Key to Effective Teams

When considering the relationship between any teams, a key decision is whether
to collaborate with another team to achieve an objective or to treat the other
team as providing a service

What must be avoided is the need for all teams to communicate with all other
teams in order to achieve their ends;

![](/assets/img/team.topologies/7.1.x.service.png)
Figure 7.1: Collaboration vs. X-as-a-Service 
- Collaboration means explicitly working together on defined areas.
- X-as-a-Service means one team consumes something “as a service” from another
  team.

> groups whose members interacted only intermittently... had an average quality
> of solution that was nearly identical to those groups that interacted
> constantly, yet they preserved enough variation to find some of the best
> solutions too.  
> -- Bernstein and colleagues 

### The Three Essential Team Interaction Modes

1. Collaboration: working closely together with another team 
2. X-as-a-Service: consuming or providing something with minimal collaboration 
3. Facilitating: helping (or being helped by) another team to clear impediments

![](/assets/img/team.topologies/7.2.interaction.modes.png)
Figure 7.2: The Three Team Interaction Modes 
- Collaboration mode is shown with diagonal cross-hatching
- X-as-a-Service mode is shown with brackets 
- Facilitating is shown with dots

![](/assets/img/team.topologies/7.3.interaction.scenario.png) Figure 7.3: Team Interaction Modes Scenario 
- Stream-aligned: Team A 
- collaborates with complicated-subsystem Team B (shown with cross-hatching) 
- while also consuming the platform provided by Team C, 
- using the X-as-a-Service mode (shown with brackets).

### Collaboration: Driver of Innovation and Rapid Discovery but Boundary Blurring

During early phases of new systems development, and during periods where there
is a need to quickly discover new information, technology limitations, and
suitable practices, the collaboration mode is highly valuable. This

There are two useful ways to visualize teams interacting using the
collaboration mode.
1. The first is to visualize two teams with distinct expertise and
   responsibilities working together on a small set of things.
2. The second visualization of collaboration mode identifies that the nature of
   working together between teams can be almost total:

Furthermore, Conway’s law tells us that with the discovery and rapid learning
that comes from the collaboration mode, the responsibilities and architecture
of the software will tend to be more blended together. If clear, well-defined
interfaces to services or systems between two teams is needed, then using the
collaboration mode for extended periods is not likely to be the best choice.

### Advantages and Disadvantages of Collaboration Mode

Advantages                     
- Rapid innovation and discovery 
- Fewer hand-offs                

Disadvantages
- Wide, shared responsibility for each team
- More detail/context needed between teams, leading to higher cognitive load |
- Possible reduced output during collaboration compared to before

Constraint: 
- A team should use collaboration mode with, at most, one other team at a time. 
- A team should not use collaboration with more than one team at the same time. 

Typical Uses: 
- Stream-aligned teams working with complicated-subsystem teams; 
- stream-aligned teams working with platform teams; 
- complicated-subsystem teams working with platform teams

### X-as-a-Service: Clear Responsibilities with Predictable Delivery but Needs Good Product Management

With X-as-a-Service, there is great clarity about who owns what: one team
consumes something that the other team provides.

![](/assets/img/team.topologies/7.4.x.service.interaction.png) Figure 7.4: X-as-a-Service Team Interaction
Mode 
- In this case, the team on the right is providing something “as a service” to
  the team on the left (perhaps an API, some developer tooling, or even an
  entire platform).

For something to be provided as a service—whether a component, an API, a
testing tool, or an entire delivery platform—the team responsible must have a
**strong sense of responsibility** toward both the consumers and the viability
of the thing they are providing.

They must make the developer experience (DevEx) highly compelling. The service
they provide should be straightforward to use, test, deploy, and/or debug; and
the documentation on how to use it should be clear, well-written, and up to
date.

The service they provide must be managed in a way that keeps it viable over
time: requests for new features from consuming teams are considered but not
built just because a team has asked for them. Instead, the purpose and remit of
the thing is evolved with the best interest of all consumers in mind,

##### Advantages and Disadvantages of X-as-a-Service Mode

Advantages 
- Clarity of ownership with clear responsibility boundaries 
- Reduced detail/context needed between teams, so cognitive load is limited 

Disadvantages 
- Slower innovation of the boundary or API 
- Danger of reduced flow if the boundary or API is not effective 

Constraint: 
- A team should expect to use the X-as-a-Service interaction with many other
  teams simultaneously, whether consuming or providing a service. 

Typical Uses: 
- Stream-aligned teams and complicated-subsystem teams consuming
  Platform-as-a-Service from a platform team; 
- stream-aligned teams and complicated-subsystem teams consuming a component or
  library as a service from a complicated-subsystem team.

### Facilitating: Sense and Reduce Gaps in Capabilities

The facilitating team interaction mode is suited to situations where one or
more teams would benefit from the active help of another team facilitating (or
coaching) some aspect of their work.

The facilitating interaction mode is the main operating mode of an enabling
team (see

Teams that interact using the facilitating mode typically work across many
other teams, detecting and reducing cross-team problems and helping to inform
the direction and capabilities

##### Advantages and Disadvantages of Facilitation Mode 

Advantages 
- Unblocking of stream-aligned teams to increase flow 
- Detection of gaps and misaligned capabilities or features in components and
  platforms 

Disadvantages 
- Requires experienced staff to not work on “building” or “running” things 
- The interaction may be unfamiliar or strange to one or both teams involved in
  facilitation 

Constraint: 
- A team should expect to use the facilitating interaction mode with a small
  number of other teams simultaneously, whether consuming or providing the
  facilitation. 

Typical Uses: 
- An enabling team helping a stream-aligned, complicated-subsystem, or platform
  team; 
- or a stream-aligned, complicated-subsystem, or platform team helping a
  stream-aligned team.

### Team Behaviors for Each Interaction Mode

> Technologist James Urquhart, writing about team intercommunication with
> Conway’s law in mind, describes the need for “a communication backchannel
> that avoids much of the politics, bandwidth constraints, and simple
> inefficiency of human-to-human communication.”

Clear roles and responsibility boundaries help this by defining expected
behavior and avoiding what some refer to as “invisible electric fences.”

**Promise theory** devised by technologist and researcher Mark Burgess—explains
how and why it is preferable to construct inter-team relationships in terms of
promises rather than in terms of commands and enforceable contracts. For
example, by adhering to the meaning of the major/minor/patch/build numbering
indicated by semantic versioning (SemVer), the team promises not to break
software that depends on their code.

### Team Behaviors for Collaboration Mode: “High Interaction and Mutual Respect”

### Team Behaviors for X-as-a-Service Mode: “Emphasize the User Experience”

Teams interacting using the X-as-a-Service mode should expect to emphasize the
user experience of the thing being provided as a service.

### Team Behaviors for Facilitating Mode: “Help and Be Helped”

### Choosing Suitable Team Interaction Modes

![](/assets/img/team.topologies/7.5.primary.interaction.png) Figure 7.5: Primary Interaction Modes for the
Four Fundamental Team Topologies 
- Stream-aligned teams use X-as-a-Service or collaboration
- enabling teams use facilitation
- complicated-subsystem teams use X-as-a-Service
- platform teams use X-as-a-Service for teams that consume the platform.

Table 7.4: Team interaction modes of the fundamental team topologies 

|                       | Collaboration | X-as-a-Service | Facilitating
| ---                   | ---           | ---            | ---          |
| Stream-aligned        | Typical       | Typical        | Occasional   |
| Enabling              | Occasional    |                | Typical      |
| Complicated-subsystem | Occasional    | Typical        |              |
| Platform              | Occasional    | Typical        |              |

### Choosing Basic Team Organization

##### Use the Reverse Conway Maneuver with Collaboration and Facilitating Interactions

To help make the new organizational structure work—and to sense whether the new
responsibility boundaries are actually correct—the reverse Conway maneuver
should be used with temporary but explicit collaboration modes between the
teams building the software, along with one or more enabling teams (and
possibly other teams) acting in a facilitating mode. By

##### Discover Effective APIs between Teams by Deliberate Evolution of Team Topologies

Instead of trying to rely entirely on individuals within teams to perform
boundary spanning (which can be stressful and needs both good social and
technical skills), use people skilled in API design to design the APIs between
teams within the organization.

##### Choose Team Interaction Modes to Reduce Uncertainty and Enhance Flow

##### Use the Collaboration Mode to Discover Viable X-as-a-Service Interactions

To address the problem of poorly drawn service boundaries, the collaboration
team interaction mode can be used to help redraw service boundaries in a new
place,

If an organization is trying to establish a new X-as-a-Service interaction, the
same pattern applies: collaborate closely to establish viable “as a service”
boundaries and then continue with lightweight collaboration to validate that
the boundaries are effective.

##### Change the Team Interaction Mode Temporarily to Help a Team Grow Experience and Empathy

If the current mode of interaction between teams has been in place for some
time and possibly needs some revitalization, changing the interaction mode
temporarily can help team members refresh and grow their experience, and
increase empathy for the other team.

##### Use Awkwardness in Team Interactions to Sense Missing Capabilities and Misplaced Boundaries

> We need to be alert for the white space between
> -- Don Reinertsen

Techniques from domain-driven design (DDD) such as event storming and context
mapping can help accelerate awareness of appropriate boundaries.

### Summary: Three Well-Defined Team Interaction Modes

**Collaboration**: two teams work closely together for a defined period to
discover new patterns, approaches, and limitations. Responsibility is shared
and boundaries blurred, but problems are solved rapidly and the organization
learns quickly.

**X-as-a-Service**: one team consumes something (such as a service or an API)
provided “as a service” from another team. Responsibilities are clearly
delineated and—if the boundary is effective—the consuming team can deliver
rapidly. The team providing the service seeks to make their service as easy to
consume as possible.

**Facilitating**: one team helps another team to learn or adopt new approaches
for a defined period of time. The team providing the facilitation aims to make
the other team self-sufficient as soon as possible, while the team receiving
the facilitation has an open-minded attitude to learning.

## 8 Evolve Team Structures with Organizational Sensing

> The design... is almost never the best possible, [so] the prevailing system
> concept may need to change. Therefore, flexibility of organization is
> important to effective design. 
> -- Mel Conway, “How Do Committees Invent?”

The most important thing is not the shape of the organization itself but the
decision rules and heuristics used to adapt and change the organization as new
challenges arise;

> In teams which score highly on architectural capabilities [which directly
> lead to higher performance], little communication is required between
> delivery teams to get their work done, and the architecture of the system is
> designed to enable teams to test, deploy, and change their systems without
> dependencies on other teams. In other words, architecture and teams are
> loosely coupled.”
> -- Accelerate

1. Restrict any ongoing collaboration between teams to explicit valuable
   activity. 
1. Collaboration is expensive. 
1. Unnecessary collaboration is particularly expensive, especially as it can
   mask or hide deficiencies in underlying platforms or capabilities. 

**Any ongoing collaboration activity must, therefore, be justified as valuable discovery, valuable capability building, or valuable deficiency-filling activity.**

### Accelerate Learning and Adoption of New Practices

If one team has significant experience in a valuable set of practices—such as
test automation—from which the second team would benefit, then bringing the two
teams together in collaboration mode for a few months can not only help to
improve and define the API between the teams but also produce a step change in
the capability of the second team.

![](/assets/img/team.topologies/8.1.collab.png) Figure 8.1: Collaboration between Cloud and Embedded Teams 
- Two teams (“cloud” and “embedded”) collaborate to share practices and
  increase awareness. 
- The results will include heightened awareness of the options for future team
  interactions: 
1. treat the cloud software as a platform for the embedded team to use, 
2. treat the embedded devices as a platform for the cloud team to use, or 
3. continue with close collaboration.

##### Constant Evolution of Team Topologies

Interaction modes of different teams should be expected to change regularly,
depending on what the teams need to achieve.

![](/assets/img/team.topologies/8.6.evolution.png) Figure 8.6: Evolution of Team Topologies 
- The evolution of Team Topologies from close collaboration to limited
  collaboration (discovery) through to X-as-a-Service for established,
  predictable delivery.

![](/assets/img/team.topologies/8.7.evolution.enterprise.png) Figure 8.7: Evolution of Team Topologies in
an Enterprise 
- Team 1 continues to collaborate with a platform team, discovering new
  patterns and ways of using new technologies. 
- This discovery activity eventually enables Team 2 to adopt an X-as-a-Service
  relationship with the platform team. 
- Later, Teams 3 and beyond adopt a later version of the platform, using it as
  a service without having to collaborate closely with the platform team.

The organization must ask itself: “Are we trying to discover things? And how
rapidly do we need to discover them?” 

### Combining Team Topologies for Greater Effectiveness

Some degree of collaboration between teams is expected, but collaboration often
doesn’t scale across the organization; and consuming things as a service is
often more effective as the number of teams increases.

### Triggers for Evolution of Team Topologies

##### Trigger: Software Has Grown Too Large for One Team

While initially it is possible that everyone in the product team has a fairly
broad understanding of the codebase, that becomes increasingly more difficult
over time.

##### Trigger: Delivery Cadence Is Becoming Slower

A long-lived, high-performing product team should be able to steadily improve
their delivery cadence as they find ways to work more efficiently together and
remove bottlenecks in delivery. However, a pre-requisite for these teams to
flourish is to grant them autonomy over the entire life cycle of the product.

##### Trigger: Multiple Business Services Rely On a Large Set of Underlying Services

In some highly regulated industry sectors, such as finance, insurance, legal,
and government, several different high-level business services may rely on a
large set of separate underlying services, APIs, or subsystems.

In order to deliver useful business value, the higher-level streams need to
integrate with many lower-level services (the realm of enterprise service
management). If the streams have to integrate separately with each underlying
service, it can be challenging to assess the effectiveness of flow

The solution to these kinds of multi-service integration problems is twofold:
1. “Platformize” the lower-level services and APIs with a thin “platform
   wrapper” that provides a consistent developer experience (DevEx)
2. Use stream-aligned teams for each high-level business service responsible
   for operational telemetry and fault diagnosis

![](/assets/img/team.topologies/8.8.platform.wrapper.png) Figure 8.8: Example of a “Platform Wrapper” 
- Increase flow predictability in higher-level business services (streams)
  through the use of a “platform wrapper” to “platformize” the lower-level
  services and APIs, allowing the streams to treat all their dependencies as a
  single platform with a holistic roadmap and consistent DevEx. 
- The streams also have rich telemetry to track flow and resource usage of the
  platform.

### Self Steer Design and Development

##### Treat Teams and Team Interactions as Senses and Signals

Not only do organizations need to sense things with high fidelity, they also
need to respond rapidly.

These questions can help an organization discover the answer: 
- Have we misunderstood how users need/want to behave? 
- Do we need to change team-interaction modes to enhance how the organization
  is working? 
- Should we still be building thing X in house? 
- Should we be renting it from an external provider? 
- Is the close collaboration between Team A and Team B still effective? 
- Should we move toward an X-as-a-Service model? 
- Is the flow of work for Team C as smooth as it could be? 
- What hampers flow? 
- Does the platform for teams D, E, F, and G provide everything those teams
  need? 
- Is an enabling team needed for a period of time? 
- Are the promises between these two teams still valid and achievable? 
- What needs to change to make the promises more realistic?

Instead of trying to optimize for lowest cost in so-called “maintenance” work,
it is essential that organizations use signals from maintenance work as input
to software-development activities.

In the The DevOps Handbook, Gene Kim and colleagues define **The Three Ways of
DevOps** for modern, high-performing organizations:
1. **Systems thinking**: optimize for fast flow across the whole organization,
   not just in small parts 
2. **Feedback loops**: Development informed and guided by Operations 
3. **Culture of continual experimentation and learning**: sensing and feedback
   for every team interaction

![](/assets/img/team.topologies/8.9.teams.png) Figure 8.9: New-Service and “Business as Usual” (BAU) Teams 
- Having separate teams for “new stuff” and BAU tends to prevent learning,
  improvements and ability to self-steer. It is a non-cybernetic approach.

![](/assets/img/team.topologies/8.10.new.teams.png) Figure 8.10: Side-by-Side New Service and BAU Teams 
- A cybernetic approach to maintaining older systems has a single
  stream-aligned team (or pair of teams) developing and running the new service
  and the older systems, enabling the team to retro-fit newer telemetry to the
  older system and increase the fidelity of the sensing from both systems.

### Summary: Evolving Team Topologies

The rapid pace of change in technology, markets, customer and user demands, and
regulatory requirements means successful organizations need to expect to adapt
and evolve their organization structure on a regular basis.

Organizations that build and run software systems need to ensure that their
team interactions optimize for flow, Conway’s law, and a team-first approach
(including team cognitive load).

Teams understand how, when, and why they need to collaborate with other teams;

The combination of well-defined teams and well-defined interaction modes provides a powerful and flexible organizational capability for structural adaptation to changing external and internal conditions, enabling the organization to “sense” its environment, modify its activities, and focus to fit.

# RECOMMENDED READING

Key Management Concepts and Practices for Reliable, Fast Flow 
- *Accelerate: The Science of Lean Software and DevOps: Building and Scaling
  High Performing Technology Organizations* by Nicole Forsgren, PhD, Jez
  Humble, and Gene Kim (Portland, Oregon: IT Revolution, 2018).
- *Designing Delivery: Rethinking IT in the Digital Service Economy* by Jeff
  Sussna (Beijing: O’Reilly Media, 2015). 
- *Fearless Change: Patterns for Introducing New Ideas* by Mary Lynn Manns and
  Linda Rising (Boston: Addison Wesley, 2004).

Key Practices and Approaches for Organizations, Software, and Systems Team 
- *Genius: The New Science of High-Performing Organizations* by Rich Karlgaard and Michael S. Malone (New York, NY: HarperBusiness, 2015). 
- *Agile Development in the Large: Diving into the Deep* by Jutta Eckstein (New York: Dorset House Publishing Co Inc.,US, 2004). 
- *Domain-Driven Design: Tackling Complexity in the Heart of Software* by Eric Evans (Boston: Addison-Wesley, 2003). 
- *Thinking in Promises* by Mark Burgess (Sebastopol, California: O’Reilly Media, 2015).

Key Engineering Practices that Enable Fast Flow Continuous Delivery: 
- *Reliable Software Releases through Build, Test, and Deployment Automation* by Jez Humble and David Farley (Upper Saddle River, NJ: Addison Wesley, 2010). 
- *Release It! Design and Deploy Production-Ready Software* by Michael T. Nygard (Raleigh, North Carolina: O’Reilly, 2018). 
- *Team Guide to Software Operability, Team Guide Series 1,* by Matthew Skelton and Rob Thatcher (Leeds, UK: Conflux Books, 2016). 
- *Team Guide to Software Testability, Team Guide Series 3,* by Ash Winter and Rob Meaney (Leeds, UK: Conflux Books, 2018). 
- *Team Guide to Software Releasability, Team Guide Series 4,* by Manuel Pais and Chris O’Dell (Leeds, UK: Conflux Books, 2018).

