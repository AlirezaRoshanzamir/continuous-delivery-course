# Continuous Delivery Course
This repository contains the artifacts (presentations, examples, ...) that are used for the course. Each session's details exist in the corresponding directory.

## Installation and Usage

### Presentations
There is a file named `presentation.md` in each session directory. You can simply open it and see the presentation.

However, if you wish to view the presentation as a slide show, you should use `reveal.js`. Navigate to the `revealjs` directory and install the dependencies:

```console
$ npm install
```

And finally, start the server with live-reload support (you can change the session directory using the `SESSION` environment variable):

```console
$ SESSION=1-outline npm start
...
[17:34:07] Starting 'serve'...
[17:34:07] Starting server...
[17:34:07] Server started http://localhost:8000
[17:34:07] LiveReload started on port 35729
[17:34:07] Running server
```

## Current Sessions
Currently, these sessions have been added:

| Number | Topic |
| ------ | ----- |
|   1    | [Course Outline](1-outline) |
|   2    | [Introduction](2-introduction) |
|   3    | [The problem of delivering software](3-the-problem-of-delivering-software) |
