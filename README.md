# City Watch - RailsChallenge v1.0

Welcome to the very first **rails**challenge!

## Late one Friday at the office...

You're a junior developer on a new Rails project. Your city is updating their
centralized emergency response center and needs a way to provide real-time data
about emergencies and emergency services via a JSON web service, which the
senior engineer on the project has assigned to you.

The senior engineer hands you some notes from the Project Planning Meeting where
the details of the API were (sort of) ironed out. When you look at the notes you
think (quietly, to yourself, of course):

**You:**
> Hm, this specification is more than a little vague and weird in spots.

The notes read:

  1. (25 points) Allow the creation of `responders`, such as Fire, Police, and Medical
     resources that can respond to emergencies.
  2. (35 points) Allow the creation of `emergencies`, which track their severity (i.e. how
     many fire, police, and medical resources we need per-emergency)
  3. (35 points) Need to be able to see the capacity of the emergency responders in the city,
specifically:
    * The total capacity of all responders in the city, by type
    * The total capacity of all "available" responders (not currently assigned
      to an emergency)
    * The total capacity of all "on-duty" responders, including those currently
      handling emergencies
    * The total capacity of all "available, AND on-duty" responders (the
      responders currently available to jump into a new emergency)
  4. (50 points) Automatic dispatch of responders based on which responders are available and
    on-duty, matching their capabilities to the emergency at hand.
  5. (20 points) Provide a "full response" score that tells you how many emergencies in the
    city had enough emergency personnel available to handle them historically.
    Just need a count like "3/10 emergencies had sufficient responders to handle
    them - or something like that".

**Senior Engineer:**
> "Feel free to [send me an email on the project mailing list][3]
> with questions if you get stuck. I'm going to be pretty busy writing the apps
> that will call into your API, but see how far you can get on your own.

**You:**
> "Would you mind going over this with me in a little more detail? I have some
> questions."

**Senior Engineer:**
> "Sorry, gotta go to the sprint planning meeting. Just take a look at the
> `test/api` folder. I wrote up some integration tests for you. As long
> as you can get that stuff to pass, my apps should work fine with your API.
> If you find anything that you think is a blatant bug in the spec please report it to
> the [mailing list][2], or [the issue tracker][5], or if you're super confident
> that you have a better way you can submit a [pull request][6]. I'll keep an
> eye on all those channels and try to be as responsive as I can. With the
> deadline we have coming up I can't promise to merge just any pull request,
> but if it's small, focused, and doesn't majorly re-spec everything then
> I'll at least consider it.
>
> Think you can handle it?"

You nod hesitantly. Not like you have a choice one way or the other.

**Senior Engineer:**
> "I'm working on a more formal version of the API documentation with the status
> codes and response formats and everything, but in the meantime you'll have to
> make due with what's in the `test/api` folder.  I should be able to get that
> document to you by Wednesday. When it's done I'll throw it in the [project wiki][4]."

**Senior Engineer:**
> "Oh, and BTW. We need the API working 10 calendar days from now, by April
> 27th; and yes, before you say it, I know I'm dumping this on you late on a
> Friday evening and all you really want to do is enjoy your weekend. Honestly
> I'm sorry, to drop this on you like this, but it's as far back as I could get
> the Project Manager to go. They said if we didn't deliver by the 27th that the
> city is going to find another company to write their software, and we'll be
> out of a job. So you know, no pressure or anything."
>
> "Again, don't be afraid to hit me up on the [project mailing list][3] if you
> get stuck with questions of any kind. We need to hit this deadline. After we
> ship whatever it is we can get done in the next 10 days, I'll meet with you to
> review your code and give you feedback on how I think you did."
>
> "Sound good?"

You nod hesitantly again, and the senior engineer disappears down the hall.

## Getting started

  * Fork this repo.
  * **On your fork**, go to "Settings" and check the box next to "Issues" - this will eanble judges to open issues on your fork direclty, in case they need to provide you some feedback
  * Do a `bundle install`
  * Work on your implementation, committing code as you go to github.
  * **All implementations must be done by 11:59pm, April 26th, US Central
    Daylight Time (GMT -5)** or else you're out of a job!
  * Any commits after the cutoff time will be ignored by the city.

---

## railschallenge scoring

There are two components to scoring: automated scoring, and judge scoring.

### Automated scoring

There are two components to the automated scoring: the test suite, and
[rubocop][1].

  * The test suite contains 50 tests, which contain **114 assertions**. For
    every assertion that passes, you will receive 1 point (for a maximum of 114
    points). **NOTE**: you only get points for the tests that come with this
    repository. You're free to add more tests as you develop at your
    discretion, but they will not add to your final score.
  * Rubocop is being used as a static code analysis tool. For every offense it
    finds you will **lose 1 point**.

As an example, we actually implemented a solution to this challenge already. It
had all assertions passing (114 points), but included 3 rubocop offenses (-3
points) for a total score of ***111 points***. See if you can beat that on the
automated scoring side!

