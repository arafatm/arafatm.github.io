---
categories: SRE
tags: SRE Observability
author: Andy Smith
title: Observability In a Crime Scene | 8th Light
source: https://8thlight.com/insights/observability-in-a-crime-scene
---

Working in software can sometimes feel like working in a crime scene.

There are no murders, but quite often there’s plenty of dead code and criminal
practices. We often end up investigating problems like a detective, having a
theory and gradually eliminating suspects from the investigation until we find
the culprit.

On a recent project, I was faced with a defect of mysterious origins that
required a detective’s eye to piece together.

Working as a [Site Reliability
Engineer](https://8thlight.com/insights/what-does-an-sre-do) (SRE) requires
detective skills, and this scenario was like an episode of
[Columbo](https://www.youtube.com/watch?v=biW9BbWJtQU). In that [TV
show](https://en.wikipedia.org/wiki/Columbo), we see the killer in the act
right at the start of the episode, and Columbo spends the entire time pestering
the killer until he gathers enough evidence to arrest them — using his trusty
tools of a notebook, pen, and cigar.

Like Lieutenant Columbo, in this entire episode we had a suspect (or a
hypothesis), and we attempted to prove or disprove that hypothesis using our
trusty tools of Service Level Objectives (SLOs), Distributed Tracing, and
Metrics.  

## Exhibit A: Service Level Objectives

The system we were working on was a microservice architecture, and the
perception of how this system was performing was not great. “Not great” and
“perception” are not very scientific ways of knowing whether something is
reliable or not. Service Level Objectives _are_ a scientific way of knowing if
something is reliable or not, and fortunately we had some implemented. The SLO
in question was of the form:

-   “99% of all requests should return in 5 seconds or less”

This meant our error budget allowed for 1 percent of all requests to take
longer than 5 seconds or not return at all.

The tool we were using to visualise SLOs ([Nobl9](https://www.nobl9.com/))
provides a nice graph that shows when we are using our error budget. As part of
a daily ritual, the team looked at these graphs and could see that over time
the latency was getting longer, breaching the SLO that we’d agreed on with the
development team.

An example of an SLO graph is shown below (this is not the actual graph used in
the investigation. It’s been redacted to protect its identity).  

![Observability
1](https://assets.8thlight.com/images/_840xAUTO_crop_center-center_none/observability-1.png)

The example above shows the latencies, and the pink line denotes 5 seconds.
Anything above that pink line starts to eat into your error budget.

As a reminder, the rule or guideline for error budgets is:

```
If there’s error budget left then
  Release new features
else 
  Focus on reliability
```

In our case, this meant the team should be focusing on reliability.

## Exhibit B: Distributed Tracing for Observability

> “Traces help you understand system interdependencies. Those interdependencies
> can obscure problems and make them particularly difficult to debug unless the
> relationship between them are clearly understood.”— Observability Engineering
> by Charity Majors, Liz Fong-Jones, and George Miranda

As the system comprised many microservices, tracking down the problem would
have been quite difficult if we had to trawl through multiple log files, which
is a laborious process in the best of times. Tracing is one of the tools
described in [Observability
Engineering](https://www.oreilly.com/library/view/observability-engineering/9781492076438/),
and fortunately distributed tracing was implemented across the system —
providing us with
[observability](https://8thlight.com/insights/podcast-into-the-unknown-unknowns-observability-with-charity-majors)
into the interdependencies, and clues leading closer to the culprit. Traces
were sent to our observability tool of choice,
[Lightstep](https://lightstep.com/) (shown below).

![Observability
2](https://assets.8thlight.com/images/_840xAUTO_crop_center-center_none/observability-2.png)

The graph above shows response times of requests to the service that the SLO
highlighted as being an issue. The advantage of the tool is that it allows us
to click on a data point on that graph and get a trace of all the calls behind
this request. We clicked on a point with a large latency (one of the large
spikes in the graph), and this displayed the call stack between all the
microservices and the time spent in each one. In this case we could see that on
a particular span, it was taking around 60 seconds on the client side, but on
the other end of the HTTP request it was only taking a few milliseconds. An
example distributed trace is shown below (the real one has been redacted to
protect its identity):  

![Observability
3](https://assets.8thlight.com/images/_840xAUTO_crop_center-center_none/observability-3.png)

Side note: Also of particular interest in the trace was at the top, which was
the front-end component. This was timing-out at 15 seconds, but in all the
services below, the timeout was much greater. Interesting and definitely an
issue, and wouldn’t be helping stability in this case. As Sam Newman says in
Building Microservices: “Timeouts are .. easy to overlook, but in a downstream
system they are important to get right.”

My team was developing a hypothesis that it was trying to acquire a HTTP
connection, and for some reason this was taking some time. Opening sockets are
relatively expensive operations, so quite often connection pools are used to
hold a number of already created socket connections that can be leased out to a
client wanting to make a request. This is to help with performance. Our theory
was that there were maybe not enough connections in the pool to make the
request — but of course we needed evidence. We needed to see if the pool had no
free connections.

## Exhibit C: Metrics

We added [Prometheus
metrics](https://prometheus.io/docs/concepts/metric_types/) to monitor the
connection pool, such as “number of free connections,” “max number of
connections,” and “number of pending connections;” and then we deployed to
production to gather evidence to prove or disprove our theory.

After a day of it being deployed to production, we graphed our metrics over 24
hours and compared it to our Lightstep graph. Bingo! We found our smoking gun
(we could see a correlation).  

![Observability
4](https://assets.8thlight.com/images/_840xAUTO_crop_center-center_none/observability-4.png)

In Exhibit B we can see latency spikes at exactly the same time as the spikes
in Exhibit C (the graph of pending connections). There were no free connections
in the pool to make the requests, and instead the requests would wait until a
connection was free. Now that we had our evidence, we could make a simple fix,
which was to increase the size of the connection pool.

We made our change, deployed the fix, and again monitored our graphs. Hurrah,
the latency is gone. Columbo _always_ catches the killer!

## Summary

SLOs are the first line of defense in knowing when reliability is getting
worse. In our case it showed large latencies that gave us more information to
investigate further.

Distributed tracing is cool. It allowed us to track down the exact function in
Lightstep that was causing the latency in minutes with laser sharp focus. It
also gave a clue as to what the issue may have been.

Even in the days of increased web performance with HTTP/2, connection pools are
still vitally important. You still need them! Don’t go with default settings
for them, as they’re more than likely wrong for your scenario. Make sure you
set the number of connections to a sensible number. Use load testing if
necessary to work out what this figure should be.

Timeouts are important. Again, do not go with the defaults. If the frontend
times out after 15 seconds, does it make sense for downstream components to
timeout in 60 seconds? Do your research, talk to owners of other components.  

### **Just One More Thing ...**

Fixing microservice architectures can be like a game of Whac-A-Mole. Fix one
issue and another one pops up. But like the great Columbo, in every episode
after the next, with enough persistent pestering, the Site Reliability Engineer
will always catch the next criminal (code).
