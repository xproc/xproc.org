<pubmeta>
<header>main</header>
<title>XProc - Specifications</title>
</pubmeta>

<a name="current"></a>
# XProc 3.1 Specifications

The current version of XProc is XProc 3.1. Version 3.1 fixes a few errata in the
language specification and the standard step library. It also publishes a number
of additional step libraries as finished specifications.

(“Final Community Group Report” versions will be published soon. They may differ
in small, editorial details, but it will introduce no technical changes.)

## Core specification

The core specification describes the syntax and semantics of the XProc 3.1
language.

* **[Community Group Report, 30 May 2025](https://spec.xproc.org/3.1/xproc/)**:
This is the Community Report version of XProc 3.1. This draft is stable and will
not be updated. Changes from 3.0 are summarized in
[Appendix M](https://spec.xproc.org/3.1/xproc/#changelog).

## Standard step libraries

The XProc 3.1 step libraries are available in several different Community Reports.

All implementations must implement the standard step libarary:

* **[XProc 3.1 Standard Step Library, 30 May 2025](https://spec.xproc.org/3.1/steps/)**:
This is the Community Report version of the XProc 3.1 Standard Step Library.
This draft is stable and will not be updated. Changes from 3.0 are summarized in
[Appendix F](https://spec.xproc.org/3.1/steps/#changelog).

Support for these additional libraries is optional. Implementations are free to pick
and choose which libraries they implement.

* **[Dynamic pipeline execution (`p:run`)](https://spec.xproc.org/3.1/run/)**: A step that runs pipelines constructed dynamically.
* **[File steps](https://spec.xproc.org/3.1/file/)**: Steps related to accessing files on a filesystem (rename, move, delete, etc.).
* **[Operating system steps](https://spec.xproc.org/3.1/os/)**: Steps related to accessing aspects of the underlying operating system (information about the system and the ability to execute commands on it).
* **[Mail steps](https://spec.xproc.org/3.1/mail/)**: Steps related to email.
* **[Paged media steps](https://spec.xproc.org/3.1/paged-media/)**: Steps related to producing paged media (for instance PDF files).
* **[ Text steps](https://spec.xproc.org/3.1/text/)**: Steps related to accessing text files (for instance Markdown).
* **[ Validation steps](https://spec.xproc.org/3.1/validation/)**: Steps related to validation of XML.
* **[ Invisible XML](https://spec.xproc.org/3.1/ixml/)**: Steps related to processing [Invisible XML](https://invisiblexml.org/).

---

# XProc 3.0 — Specifications

The previous version of XProc was XProc 3.0.

## Core Specification

The core specification describes the syntax and semantics of the XProc&#160;3.0 language. Two versions are available:

* **[Community Group Report 12 September 2022](https://spec.xproc.org/3.0/xproc/)**: The editorial team believes that the core language specification is final. We are unaware (at the time of publication) of any substantive issues. This report is stable and will not be updated.
* **[Recent editorial draft](https://spec.xproc.org/master/head/xproc/)**: The current editorial draft for XProc 3.0+ tracks changes made since the community report. For the most part, only editorial changes are expected. See the [change log appendix](https://spec.xproc.org/master/head/xproc/#changelog) for a list of substantive changes. This draft is updated regularly as the editorial team address issues.

## Standard Step Library

The standard step library specification describes the standard step vocabulary of the XProc&#160;3.0 language. Two versions are available:

* **[Community Group Report 12 September 2022](https://spec.xproc.org/3.0/steps/)**: The editorial team believes that the standard step library specification is final. We are unaware (at the time of publication) of any substantive issues. This report is stable and will not be updated.
* **[Current editorial draft](https://spec.xproc.org/master/head/steps/)**: The current editorial draft for XProc 3.0+ tracks changes made since the community. For the most part, only editorial changes are expected. See the [change log appendix](https://spec.xproc.org/master/head/steps/#changelog) for a list of substantive changes. This draft is updated regularly as the editorial team address issues.
