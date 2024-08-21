<pubmeta>
<header>main</header>
<title>XProc Specifications</title>
</pubmeta>

# XProc 3.1 — “Last Call” Specifications

The current, official specifications are [_XProc 3.0_ and _XProc 3.0: Standard Step Library_](#current).

XProc 3.1 is in “last call”. Version 3.1 fixes a few errata in the language
specification and the standard step library. It also publishes a number of additional step
libraries as finished specifications.

Last call will last for at least a month (until 20 September 2024), after which
time the final specifications will be published (unless additional last call
periods are required).

If you have questions or comments about the last call drafts, please
[let us know](https://github.com/xproc/3.0-specification/issues).

## Core specification

The core specification describes the syntax and semantics of the XProc 3.1
language. The last call draft is available:

* **[XProc 3.1 last call, 20 August 2024](https://spec.xproc.org/lastcall-2024-08/head/xproc/)**: The
editorial team believes that the core language specification is finished. We are
unaware (at the time of publication) of any substantive issues. This draft is
stable and will not be updated. Changes from 3.0 are summarized in
[Appendix M](https://spec.xproc.org/lastcall-2024-08/head/xproc/#changelog).

## Standard step libraries

The XProc 3.1 step libraries are available in several different specifications. The
last call drafts are stable and will not be updated.

All implementations must implement the standard step libarary:

* **[XProc 3.1 Standard Step Library last call, 20 August 2024](https://spec.xproc.org/lastcall-2024-08/head/steps/)**: The editorial team believes that the standard step library specification is finished.
We are unaware (at the time of publication) of any substantive issues.
Changes from 3.0 are summarized in
[Appendix F](https://spec.xproc.org/lastcall-2024-08/head/steps/#changelog).

Support for these additional libraries is optional. Implementations are free to pick
and choose which libraries they implement.

* **[Dynamic pipeline execution (`p:run`)](https://spec.xproc.org/lastcall-2024-08/head/run/)**: A step that runs pipelines constructed dynamically.
* **[File steps](https://spec.xproc.org/lastcall-2024-08/head/file/)**: Steps related to accessing files on a filesystem (rename, move, delete, etc.).
* **[Operating system steps](https://spec.xproc.org/lastcall-2024-08/head/os/)**: Steps related to accessing aspects of the underlying operating system (information about the system and the ability to execute commands on it).
* **[Mail steps](https://spec.xproc.org/lastcall-2024-08/head/mail/)**: Steps related to email.
* **[Paged media steps](https://spec.xproc.org/lastcall-2024-08/head/paged-media/)**: Steps related to producing paged media (for instance PDF files).
* **[ Text steps](https://spec.xproc.org/lastcall-2024-08/head/text/)**: Steps related to accessing text files (for instance Markdown).
* **[ Validation steps](https://spec.xproc.org/lastcall-2024-08/head/validation/)**: Steps related to validation of XML.
* **[ Invisible XML](https://spec.xproc.org/lastcall-2024-08/head/ixml/)**: Steps related to processing [Invisible XML](https://invisiblexml.org/).

---

<a name="current"></a>
# XProc 3.0 — Specifications

The following drafts are the most currently published specifications.

## Core Specification

The core specification describes the syntax and semantics of the XProc&#160;3.0 language. Two versions are available:

* **[Community Group Report 12 September 2022](https://spec.xproc.org/3.0/xproc/)**: The editorial team believes that the core language specification is final. We are unaware (at the time of publication) of any substantive issues. This report is stable and will not be updated.
* **[Recent editorial draft](https://spec.xproc.org/master/head/xproc/)**: The current editorial draft for XProc 3.0+ tracks changes made since the community report. For the most part, only editorial changes are expected. See the [change log appendix](https://spec.xproc.org/master/head/xproc/#changelog) for a list of substantive changes. This draft is updated regularly as the editorial team address issues.

If you find (either version of) the language specification unclear or believe
that you've found an error or omission, please [let us know](https://github.com/xproc/3.0-specification/issues).


## Standard Step Library

The standard step library specification describes the standard step vocabulary of the XProc&#160;3.0 language. Two versions are available:

* **[Community Group Report 12 September 2022](https://spec.xproc.org/3.0/steps/)**: The editorial team believes that the standard step library specification is final. We are unaware (at the time of publication) of any substantive issues. This report is stable and will not be updated.
* **[Current editorial draft](https://spec.xproc.org/master/head/steps/)**: The current editorial draft for XProc 3.0+ tracks changes made since the community. For the most part, only editorial changes are expected. See the [change log appendix](https://spec.xproc.org/master/head/steps/#changelog) for a list of substantive changes. This draft is updated regularly as the editorial team address issues.

If you find (either version of) the standard step library specification unclear or believe
that you've found an error or omission, please [let us know](https://github.com/xproc/3.0-steps/issues).

## Additional specifications

Not all steps make sense in every environment where an XProc processor might run. For example, paged media steps are unlikely to be supported on a mobile device, and steps that operate on files might not make sense in an embedded environment.

To simplify the task of identifying which steps an implementation supports, suites of steps considered "optional" are organized into separate specifications:

* **[Dynamic pipeline execution (`p:run`)](https://spec.xproc.org/master/head/run/)**: A step that runs pipelines constructed dynamically.
* **[File steps](https://spec.xproc.org/master/head/file/)**: Steps related to accessing files on a filesystem (rename, move, delete, etc.).
* **[Operating system steps](https://spec.xproc.org/master/head/os/)**: Steps related to accessing aspects of the underlying operating system (information about the system and the ability to execute commands on it).
* **[Mail steps](https://spec.xproc.org/master/head/mail/)**: Steps related to email.
* **[Paged media steps](https://spec.xproc.org/master/head/paged-media/)**: Steps related to producing paged media (for instance PDF files).
* **[RDF/Semantic web steps](https://spec.xproc.org/master/head/rdf/)**: Steps related to RDF and semantic web technologies.
* **[ Text steps](https://spec.xproc.org/master/head/text/)**: Steps related to accessing text files (for instance Markdown).
* **[ Validation steps](https://spec.xproc.org/master/head/validation/)**: Steps related to validation of XML.
* **[ Invisible XML](https://spec.xproc.org/master/head/ixml/)**: Steps related to processing [Invisible XML](https://invisiblexml.org/).
* **[Extensible Validation Report Language (XVRL)](https://spec.xproc.org/master/head/xvrl/)**: XVRL is a unified vocabulary for validation reports ([github.com/xproc/xvrl](github.com/xproc/xvrl)).



It's likely that additional, optional libraries will be created. (Steps for linked data, for sending mail, for accessing ODBC services have all been suggested).

If you find any of the step specifications unclear or believe that you've found an error or omission, please [let us know](https://github.com/xproc/3.0-steps/issues). Please also tell us if you have suggestions for new step libraries or if you think that an optional step should be required or vice versa.

