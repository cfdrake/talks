# [fit] Elixir: A Whirlwind Tour

### by @colinfdrake

![](https://ecocrap.files.wordpress.com/2012/01/vintage-apothecary-bottles-2.jpg)

---

## Overview

- Motivation - History, Backstory, etc.
- Elixir Overview
- OTP Overview
- Other Cool Stuff ™

---

# Motivation

---

## What is Elixir?

- A Ruby-inspired "[...] **dynamic**, **functional** language designed for building scalable and maintainable applications"
- Compiled, targeting the Erlang virtual machine

---

## Erlang

- A functional language designed by Ericsson in 1986
- Open sourced as **Open Telecom Platform** (OTP) in 1998
- Influenced by Prolog, Smalltalk, CSP
- Designed for "distributed, fault-tolerant, [...], highly available, non-stop applications"

---

## Erlang Features

- Simple, process-based concurrency ("actor model")
  - Higher-level than OS threads/processes
  - Very lightweight
  - Share _no_ state
- Dynamic software updating
- Fault tolerant - _"Let it crash"_ philosophy

---

## Erlang IRL

- Amazon SimpleDB (AWS)
- Facebook Messenger
- WhatsApp
- T-Mobile SMS network
- Pinterest (deployed alongside Elixir!)

---

![](http://dekstop.de/weblog/2006/01/erlang_the_movie/erlang-3.jpg)

---

![](http://cdn.infoq.com/statics_s2_20150819-0313/resource/presentations/Erlang-Yaws/en/slides/sl119.jpg)

---

![](http://globalnerdy.com/wordpress/wp-content/uploads/2008/07/i_knew_erlang_before_it_was_cool.jpg)

---

# Elixir Overview

---

## What makes Elixir different?

- Able to target a proven VM with a "simpler" language
- Adds macros, pipelines, protocol-oriented design, ...
- Excellent open source ecosystem
  - Plug, Phoenix, Ecto, HTTPoison, ...

---

## Basics

```ruby
1.0                 # numbers
"Strings"           # strings
:atoms              # atoms/keywords
{:ok, "some data"}  # tuples
%{a: "b", c: "d"}   # maps/structs

x = 1                                 # variables
{status, value} = {:ok, "some data"}  # destructuring

# functions, modules, etc.
```

---

## Pattern Matching

```ruby
res = some_unsafe_function

case res do
  {:ok, value} ->
    IO.puts value
  {:error, _} ->
    IO.puts "Uh oh!"
end

# one of *many* cases of pattern matching in the language
```

---

## Pattern Matching

```ruby
# I lied... "=" doesn't mean "assign". It means "match".

x = 1

1 = x
[x, y] = [1, 2]    # 👍🏻

2 = x    # ** (MatchError) no match of right hand side value: 1
         # ** This is a crash!
```

---

## Match Refactoring

```ruby
{status, result} = call_some_unsafe_service

if status == :ok do
  result |> do_cool_stuff |> and_more_stuff
else
  perform_some_fatal_error
end

# Let's rewrite this with pattern matching...
```

---

## Match Refactoring - "Let it Fail"

```ruby
{:ok, result} = call_some_unsafe_service
result |> do_cool_stuff |> and_more_stuff

# Sure... but what happens if doesn't match to :ok?
```

---

![](http://www.elasperger.org/wp-content/uploads/2013/10/atkinson-says-goodbye-to-beloved-character-mr-bean1.jpg)

---

![](https://media.giphy.com/media/10VZfgNU9YBPpK/giphy.gif)

---

# OTP Overview
### Actors, Agents, Supervisors, ...oh my!

---

## Processes

- Break out app into processes
  - Contains completely *localized, independent* state
  - Has a mailbox, a queue of messages to respond to
  - Can asynchronously send messages to other mailboxes

![right zoom 150%](http://learnyousomeerlang.com/static/img/hello.png)

---

## Processes - Example Code

```ruby
parent = self()  # PID

# Create a child process...
spawn_link(fn ->
  send parent, {:msg, "hello world"}
end)

# Listen to messages sent to current process...
receive do
  {:msg, contents} -> IO.puts contents
end
```

---

## Fault Tolerance: Supervisors

```ruby
import Supervisor.Spec

children = [
  worker(...),
  worker(...),
  supervisor(...)  # could be a tree of processes!
]

Supervisor.start_link(children, strategy: :one_for_one)
```

---

# Other Cool Stuff ™

---

## Observer

![](http://crypt.codemancers.com/assets/images/elixir_observer/observer_2.png)

---

## Phoenix

![](https://i.ytimg.com/vi/RPs4SHpSThU/maxresdefault.jpg)

---

# Questions?

![](http://brunakochi.com/images/elixir-variantes.png)
