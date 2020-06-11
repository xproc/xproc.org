<pubmeta>
<header>main</header>
<title>XProc 3.0 - Home</title>
</pubmeta>

<h1>XProc 3.0 - Home</h1>

XProc is an XML based programming language for processing documents in pipelines: chaining conversions and other steps together to achieve the desired results. The current version is 3.0. 

XProc has been around, in its 1.0 version, since 2010. All information about this older version can be found [here](https://archive.xproc.org).

The following are important sources of information about XProc 3.0:

* To wet your appetite, read the [nutshell](#nutshell) section below or have a look at the *[Introduction to XProc 3.0](https://www.xml.com/articles/2019/11/05/introduction-xproc-30/)* article at the [xml.com website](https://www.xml.com/).
* There's an *XProc 3.0 Programmer Reference* book, which you can order [here](https://xmlpress.net/publications/xproc-3-0/).
* We have collected as many learning materials about XProc 3.0 as we could find [here](learning.html) (conference talks, webinars, articles, etc.). 
* There is, of course, a [formal specification](https://spec.xproc.org/) of the XProc 3.0 language.
* To run XProc you need one of the [XProc processors](processors.html)
  * Conformance checking of these processors is done using the [XProc test suite](https://test-suite.xproc.org/) 
* You can find XProc on GitHub at [https://github.com/xproc](https://github.com/xproc)
* Join in or visit the archives of the [XProc mailing list](https://lists.w3.org/Archives/Public/xproc-dev/): `xproc-dev@w3.org`

The XProc 3.0 specification is maintained by Achim Berndzen, Gerrit Imsieke, Erik Siegel and Norman Tovey-Walsh. 
 

<h2><a name="nutshell"/>XProc in a nutshell</h2>

* XProc is a programming language, expressed in XML, in which you can write pipelines.
* An XProc pipeline takes data as its input (often XML) and passes this through specialized steps to produce end results.
* Steps range from simple ones, like reading and writing data, to more complex stuff like splitting/combining/pruning, transformations with XSLT and XQuery, validations against schemas, etc.
* Within a pipeline you can do things like working with variables, branching, looping, catch errors, etc. Everything is based on the data flowing through.
* XProc pipelines are not limited to a linear succession of steps. They can fork and merge.
* XProc allows you to create custom steps by combining other steps. These custom steps can be used just like any other. Custom steps can be collected into libraries.
* XProc aids in the housekeeping surrounding the processing, like inspecting directories, reading documents from zip files, writing things to disk, etc
* There is software that can execute these pipelines, the so-called XProc processors.

Now why and when would this be useful? In the physical world, pipelining and working in specialized steps is not unusual. Take for instance an oil refinery: it takes crude oil as its input and, through a series of steps and intermediate products, produces petrol/gasoline, kerosene, diesel, etc. Just one look shows that refineries take the word "pipeline" very literal...

A classic from the IT world are of course UNIX pipelines. Some command produces some output and we do further processing (by, for instance, `grep` or `tail` or `head`) to get the information needed. The character used for chaining steps, `|`, is even called the "pipe" character!

So why would we do this in the world of information and document processing? One of the main reasons is that data is often not in the format we need it to be. Some examples:

* We have XML coming from some data source but need HTML for our website.
* Multiple weather stations produce data that needs to be merged into a single consolidated view. From this we produce a map with the information nicely laid out.
* Word processors produce zip files with lots of XML documents inside (most word processors do nowadays). You need the text in some other format so you’ll have to inspect the zip file, combine the XML documents inside and transform the result into what you want.

For straight transformation of XML data there are languages available, like XSLT and XQuery. But more often than not tasks are more complex than can be done in a single transformation: chaining, splitting and merging comes into play. Surrounding the transformations you need housekeeping, like where to read from or write to, inspect directories and zip files and write logs. Also from a software engineering point of view it is often desirable to work in smaller steps to get more legible and better maintainable code. This is where XProc comes into play: a single executable language to express this.