The [mailing list][3] the senior developer referenced is a real mailing list.
When you run into questions or want clarification on a portion of the challenge,
feel free to email there first. Someone from the **rails**challenge team will
respond, acting as the (hopefully helpful) senior engineer in the scenario.

To know how your implementation is coming along as you're working, simply run
the tests and rubocop and look at the results:

    # Run the test suite this way:
    $ rake test

    # ...and rubocop this way
    $ rubocop

**Why rubocop?**

We know we're probably going to get some flak for using rubocop. Here's the
rationale behind it:

  * In any professional coding environment your code will need to conform to the
    style practices of your team.
  * Rubocop is an automated way to *simulate* that sort of thing through a
    challenge of this nature.
  * Style scoring, we believe, is important not because of the specific rules
    that rubocop might use, but because working as a developer includes the
    skill of writing code that works well within your team, and that means
    conforming to **some kind** of style guide.

Does that mean that **rails**challenge believes that rubocop is the
be-all-end-all in coding style? Nope. In fact, we've [loosened the rubocop rules][2]
a bit for this challenge. It's something we're trying for this first run of the
contest, and we'll see if it's a success or not.

On the flip side, we promise that this repo, in its current form, is free of
rubocop offenses according to the included [.rubocop.yml][2] file. So at least
we've started you off with a clean slate. And remember, your repo doesn't have
to be 100% clean of offenses when you submit your final code solution - you'll
just get a few more points on the automated scoring side if you keep things
clean. If you believe chasing down rubocop offenses isn't a good use of your time
(say, compared to making your overall implementation better) then that's
absolutely your choice on how to budget your time.

### Judge scoring

Part of the spirit of **rails**challenge is to provide feedback and guidance to
participants. After the submission period ends our panel of judges will act as
your "senior developer", review the challenge submissions, and award points based
on a code review.

Each judge is a currently employed developer or more senior technology
professional, and is here not just to give out points, but to guide you in your
coding practice. The goal is not just for you to write a Rails app, but for
everyone involved to learn how to better approach application development.

Here is an outline of the structure of the judge scoring system:

Judges will score each component of your application, and rate it on a scale
from `-1..3`.

  * `-1` for code that doesn't pass the tests
  * `0` for poorly written code that passes, but is sloppy, for example:
    * code that uses non-descriptive variable names
    * sloppily written and/or non-standard (to Rails) coding practices
    * variables and methods that are defined, but not actually used
    * code that appears to be obfuscated (whether intentionally or not)
  * `1` for decent code that looks reasonably like it complies with Rails coding
    standards
  * `2` to unusually good, highly efficient, or especially elegantly
    written solutions. This is where you'll get bonus points for good, idiomatic
    code.
  * `3` for the best implementation of a given feature -
    something that truly stands above the rest of the crowd

And from that the judges will assign points accordingly during your code
review:

  * `-1` will cause that component's points to be **subtracted** from your
    total score
  * `0` gets you zero points - you made the tests pass, but that's it
  * `1` gets you 50% of that component's points
  * `2` gets you 100% of that component's points
  * `3` gets you 200% of that component's points - and hey, maybe even a
    promotion to senior engineer some day

As you can see if you spend time not just making the tests pass, but writing
quality code, it's very possible to score more through well-written code and
code review than through the automated scoring alone. This approach was chosen
for **rails**challenge specifically because being good at programming is about
more than just making a test suite pass: it's about also writing code that works
well, and can be read and maintained by others.

### Scoring summary:

  * Maximum of 114 points in the automated scoring section
  * An "OK" submission that completes all components at the `0` level will max out
    at 114 points
  * A decent submission that completes all components at the `1` level will max
    out at `114 + (12.5 + 17.5 + 17.5 + 25 + 10) points = 196.5 points`
  * A solid submission that completes all components at the `2` level will max
    out at `114 + (25 + 35 + 35 + 25 + 20) points = 254 points`
  * An impossibly good submission that somehow manages to get the best possible
    implementation on all components could (theoretically) max out at
    `144 + (50 + 70 + 70 + 50 + 40) points = 424 points`

Winners are selected by most total points.

### In the event of a tie for 1st, 2nd, or 3rd place...

Ties will be broken by running a battery of speed tests against the submissions.
The submission that has the faster average response time will win!

# Be resourceful!

Use the net. Use the mailing list. Use StackOverflow. Whatever you want.

**Good luck!**

  [1]: https://github.com/bbatsov/rubocop
  [2]: https://github.com/railschallenge/railschallenge-city-watch/blob/master/.rubocop.yml
  [3]: https://groups.google.com/forum/#!forum/railschallenge
  [4]: https://github.com/railschallenge/railschallenge-city-watch/wiki
  [5]: https://github.com/railschallenge/railschallenge-city-watch/issues
  [6]: https://github.com/railschallenge/railschallenge-city-watch/pulls
