---
categories: mba
source: https://www.philvenables.com/post/you-only-get-3-metrics-which-ones-would-you-pick
author: Phil Venables
title: You Only Get 3 Metrics, Which Ones Would You Pick?
---

Just over a year ago I put out [this blog
post](https://www.philvenables.com/post/10-fundamental-but-really-hard-security-metrics)
on the 10 fundamental (but really hard) security metrics. Since then I’ve
discussed this with a lot of people and have been thinking more about this in
the context of how Boards can oversee risk. For Boards, in particular, it’s
clear that they need to drive behaviors by tracking leading indicators as
opposed to reacting negatively when current lagging indicators don’t meet their
expectations.

Despite 10 metrics not seeming a lot I’m becoming increasingly convinced that
10 metrics might be too much for such purposes. So, I thought I’d try a thought
experiment: if you could only have 3 metrics what would they be?

I know this isn’t realistic. You’ll need more metrics at an operational level,
but bear with me as we think about this at a more strategic level.

First, if we’re going to do this then the selection criteria for metrics of
this sort needs to be very strict. Specifically:
- **Measurable**. They need to be strictly quantifiable. No hand-waving, no
  traffic light ratings, no arbitrary placement on 2x2 grids. Just brutal
  measurement.
- **Non-monetary**. They are purely objective statements of fact without any
  opinion of financial risk. Yes, I know this goes against the grain that we
  need to understand the business impact of a risk and then be able to assess
  if the cost of mitigating that impact makes sense. The problem is such an
  exercise typically contains too much subjectivity. Besides, subsequently, you
  can take the metric and use it to feed such financial analysis.
- **Commercial**. Improving upon the metric also creates adjacent benefits
  beyond the risk mitigation itself.
- **Purposeful.** Measurement causes work. Good work. The practice and act of
  measuring takes work which mitigates risk in and of itself. Put another way,
  establishing the apparatus of measurement reduces risk even if there are no
  explicit actions then taken to improve the wider situation. There’s an almost
  “Heisenberg” quality to this, that is, the act of measuring changes the
  situation because the apparatus of measurement inevitably “cleans” up some
  extraneous or troublesome parts of the environment. Also, when someone is
  compelled to measure they are likely to be initially worried (or horrified)
  by those results and then do some self-correction before you even stipulate
  an outcome.
- **Fractal**. The measurement can be applied at multiple levels of the
  organization, be dependency free, and be self-contained at that level i.e.
  any dependencies can always be intrinsically brought into the measurement.
- **Standardized**. It can be broadly standardized in terms of what is
  measured, what those measurements mean and how the scope of measurement can
  be bounded consistently so that reasonable comparisons between different
  organizations are possible.
- **Blameless**. The objective measurement implies no judgment. It’s just data.
  In other words there is no implied “high” or “low”, it just is. The use of
  the metric in a specific context then compels concern (or not). It’s like
  spare cash in a business. Having a lot or a little might be a good or bad
  signal depending on the situation.
- **Linear**. A change in the measured value (positive or negative) is
  consistent with positive or negative improvement in the measured situation.
- **Leading**. A preference for leading not lagging indicators.
- **Pareto (80/20)**. They, roughly, form a subset (e.g. 20%) of the possible
  metrics that represent a superset (e.g. 80%) of the beneficial outcomes.
 
Taking this last point, let’s call the class of metrics that conform to these
criteria: **_Pareto Metrics_** because they are a small number of essential
leading indicators that drive a disproportionate amount of the right behaviors
and outcomes across a possibly large and complex enterprise.

So, now the 3 that, in this way, maximize the coverage of other risks. I’ve
pruned the 10 metrics from the original post quite aggressively. For example,
you don’t need to specifically measure and drive the Infrastructure
Reproducibility metric of the original post because you can simply track
improvements in your Cold Start Recovery Time (what I originally called Time to
Reboot your company) - to have effective cold start recovery you, by
definition, need infrastructure reproducibility and many other things.

## 1. High Assurance Software Reproducibility

> What percentage of your software is continuously reproducible in a secure
> build pipeline?

What percentage of your entire software is reproducible through a CI/CD
pipeline (or equivalent). From this comes so much in terms of security,
reliability, resilience and recovery as well as business agility. Patching and
vulnerability measurement outcomes can stem from this. If this percentage is
low then inevitably the time to resolve vulnerabilities or completeness of
resolution will not be what you want. In my experience there are a small number
of tech companies or digital natives that are 80%+ (if not near 100%), other
types of organizations would be doing well to hit 50%, but sadly a lot are in
the 10-20% range. Additionally, the definition of reproducibility includes the
notion of high assurance which would expect SBOMs to be produced as required
and to enforce a minimum [SLSA](https://slsa.dev/) level across each business
service. This requires a software dependency map tied to a business service or
mission inventory. In turn, this means you are only as good as the weakest link
in that dependency chain.

So, your denominator is going to be the full scope of your software base (yes,
you have to know that before computing this metric and, again, this is the
point, the act of getting to that is a risk reducing activity in itself) and
the numerator will be what amount of that software is reproducible with high
assurance which could be defined as:
- **Described**. Has an SBOM with defined and maintained ownership.
- **Assured**. Is at SLSA level 3 (perhaps less depending on your risk profile
  and appetite).
- **Tested**. Has test coverage for security (including fuzzing), controls and
  reliability.
- **Maintained**. Active bug / vulnerability management within an SLO
  framework.
- **Insider threat controlled**. There is separation of duties (independent review) over code changes.

I’m skipping over the hard step of deciding what unit of measurement you need
to take e.g. package, library, interface, overall application, maybe even a
higher level abstraction like business service. To the fractal point, though,
it might be all of these. There’s also a lot of scope to determine what would
qualify as sufficient test coverage.

Getting to this is going to be tough. Very tough. It might be that your
organization only needs to be near 100% for certain business services. You
might even not set a goal, and just use the measurement overlaid with your
business service (or mission) criticality to see if you don’t like the risk
discrepancies. Again, whether or not you set and achieve a goal of 25%, 50%,
75% or 100% might not matter too much in the short term because the very act of
measuring this is going to bring much needed clarity, some risk reduction and
will likely catalyze a lot of self-correction.

## 2 Cold-Start Recovery Time

> What percentage of your systems and business services have a predictable and
> tested cold-start recovery time?

Imagine everything you have is wiped by a destructive attack or other cause.
All you have is bare metal in your own data centers or empty cloud instances
and a bunch of immutable back-ups. Then ask, how long does it take to
rehydrate/rebuild your environment? In other words, how long does it take to
reboot the company?

A less dramatic way to say this, which can translate down to specific business
services is how long does it take to cold-start those services from an outage
of any form - including the necessary dependencies.

This might need decomposition of the enterprise into units of recovery that can
be shown to be capable of their own timely indivisible cold-start. Then develop
an understanding of the dependency graph between all recovery units so a whole
business service and ultimately the entire business can be cold-started.
Clearly, in looking at this dependency graph it will be important to ensure it
is acyclic i.e. recovery units are not mutually dependent for their recovery
(directly or transitively). For example, if your DNS cold-start is dependent
on, say, a Kerberos cold-start but your Kerberos cold-start is dependent on DNS
then you have a problem.

Remember, there is a subtle difference here between conventional backup/restore
processes vs. rebuild/reboot. There are a lot of companies that I’ve seen
struggle with timely recovery from, say, ransomware events despite having
otherwise good backups. This is because the backups were insufficient for a
rebuild/reboot vs. a conventional server failure, site disaster, or file
deletion driven restore need. e.g. missing catalogs, missing software, missing
configuration.

From what I’ve seen there are very few organizations that can completely answer
this question at extreme breadth, depth and accuracy. It is unusual for many
organizations to be able to even partially answer this. However, I’ve seen some
positive outcomes in a number of organizations for certain things like
desktops, core critical systems, and some key business systems that have gone
from unknown to known measurement. They have then invested to bring this
cold-start time down from weeks, to days, to hours. One organization I knew
went from global desktop recovery status of unknown to then be able to take
80,000+ virtual and physical desktops from bare metal to full function in a few
hours. Others I’ve seen can fully rehydrate their “core” (DNS, network,
authentication, directory, time, and other services) in a few hours - having
done some prior work to make the dependency graph acyclic.

As with the other Pareto Metrics, this is hard. Very hard. But the effort of
doing this is likely very beneficial even if it’s just to remove the cyclic
dependencies that would cause you major pain in an event. It also means you
will likely discover low hanging fruit in improving your existing back-up
processes.

Also, the great thing about this metric is it is feasible to put costs to each
reduction in risk and it’s usually quite clear what the diminishing returns
are. For example, to go from 1 month to 1 week might be $X, 1 week to one day
might be $10X but 1 day to 1 minute might be $1000X. For Boards or executive
leadership to initially naively demand instant recovery this gives them a more
palatable and balanced range of options. Again, many organizations I have seen
that use a variant of this measure have actually seen management think $10M a
bargain to go from 1 week+ to sub 1 day for core functions. Many also use cloud
and IT modernization approaches as a means of doing this and, of course, this
becomes easier if you can become really good at software and infrastructure
reproducibility.

To get to suitable cold-start approaches and times it’s highly unlikely you
will be able to do this for all your systems and so this will cause you to
address your legacy systems that might not be able to get where they need to
be. Although, I’m not a fan of the term legacy system. Some legacy systems are
a true “legacy” of the company and might even be well maintained, reliable,
secure and supported despite being of an older technology generation. The real
issue, which is what I think we mean when we casually throw around the phrase
legacy systems are systems that are stagnant. That is, systems that are not
maintained or kept up to date. As with many of the metrics it might be ok there
are stagnant systems under various risk conditions, but having full
transparency into that is crucial.

In turn, all of this might require a different approach to budgeting. A big
root cause of many of the issues that make some of these fundamental metrics
hard to measure or drive good outcomes from is insufficient budget or
resources. This reduces the ability of a team to undertake activities like
maintenance, technical debt pay down, or other work that would in other realms
be considered preventative maintenance. There’s likely no correct level for
this but it’s reasonable for there to be an assigned budget amount, expressed
as a percentage of the wider operating budget, that can go up or down each
budget cycle. It’s reasonable for management or the Board to dictate that this
percentage increases according to prior failures (a signal that more
maintenance is needed) or it can decrease because of the positive effect of
maintenance once that has been fully demonstrated (to avoid premature cutting).
The key point here is to make that budget eat into or free up the operating
capital or expenditure of that business / department so there are aligned
incentives.

## 3 Data Governance Coverage

> What percentage of your data is kept under an assured data governance regime?

It’s tempting to propose an identity and access management metric and you could
certainly construct one or more quite substantial Pareto Metrics that would be
of immense use. However, in the current era it is important to not just control
access to data and the services that use them but to also understand the
lineage and integrity of data used to make business decisions. This is
especially important when such data is part of the foundational data sets used
to train, enhance or verify the operation of varying types of AI models.

So this metric requires you to understand where all your data is, internally
and externally, and to then determine what percentage is managed within an
assured data governance regime. Specifically:
- **Description**. The data set is described in terms of its source, means of
  collection, intended use, and other required legislative or regulatory
  parameters including retention, use and jurisdictional controls.
- **Access**. Who and what (human and non-human identities) are allowed to do
  what to the data and whether modification under a defined access control
  policy uses role and attribute based access controls rules supporting
  multi-party control to reduce risk from insider threats.
- **Business Services**. What business services (including applications and
  APIs) make use of this data and how is their access configured.
- **Model Control**. Is this data used to feed specific models and whether this
  data is produced by models? In both cases the model is subject to independent
  validation and testing.
- **Lineage**. Whether the lineage of the data is protected and reproducible.
- **Annotated**. Does the data carry tags describing its attributes (e.g. is it
  PII, PHI, etc.) and is the use of the data (by business services,
  applications and APIs) respectful of those tags.
- **Reconciliation and triangulation**. Is the data set subject to
  reconciliation with other referenced data sets so distributed integrity is
  assured.

Again, while the measurement of this is hard, the really hard part would be to
achieve 100% conformance. But, the reality is, as with the other metrics, there
is no implication that 100% is the goal. Rather, it is a risk management
decision as to what data (and services that consume that data) should be in
conformance.

**Bottom line:** we need to shift more of our metrics to be leading indicators,
not just lagging indicators. Just as importantly, we also need to shift them to
what we might call Pareto Metrics, those that include a range of criteria
including incidental benefits even just in the act of measuring. I’ve proposed
3 that if you were able to measure and bring to some acceptable level you would
be able to reliably and securely build all your software, reconstruct systems
quickly in the face of disruption and understand where all your data is, its
purpose, integrity, lineage and accessibility. If you had this then a huge part
of your information risks are under control. You might argue for others, but if
you do then check they align to the 10 criteria I’ve listed above.