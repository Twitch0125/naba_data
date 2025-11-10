# Design Principles

This document outlines the guiding design principles for the development of new
applications and services within this project. Our core philosophy is to be "all
in on LLM agents," building robust, scalable, and maintainable systems.

All applications shall be containerized.

## Backend

Backend services will be the foundation of our agent-based architecture.

- **Language:** Elixir
  - **Rationale:** We will leverage Elixir for its expressiveness, fault
    tolerance (OTP), and concurrency features, which are ideal for building
    reliable and scalable backend systems.

- **Communication Protocol:** GraphQL
  - **Rationale:** All backend services will expose a GraphQL API. This provides
    a flexible and strongly-typed interface for our web applications to fetch
    and manipulate data, reducing over-fetching and enabling frontend teams to
    evolve their products with minimal backend dependencies.

## Frontend

Frontend applications will provide the user interface for interacting with our
systems.

- **Framework:** Nuxt 4
  - **Rationale:** Nuxt 4 provides a modern, server-side rendering (SSR) capable
    framework for building performant and SEO-friendly web applications. Its
    file-based routing and modular architecture will help us stay organized.

- **Styling:** DaisyUI
  - **Rationale:** DaisyUI, built on top of Tailwind CSS, will be used for our
    primary CSS library. It offers a rich set of pre-built components that will
    allow us to create clean and consistent user interfaces quickly.

- **Data Management:** TanStack Ecosystem
  - **Rationale:** We will use the TanStack ecosystem for data fetching, state
    management, and complex UI components.
    - **TanStack Query:** For managing server state, caching, and data
      synchronization with our GraphQL backend.
    - **TanStack Table:** For building complex, data-driven tables.

- **Complex Interactions:** Reka UI
  - **Rationale:** For more complex and stateful UI interactions that go beyond
    what DaisyUI and TanStack Table provide, we will use Reka UI. This allows
    for creating rich, interactive components.

## Project Overview (NABA)

Our application is a suite of apps for a group called NABA. It stands for North
American Baseball Association. It's a fictional baseball league that is
simulated in the Out Of the Park (OOTP) video game series. There are several
people who participate in NABA through a Discord server. There are a few
Commissioners (ie: Admins) who own OOTP and will run the game for a few weeks at
a time. Discord participants and Admins can have their own teams. Admins will
progress the game world when they're running the game and take team updates from
participants, such as lineups and trades. Admins will often live stream the game
simulations in discord where they'll usually progress 2-3 days in-game. After
which, the admin will get the website export (detailed in the Available Data
section below) and upload it using a legacy upload portal application. Then
discord participants can see the website at https://nabaleague.com

### Available Data

OOTP provides exports for data in CSV format. The data can include game scores,
batting/pitching statistics, player ratings and a lot more. OOTP also provides a
website export to view teams and some basic statistics and game scores. However,
it does not provide player Ratings, which are very valuable to participants to
get an estimate of how a player might actually perform. Players are rated on a
scale of 20-80, with 80 being amazing and 20 being very poor. They have an
overall rating and a potential rating, with these numbers equalizing out over
the players' career. The game has a few different ways of displaying the rating,
as it actually seems to be using a rating between 0-255 and just scales it
differently, but not all scales are linear! So an 18yr old rookie with an 80
potential rating and a 30 overall rating might be the next Babe Ruth of the
league in several years!

### Applications

- Upload portal (implemented considered legacy)
  - Allows Admins to upload website exports from OOTP and make them publicly
    visible at https://nabaleague.com
- Ratings (not implemented)
  - Allows Admins to upload OOTP CSVs of player ratings which the app will then
    scale to 20-80 scale and allow participants to view their players' ratings.
  - Allows participants to create batting/pitching lineups with visible ratings.
    Participants could then send screenshots of the lineups to an Admin who
    shall update the participant's team.
