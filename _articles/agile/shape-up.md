---
category: agile
tags: basecamp
source: https://basecamp.com/shapeup
author: Ryan Singer - Basecamp
title: Shape Up
---

Table of Contents
  - [Introduction](#Introduction)
- [Part 1: Shaping](#Part-1-Shaping)
  - [Principles of Shaping-](#Principles-of-Shaping)
  - [Set Boundaries](#Set-Boundaries)
  - [Find the Elements](#Find-the-Elements)
  - [Risks and Rabbit Holes](#Risks-and-Rabbit-Holes)
  - [Write the Pitch](#Write-the-Pitch)
- [Part 2: Betting](#Part-2-Betting)
  - [Bets, Not Backlogs](#Bets,-Not-Backlogs)
  - [Bet Six Weeks](#Bet-Six-Weeks)
- [xxx Part 3: Building](#xxx-Part-3-Building)
  - [xxx Hand Over Responsibility](#xxx-Hand-Over-Responsibility)
  - [xxx Get One Piece Done](#xxx-Get-One-Piece-Done)
  - [xxx Map the Scopes](#xxx-Map-the-Scopes)
  - [xxx Show Progress](#xxx-Show-Progress)
  - [xxx Decide When to Stop](#xxx-Decide-When-to-Stop)
  - [xxx Move On](#xxx-Move-On)
  - [xxx Conclusion](#xxx-Conclusion)

## Introduction[](#introduction)

### Growing pains[](#growing-pains)

As software teams start to grow, some common struggles appear:
- Team members feel like projects go on and on, with no end in sight.
- Product managers can’t find time to think strategically about the product.
- Founders ask themselves: “Why can’t we get features out the door like we used
  to in the early days?”

### Six-week cycles[](#six-week-cycles)

Six weeks is 
- long enough to build something meaningful start-to-finish 
- short enough that everyone can feel the deadline looming from the start

Our decisions are based on moving the product forward in the next six weeks,
not micromanaging time. 
- We don’t count hours or question how individual days are spent. 
- We don’t have daily meetings. 
- We don’t rethink our roadmap every two weeks. 

We commit the six weeks and leave the team alone to get it done.

### Shaping the work[](#shaping-the-work)

We **shape the work** before giving it to a team. 

A small senior group works in parallel to the cycle teams defining the key
elements of a solution before we consider a project ready to bet on. 

When shaping, we focus less on estimates and more on our **appetite.** 

Instead of asking how much time it will _take_ to do some work, we ask: **How
much time do we want to spend**? 

### Making teams responsible[](#making-teams-responsible)

Third, we **give full responsibility** to a small integrated team of designers
and programmers. 
- They define their own tasks, 
- make adjustments to the scope,
- work together to **build vertical slices** of the product one at a time. 

### Targeting risk[](#targeting-risk)

At every step of the process we target a specific risk: the risk of not
shipping on time. 

This book isn’t about the risk of building the wrong thing.
Other books can help you with that (we recommend [Competing Against
Luck](https://www.amazon.com/Competing-Against-Luck-Innovation-Customer/dp/0062435612)).

This book is about the risk of getting stuck.

We reduce risk in the shaping process by solving open questions _before_ we
commit the project to a time box. 

We reduce risk in the planning process by capping our bets to six weeks. If a
project runs over, by default it doesn’t get an extension. 

And lastly we reduce risk in the building process by integrating design and
programming early. 

### How this book is organized[](#how-this-book-is-organized)

Part One is all about **Shaping** - the pre-work we do on projects before we
consider them ready to schedule. 

Part Two is about **Betting** - how we choose among the pitched projects and
decide what to do six weeks at a time.

Part Three is about **Building** - the expectations we place on the teams and
the special practices they use to discover what to do. 

Lastly the Appendix gives you some help for when it’s time to make changes at
your company. 

---

# Part 1: Shaping

## Principles of Shaping[](#Principles-of-Shaping)

![A vertical axis marked Abstract at the top and Concrete at the bottom. In the
middle a zone is marked
Shaped.](https://basecamp.com/assets/books/shapeup/1.1/levels_of_abstraction-bf55d00941aad5a9c895d24dfefcde27572b8cf35d839155839af190f84ed815.jpg)

When we shape the work, we need to do it at the right level of abstraction: **not
too vague and not too concrete**. 

### Wireframes are too concrete[](#wireframes-are-too-concrete)

When design leaders go straight to wireframes or high-fidelity mockups, they
define too much detail too early. This leaves designers no room for creativity.

Over-specifying the design also leads to estimation errors. Counterintuitive as
it may seem, **the more specific the work is, the harder it can be to estimate**.

### Words are too abstract[](#words-are-too-abstract)

When a project is defined in a few words, nobody knows what it means.

Concerning estimation, under-specified projects naturally grow out of control
because there’s **no boundary to define what’s out of scope**.

### Case study: The Dot Grid Calendar[](#case-study-the-dot-grid-calendar)

Customers started asking us to “add a calendar” to Basecamp.

We had built calendars before and we knew how complex they are. It can easily
take six months or more to build a proper calendar.

With only six weeks to work with, we could only build about a tenth of what
people think of when they say “calendar.” The question became: which tenth?

We did some research (discussed in the next chapter) and narrowed down a use
case that we wanted to solve. 

The Dot Grid wasn’t a full-featured calendar. We were comfortable with all
these trade-offs because of our understanding of the use case.

This is the level of fidelity we used to define the solution:

[![A rough sketch showing two monthly calendars side by side. Some of the days
in the calendar have dots in them. Below the calendar grid, rough lines suggest
a list of
events.](https://basecamp.com/assets/books/shapeup/1.1/calendar_sketch-355ff96889735772138625e1d56acdbc8740186af109b5383cc5954939349cb4.png)](https://basecamp.com/assets/books/shapeup/1.1/calendar_sketch-355ff96889735772138625e1d56acdbc8740186af109b5383cc5954939349cb4.png) 

Note how rough the sketch is and how many details are left out. The designer
had a lot of room to interpret how this should look and feel.

At the end of the project, the finished work that the designers and programmers
created looked like this:

[![A screenshot of the final Dot Grid calendar as built in Basecamp. It has the
same structure as the rough sketch but it is fully designed down to every
detail.](https://basecamp.com/assets/books/shapeup/1.1/calendar_screenshot-f8bcf5d1a0cd1642043ed106ac8b58db460e86acad341bde1a848f20fe1683a3.png)](https://basecamp.com/assets/books/shapeup/1.1/calendar_screenshot-f8bcf5d1a0cd1642043ed106ac8b58db460e86acad341bde1a848f20fe1683a3.png) 

### Property 1: It’s rough[](#property-1-its-rough)

Everyone can tell by looking at it that it’s unfinished. 

### Property 2: It’s solved[](#property-2-its-solved)

Despite being rough and unfinished, shaped work has been thought through. 

### Property 3: It’s bounded[](#property-3-its-bounded)

Lastly, shaped work indicates what _not_ to do. It tells the team where to
stop. 

### Who shapes[](#who-shapes)

Shaping is creative and integrative. It requires combining interface ideas with
technical possibilities with business priorities. To do that you’ll need to
either **embody these skills as a generalist or collaborate** with one or two
other people.

Shaping is primarily design work. The shaped concept is an interaction design
viewed from the user’s perspective. 

You don’t need to be a programmer to shape, but you need to be technically
literate. You should be able to judge what’s possible, what’s easy and what’s
hard. 

It’s also strategic work. Setting the appetite and coming up with a solution
requires you to be critical about the problem. 

Shaping is a closed-door, creative process. 

### Two tracks[](#two-tracks)

You can’t really schedule shaping work because, by its very nature, **unshaped
work is risky and unknown**. 

For that reason we have two separate tracks: 
1. one for shaping
2. one for building. 

### Steps to shaping[](#steps-to-shaping)

1. **Set boundaries.** 
2. **Rough out the elements.** 
3. **Address risks and rabbit holes.** 
4. **Write the pitch**. 

## Set Boundaries[](#Set-Boundaries) 

![Cartoon. In the background, three people talk around a table. One says 'They
said they wanted categories.' The other says 'We should redesign the whole
section!' and the third says 'Yes!' In the foreground, a figure who is
listening looks distressed and thinks 'uh
oh.'](https://basecamp.com/assets/books/shapeup/1.2/intro_cartoon-849a30dad3a668738e5933a410abd2dd895dbab32c14bb5bdb1604652f74c1e4.jpg)

The first step of shaping is setting boundaries on what we’re trying to do. 

### Setting the appetite[](#setting-the-appetite)

Whether we’re chomping at the bit or reluctant to dive in, it helps to
explicitly define how much of our time and attention the subject deserves. 

**Appetite**: a time budget for a standard team size. 

We usually set the appetite in two sizes:
- **Small Batch**: This is a project that a team of one designer and one or two
  programmers can build in one or two weeks. We batch these together into a
  **six week** cycle.
- **Big Batch**: This project takes the same-size team a full six-weeks.

If we can’t shrink the scope, we’ll break off a meaningful part of the project
that we can shape to a six-week appetite.

### Fixed time, variable scope[](#fixed-time-variable-scope)

- Estimates start with a design and end with a number. 
- Appetites start with a number and end with a design. 

### “Good” is relative[](#good-is-relative)

**Without a time limit, there’s always a better version**. 

    The ultimate meal might be a ten course dinner. 
    But when you’re hungry and in a hurry, a hot dog is perfect.

### Responding to raw ideas[](#responding-to-raw-ideas)

Our default response to any idea that comes up should be: “_Interesting. Maybe
some day_.” 

Even if we’re excited about it, we shouldn’t make a commitment that we don’t
yet understand.

### Narrow down the problem[](#narrow-down-the-problem)

Flip from asking “What could we build?” to “**What’s really going wrong**?” 

### Case study: Defining “calendar”[](#case-study-defining-calendar)

Instead of asking her why she wants a calendar and what it should look like, we
asked her _when_ she wanted a calendar. What was she doing when the thought
occurred to ask for it?

### Watch out for grab-bags[](#watch-out-for-grab-bags)

When it comes to unclear ideas, the worst offenders are “redesigns” or
“refactorings” that aren’t driven by a single problem or use case. 

When someone proposes something like “redesign the Files section,” that’s a
grab-bag, not a project. 

Here’s a more productive starting point: “We need to rethink the Files section
because sharing multiple files takes too many steps.”

A tell-tale sign of a grab-bag is the “2.0” label. 

### Boundaries in place[](#boundaries-in-place)

When we have all three things
- a raw idea, 
- an appetite, 
- and a narrow problem definition

then we’re ready to move to the next step and define the elements of a solution.

## Find the Elements[](#Find-the-Elements) 

![A cartoon. Two people are sketching on a whiteboard animatedly. One says
'a-ha!' while pointing to what they've drawn and the other, still sketching,
says 'Yes! And
then...'](https://basecamp.com/assets/books/shapeup/1.3/intro_cartoon-7cdeaa7e5e113e22cde722646b3931f1f687ffdeefa3c0e0d20c85ef3f11e700.png)

### Move at the right speed[](#move-at-the-right-speed)

First, we need to have **the right people, or nobody**, in the room. 

Second, we need to avoid the wrong level of detail in the drawings and
sketches. 

The questions we’re trying to answer are:
- Where in the current system does the new thing fit?
- How do you get to it?
- What are the key components or interactions?
- Where does it take you?

### Breadboarding[](#breadboarding)

![A drawing of an electronics breadboard and a finished electronics product.
The breadboard looks like a circuit board with a light bulb, dimmer and battery
connected by long wires. It has no industrial design. The product has the same
components but looks finished, with the bulb and dial artfully placed in an
enclosure.](https://basecamp.com/assets/books/shapeup/1.3/ee_breadboard-f576c579fcb3f3865a3004c9e9e53fd0c97fa14e65a7b81af3ec6fbfe7b31832.png)

There are three basic things we’ll draw:
1. Places: These are things you can navigate to, like screens
2. Affordances: These are things the user can act on
3. Connection lines: These show how the affordances take the user from place to
   place.

We’ll use words for everything instead of pictures. 

#### Example[](#example)

![A different breadboard. This time a Pay button on the Invoice leads to a Pay
Invoice place. Under that, there is an option to Autopay in the Future.
Submitting goes to a third place called Confirm, with affordances named: Print
Receipt, Thank You Message, and Confirm Autopay if
Chosen.](https://basecamp.com/assets/books/shapeup/1.3/invoice_breadboard_6-728e11c77b57f3c4ee56c00187a7c760562090f3733a4aec43cc05a2f95bb003.png)

![The Invoicer's Customer List has one affordance: Customer Detail. Customer
Detail points to Customer Page. Below that is an affordance to Disable
Autopay.](https://basecamp.com/assets/books/shapeup/1.3/invoice_breadboard_7-c7e70620d06da7e00aac001f486d3cb0623bf08be7a5d11089b0bb40d9705d82.png)

Writing out the flows confronts us with questions we didn’t originally think of
and stimulates design ideas without distracting us with unimportant visual
choices.

We’re getting more concrete while still leaving out a huge amount of detail.

### Fat marker sketches[](#fat-marker-sketches)

Sometimes the idea we have in mind is a visual one. Breadboarding would just
miss the point because the 2D arrangement of elements is the fundamental
problem. In that case, we still don’t want to waste time on wireframes or
unnecessary fidelity. Instead we use fat marker sketches.

A fat marker sketch is a sketch made with such broad strokes that adding detail
is difficult or impossible. 

Here’s an example. We found ourselves often creating fake to-dos in our
Basecamp to-do lists that acted as dividers. 

We had to work out what the implications of adding a divider were. 

![A sketch drawn roughly with a fat-tipped marker. Squiggly lines suggest a
to-do list with items. The first two items appear directly under the to-do list
name. The rest of the items are separated by dividers. The top items with no
divider above are labeled Loose and the divided ones below are labeled
Grouped.](https://basecamp.com/assets/books/shapeup/1.3/fat_marker_1-0584765a210e4d2c130096bbc8e862c363328afb9f227ecbc89421fe6a2544ef.png)

We could add items via some affordance within each group, including the “loose”
group on top.

![A sketch showing an Add button below each set of items: the loose items and
the items in each
group.](https://basecamp.com/assets/books/shapeup/1.3/fat_marker_2-570c445ea82290154b6a06b625ee31fbe780c62ff653ada1be939366bf39c103.png)

We were a little concerned the add buttons might break up the gestalt of the
list, and the groups might all separate too much from the lists on the page. 

![A sketch with no add buttons. Instead little handles appear to the left of
each to-do item. A popover menu appears to the left of one of the item and
points to it. Inside the menu is a button to Add an Item and some squiggly
lines suggesting other
actions.](https://basecamp.com/assets/books/shapeup/1.3/fat_marker_3-c2e60aa68225483109cc5ac60f069867b0b739c8c246f76816d10f49f783d58b.png)

This notation is much less constraining than breadboards, which has downsides.
We might sketch a sidebar and get attached to a layout element like that even
though it’s not a core element. 

### Elements are the output[](#elements-are-the-output)

In the case of the Autopay example, we ended up with some clear elements:
- A new “use this to Autopay?” checkbox on the existing “Pay an invoice” screen
- A “disable Autopay” option on the invoicer’s side

For the To-Do Groups project, the elements were:
- Loose to-dos above the first group belong directly to the parent
- Grouped to-dos appear below the loose to-dos
- We’d like to try an _add_ affordance within each section, but if that doesn’t
  work visually, we’re ok with relying on the action menu for inserting to-dos
  into position.

Similarly, when we sketched the simplified solution for rendering events on a
calendar grid, we used the fat marker approach.

![Fat marker sketch of the Dot Grid as described in the previous
chapter](https://basecamp.com/assets/books/shapeup/1.3/calendar_dot_grid-7d1e375f646a32517d5d8d7ad444e45a09a54ac8f27e0abb059d71bd68650e55.png)

This enabled us to work out the main elements of the solution:
- A 2-up monthly calendar grid
- Dots for events, no spanned pills
- Agenda-style list of events below that scrolls an event into view when you
  tap a dot

### Room for designers[](#room-for-designers)

By leaving details out, the breadboard and fat marker methods give room to
designers in subsequent phases of the project.

### Not deliverable yet[](#not-deliverable-yet)

It’s normal for the artifacts at this point - on the wall or in your notebook  - 
to be more or less indecipherable to anybody who wasn’t there with you.

The next step is to do some stress-testing and de-risking. 

### No conveyor belt[](#no-conveyor-belt)

Also keep in mind that, at this stage, we could walk away from the project. **We
haven’t bet on it**. 

## Risks and Rabbit Holes 

![Cartoon. A figure stands beside a whiteboard covered in rough sketches,
presenting an idea. An audience of two people sits on chairs in front of the
whiteboard, scratching their chins in consideration. One responds: 'Yes, but it
doesn't work exactly like
that...'](https://basecamp.com/assets/books/shapeup/1.4/intro_cartoon-e2d13cf3feb0ee1bd00b9977a2a91b39dc461252774ae6feac4bf7e04e76c825.png)

**Remember that we’re shaping work for a fixed time window**. 

Sometimes you run into problems that don’t just delay the project - they have
no apparent solution. 

Of course there will always be unknowns. That’s why we apply the many practices
in Part Three so that teams tackle the right problems in the right order,
leaving room for the unexpected. **But that doesn’t mean we shouldn’t look for
the pitfalls we _can_ find up front and eliminate them before betting** 

### Different categories of risk[](#different-categories-of-risk)

In terms of risk, well-shaped work looks like a thin-tailed probability
distribution. 

![Drawing of a thin tailed probability distribution. The Y axis is probability
and the X axis is Time to Ship in Weeks. The X axis extends from zero weeks to
18 weeks. There is a single spike at 6 weeks shaped like a normal distribution,
extending slightly to the left and right at the bottom of the curve. The left
edge only extends to five weeks and the right edge to seven
weeks.](https://basecamp.com/assets/books/shapeup/1.4/thin_tailed-a2d3f4ecb256e5766db72e80cde6815c6fa42058d90063c3f4edd423f752905f.jpg)

However, if there are any rabbit holes in the shaping, the project could take
_multiple times_ the original appetite to complete. 

![Drawing of a fat tailed probability distributation. The X and Y axes are the
same as before. This time the spike up at six weeks has a long slope down which
reaches all the way past the 18 week point on the X axis. The area above 18
weeks where the right tail still stretches is labled: Possible 3x
delay.](https://basecamp.com/assets/books/shapeup/1.4/fat_tailed-5fb8e1135bd81c8b8cee8bba29be34ec985a983698a65f9aaefdef79ab63b575.jpg)

We want to remove the unknowns and tricky problems from the project so that our
probability is as thin-tailed as possible. 

### Look for rabbit holes[](#look-for-rabbit-holes)

In this step, we slow down and look critically at what we came up with. Did we
miss anything? Are we making
technical assumptions that aren’t fair?

Then we should also question the viability of each part we think we solved. We
ask ourselves questions like:
- Does this require new technical work we’ve never done before?
- Are we making assumptions about how the parts fit together?
- Are we assuming a design solution exists that we couldn’t come up with
  ourselves?
- Is there a hard decision we should settle in advance so it doesn’t trip up
  the team?

### Case study: Patching a hole[](#case-study-patching-a-hole)

For example, when we defined the To-Do Groups project, we introduced the idea
of dividers in the to-do list:

![The fat marker sketch of the to-do group concept from the previous chapter,
with loose to-dos at the top of the list and grouped to-dos at the
bottom.](https://basecamp.com/assets/books/shapeup/1.3/fat_marker_1-0584765a210e4d2c130096bbc8e862c363328afb9f227ecbc89421fe6a2544ef.png)

We liked the idea of the dividers, and the logic of loose versus grouped to-dos
made sense to us. But when we looked closer we realized that we didn’t address
how to display completed items. 

![A sketch showing how to handle completed items. The grouped items in the
to-do list are only outstanding items. All the completed items are gathered at
the bottom of the list. To the right of each completed item is a graph name in
parenthesis.](https://basecamp.com/assets/books/shapeup/1.4/completed_items-0140398be104a5ec897f74c0030812c13f7006cdb6b377b8ab5e3bebdbcece98.png)

This is the kind of trade-off that’s difficult to make when you’re working
inside the cycle under pressure. There are lots of reasons why a different
design or a deeper reconsideration of completed to-dos would be objectively
better. 

### Declare out of bounds[](#declare-out-of-bounds)

Since everyone on the team wants to do their best work, they will of course
look for all the use cases to cover and consider them necessary. 

For example, we worked on an idea for notifying groups of people in Basecamp.
Rather than checking off five programmers one by one, you could just click
“Programmers” and they’d be selected for notification. As we looked at the
product, we saw tons of places where this kind of behavior might make sense. If
we let you choose a group when posting a message, why not when assigning a
to-do, or mentioning people in the chat room?

We decided for the purpose of the project that the core value was narrowing
down who to notify about a message. We explicitly marked off the other cases as
“out of bounds” for the project and focused on the win we wanted: a faster flow
for posting messages.

### Cut back[](#cut-back)

There may be parts of the solution we got excited about during the sketching
phase that aren’t really necessary. 

### Present to technical experts[](#present-to-technical-experts)

Up to this point shaping has been a closed-door activity. 

This is a good time to grab some technical experts and walk them through the
idea. 

Beware the simple question: “Is this possible?” In software, everything is
possible but nothing is free. 

Talk through the constraints of how this is a good solution given the appetite,
so they’re partners in keeping the project at the size you intend. 

And emphasize that you’re looking for risks that could blow up the project.

### De-risked and ready to write up[](#de-risked-and-ready-to-write-up)

At the end of this stage, we have 
- the elements of the solution, 
- patches for potential rabbit holes, 
- and fences around areas we’ve declared out of bounds.

That means we’re ready to make the transition from privately shaping and
getting feedback from an inner-circle to presenting the idea at the **betting
table**. 

## Write the Pitch 

![Cartoon. A person stands at a desk. To their right is a whiteboard with a
breadboard and fat marker sketch. At the table in front of them is an open
laptop and a tablet with a fat marker sketch drawn on it. The person holds a
stylus above the tablet while thinking: Are they going to get
it?](https://basecamp.com/assets/books/shapeup/1.5/intro_cartoon-21b07e1550340b500fe1728a0c2807a919213049bc1a6f9fab79dca4a96a1cff.png)

We’ve got the elements of a solution now, and we’ve de-risked our concept to
the point that we’re confident it’s a good option to give a team. 

Now we need to put the concept into a form that other people will be able to
understand, digest, and respond to.

The purpose of the pitch is to present a good potential bet. It’s basically a
presentation. 

There are five ingredients that we always want to include in a pitch:
1. **Problem** - The raw idea, a use case, or something we’ve seen that
   motivates us to work on this
2. **Appetite** - How much time we want to spend and how that constrains the
   solution
3. **Solution** - The core elements we came up with, presented in a form
   that’s easy for people to immediately understand
4. **Rabbit holes** - Details about the solution worth calling out to avoid
   problems
5. **No-gos** - Anything specifically excluded from the concept:
   functionality or use cases we intentionally aren’t covering to fit the
   appetite or make the problem tractable

### Ingredient 1. Problem[](#ingredient-1-problem)

It’s critical to always present both a problem and a solution together. 

Diving straight into “what to build” - the solution - is dangerous. You don’t
establish any basis for discussing whether this solution is good or bad without
a problem. 

The best problem definition consists of a single specific story that shows why
the status quo doesn’t work.

### Ingredient 2. Appetite[](#ingredient-2-appetite)

Not only do we want to solve this use case, we want to come up with a way to do
it in six weeks, not three months, or - in the case of a **small batch**
project - two weeks, not the whole six weeks.

### Ingredient 3. Solution[](#ingredient-3-solution)

A problem without a solution is unshaped work. 

If the solution isn’t there, someone should go back and do the shaping work on
the shaping track. 

### Help them see it[](#help-them-see-it)

We need more concreteness, but we don’t want to over-specify the design with
wireframes or high-fidelity mocks. 

#### Embedded sketches[](#embedded-sketches)

Suppose your breadboard from the shaping session looked like this:

![A breadboard for the payments form. Under Dashboard: Go to Form, Send Form
Link, and Change Form Settings. Go to Form points with an arrow to Simple
Payment Form. Under Simple Payment Form: Name, Email, Company, Payment For,
Payment Amount, CC Fields, Submit and FI Logo. Submit points to a Thank You
screen.](https://basecamp.com/assets/books/shapeup/1.5/payment_form_breadboard-277e13785f0ce02963ecd00ed13178b8fa6d1694097bd240188f2f1126a1683b.png)

People might have trouble visualizing where these new affordances go on the
Dashboard. We could sketch a new box on the Dashboard to make it clearer:

![A screenshot of the dashboard with some hand drawing on top. A box is hand
drawn at the top of the dashboard. Handwritten laters say: Payment form preview
and links go
here.](https://basecamp.com/assets/books/shapeup/1.5/affordances_go_here-89b096cb468a35323ba4f34264b334f9435d40526c01d1359b6c8717f12efd50.png)

But we’re still asking people to imagine too much. It’s worth the trade-off to
go one step down into fat-marker detail here.

![The same screenshot again. This time in the box on top some small drawings
are superimposed. They correspond to the elements in the breadboard. They are
drawn roughly, in the fat marker style. In the left side, text appears saying:
Send the link to customers. A squiggle below suggests a copyable URL. Below
that a link is hand-drawn with the text: Change your Form Settings. A vetical
line divides the box. To its right a rough sketch of a payment form appears
with the words Go to Your Form above
it.](https://basecamp.com/assets/books/shapeup/1.5/fat_marker_dashboard-8e3d19b9388470aea447a7d57d8aed50fe7c2a00952922a9b1d442a6ac38fec4.png)

#### Annotated fat marker sketches[](#annotated-fat-marker-sketches)

Sometimes ideas are inherently visual or a little too complicated to express in
a schematic breadboard. Fat marker sketches can be very effective in a pitch;
you just need to take more care to label them cleanly.

Redrawing the sketch on an iPad - still with a fat brush size - works well. You can
use different colors to separate the labels from the material parts of the
sketch.

![A fat marker sketch of the to-do groups concept, drawn a bit more neatly with
different colors. The fat marker sketch itself is orange. To its right, labels
hand drawn in purple point out the List Name, the Loose items and the
Groups.](https://basecamp.com/assets/books/shapeup/1.5/fat_marker_todo_groups-904d6525a3daf8496c7d61bf20b4f04afc7868ddcf4ad174e2deefaf3038f9ea.png)

Or you might add some call-outs to enable discussion of specific elements.

![Two fat marker sketches are annotated with hand drawn numbers one and two on
the left. The numbers are drawn neatly in white on black circles so they look
like
call-outs.](https://basecamp.com/assets/books/shapeup/1.5/annotated_fat_marker_sketch-674c176b4187fe19ff4d633282201928a983e3f9aa8e422c5952ce01e540c551.jpg)

### Ingredient 4. Rabbit holes[](#ingredient-4-rabbit-holes)

Sometimes addressing a rabbit hole just requires a few lines of text. 

### Ingredient 5. No Gos[](#ingredient-5-no-gos)

Lastly if there’s anything we’re _not_ doing in this concept, it’s good to
mention it here. 

### Examples[](#examples)

Here are two examples of real pitches.

This pitch for grouping to-dos together starts by showing a workaround people
are using in the current design. Then it sketches out all the main ideas for
how to enable optional to-do groupings.

 [![A scaled-down screenshot of a full pitch for the To-Dos feature. It looks
 like a document. The document starts with two screenshots demonstrating the
 workaround for grouping to-dos without the feature. Then five fat marker
 sketches follow that show the shaped idea. Paragraphs of explanatory text
 surround each sketch.
 ](https://basecamp.com/assets/books/shapeup/1.5/to-do_groups_pitch-ac9465339dfffb0b9cf634064b51b4d9336fe6d5c7410f7ed80abd1c1fbe5305.png)](https://basecamp.com/assets/books/shapeup/1.5/to-do_groups_pitch-ac9465339dfffb0b9cf634064b51b4d9336fe6d5c7410f7ed80abd1c1fbe5305.png) 

Two screenshots demonstrate the problem. Fat marker sketches describe the
solution. Rabbit holes motivated some of the sketches.

This pitch for changing how notifications work starts with two videos to
demonstrate the problem. The black boxes toward the end are a visualization of
user behavior data that supports a decision in the pitch.

 [![Another scaled-down screenshot of a pitch. This one has two videos embedded
 in the document at the start. After some paragraphs, a fat marker sketch
 appears, followed by a screenshot thats annotated with handwriting. Two black
 boxes contain what looks like some data visualization. A breadboard is at the
 end. All the images are interspersed with short paragraphs of
 text.](https://basecamp.com/assets/books/shapeup/1.5/group_notifications_pitch-ba3f748fe757356b59d0c63560bddf4744efb49b0e4dbd874a2f6cdb2faa1c7f.png)](https://basecamp.com/assets/books/shapeup/1.5/group_notifications_pitch-ba3f748fe757356b59d0c63560bddf4744efb49b0e4dbd874a2f6cdb2faa1c7f.png) 

Two videos show the problem. A fat marker sketch and a breadboard describe the
solution. The black boxes contain data visualizations that support trade-offs
in the solution.

### Ready to present[](#ready-to-present)

We prefer asynchronous communication by default and escalate to real-time only
when necessary. 

That means the first step for presenting a pitch is posting the write-up with
all the ingredients above somewhere that stakeholders can read it on their own
time. 
This keeps the **betting table**
short and productive. In ideal conditions everyone has time to read the pitches
in advance. And if that isn’t possible in some cases, the pitch is ready to
pull up for a quick live sell.

### How we do it in Basecamp[](#how-we-do-it-in-basecamp)

We post pitches as Messages in [Basecamp](https://basecamp.com/). We created a
Message Category called _Pitch_ so we can easily find them. Pitches are posted
to a Team called _Product Strategy_ that can be accessed by people on the
betting table.

[![A screenshot of a Message Board in a Basecamp team called Product Strategy.
Five Pitches appear in the
list.](https://basecamp.com/assets/books/shapeup/1.5/in_basecamp/message_board-a06e9431a81441c11011bd5ca2fcb1498b855124ebb7a0ad1e2ab68ddb0b66fd.png)](https://basecamp.com/assets/books/shapeup/1.5/in_basecamp/message_board-a06e9431a81441c11011bd5ca2fcb1498b855124ebb7a0ad1e2ab68ddb0b66fd.png) 

Pitches on the Message Board of the Product Strategy team in Basecamp

[![A screenshot of a Pitch posted as a Message in Basecamp. It is titled: Sort
Messages Setting (Revised). It looks like a document. The first part of the
pitch describes an example customer case. The second section is titled 'Looking
for a 1-weeker' and describes the
appetite.](https://basecamp.com/assets/books/shapeup/1.5/in_basecamp/sort_messages-45fcd7f0e22f160ca59e6900590f19968f54d9ae416865396062fd4b061df449.png)](https://basecamp.com/assets/books/shapeup/1.5/in_basecamp/sort_messages-45fcd7f0e22f160ca59e6900590f19968f54d9ae416865396062fd4b061df449.png) 

A pitch as a Message. Note the one-week **appetite**. This was a **Small Batch**
project.

When we need to include a **fat marker sketch** in a pitch, we’ll draw it on an
iPad (with [Notability](https://www.gingerlabs.com/)) and take a screenshot.
Basecamp’s text editor makes it easy to insert images and caption them so they
make sense in the flow of the pitch.

[![Screenshot of another Pitch in Basecamp. The part of the pitch that is
scrolled into view has a fat marker sketch embedded in the
middle.](https://basecamp.com/assets/books/shapeup/1.5/in_basecamp/sketches_in_message-44bbfe2f97a960cd88aa15b7e1fc11371d13c1af9ab1008a687ba83adca1df40.png)](https://basecamp.com/assets/books/shapeup/1.5/in_basecamp/sketches_in_message-44bbfe2f97a960cd88aa15b7e1fc11371d13c1af9ab1008a687ba83adca1df40.png) 

A sketch drawn on an iPad in the middle of a pitch

People comment on the pitch asynchronously. Not to say yes or no - that happens
at the betting table - but to poke holes or contribute missing information.

[![A screenshot of a pitch that is scrolled down to the bottom. A breadboard
appears at the end of the document. Below that, a comment thread begins. The
first comment is by David, the CTO, providing information about what the pitch
requires from a technical
standpoint.](https://basecamp.com/assets/books/shapeup/1.5/in_basecamp/sort_messages_comments-4b6ed91df6e5be6757d749f46b086deb5b916be3c59d4dcacb3061003155bdec.png)](https://basecamp.com/assets/books/shapeup/1.5/in_basecamp/sort_messages_comments-4b6ed91df6e5be6757d749f46b086deb5b916be3c59d4dcacb3061003155bdec.png) 

Our CTO responds with technical thoughts on the pitch.

---

# Part 2: Betting

## Bets, Not Backlogs 

![Cartoon. A person stands in front of a wall covered in countless sticky
notes. A thought bubble above the person says: This is ridiculous. We'll never
get all this
done.](https://basecamp.com/assets/books/shapeup/2.1/intro_cartoon-562591e3436e67b04d32287bdc7ff45bfcdb284bfec3ac9a42c14e04f8ab9025.png)

### No backlogs[](#no-backlogs)

Backlogs are a big weight we don’t need to carry. Dozens and eventually
hundreds of tasks pile up that we all know we’ll never have time for. 

The growing pile gives us a feeling like we’re always behind even though we’re not.

The time spent constantly reviewing, grooming and organizing old ideas prevents
everyone from moving forward on the timely projects that really matter right
now.

### A few potential bets[](#a-few-potential-bets)

So what do we do instead? Before each six-week cycle, we hold a **betting table**
where stakeholders decide what to do in the next cycle. At the betting table,
they look at pitches from the last six weeks - or any pitches that somebody
purposefully revived and lobbied for again.

If we decide to bet on a pitch, it goes into the next cycle to build. If we
don’t, we let it go. There’s nothing we need to track or hold on to.

What if the pitch was great, but the time just wasn’t right? Anyone who wants
to advocate for it again simply tracks it independently - their own way - and
then _lobbies for it six weeks later_.

### Decentralized lists[](#decentralized-lists)

We don’t have to choose between a burdensome backlog and not remembering
anything from the past. Everyone can still track pitches, bugs, requests, or
things they want to do independently without a central backlog.

- Support can keep a list of requests or issues that come up more often than
  others. 
- Product tracks ideas they hope to be able to shape in a future cycle.
- Programmers maintain a list of bugs they’d like to fix when they have some
  time. 

Regular but infrequent one-on-ones between departments help to cross-pollinate
ideas for what to do next. 

This approach spreads out the responsibility for prioritizing and tracking what
to do and makes it manageable. 

### Important ideas come back[](#important-ideas-come-back)

It’s easy to overvalue ideas. The truth is, ideas are cheap. They come up all
the time and accumulate into big piles.

Really important ideas will come back to you. 

When’s the last time you forgot a really great, inspiring idea? 

And if it’s not that interesting - maybe a bug that customers are running into
from time to time - it’ll come back to your attention when a customer complains
again or a new customer hits it. 

If you hear it once and never again, maybe it wasn’t really a problem. And if
you keep hearing about it, you’ll be motivated to shape a solution and pitch
betting time on it in the next cycle.

## Bet Six Weeks 

![Cartoon. Three people sit around a table. The person in the middle is
standing and presenting a document. The person on the left says: Won't that
take longer than six weeks? The one presenting points to the document and says:
Notif we focus on this one use case. The person on the right leans back and
observes the
discussion.](https://basecamp.com/assets/books/shapeup/2.2/intro_cartoon-cb716b39a86cb267e54549f739854b7c7b768da7316b8b0c495deba2805ccb10.png)

### Six-week cycles[](#six-week-cycles)

Committing time and people is difficult if we can’t easily determine who’s
available and for how long. 

When people are available at different times due to overlapping projects,
project planning turns into a frustrating game of Calendar Tetris. **Working in
cycles** drastically simplifes this problem. A cycle gives us a standard
project size both for shaping and scheduling.

Two weeks is too short to get anything meaningful done. 

**Six weeks** is long enough to finish something meaningful and still short
enough to see the end from the beginning.

### Cool-down[](#cool-down)

After each six-week cycle, we schedule two weeks for **cool-down**.  This is a
period with no scheduled work where we can breathe, meet as needed, and
consider what to do next.

During cool-down, programmers and designers on project teams are free to work
on whatever they want. 

### Team and project sizes[](#team-and-project-sizes)

In addition to standardizing the length of our cycles, we also roughly
standardize the types of projects and teams that we bet on.

Our project teams consist of either one designer and two programmers or one
designer and one programmer. 

They’re joined by a QA person who does integration testing later in the cycle.

These teams will either spend the entire cycle working on one project, or
they’ll work on multiple smaller projects during the cycle. 

We call the team that spends the cycle doing one project the **big batch** team
and the team working on a set of smaller projects the **small batch** team. 

Small batch projects usually run one or two weeks each.  It’s up to the small
batch team to figure out how to juggle the work so they all ship before the end
of the cycle.

Now that we have a **standard way to think about capacity**, we can talk about
how we decide what to schedule.

### The betting table[](#the-betting-table)

The **betting table** is a meeting held during cool-down where stakeholders
decide what to do in the next cycle. 

Our betting table at Basecamp consists of the CEO (who in our case is the last
word on product), CTO, a senior programmer, and a product strategist (myself).

C-level time is only available in small slices, so there’s an atmosphere of
“waste no time” and the call rarely goes longer than an hour or two. 

Everyone has had a chance to study the pitches on their own time beforehand. 

Ad-hoc one-on-one conversations in the weeks before usually establish some
context too. 

The output of the call is a cycle plan. 

This buy-in from the very top is essential to making the cycles turn properly.

The meeting is short, the options well-shaped, and the headcount low. 

### The meaning of a bet[](#the-meaning-of-a-bet)

We talk about “betting” instead of planning because it sets different
expectations.

First, bets have a payout. We’re not just filling a time box with tasks until
it’s full. 

Second, bets are commitments. If we bet six weeks, then we commit to giving the
team the entire six weeks to work exclusively on that thing with no
interruptions. 

Third, a smart bet has a cap on the downside. If we bet six weeks on something,
the most we can lose is six weeks. 

### Uninterrupted time[](#uninterrupted-time)

It’s not really a bet if we say we’re dedicating six weeks but then allow a
team to get pulled away to work on something else.

When people ask for “just a few hours” or “just one day,” don’t be fooled.
Momentum and progress are second-order things, like growth or acceleration. You
can’t describe them with one point. You need an uninterrupted curve of points.

When you pull someone away for one day to fix a bug or help a different team,
you don’t just lose a day. You lose the momentum they built up and the time it
will take to gain it back. Losing the wrong hour can kill a day. Losing a day
can kill a week.

What if something comes up during that six weeks? We still don’t interrupt the
team and break the commitment. 

If the cycle passes and that thing is still the most important thing to do, we
can bet on it for that cycle. 

### The circuit breaker[](#the-circuit-breaker)

We combine this uninterrupted time with a tough but extremely powerful policy.
Teams have to ship the work within the amount of time that we bet. _If they
don’t finish, by default the project doesn’t get an extension_.

First, it eliminates the risk of runaway projects. 

Second, if a project doesn’t finish in the six weeks, it means we did something
wrong in the shaping.  We can use the shaping track on the next six weeks to
come up with a new or better solution. 

Finally, the circuit breaker motivates teams to take more ownership over their
projects. 

### What about bugs?[](#what-about-bugs)

If the teams aren’t interrupted in the six week cycle, how do we handle bugs
that come up?

First we should step back and question our assumptions about bugs.

There is nothing special about bugs that makes them automatically more
important than everything else.  All software has bugs. 

The question is: how severe are they? If we’re in a real crisis - data is
being lost, the app is grinding to a halt, or a huge swath of customers are
seeing the wrong thing - then we’ll drop everything to fix it. But _crises are
rare_. 

That said, nobody likes bugs. We still want ways to deal with them. Three
strategies have worked for us.
1. **Use cool-down**. 
2. **Bring it to the betting table**. 
3. **Schedule a bug smash**. Once a year - usually around the holidays - we’ll
   dedicate a whole cycle to fixing bugs. 

### Keep the slate clean[](#keep-the-slate-clean)

The key to managing capacity is giving ourselves a clean slate with every
cycle. That means only betting one cycle at a time and never carrying scraps of
old work over. 

Even if we have some kind of road map in our heads at the time scale above
cycles, we keep it in our heads and in our side-channel discussions. 

What about projects that just can’t be done in one cycle? In that case we still
only bet six weeks at a time. 

We reduce our risk dramatically by shaping a specific six week target, with
something fully built and working at the end of that six weeks. If that goes as
expected, we’ll feel good about betting the next six weeks. 

### Common questions to ask[](#questions-to-ask)

#### Does the problem matter?[](#does-the-problem-matter)

Of course, any problem that affects customers matters. But we have to make
choices because there will always be more problems than time to solve them. 

So we weigh problems against each other. Is _this_ problem more important than
_that_ problem right now?

#### Is the appetite right?[](#is-the-appetite-right)

It’s good when we have a solution shaped to a reasonable time frame, like two
or six weeks. But we might still debate whether it’s worth the time. 

Suppose a stakeholder says they aren’t interested in spending six weeks on a
given pitch.  The negotiation could go a couple directions from there:
1. Maybe the problem wasn’t articulated well enough, and there’s knowledge that
   the shaper can add to the conversation right now to swing opinion. 
2. Sometimes saying “no” to the time commitment is really saying no to
   something else. 
3. The shaper might just let the idea go if interest is too low.
4. The shaper might go back to the drawing table and either work on a smaller
   version (for a shorter appetite) or do more research 

#### Is the solution attractive?[](#is-the-solution-attractive)

The problem may be important and the appetite fair, but there can be
differences about the solution.

If someone offers an immediate design solution, like “how about we move that
button to an action menu instead,” we might discuss it. But generally we’ll
avoid doing design work or discussing technical solutions for longer than a few
moments at the betting table. 

#### Is this the right time?[](#is-this-the-right-time)

The kind of project we want to do next can depend on which projects we’ve done
recently. 

The project’s great; it’s just not the right time.

#### Are the right people available?[](#are-the-right-people-available)

As part of the betting process we choose who specifically will play which role
on each team. Different projects require different expertise. 

The type of work each person has been doing is another factor. Someone who’s
done a long string of **small batch** projects might prefer to take on a **big
batch**, or vice versa.

And lastly there’s always a little Calendar Tetris with peoples’ availability.
Vacations or sabbaticals affect which projects we can schedule in the coming
cycle.

We’ve seen some other companies use a different model where instead of
assigning the projects to people, they let the team members choose which
projects they want to work on. Culturally, we are too meeting-averse for this
extra step. But we’ve heard it can work well for some teams because the project
teams have a little more buy-in.

### Make the announcement[](#make-the-announcement)

After the bets are made, one of us will write a message that tells everyone
which projects we’re betting on for the next cycle and who will be working on
them.

 [![A screenshot of a Message announcing a cycle in Basecamp. Jason, the
 author, introduces it with some remarks about the type of work in the cycle.
 Then headings below introduce each project in the cycle with a short paragraph
 of commentary
 each.](https://basecamp.com/assets/books/shapeup/2.2/kickoff_message-18083d3733d1f1b965ce2c128a48f3d6428ad3978d5864e26b1b1bc34ce3e1cf.png)](https://basecamp.com/assets/books/shapeup/2.2/kickoff_message-18083d3733d1f1b965ce2c128a48f3d6428ad3978d5864e26b1b1bc34ce3e1cf.png) 

---

# xxx Part 3: Building

## xxx Hand Over Responsibility 


![Cartoon. Three figures are seated at their desks, hunching over laptops as if
very focused. On the left, one holds a pencil in the air and gazes down at a
piece of paper beside the laptop. A thought bubble says: Hmm... Where to start.
On the right, another figure points to the laptop and leans forward, thinking:
OK... so that's how that
works.](https://basecamp.com/assets/books/shapeup/3.1/intro_cartoon-3a9ab2d1da6bb6653381f5ca7f32b221652035f40cf7b5fa748fffe2edf119f5.jpg)

We’ve made our bets and now it’s time to start the next cycle. How does the
team get started?

### xxx Assign projects, not tasks[](#assign-projects-not-tasks)

We _don’t_ start by assigning tasks to anyone. Nobody plays the role of the
“taskmaster” or the “architect” who splits the project up into pieces for other
people to execute.

Splitting the project into tasks up front is like putting the pitch through a
paper shredder. Everybody just gets disconnected pieces. We want the project to
stay “whole” through the entire process so we never lose sight of the bigger
picture.

Instead, we trust the team to take on the entire project and work within the
boundaries of the pitch. The team is going to define their own tasks and their
own approach to the work. They will have full autonomy and use their judgement
to execute the pitch as best as they can.

Teams love being given more freedom to implement an idea the way they think is
best. Talented people don’t like being treated like “code monkeys” or ticket
takers.

Projects also turn out better when the team is given responsibility to look
after the whole. Nobody can predict at the beginning of a project what exactly
will need to be done for all the pieces to come together properly. What works
on paper almost never works exactly as designed in practice. The designers and
programmers doing the real work are in the best position to make changes and
adjustments or spot missing pieces.

When teams are assigned individual tasks, each person can execute their little
piece without feeling responsible for judging how all the pieces fit together.
Planning up front makes you blind to the reality along the way.

Remember: we aren’t giving the teams absolute freedom to invent a solution from
scratch. We’ve done the shaping. We’ve set the boundaries. Now we are going to
trust the team to fill in the outline from the pitch with real design decisions
and implementation.

This is where our efforts to define the project at the right level of
abstraction - without too much detail - will pay off. With their talent and
knowledge of the particulars, the team is going to arrive at a better finished
product than we could have by trying to determine the final form in advance.

### xxx Done means deployed[](#done-means-deployed)

At the end of the cycle, the team will deploy their work. In the case of a
Small Batch team with a few small projects for the cycle, they’ll deploy each
one as they see fit as long as it happens before the end of the cycle.

This constraint keeps us true to our bets and respects the **circuit breaker**.
The project needs to be done within the time we budgeted; otherwise, our
appetite and budget don’t mean anything.

That also means any testing and QA needs to happen _within_ the cycle. The team
will accommodate that by scoping off the most essential aspects of the project,
finishing them early, and coordinating with QA. (More on that later.)

For most projects we aren’t strict about the timing of help documentation,
marketing updates, or announcements to customers and don’t expect those to
happen within the cycle. Those are thin-tailed from a risk perspective (they
never take 5x as long as we think they will) and are mostly handled by other
teams. We’ll often take care of those updates and publish an announcement about
the new feature during cool-down after the cycle.

### xxx Kick-off[](#kick-off)

We start the project by creating a new [Basecamp](https://basecamp.com/)
project and adding the team to it. Then the first thing we’ll do is post the
shaped concept to the Message Board. We’ll either post the original pitch or a
distilled version of it.

 [![Screenshot of a kick-off message in Basecamp. The message is titled 'Hill
 Charts Concept'. Some text starts explaining how the feature is going to
 relate to the existing to-do functionality. A fat marker sketch is below the
 text.](https://basecamp.com/assets/books/shapeup/3.1/in_basecamp/concept_message-6701d89c76753bc47de6e41a1daca7f59611bcaa7c209514e0e41ca0bdfad48f.png)](https://basecamp.com/assets/books/shapeup/3.1/in_basecamp/concept_message-6701d89c76753bc47de6e41a1daca7f59611bcaa7c209514e0e41ca0bdfad48f.png) 

The first thing on the [Basecamp](https://basecamp.com/) project is a message
with the shaped concept

Since our teams are remote, we use the chat room in the Basecamp project to
arrange a kick-off call.

 [![Screenshot of the Campfire chat room in Basecamp. The three people on the
 project discuss when to have the kick-off
 call.](https://basecamp.com/assets/books/shapeup/3.1/in_basecamp/kicking_off-8cde0422601d5e7043538aa19d54d77189061ed33e28ba2aa56ebe7fa9aa2984.png)](https://basecamp.com/assets/books/shapeup/3.1/in_basecamp/kicking_off-8cde0422601d5e7043538aa19d54d77189061ed33e28ba2aa56ebe7fa9aa2984.png) 

Arranging a call with the team to walk through the shaped work

The call gives the team a chance to ask any important questions that aren’t
clear from the write-up. Then, with a rough understanding of the project,
they’re ready to get started.

### xxx Getting oriented[](#getting-oriented)

Work in the first few days doesn’t look like “work.” No one is checking off
tasks. Nothing is getting deployed. There aren’t any deliverables to look at.
Often there isn’t even much communication between the team in the first few
days. There can be an odd kind of radio silence.

Why? Because each person has their head down trying to figure out how the
existing system works and which starting point is best. Everyone is busy
learning the lay of the land and getting oriented.

 [![The team in the Campfire chat room discusses the work. The designer says:
 We'll need to stub in the Hill Chart Editor. The programmer responds: I can
 add an empty controller for the editor. The programmer goes on to share some
 early thinking about how to model the
 attributes.](https://basecamp.com/assets/books/shapeup/3.1/in_basecamp/where_to_start-3f152d1d0df2ca09a6e8576cfe152b0d66b6e24e3eca2edf0cff89bfb29febd5.png)](https://basecamp.com/assets/books/shapeup/3.1/in_basecamp/where_to_start-3f152d1d0df2ca09a6e8576cfe152b0d66b6e24e3eca2edf0cff89bfb29febd5.png) 

The team figuring out where to start

It’s important for managers to respect this phase. Teams can’t just dive into a
code base and start building new functionality immediately. They have to
acquaint themselves with the relevant code, think through the pitch, and go
down some short dead ends to find a starting point. Interfering or asking them
for status too early hurts the project. It takes away time that the team needs
to find the best approach. The exploration needs to happen anyway. Asking for
visible progress will only push it underground. It’s better to empower the team
to explictly say “I’m still figuring out how to start” so they don’t have to
hide or disguise this legitimate work.

Generally speaking, if the silence doesn’t start to break after three days,
that’s a reasonable time to step in and see what’s going on.

### xxx Imagined vs discovered tasks[](#imagined-vs-discovered-tasks)

Since the team was given the project and not tasks, they need to come up with
the tasks themselves. Here we note an important difference between tasks we
_think_ we need to do at the start of a project and the tasks we _discover_ we
need to do in the course of doing real work.

The team naturally starts off with some imagined tasks - the ones they assume
they’re going to have to do just by thinking about the problem. Then, as they
get their hands dirty, they discover all kinds of other things that we didn’t
know in advance. These unexpected details make up the true bulk of the project
and sometimes present the hardest challenges.

Teams discover tasks by doing real work. For example, the designer adds a new
button on the desktop interface but then notices there’s no obvious place for
it on the mobile webview version. They record a new task: figure out how to
reveal the button on mobile. Or the first pass of the design has good visual
hierarchy, but then the designer realizes there needs to be more explanatory
copy in a place that disrupts the layout. Two new tasks: Change the layout to
accommodate explanatory copy; write the explanatory copy.

Often a task will appear in the process of doing something unrelated. Suppose a
programmer is working on a database migration. While looking at the model to
understand the associations, she might run into a method that needs to be
updated for a different part of the project later. She’s going to want to note
a task to update that method later.

**The way to really figure out what needs to be done is to start doing real
work.** That doesn’t mean the teams start by building just anything. They need
to pick something meaningful to build first. Something that is central to the
project while still small enough to be done end-to-end - with working UI and
working code - in a few days.

In the next chapters we’ll look at how the team chooses that target and works
together to get a fully integrated spike working.

## xxx Get One Piece Done 


![Cartoon. A figure stands next to another figure seated at a desk. The
standing figure with hands on hips asks: So, how's the project coming? The
seated figure looks nervously to a whiteboard covered in a mess of sticky notes
labeled: To-Do. A thought bubble says: Ugh, how do I
explain?](https://basecamp.com/assets/books/shapeup/3.2/intro_cartoon-2c91ce2d0578468d323214fbc95cf42d8ca17b0030895263b15ac829d3a0af1d.png)

As the team gets oriented, they start to discover and track the tasks they need
to do to build the project. It’s important at this early phase that they don’t
create a master plan of parts that should come together in the 11th hour. If
the team completes a lot of tasks but there’s no “one thing” to click on and
try out, it’s hard to feel progress. A team can do a lot of work but feel
insecure because they don’t have anything real to show for it yet. Lots of
things are done but nothing is _really_ done.

Instead they should aim to make something tangible and demoable early - in the
first week or so. That requires integrating vertically on one small piece of
the project instead of chipping away at the horizontal layers.

### xxx Integrate one slice[](#integrate-one-slice)

We can think of projects in two layers: front-end and back-end, design and
code. While technically speaking there are more layers than this, these two are
the primary integration challenge in most projects.

Suppose the project starts with a lot of design. The team could design a
variety of screens and even implement them as templates or views. But until
they’re wired to a backend, nothing does anything. The work remains
hypothetical and speculative.

![Illustration depicting the front-end and back-end as two discs lying flat.
The front-end disc floats above and parallel to the back-end disc. The
front-end disc is marked with dotted line boundaries and the regions inside the
boundaries have checkmarks, suggesting surface area that is completed. Nothing
is marked on the back-end disc below. At the right a label says: Nothing
works.](https://basecamp.com/assets/books/shapeup/3.2/front-end_only-91147b9b144a224f146ec3f184ac4aa2bc583490e3e6bc847947d123cae7ea3c.png)

Same with the backend. A lot of tasks could be checked off, but without any
UI - what can you do with it? How do you judge if the work on a specific piece of
business logic is really right without interacting with it?

![Another illustration of the front and back end discs. This time the back-end
disc also has surface area marked out as completed, but it doesn't line up the
completed areas on the front end disc above. The illustration again is labeled:
Nothing works.
](https://basecamp.com/assets/books/shapeup/3.2/back-end_only-e8b9580807d4b4b50a31627b20d37c1dcf90c55b1f0cc20d5ab88f25888b6bf6.png)

What we want instead is to pick off one slice of the project to integrate. Then
when that’s done, the team has something tangible that they’ve proven to work
(or not work and reconsider). Anyone can click through the interaction and see
if the feature does what it should and if what it does is what they want.

![Illustration showing the two discs lying directly on each other. One area is
marked on the front-end disc and dotted lines coming down indicate the exact
same area is also marked on the back end disc. This common area on both is
shaded and marked complete. At the right, a label says: Something
works!](https://basecamp.com/assets/books/shapeup/3.2/one_slice-4cbcdda1a5cdc1b2bdc9bf7bd023cc0c5af666c5857c6e7d32650d9229a81cf0.png)

### xxx Case study: Clients in projects[](#case-study-clients-in-projects)

We built a feature in Basecamp 3 that allowed service firms to invite clients
to their projects and share chosen documents, messages, or to-do lists with
them. The concept, defined in the pitch, had a variety of moving parts:

- Client Access: Before this feature, Basecamp’s access model was all or
  nothing. We needed a way to invite some people to see just some parts of a
  project. This had major back-end and caching implications.
- Client Management: We needed a way to add clients to projects and the ability
  to manage clients separately from team members.
- Visibility Toggle: Each piece of content in a project should have a toggle to
  expose it to clients or not.

The team had one designer and one programmer. After they got oriented and
familiar with how the existing code worked, the designer chose the visibility
toggle as the best place to integrate first. This was the most central piece of
UI in the project. It’s the one that would appear in demo videos and the
interaction customers would use most.

The designer didn’t make a pixel-perfect mockup. Instead, he experimented with
different affordances and placements in the app’s HTML templates. Should the
toggle be two radio buttons, a checkbox, or a custom button that changes state?

Meanwhile, the programmer wasn’t waiting around. He had enough guidance from
the pitch to start spiking the access model.

As soon as the designer felt confident in the basic direction of the UI, he
pinged the programmer and showed him the stubbed toggle. Stepping away from the
access problem for a bit, the programmer wired the toggle enough so that it
would appear on all the supported content types, change state when clicked, and
save its state in the database.

At this point, the toggle didn’t actually change the visibility of the content.
But it worked from the service firm’s point of view. The designer could click
it, feel it, and judge how well it worked with live data on a staging server.

There was still more design work to do on the toggle. But the programmer didn’t
need to be involved anymore. With the affordance wired up, the designer could
continue to experiment with copy, placement, color, mobile view rendering, and
more. Meanwhile, the programmer could get back to the access model or whatever
else was most important to tackle next.

About three days after the start of the project, the designer demoed the
working toggle to a manager. Their conversation led to a few more tweaks and
then they were able to call the toggle “done.” One important piece of the
project was designed, implemented, demoed, and settled. The team felt good
about showing tangible progress. And the team and management both felt
confidence in the project by seeing a working piece. By clicking through a core
interaction early, they were able to validate that what they hoped would make
sense in theory did indeed look right and make sense in practice.

This short example illustrates a few points about how the teams integrate over
short periods to finish one piece of the project at a time.

### xxx Programmers don’t need to wait[](#programmers-dont-need-to-wait)

Because the important moving parts were already defined in the shaping process,
programmers don’t need to sit idle waiting for design when the project starts.
There’s enough direction in the pitch for them to start working on back-end
problems from the start. They won’t be able to take a piece of functionality to
completion without knowing where it leads on the front-end, but there should be
enough information in the pitch to inform foundational modeling decisions.

### xxx Affordances before pixel-perfect
screens[](#affordances-before-pixel-perfect-screens)

Programmers don’t need a pixel-perfect design to start implementing. All they
need are endpoints: input elements, buttons, places where stored data should
appear. These affordances are the core of a user interface design.

Questions about font, color, spacing, and layout can be resolved after the raw
affordances are in place and hooked up in code. Copywriting, basic affordances,
and some wiring are all we need to try a live working version in the browser or
on the device. Then we can answer the fundamental questions early: Does it make
sense? Is it understandable? Does it do what we want?

That means the first interface a designer gives to a programmer can look very
basic, like the example below. It’s more like a breadboard than a visual design
or a polished mock-up.

![Screenshot of a web browser. Some form fields, labels, and headers present an
interface, but there is no navigation around them or visual styling. They float
on a white field and are themselves very
unstyled.](https://basecamp.com/assets/books/shapeup/3.2/affordances_first-da6f456fef0a4f777495bf1a99b8a66a76598919c1838e919bf1e707eac0019c.png)

This screenshot is from a registration app for multi-day courses. The designer
made it in HTML by hand. There’s barely any style - just enough visual
hierarchy to feel confident that the layout is usable and amenable to future
layers of styling.

While the design looks simple, a lot of decisions are reflected in it.

- The decision to ask for arrival time but not departure time came from
  detailed discussions about the business logic and pricing model.
- The specific options in the arrival time pulldown correspond to rules that
  had to be worked out about when to charge for meals and overnight stays.
- The designer’s first sketches used a calendar-style date picker for the
  arrival and departure days. But that led to UX problems. Some courses were
  long (multiple weeks) with different phases. There wasn’t room in a standard
  calendar-style date picker to label the phases on the day boxes. With a
  pulldown, she could use option groups to label groups of dates when needed.
  That way users wouldn’t need to reference a schedule elsewhere to be sure
  they were selecting the right dates.

Here’s another example. This is the first working piece of an app for capturing
data from customer interviews.

![Screenshot of the interview app. A large breadcrumb at the top shows the
project name (Basecamp) and the name of the interview subject (Jan). Below that
there are six boxes side-by-side labeled with different categories of data to
record from the interview: Setup, Pushes, Pulls, Habits, Anxities, and
Observations. Below each box there is a simple text link that says add/edit.
The interface is rough and
unstyled.](https://basecamp.com/assets/books/shapeup/3.2/treehouse_story-602f74d12c548ce957ce0746e3765f3e663a654d967c670d8cec1ec452e20d2e.png)

At this early stage the project name (Basecamp) and interview subject (Jan)
were hard-coded and most of the links didn’t go anywhere.

Look at how raw this design is. The actions are plain text links in the default
blue and purple browser colors. The boxes containing the data points are barely
styled with plain black borders. As rough as it is, this design tests some
important trade-offs. The designer chose to show as much data as possible above
the fold so it would be easy to review interviews. That didn’t leave enough
room within each section for UI to add, edit, or remove data points. That led
the designer to create separate screens for adding and editing data per
section.

![Screenshot of a dedicated screen for adding pulls to the box labeled 'pulls'
in the previous screenshot. The breadcrumb at the top indicate these are pulls
for Jan in the Basecamp interview project. Three pulls are listed, each as a
row of text beginning with the word 'So', for example 'So my staff will know
what to do', and ending with a link to edit it. Below the pulls, the last row
beings with the word 'So' followed by a text field and an 'Add' button. The
edit links and the Add button are
unstyled.](https://basecamp.com/assets/books/shapeup/3.2/treehouse_pulls-c0044de294f1af4a45224a55414e98e14e22b73531a700d44e398fb1bd4d5350.png)

This is the first design for adding and editing “pulls” - a type of data in
this interview technique. Again, look at how raw it is. There’s just enough
design here to quickly wire it up and test it. The team can click through this
to judge whether navigating to a separate screen to record data is acceptable
or not. If it works, they can layer on additional styling later. If it doesn’t
work, they didn’t waste a lot of time implementing a pixel-perfect design.

Beautiful alignment, colors, and typography don’t matter on the first pass.
Visual styling is important in the end product, not in the early stages. The
biggest uncertainties are about whether it will work, whether it will make
sense, and how hard it will be to implement. After the elements are wired up,
they can be rearranged, restyled, and repainted to improve the work that’s
already done. First make it work, then make it beautiful.

### xxx Program just enough for the next
step[](#program-just-enough-for-the-next-step)

The same is true for back-end work. It doesn’t have to be all or nothing.
Sometimes a designer just needs some scaffolding - a couple fields that save data
or some code to navigate from one stubbed screen to another. Other times she
needs to populate a variable in the template with a collection of real data so
she can iterate on different displays (rows, columns, media boxes, etc) to find
the best design.

The early back-end work can be strategically patchy. There might be a
controller to render templates but no model. Or a controller and bits of a
model with mock data but no support for creating or updating the data. Screens
that aren’t wired yet could at least be connected with routes for navigating
between them.

When it was time to test the first piece of the interview app, the team knew
there would be sensitive data from real interviews going into it. They needed
to protect it with some kind of authentication. Rather than building full
username and password support - or even integrating a third-party solution - they
just used plain HTTPAuth to hard-code a password.

![Screenshot of the interview app protected with HTTPAuth. The site is greyed
out and the browser's default username and password dialog for HTTP
Authentication appears on top of
it.](https://basecamp.com/assets/books/shapeup/3.2/treehouse_auth-026f20666d1ff20c9c937b8c3a6b4b4214e56d4a2a3479f3c7c8a932d4a269b3.png)

This allowed the team to try adding data from real interviews very early in the
cycle, without slowing down to hook up some authentication code that wasn’t
going to teach them anything about the problems they were trying to solve.

The point is to create a back-and-forth between design and programming on the
same piece of the product. Instead of one big hand-off, take turns layering in
affordances, code, and visual styling. Step by step, click through the real
working feature-in-progress to judge how it’s coming and what to do next.

### xxx Start in the middle[](#start-in-the-middle)

In the examples above, the team didn’t build log in first. They didn’t build a
way to create an interview project and an interview subject before solving the
problem of adding interview data. They jumped straight into the middle where
the interesting problem was and stubbed everything else to get there.

To expand on this, here are three criteria to think about when choosing what to
build first:

First, it should be **core**. The visibility toggle was core to the Clients in
Projects concept. Without it, the other work wouldn’t mean anything. Contrast
that with a more peripheral aspect of the project, like the ability to rename a
client. Both were “required,” but one was more central and important to prove
out early in the cycle. In the interview app, recording interview data was more
core - more in the middle - than setting up a new research project.

Second, it should be **small**. If the first piece of work isn’t small enough,
there isn’t much benefit to carving it off from the rest. The point is to
finish something meaningful in a few days and build momentum - to have something
real to click on that shows the team is on the right track.

Third, it should be **novel**. If two parts of the project are both core and
small, prefer the thing that you’ve never done before. In the Clients in
Projects feature, the UI for adding clients was mostly the same as the UI for
adding regular users. Starting on that would have moved the project forward,
but it wouldn’t have taught the team anything. It wouldn’t have eliminated
uncertainty. Starting with the visibility toggle boosted everyone’s confidence
because it proved that a new idea was going to work.

## xxx Map the Scopes 


![Cartoon. The same figure as in the last chapter stands beside the desk of
another figure. Hands on hips, the first figure asks: So, how's the project
coming? The figure on the right points to a monitor with a map drawn. The map
outlines territories, some of them with checkmarks inside. A speech bubble
says: 'Compose' and 'Store' are working. We're starting 'Send'
now.](https://basecamp.com/assets/books/shapeup/3.3/intro_cartoon-bfdfe5579c42a0dc27591d343ab109d5d37f3fa94eb9b06266ee7b62f414b518.png)

In the previous chapter, we started the project by finishing one integrated
slice early on. That practice belongs to a more general technique that the team
can use throughout the project.

### xxx Organize by structure, not by
person[](#organize-by-structure-not-by-person)

When asked to organize tasks for a project, people often separate work by
person or role: they’ll create a list for Designers and a list for Programmers.
This leads to the problem we talked about in the previous chapter - people will
complete tasks, but the tasks won’t add up to a finished part of the project
early enough.

To take an example outside of software, consider someone organizing a
fundraising event. They could create a list of tasks for each of their three
volunteers and track the work that way. But then there’d be no way to see the
big picture of how the event is coming together - what’s done and what’s not done
at the macro level. Instead, they should create lists based on the _structure_
of the project - the things that can be worked on and finished independently of
each other. To do that, they would create lists for Food Menu, Venue Setup, and
Light/Sound. Then the organizer can easily see which areas are done and which
areas have outstanding work.

In product development, the categories aren’t pre-cut for us. We usually build
things we’ve never built before. Each project is a wild territory that we have
to walk through before we can draw a map. By digging into the work, we figure
out where the interdependencies are, how things are connected, and what we can
slice apart.

As we saw in the previous chapter, the slices of work integrate front-end and
back-end tasks. This allows us to finish one slice of the actual project and
definitively move on. That’s better than having lots of pieces that - fingers
crossed - are supposed to come together by the end of the cycle.

We call these integrated slices of the project **scopes**. We break the overall
scope (singular) of the project into separate scopes (plural) that can be
finished independently of each other. In this chapter, we’ll see how the team
maps the project into scopes and tackles them one by one.

### xxx The scope map[](#the-scope-map)

Imagine an overhead view of the project. At the beginning, there’s just an
outline from the shaping work that preceded the project. There aren’t any tasks
or scopes yet.

![Drawing: an enclosed vaguely circular outline with nothing
inside.](https://basecamp.com/assets/books/shapeup/3.3/map_outline-bd532edbcca0a1a71b7521d1303a4c500037254651c81e1e8a0487f7ce07446d.png)

When the team members take over the project, they start discovering tasks.
Tasks are a natural starting point because they’re concrete and granular. It’s
too early to organize them into higher level categories. It would be artificial
to try and group them arbitrarily. It’s enough at the start just to capture a
variety of things that need to happen.

![Drawing: the same outline with a dozen tiny dots filling the space
inside.](https://basecamp.com/assets/books/shapeup/3.3/map_tasks-dfc44d0acf74e8dd1d76ad7be0cc05efb7ba31cd690da5bf45f1734405ba7eff.png)

But we don’t want to stay with this picture for long. It’s too low-level.
There’s nothing visible from high altitude.

As the team starts doing real work on the project they learn how the tasks are
related and what the structure of the project is really like. Then they become
able to factor the project into scopes. This is like dividing the map of the
project into separate territories.

![Drawing: the same outline now divided with boundary lines like states on a
map. The regions are labeled: Field on Form, Preset Locations, Migrate Events,
and Display on
List.](https://basecamp.com/assets/books/shapeup/3.3/map_scopes-ef077052fd1354c32a3b98ca4374e5acdec4854dd25f2f9144681e931acb6ef4.png)

The scopes reflect the meaningful parts of the problem that can be completed
independently and in a short period of time - a few days or less. They are bigger
than tasks but much smaller than the overall project.

The map is a mental image. In practice, we define and track the scopes as to-do
lists. Each scope corresponds to a list name. Then any tasks for that scope go
in that list.

![A screenshot of to-do lists in Basecamp. The names of the to-do lists
correspond to the regions on the map above. Each list has a few items
below.](https://basecamp.com/assets/books/shapeup/3.3/scopes_as_tasks-f2d2d388c1fef0554194b742b4f86a90c584d4fd39304b964f2e128ab6fbda92.png)

### xxx The language of the project[](#the-language-of-the-project)

Scopes are more than just slices. They become the language of the project at
the macro level. When we were building the _Clients in Projects_ feature, the
team used the language of the scopes like this: “After _Bucket Access_ is done
we can implement _Invite Clients_. Then we’ll _Update Recording Visibility_
when people on the firm flip the _Visibility Toggle_.”

When it’s time to report status, the team uses the language of scopes to
explain what’s done and what’s not done. It’s more satisfying to have the
conversation at a high level and point to finished pieces of software, instead
of going down into the weeds and defending the purposes and status of
individual outstanding tasks. (We’ll see more in the next chapter about how to
report on scopes using the Hill Chart.)

### xxx Case study: Message drafts[](#case-study-message-drafts)

A designer and programmer were building a feature to create and save drafts of
messages in a new app. After kick-off, they identified a bunch of tasks they
would need to do at some point.

![On the left, an enclosed outline that represents the project with scattered
dots inside. On the right, a to-do list named 'Unscoped' with ten seemingly
unrelated
tasks.](https://basecamp.com/assets/books/shapeup/3.3/drafts_1-34f5a96e807ac206f0a3c1cd708a1ed553550480198d3dbd02e3f8f890c36100.png)

As the end of the first week approached, they had completed some of the tasks,
but there wasn’t anything to show for their work. In the spirit of “get one
piece done” they focused on one key interaction they could integrate: creating
a new draft.

They called the new scope “Start New,” created a to-do list for it, and moved
to-dos into it. There was only one design task left for them to consider this
scope finished.

![One region of the outlined space is marked with a boundary and labeled Start
New. On the right, the to-do list is broken into two: a new list called Start
New with three of the items from the prior list, and the remaining items below
in the Unscoped list, which is three items shorter now. Two of the items in the
Start New list are completed and one is
outstanding.](https://basecamp.com/assets/books/shapeup/3.3/drafts_2-89577b850eaa3053b9d335730a42d6bf7b66062b4ad5391e56307f9b928d79d2.png)

After finishing the one design task, the scope was complete.

![The region that was labeled 'Start New' is now marked with a checkmark. On
the right, the Start New to-do list is gone because all the items were
completed and the Unscoped list
remains.](https://basecamp.com/assets/books/shapeup/3.3/drafts_3-304ea3ad4d86e8b46f1dff3ad048776a111c79d078adb50ba25cf3611276995b.png)

The unscoped tasks that are left don’t represent all the work that remains.
More tasks are going to be discovered as they start working on each of those.
Still, there is enough variety in the work to tease out more scopes. The team
was motivated to break out the scopes already at this point because they knew
they wanted their efforts to add up to another visible piece being finished
before long.

Taking a look at the tasks that were left, they decided to pull out tasks
related to finding the drafts into a new scope called Locate and the task for
deleting into a scope called Trash. The work that was left all seemed related
to saving and editing the draft, so they called that Save/Edit.

![The map is now divided into three regions in addition to the checked off
region: Trash, Locate, and Save/Edit. On the right, to-do lists corresponding
to the same regions appear. Save/Edit has the most items. The Unscoped list is
gone because of all its items have been distributed to the new
lists.](https://basecamp.com/assets/books/shapeup/3.3/drafts_4-1abbc8645f679d8db90f22ae2cc58e48f241a9a17f5c94555dc34ff64f2c5659.png)

Take a look at the Locate scope. There’s only one task there right now. But
surely there will be more work to do than just designing the index. When there
are implementation tasks to do, that’s where they’ll go.

The designer started some work on Locate while the programmer focused on
Save/Edit. As she dug into it, she noticed she could carve off a couple pieces
to make more visible progress. There were really three scopes in it.

First she factored out the work related to sending the drafted message. She
called that Send.

![The Save/Edit region is further subdivided with a small region inside labeled
Send. On the right, two items appear in a list called Send and the Save/Edit
list is correspondingly
shorter.](https://basecamp.com/assets/books/shapeup/3.3/drafts_5-267e71f5dd4144e6e02d53e587e15ef5a434055f3d4a9eaefb6e0e3f1368c2ab.png)

Finally, some of the remaining Save/Edit tasks were about storing information
and one other was actually unrelated - it was a special case for handling drafts
when replying to another message. She broke these out into two new scopes:
Store and Reply.

![The region formerly labeled Save/Edit is divided into two with a new
boundary. The new two regions are named Store and Reply. On the right Store and
Reply lists replace what used to be the Save/Edit list. There are now five
regions depicted in the map illustration and five regions appearing as to-do
lists: Send, Store, Reply, Trash, and Locate. Each list has between one and
three items on
it.](https://basecamp.com/assets/books/shapeup/3.3/drafts_6-a511456472dd9b348e6fc314781a8e6c91e7ae942eed0779036539bf27bbb530.png)

At this point the team suddenly felt like they could see the whole of the
project at a high level. All the major parts were visible at the macro level as
scopes. None of them were so big that important or challenging tasks could hide
inside of them unnoticed.

Meanwhile, the designer had made progress on Locate. After a little wiring,
they were able to mark that done. Tasks were getting done on Send and Store as
well.

![The region marked Locate is checked off. The list disappears on the
right.](https://basecamp.com/assets/books/shapeup/3.3/drafts_7-5e57ebc504000f0fd6a34d99f88485de703c4275c9e95c8bf0b9ffe53da52f8c.png)

Once Send and Store were finished, just a couple tasks remained for Trash and
Reply.

![Send and Store are checked off. Now only Reply and Trash remain in the map
and as to-do lists on the
right.](https://basecamp.com/assets/books/shapeup/3.3/drafts_8-d8ce2b945f7eaf2938bba92428fb75dc665bcda8f5ca8d629f9cc054e34a5ef8.png)

And then the project was done.

![Every region on the map is checked off. There are no to-dos on the
right.](https://basecamp.com/assets/books/shapeup/3.3/drafts_9-06a8aa76c9f01d2311422dac7e0e88235fc7e38a68b02d4643ef87355425ab63.png)

### xxx Discovering scopes[](#discovering-scopes)

Scope mapping isn’t planning. You need to walk the territory before you can
draw the map. Scopes properly drawn are not arbitrary groupings or categories
for the sake of tidiness. They reflect the real ground truth of what can be
done independently - the underlying interdependencies and relationships in the
problem.

Scopes arise from interdependencies. The way parts depend on each other
determines when you can say a given piece of the work is “done.” You don’t know
what the work and interdependencies actually are in advance. We talked earlier
about imagined versus discovered tasks. The same principle applies to scopes.
The scopes need to be discovered by doing the real work and seeing how things
connect and don’t connect.

That’s why at the start of a project, we don’t expect to see accurate scopes.
We’re more likely to see them at the end of week one or start of week two,
after the team has had a chance to do some real work and find the natural
dividing lines in the anatomy of the problem.

It’s also normal to see some shuffling and instability in the scopes at first.
The lines get redrawn or scopes renamed as the team feels out where the
boundaries really are, like in the example above. The team was focused on
specific problems of saving and editing drafts, so it was easiest to identify
that scope early. It wasn’t until they got into the weeds that they noticed
there were tasks specifically about sending the draft and made that a separate
scope.

### xxx How to know if the scopes are right[](#how-to-know-if-the-scopes-are-right)

Well-made scopes show the anatomy of the project. When you feel a pain in your
body, you don’t have to question whether it’s in your arms or your legs or your
head. You know the parts and their names so you can explain where the pain is.
In the same way, every project has a natural anatomy that arises from the
design you want, the system you’re working within, and the interdependencies of
the problems you have to solve.

Three signs indicate when the scopes are right:

1. You feel like you can see the whole project and nothing important that
worries you is hidden down in the details.
2. Conversations about the project become more flowing because the scopes give
you the right language.
3. When new tasks come up, you know where to put them. The scopes act like
buckets that you can easily lob new tasks into.

On the other hand, these three signs indicate the scopes should be redrawn:

1. It’s hard to say how “done” a scope is. This often happens when the tasks
inside the scope are unrelated. If the problems inside the scope are unrelated,
finishing one doesn’t get you closer to finishing the other. It’s good in this
case to look for something you can factor out, like in the Drafts example.
2. The name isn’t unique to the project, like “front-end” or “bugs.” We call
these “grab bags” and “junk drawers.” This suggests you aren’t integrating
enough, so you’ll never get to mark a scope “done” independent of the rest. For
example, with bugs, it’s better to file them under a specific scope so you can
know whether, for example, “Send” is done or if you need to fix a couple bugs
first before putting it out of mind.
3. It’s too big to finish soon. If a scope gets too big, with too many tasks,
it becomes like its own project with all the faults of a long master to-do
list. Better to break it up into pieces that can be solved in less time, so
there are victories along the way and boundaries between the problems to solve.

Let’s close this chapter with a few tips for dealing with different kinds of
tasks and scopes that will come up.

### xxx Layer cakes[](#layer-cakes)

Most software projects require some UI design and a thin layer of code below.
Think of a database app where all you need to do is enter information, save it,
and display it back. Work like this looks like a **layer cake**: You can judge
the work by UI surface area because the back-end work is thin and evenly
distributed. In these cases, you can integrate all design and programmer tasks
together in the same scope. This is a good default for most “information
system” type apps.

![Two square planes representing front and back end are aligned in such a way
that they look like a slice of cake with two layers. The 'layer cake' is drawn
isometrically. On the side, a three dimensional axis is labeled. The vertical
axis is labeled Effort to Build and the two horizontal axes are labeled
Functionality. The slice of the cake is wide and deep and the two layers are
thin.](https://basecamp.com/assets/books/shapeup/3.3/layer_cake-df0e389ebd8bf05c90eb190e7732cbe89c107e21b927ff4cce6dd6b9a70c3184.png)

### xxx Icebergs[](#icebergs)

But sometimes there is significantly more back-end work than UI work or vice
versa. For example, a new feature that only requires submitting a form could
require very complex business logic to return the right answer. This kind of
work is like an iceberg.

![An iceberg is drawn with the same three dimensional axis: height represents
effort to build and width and depth represent funtionality. A dotted line marks
the water line. The small area above the water line is marked Front End and the
rest below the line is marked Back
End.](https://basecamp.com/assets/books/shapeup/3.3/iceberg-c7da94a0a02bb81ab4609822d2c03ea7bbe15966d6c19b5c786c8ece1589000b.png)

For icebergs, it can help to factor out the UI as a separate scope of work
(assuming the UI isn’t interdependent with the back-end complexity). If the
back-end is complex enough, you can split it into separate concerns and then
turn those into scopes as well. The goal in cases like this is to define some
different things you can finish and integrate in stages, rather than waiting
until the 11th hour with fingers crossed that it will all come together.

You also sometimes see upside-down icebergs, where there is a ton of UI
complexity with less back-end complexity. For example, the data model for a
calendar isn’t complicated, but the interaction for rendering a multiple-day
event and wrapping across grid cells could take a lot of time and
problem-solving.

For both back-end and front-end icebergs, we always question them before
accepting them as a fact. Is the complexity really necessary and irreducible?
Do we need that fancy UI? Is there a different way to build that back-end
process so it has fewer interdependencies with the rest of the system?

### xxx Chowder[](#chowder)

There are almost always a couple things that don’t fit into a scope. We allow
ourselves a “Chowder” list for loose tasks that don’t fit anywhere. But we
always keep a skeptical eye on it. If it gets longer than three to five items,
something is fishy and there’s probably a scope to be drawn somewhere.

### xxx Mark nice-to-haves with ~[](#mark-nice-to-haves-with-)

New tasks constantly come up as you get deeper into a problem. You’ll find code
that could be cleaned up, edge cases to address, and improvements to existing
functionality. A good way to deal with all those improvements is to record them
as tasks on the scope but mark them with a ~ in front. This allows everyone on
the team to constantly sort out the **must-haves** from the **nice-to-haves**.

In a world with no deadlines, we could improve everything forever. But in a
fixed time box, we need a machete in our hands to cut down the constantly
growing scope. The ~ at the start of an item, or even a whole scope, is our
best tool for that. We’ll come back to this technique when we talk about making
cuts to scope in Chapter 13, [Decide When to
Stop](https://basecamp.com/shapeup/3.5-chapter-13).

## xxx Show Progress 


![Cartoon. A figure sits alone typing on a laptop. A thought bubble says: Ugh,
I hate asking this. A speech box indicating what they are typing says: So...
how's the project
going?](https://basecamp.com/assets/books/shapeup/3.4/intro_cartoon-2844861c7d69b5783b5b7097c3b305a53552ac362f685aed5f3138fe6f7d5e65.png)

Good-hearted managers don’t like asking for status. It’s awkward, feels like
nagging, and gets even worse when they have to ask follow-up questions to get
sufficiently clear about what’s going on.

Managers would rather be able to see the status themselves whenever they need
to. We saw in the last chapter how organizing to-dos into scopes helps the team
to stay on top of the work. But this doesn’t help the manager directly. There
are a couple problems with to-dos that make them insufficient for judging
status.

### xxx The tasks that aren’t there[](#the-tasks-that-arent-there)

Consider a list with a few completed items and no incomplete items left. This
could mean that all the work is done. But it could also mean that the team
knows there’s more work but hasn’t defined tasks yet.

Sometimes a team will define a **scope** early in the project without populating
it with tasks. It marks that some work needs to be done but that actual tasks
haven’t been discovered yet.

Or think about doing some QA at the end of a scope. All the tasks are done.
There’s nothing else to do. Then the act of testing populates the scope with
new tasks for the issues found.

This goes back to the notion of **imagined** versus **discovered** tasks. In our
naive notion of a list that’s planned up-front, somebody populates it with
items that are gradually checked off. In real life, issues are discovered by
getting involved in the problem. That means _to-do lists actually grow as the
team makes progress_.

![Two diagrams with the same axes. The top is labeled: In Theory. The Y axis is
tasks and the X axis is time. A to-do list is shown at five time steps t1
through t5. The list is the same length in every time step. At t1 none of the
items are completed. They are gradually completed in each step until at t5 all
the items are checked. Below, the second digram is labeled: In Practice. At t1
the list is five items long. At t2, it is still five items long and three of
the items are completed. At t3, the list gets taller with new uncompleted
items. At t4, two items get completed, but it still gets taller due to an extra
item added. At t5 all items are completed. t3 and t4 are labeld: More tasks
discovered. The height of the list has grown from t1 to t5, in contrast with
the constant height in the first
diagram.](https://basecamp.com/assets/books/shapeup/3.4/tasks_growing-9ec9f929e6eb6dab7ba05e7c02a5b4c33ba5739622236c2f213ebe75bcb4c17c.jpg)

If we tried to judge at _t2_ how far along the project is, we’d be misled. From
an outsider’s perspective, there’s no way to know whether the number of
outstanding tasks will go down or up. To know that, you’d need more context on
the work inside the scope to understand what it means that those particular
tasks are done and whether others might still be coming.

### xxx Estimates don’t show uncertainty[](#estimates-dont-show-uncertainty)

Some teams try to attach estimates to their tasks or scopes to report status.
The problem with estimates is they have a very different meaning depending on
the nature of the work being estimated.

Say you have two tasks, both estimated to take four hours. If one task is
something the team has done ten times in the past, you can be confident in the
estimate. Suppose the other task is something the team has never done before,
or it has unclear interdependencies. It could take the four hours if all goes
perfectly, but due to the unknowns in it, it could stretch out to two to three
days. It’s not meaningful to write “4 hours, or maybe 3 days” as the estimate.

Recognizing this, we came up with a way to see the status of the project
without counting tasks and without numerical estimates. We do that by shifting
the focus from what’s done or not done to what’s unknown and what’s solved. To
enable this shift, we use the metaphor of the hill.

### xxx Work is like a hill[](#work-is-like-a-hill)

Every piece of work has two phases. First there’s the uphill phase of figuring
out what our approach is and what we’re going to do. Then, once we can see all
the work involved, there’s the downhill phase of execution.

![A Hill Chart diagram. It looks like a wide bell curve, with a vertical dotted
line down the middle. The far left edge is labeled: Start, and the far right
edge labeled: Finish. The left slope going up is labeled: Figuring out what to
do. The right slope going down is labeld: Getting it done. A dot is drawn about
two-thirds of the way up the left side of the hill. Light-colored arrows
suggest the dot originated at the left side, moved up to its current position,
and later moves over the hill and down the right to the
finish.](https://basecamp.com/assets/books/shapeup/3.4/hill_concept-a0a77c0ebb209b61899b8b4cdb1a315f2807e3fdc2e1d2373e2f19060725f042.png)

Let’s use an everyday example to get the feeling of the hill.

Suppose you’re planning to host a dinner party. You’ve set the date, but it’s
still a couple weeks ahead and you haven’t thought about what to cook yet. You
have no idea what type of cuisine the meal will be or what dish to make. That
would place you at the start of the hill on the bottom-left.

![The hill with a dot at the far bottom left labeled: Didn't start
yet.](https://basecamp.com/assets/books/shapeup/3.4/dinner_hill_1-e2ec26c6872bce18b3bb9494c25aaeffea15502c0011dfc45dc439ad23877020.png)

Next you think about who’s attending and note that a couple people are
vegetarian. That eliminates some options (like grilling out) but still leaves a
lot of options open. You consider both Italian and Indian. You think Indian
might be more fun to cook, with more interesting vegetarian options. So you
decide to look for Indian recipes.

At this point, the question “What percent complete is the project?” doesn’t
even make sense. And if someone asked you to estimate how long the shopping and
prep will take, you couldn’t answer that either because you haven’t chosen a
dish yet. The answer would be: “I’ve done some work to figure out what kind of
cuisine, but I haven’t narrowed it down to a specific dish yet.” We can
represent that by putting you halfway up the “figuring it out” side of the
hill.

![The hill with the dot moved halfway up the left side. It is labeled: Choosing
type of
cuisine.](https://basecamp.com/assets/books/shapeup/3.4/dinner_hill_2-66189464c0db39fde407061ff9fb7821ef0bb38bf87658b294be2df0e880cc7f.png)

Next you do some searching online and look through your recipe books. You want
to find a recipe that will be interesting but doesn’t require ingredients that
will be too hard to find. You settle on a recipe and prepare a shopping list.

Now you are in a very different position than before. The feeling changes from
“I’m still not sure what I’m doing” to “Now I know what to do.” You’re at the
top of the hill.

![The dot moves to the top of the hill. It is labeled: Choosing dish, making
grocery list. A thought bubble appears on the side of the chart saying: Now I
know what I have to
do!](https://basecamp.com/assets/books/shapeup/3.4/dinner_hill_3-430bd6d8ea2f1f26edc29697bc585ea97c8b4fac16ad9b313e6ec3c647396954.png)

From this vantage point, you can see all of the steps that are left. It’s even
fair to estimate how long all the work will take (“Let’s see…an hour to grocery
shop, 30 minutes of prep, cook for 45 minutes…”).

The day before the dinner party, you go to the grocery store and buy the
ingredients. This moves you downhill. You’re closer to finishing the task.

![The dot moves one third down the right side of the hill. It is labeled:
Buying
ingredients.](https://basecamp.com/assets/books/shapeup/3.4/dinner_hill_4-bad87f32f0705cafd769924dbe4e3c13f001565fefc9c6b1de5b724b3fef3362.png)

Next comes the work of prepping and cooking the meal.

![The dot moves two thirds down the right side of the hill. It is labeled:
Cooking
meal.](https://basecamp.com/assets/books/shapeup/3.4/dinner_hill_5-ed35d83a059a495cfebdf180c48841e047ad7035a329b88a1d2a28cd7afd8717.png)

After the meal is over, there’s just a little work left: the clean-up.

![The dot moves to the bottom of the hill on the right side. The movement is
labeled: Cleaning
up.](https://basecamp.com/assets/books/shapeup/3.4/dinner_hill_6-9ee3dcc1091814729a7160037d9464985f21449951d6ecce041308950c955998.png)

Note how the hill shows how the work _feels_ at different stages. The uphill
phase is full of uncertainty, unknowns, and problem solving. The downhill phase
is marked by certainty, confidence, seeing everything, and knowing what to do.

### xxx Scopes on the hill[](#scopes-on-the-hill)

We can combine the hill with the concept of scopes from the last chapter. The
scopes give us the language for the project (“Locate,” “Reply”) and the hill
describes the status of each scope (“uphill,” “downhill”).

To see the status of the scopes, we can plot each one as a different color on
the hill.

![A map in the style of last chapter is drawn next to a hill chart. The map is
divided into regions labeled: Permas per occurence, Future-apply labels, and
Global Recurring. Each scope on the map is marked with a colored dot. To the
right, a hill chart appears. It has three dots on it that correspond to the
same scopes. The dots are the same colors as on the map. Future-apply edits is
a blue dot one-third up the left side of the hill. Permas per occurrence is a
green dot one third down the right side of the hill. Global recurring events is
an orange dot two thirds down the right side of the
hill.](https://basecamp.com/assets/books/shapeup/3.4/scopes_on_the_hill-592ba06433e0fbc0e45c6344efdcb44e7d2c495b8d0f0d6048e2b8aa030acb88.png)

This is a snapshot from a project to implement recurring events in Basecamp.
Here “Future-applying edits” is a scope that is still being worked out, with
significant unknowns to solve. The other two scopes have no meaningful unknowns
left, and “Global recurring events” is closer to finished.

### xxx Status without asking[](#status-without-asking)

We built a feature exclusive to Basecamp for creating hill charts and updating
them with a few clicks. The team members, who have the full context of where
the work stands, intuitively drag the scopes into position, and save a new
update that’s logged on the project (see [How to Implement Shape Up in
Basecamp](https://basecamp.com/shapeup/4.0-appendix-01)).

![An animated screenshot of the Hill Chart feature in Basecamp. The cursor
grabs a dot and drags it along the line of the hill to a new
position.](https://basecamp.com/assets/books/shapeup/3.4/dragging_scopes-3e5bf229b1603922b72af5d04a2a7f1aceaf91b8e751680b3d29a3ac982c8289.gif)

For managers, the ability to compare past states is the killer feature. It
shows not only where the work stands but how the work is _moving_.

![Screenshot of three hill charts in Basecamp captured at different times. The
same four scopes appear on each hill but the positions advance over the hill
and to the right with the passing of
time.](https://basecamp.com/assets/books/shapeup/3.4/snapshots-acc8efc1f87284428ed51816961e7f6f40141ff29cf1103c3d0002e73b0da497.png)

With this second-order view, managers can judge what’s in motion and what’s
stuck. They can see which problems the team chose to solve and how much time
they spent at each stage from unknown to known to done.

This report becomes the manager’s first destination when they feel anxious
about a project. Since it’s self-serve, there’s no need to interrupt the team
with the awkward status question. And in cases where something doesn’t look
right, the manager can jump directly into a conversation about the relevant
piece of work. “Looks like ‘Autosave’ has been uphill for a while. What’s the
unknown that’s holding it back?” The manager can workshop this specific piece
of the project without having to first untangle it from all the other things
that are moving along as expected.

### xxx Nobody says “I don’t know”[](#nobody-says-i-dont-know)

Nobody wants to raise their hand to management and say “I don’t know how to
solve this problem.” This causes teams to hide uncertainty and accumulate risk.
The moments when somebody is stuck or going in circles are where the biggest
risks and opportunities lie. If we catch those moments early, we can address
them with help from someone senior or by reworking the concept. If we don’t
catch them, the unsolved problems could linger so far into the cycle that they
endanger the project.

The hill chart allows everybody to see that somebody might be stuck without
them actually saying it. A dot that doesn’t move is effectively a raised hand:
“Something might be wrong here.”

![Three snapshots of a hill chart through time. Each has three scopes on it.
Two of the scopes are moving, but one scope stays in the same position on each
snapshot](https://basecamp.com/assets/books/shapeup/3.4/stuck_scope-e163bf7a8211ad246df85cd4182b520606d1713589000abd991f1e2625ba9177.png)

Once it’s been spotted, the language of uphill/downhill facilitates the
conversation. It’s less about the person (Looks like you’re stuck!) and more
about the work. The question is: What can we solve to get that over the hill?

### xxx Prompts to refactor the scopes[](#prompts-to-refactor-the-scopes)

Sometimes probing into a stuck scope reveals that it isn’t stuck at all. The
problem is in how the lines of the scope were drawn.

Here’s a case where the “Notify” scope was stuck on the hill for too long.

![Two snapshots of a hill chart taken six days apart. A scope labeled Notify is
in the same position on
both.](https://basecamp.com/assets/books/shapeup/3.4/notify_stuck-6b712f982cad1d5dfd69521c1a3d981d267170d0e362f745a0fc174a6a4e76a3.png)

When we checked in with the team, it turned out the work was moving along just
fine. The problem was that “Notify” wasn’t a single thing. It had three
different parts: designing an email, delivering the email in the back-end, and
displaying the notification in an in-app menu. The team mostly finished the
code for delivering the email. The design of the email was nearly figured out.
But they hadn’t started on the in-app display. It wasn’t possible to say
whether “Notify” as a whole was over the hill or not because parts of it were
and parts of it weren’t.

The solution in a case like this is to break the scope apart into smaller
scopes that can move independently.

 [![Two scope maps appear showing a before and after. Before, one of the scopes
 is labeled Notify. After, that region is broken into three new subregions:
 Email, Hey Menu, and Deliver. Below the two scope maps, the same change is
 shown in the to-do lists. First all the items are in a list called Notify.
 Then they are broken into three different lists: Hey Menu Notification, Email
 Notification, and Notification
 Delivery](https://basecamp.com/assets/books/shapeup/3.4/notify_factored_out-a7da115cbab1c0b9b005e8ffe51b85a8d8e4e292118b1125740b29d42ea232a2.png)](https://basecamp.com/assets/books/shapeup/3.4/notify_factored_out-a7da115cbab1c0b9b005e8ffe51b85a8d8e4e292118b1125740b29d42ea232a2.png) 

Now the team can move each dot to accurately show where the work stands.

![Two hill charts showing the corresponding before and after. Before, a single
dot for Notify is stuck on the uphill side. After, three dots appear. One for
Hey Menu on the far left, one for Notification Email about to crest the top,
and one for Notification Delivery almost all the way to the bottom on the
right.](https://basecamp.com/assets/books/shapeup/3.4/notify_after_refactoring-22e9c4d8c52823332c7dcf95d64465885527b938ecefc46301a9d0d848b31d24.png)

The benefit comes at the second order. With the scopes separated out, they can
move independently over time. Now the team can show more progress more
frequently than before.

![Three snapshots of the three scopes on the hill showing how they move over
the hill independently at different
speeds.](https://basecamp.com/assets/books/shapeup/3.4/notify_movement_after_refactoring-215c277c889103d22b884995b89170bd558c57b94085e41840ae5600b604cac8.png)

### xxx Build your way uphill[](#build-your-way-uphill)

Some teams struggle with backsliding when they first try the hill chart. They
consider a scope solved, move it the top of the hill, and later have to slide
it back when they uncover an unexpected unknown.

When this happens, it’s often because somebody did the uphill work with their
head instead of their hands. Coming up with an approach in your head is just
the first step uphill. We often have a theory of how we’ll solve
something - “I’ll just use that API” - and then the reality turns out to be more
complicated. It’s good to think of the first third uphill as “I’ve thought
about this,” the second third as “I’ve validated my approach,” and the final
third to the top as “I’m far enough with what I’ve built that I don’t believe
there are other unknowns.”

### xxx Solve in the right sequence[](#solve-in-the-right-sequence)

In addition to seeing where the work stands, we can use the hill chart to
sequence the work - which problems to solve in which order.

Some scopes are riskier than others. Imagine two scopes: One involves geocoding
data - something the team has never done before. The other is designing and
implementing an email notification. Both have unknowns. Both start at the
bottom of the hill. This is where the team asks themselves: If we were out of
time at the end of the cycle, which of these could we easily whip
together - despite the unknowns - and which might prove to be harder than we think?

That motivates the team to push the scariest work uphill first. Once they get
uphill, they’ll leave it there and look for anything critically important
before finishing the downhill work to completion. It’s better to get a few
critical scopes over the top early in the project and leave the
screw-tightening for later.

Work expands to fill the time available. If the team starts with the email
template first, they could easily spend weeks iterating on copy or creating the
ultimate best-ever email design. But they don’t _need_ to do that. There’s some
version of an email template that could be worked out in a day during the final
week and it would be sufficient. The geocoder, on the other hand, might present
novel problems that the team could struggle with for weeks. They don’t want
that surprise to come at the end of the cycle.

Journalists have a concept called the “inverted pyramid.” The idea is their
articles start with the most essential information at the top, then they add
details and background information in decreasing order of importance. This
allows print newspaper designers to get the crucial part of the story on the
front page and cut the end as needed without losing anything essential.

Effective teams sequence their problem solving in the same way. They choose the
most important problems first with the most unknowns, get them to the top of
the hill, and leave the things that are the most routine or least worrisome for
last.

As the end of the cycle approaches, teams should have finished the important
things and left a variety of “nice to haves” and “maybes” lingering around.
That brings us to the next chapter, on deciding when to stop.

## xxx Decide When to Stop 


![Cartoon. A figure sits in front of a laptop holding their hand in one hand
and sweating. A calendar on the wall shows a deadline three two days away.
Staring into the laptop, the figure asks in a thought bubble: Is it good
enough?](https://basecamp.com/assets/books/shapeup/3.5/intro_cartoon-05df8762bc8fd85d9569643ebce62197e9326bd1fc4bf3c3a89faec8f94eae81.png)

When the end of the cycle approaches, the techniques we covered so far will put
the team in a good position to finish and ship. The shaped work gave them guard
rails to prevent them from wandering. They integrated one scope at a time so
there isn’t half-finished work lying around. And all the most important
problems have been solved because they prioritized those unknowns first when
they sequenced the work.

Still, there’s always more work than time. Shipping on time means shipping
something imperfect. There’s always some queasiness in the stomach as you look
at your work and ask yourself: Is it good enough? Is this ready to release?

### xxx Compare to baseline[](#compare-to-baseline)

Designers and programmers always want to do their best work. It doesn’t matter
if the button is on the center of the landing page or two pages down a settings
screen, the designer will give it their best attention. And the best
programmers want the code base to feel like a cohesive whole, completely
logically consistent with every edge case covered.

Pride in the work is important for quality and morale, but we need to direct it
at the right target. If we aim for an ideal perfect design, we’ll never get
there. At the same time, we don’t want to lower our standards. How do we make
the call to say what we have is good enough and move on?

It helps to shift the point of comparison. Instead of comparing up against the
ideal, compare down to **baseline** - the current reality for customers. How do
customers solve this problem today, without this feature? What’s the
frustrating workaround that this feature eliminates? How much longer should
customers put up with something that doesn’t work or wait for a solution
because we aren’t sure if design A might be better than design B?

Seeing that our work so far is better than the current alternatives makes us
feel better about the progress we’ve made. This motivates us to make calls on
the things that are slowing us down. It’s less about us and more about value
for the customer. It’s the difference between “never good enough” and “better
than what they have now.” We can say “Okay, this isn’t perfect, but it
definitely works and customers will feel like this is a big improvement for
them.”

 [![A chart with performance on the Y axis and development time on the X axis.
 A line curves upward from zero performance at the beginning of development
 time to about halfway up the y axis when it reaches the middle of the chart
 and terminates in a dot. The x axis below the dot is labeld: Now. Horizontal
 lines divide the Y axis into three regions. In the bottom third, below the dot
 of the current position, a dotted line is labeled: Baseline. At the top of the
 chart, above the dot, a line is labeled: Ideal. The Y value of the dot is
 labeled: Work in progress. An arrow points down from the dot to the baseline
 with the label: Compare down. Another arrow points up from the dot to the
 ideal line and says: Not
 up.](https://basecamp.com/assets/books/shapeup/3.5/compare_to_baseline-ff521686dc8ea60cb9587d072409f5ee8bba79ca269e0fb04963b930699fb62d.jpg)](https://basecamp.com/assets/books/shapeup/3.5/compare_to_baseline-ff521686dc8ea60cb9587d072409f5ee8bba79ca269e0fb04963b930699fb62d.jpg) 

Make scope cuts by comparing down to baseline instead of up to some perfect
ideal

### xxx Limits motivate trade-offs[](#limits-motivate-trade-offs)

Recall that the six-week bet has a **circuit breaker** - if the work doesn’t get
done, the project doesn’t happen.

This forces the team to make trade-offs. When somebody says “wouldn’t it be
better if…” or finds another edge case, they should first ask themselves: Is
there time for this? Without a deadline, they could easily delay the project
for changes that don’t actually deserve the extra time.

We expect our teams to actively make trade-offs and question the scope instead
of cramming and pushing to finish tasks. We create our own work for ourselves.
We should question any new work that comes up before we accept it as necessary.

### xxx Scope grows like grass[](#scope-grows-like-grass)

Scope grows naturally. Scope creep isn’t the fault of bad clients, bad
managers, or bad programmers. Projects are opaque at the macro scale. You can’t
see all the little micro-details of a project until you get down into the work.
Then you discover not only complexities you didn’t anticipate, but all kinds of
things that could be fixed or made better than they are.

Every project is full of scope we don’t need. Every part of a product doesn’t
need to be equally prominent, equally fast, and equally polished. Every use
case isn’t equally common, equally critical, or equally aligned with the market
we’re trying to sell to.

This is how it is. Rather than trying to stop scope from growing, give teams
the tools, authority, and responsibility to constantly cut it down.

### xxx Cutting scope isn’t lowering
quality[](#cutting-scope-isnt-lowering-quality)

Picking and choosing which things to execute and how far to execute on them
doesn’t leave holes in the product. Making choices makes the product better. It
makes the product better _at some things_ instead of others. Being picky about
scope _differentiates_ the product. Differentiating what is core from what is
peripheral moves us in competitive space, making us more alike or more
different than other products that made different choices.

Variable scope is not about sacrificing quality. We are extremely picky about
the quality of our code, our visual design, the copy in our interfaces, and the
performance of our interactions. The trick is asking ourselves which things
actually matter, which things move the needle, and which things make a
difference for the core use cases we’re trying to solve.

### xxx Scope hammering[](#scope-hammering)

People often talk about “cutting” scope. We use an even stronger
word - **hammering** - to reflect the power and force it takes to repeatedly bang the
scope so it fits in the time box.

As we come up with things to fix, add, improve, or redesign during a project,
we ask ourselves:

- Is this a “must-have” for the new feature?
- Could we ship without this?
- What happens if we don’t do this?
- Is this a new problem or a pre-existing one that customers already live with?
- How likely is this case or condition to occur?
- When this case occurs, which customers see it? Is it core - used by everyone - or
  more of an edge case?
- What’s the actual impact of this case or condition in the event it does
  happen?
- When something doesn’t work well for a particular use case, how aligned is
  that use case with our intended audience?

The fixed deadline motivates us to ask these questions. Variable scope enables
us to act on them. By chiseling and hammering the scope down, we stay focused
on just the things we need to do to ship something effective that we can be
proud of at the end of the time box.

Throughout the cycle, you’ll hear our teams talking about **must-haves** and
**nice-to-haves** as they discover work. The must-haves are captured as tasks on
the scope. The scope isn’t considered “done” until those tasks are finished.
Nice-to-haves can linger on a scope after it’s considered done. They’re marked
with a tilde (~) in front. Those tasks are things to do if the team has extra
time at the end and things to cut if they don’t. Usually they never get built.
The act of marking them as a nice-to-have is the scope hammering.

 [![Screenshot of a to-do list in Basecamp for a scope. All the items are
 checked off except for one. The one oustanding item is marked with a tilde at
 the
 front.](https://basecamp.com/assets/books/shapeup/3.5/scope_with_maybes-1838d92cd3c87917932716ef6baaad023b5b968af9d3f316d257c5f08a3a71f8.png)](https://basecamp.com/assets/books/shapeup/3.5/scope_with_maybes-1838d92cd3c87917932716ef6baaad023b5b968af9d3f316d257c5f08a3a71f8.png) 

A finished scope with one **nice-to-have** (marked with a “~”) that was never
completed

### xxx QA is for the edges[](#qa-is-for-the-edges)

At Basecamp’s current size (millions of users and about a dozen people on the
product team), we have one QA person. They come in toward the end of the cycle
and hunt for edge cases outside the core functionality.

QA can limit their attention to edge cases because the designers and
programmers take responsibility for the basic quality of their work.
Programmers write their own tests, and the team works together to ensure the
project does what it should according to what was shaped. This follows from
giving the team responsibility for the whole project instead of assigning them
individual tasks (see Chapter 9, [Hand Over
Responsibility](https://basecamp.com/shapeup/3.1-chapter-09)).

For years we didn’t have a QA role. Then after our user base grew to a certain
size, we saw that small edge cases began to impact hundreds or thousands of
users in absolute numbers. Adding the extra QA step helped us improve the
experience for those users and reduce the disproportional burden they would
create for support.

Therefore we think of QA as a level-up, not a gate or a check-point that all
work must go through. We’re much better off with QA than without it. But we
don’t depend on QA to ship quality features that work as they should.

QA generates **discovered tasks** that are all **nice-to-haves** by default. The
designer-programmer team triages them and, depending on severity and available
time, elevates some of them to **must-haves**. The most rigorous way to do this
is to collect incoming QA issues on a separate to-do list. Then, if the team
decides an issue is a must-have, they drag it to the list for the relevant
**scope** it affects. This helps the team see that the scope isn’t done until the
issue is addressed.

We treat code review the same way. The team can ship without waiting for a code
review. There’s no formal check-point. But code review makes things better, so
if there’s time and it makes sense, someone senior may look at the code and
give feedback. It’s more about taking advantage of a teaching opportunity than
creating a step in our process that must happen every time.

### xxx When to extend a project[](#when-to-extend-a-project)

In very rare cases, we’ll extend a project that runs past its deadline by a
couple weeks. How do we decide when to extend a project and when to let the
**circuit breaker** do its thing?

First, the outstanding tasks must be true **must-haves** that withstood every
attempt to **scope hammer** them.

Second, the outstanding work must be all **downhill**. No unsolved problems; no
open questions. Any **uphill** work at the end of the cycle points to an
oversight in the shaping or a hole in the concept. Unknowns are too risky to
bet on. If the work is uphill, it’s better to do something else in the next
cycle and put the troubled project back in the shaping phase. If you find a
viable way to patch the hole, then you can consider betting more time on it
again in the future.

Even if the conditions are met to consider extending the project, we still
prefer to be disciplined and enforce the **appetite** for most projects. The
two-week **cool-down** usually provides enough slack for a team with a few too
many **must-haves** to ship before the next cycle starts. But this shouldn’t
become a habit. Running into cool-down either points back to a problem in the
shaping process or a performance problem with the team.

## xxx Move On 


### xxx Let the storm pass[](#let-the-storm-pass)

Shipping can actually generate new work if you’re not careful. Feature releases
beget feature requests. Customers say “Okay, that’s great, but what about that
other thing we’ve been asking for?” Bugs pop up. Suggestions for improvements
come in. Everyone is focused on the new thing and reacting to it.

The feedback can be especially intense if the feature you shipped changes
existing workflows. Even purely visual changes sometimes spur intense pushback.
A small minority of customers might overreact and say things like “You ruined
it! Change it back!”

It’s important to stay cool and avoid knee-jerk reactions. Give it a few days
and allow it to die down. Be firm and remember why you made the change in the
first place and who the change is helping.

### xxx Stay debt-free[](#stay-debt-free)

It can be tempting to commit to making changes in response to feedback, but
then you no longer have a clean slate for the next cycle. Remember: these are
just **raw ideas** coming in. The way to handle them is with a gentle “no.”
Saying “no” doesn’t prevent you from continuing to contemplate them and maybe
shape them up into future projects. Saying “yes,” on the other hand, takes away
your freedom in the future. It’s like taking on debt.

Remember, the thing you just shipped was a six-week **bet**. If this part of the
product needs more time, then it requires a new bet. Let the requests or bugs
that just came up compete with everything else at the next **betting table** to
be sure they’re strategically important.

### xxx Feedback needs to be shaped[](#feedback-needs-to-be-shaped)

Here we come full circle. The raw ideas that just came in from customer
feedback aren’t actionable yet. They need to be shaped. They are the raw inputs
that we talked about in step one of the shaping process: [Set
Boundaries](https://basecamp.com/shapeup/1.2-chapter-03).

If a request is truly important, you can make it your top priority on the
shaping track of the next cycle. Bet on something else for the teams to build
and use that time to properly shape the new idea. Then, when the six weeks are
over, you can make the case at the betting table and schedule the shaped
version of the project for the greatest chance of success.

## xxx Conclusion 

### xxx Key concepts[](#key-concepts)

The Shape Up method presented in this book is tightly interwoven. It may take
some thought and experimentation to pull out the right pieces and adapt them to
your team.

Whether your team can adopt the method at once or not, I hope that the language
and concepts in this book gave you some things to take home immediately:

- Shaped versus unshaped work
- Setting appetites instead of estimates
- Designing at the right level of abstraction
- Concepting with breadboards and fat marker sketches
- Making bets with a capped downside (the circuit breaker) and honoring them
  with uninterrupted time
- Choosing the right cycle length (six weeks)
- A cool-down period between cycles
- Breaking projects apart into scopes
- Downhill versus uphill work and communicating about unknowns
- Scope hammering to separate must-haves from nice-to-haves

### xxx Get in touch[](#get-in-touch)

We’d love to hear what you think so we can make the Shape Up method easier to
adopt. What did we miss? What still isn’t clear? What do you wish we had talked
about that we didn’t? We’d also love to hear about your successes and
challenges as you try to apply it to your teams and projects.

Send us an email at [shapeup@basecamp.com](mailto:shapeup@basecamp.com).