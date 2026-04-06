<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:f="https://xproc.org/ns/functions"
                exclude-result-prefixes="#all"
                version="3.0">

<xsl:output method="xml" encoding="utf-8" indent="yes"/>

<xsl:param name="root" select="resolve-uri('../../src/status')"/>

<xsl:variable name="Z" select="xs:dayTimeDuration('PT0S')"/>

<xsl:mode on-no-match="shallow-copy"/>

<xsl:template match="/">
  <xsl:variable name="statuses" as="element(item)+">
    <xsl:for-each select="collection($root||'?recurse=yes;select=*.xml')">
      <xsl:sort select="/item/pubDate" order="descending"/>
      <xsl:sequence select="f:valid(/*)"/>
    </xsl:for-each>
  </xsl:variable>

  <xsl:if test="count(distinct-values($statuses/pubDate)) != count($statuses)">
    <xsl:message terminate="yes"
                 select="'Error: duplicated pubDate'"/>
  </xsl:if>

  <rss version="2.0">
    <channel>
      <title>@xproc</title>
      <link>https://xproc.org/@xproc/</link>
      <description>XProc status feed.</description>
      <language>en-us</language>
      <pubDate>
        <xsl:sequence select="f:dateTime($statuses[1]/pubDate)"/>
      </pubDate>
      <lastBuildDate>
        <xsl:sequence select="f:dateTime(string(current-dateTime()))"/>
      </lastBuildDate>
      <managingEditor>ndw@nwalsh.com</managingEditor>
      <webMaster>ndw@nwalsh.com</webMaster>
      <xsl:apply-templates select="$statuses"/>
    </channel>
  </rss>

  <xsl:variable name="head-elements" as="element()+">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="/css/tufte.css" />
    <link rel="stylesheet" href="/css/xproc.css" />
    <link rel="stylesheet" href="https://use.typekit.net/zgg8zqr.css" />
    <script src="https://code.jquery.com/jquery-3.4.0.min.js" integrity="sha256-BJeo0qm959uMBGb65z40ejJYGSgR7REI4+CW1fNKwOg=" crossorigin="anonymous"></script>
    <script src="/js/mdecl.js"></script>
    <link rel="icon" href="/img/favicon.gif" />
  </xsl:variable>

  <xsl:variable name="header" as="element(header)">
    <header>
      <nav class="sidebar">
        <img src="/img/logo.png" alt="[Logo]" id="mainlogo" />
        <ul>
          <li><a href="/">Home</a></li>
          <li><a href="/introduction.html">Introduction</a></li>
          <li><a href="/specifications.html">Specification</a></li>
          <li><a href="/processors.html">Processors</a></li>
          <li><a href="/learning.html">Learning</a></li>
          <li><a href="/test-suite.html">Test suite</a></li>
        </ul>
      </nav>
      <nav class="inline">
        <ul>
          <li><a href="/">Home</a></li>
          <li><a href="/introduction.html">Introduction</a></li>
          <li><a href="/specifications.html">Specification</a></li>
          <li><a href="/processors.html">Processors</a></li>
          <li><a href="/learning.html">Learning</a></li>
          <li><a href="/test-suite.html">Test suite</a></li>
        </ul>
      </nav>
    </header>
  </xsl:variable>

  <xsl:variable name="years" as="xs:string+"
                select="distinct-values($statuses/pubDate
                                        ! format-dateTime(xs:dateTime(.), '[Y0001]'))"/>

  <xsl:for-each select="$years">
    <xsl:variable name="year" select="."/>

    <xsl:result-document href="{resolve-uri('../../build/@xproc/'||$year||'/index.html')}"
                         method="html" html-version="5">
      <html>
        <head>
          <xsl:sequence select="$head-elements"/>
          <title>@xproc statuses in <xsl:sequence select="$year"/></title>
        </head>
        <body>
          <main>
            <xsl:sequence select="$header"/>
            <article>
              <h1>@xproc statuses in <xsl:sequence select="$year"/></h1>
              <p>This page displays status “<a href="https://botsin.space/@xproc">toots</a>”
              about the XProc project from <xsl:sequence select="$year"/>.</p>
              <p>See also <a href="../">recent statuses</a>.</p>
              <div class="toots">
                <xsl:for-each
                    select="$statuses
                            [format-dateTime(xs:dateTime(pubDate), '[Y0001]') = $year]">
                  <xsl:variable
                      name="dt"
                      select="adjust-dateTime-to-timezone(xs:dateTime(pubDate), $Z)"/>
                  <xsl:variable
                      name="pubdate"
                      select="format-dateTime($dt,
                                '[D01] [MNn,*-3] [Y0001] @ [H01]:[m01]:[s01] GMT')"/>
                  <xsl:variable
                      name="id" 
                      select="substring-after(f:uri(.), '#')"/>
                  <div class="toot" id="{$id}">
                    <div>
                      <h2>
                        <xsl:if test="exists(title)">
                          <xsl:sequence select="string(title)||'; '"/>
                        </xsl:if>
                        <xsl:sequence select="$pubdate"/>
                        <span class="toot-id">
                          <xsl:text> #</xsl:text>
                          <xsl:sequence select="$id"/>
                        </span>
                      </h2>
                    </div>
                    <p>
                      <xsl:sequence select="string(description)"/>
                      <xsl:if test="link">
                        <span class="link">
                          <xsl:text>[</xsl:text>
                          <a href="{string(link)}">Link</a>
                          <xsl:text>]</xsl:text>
                        </span>
                      </xsl:if>
                    </p>
                  </div>
                </xsl:for-each>
              </div>
            </article>
          </main>
        </body>
      </html>
    </xsl:result-document>
  </xsl:for-each>

  <xsl:result-document href="{resolve-uri('../../build/@xproc/index.html')}"
                       method="html" html-version="5">
    <html>
      <head>
        <xsl:sequence select="$head-elements"/>
        <title>@xproc statuses</title>
      </head>
      <body>
        <main>
          <xsl:sequence select="$header"/>
          <article>
            <h1>@xproc statuses</h1>
            <p>This page displays recent status
            “<a href="https://botsin.space/@xproc">toots</a>”
            about the XProc project.</p>
            <p>The are also captured in <a href="../status.rss">an RSS feed</a>.</p>
            <p>
              <xsl:text>By year: </xsl:text>
              <xsl:for-each select="$years">
                <xsl:sort select="." order="descending"/>
                <xsl:if test="position() gt 1">, </xsl:if>
                <a href="{.}/"><xsl:sequence select="."/></a>
              </xsl:for-each>
            </p>
            <div class="toots">
              <xsl:for-each select="subsequence($statuses, 1, 30)">
                <xsl:variable
                    name="dt"
                    select="adjust-dateTime-to-timezone(xs:dateTime(pubDate), $Z)"/>
                <xsl:variable
                    name="pubdate"
                    select="format-dateTime($dt,
                              '[D01] [MNn,*-3] [Y0001] @ [H01]:[m01]:[s01] GMT')"/>
                <xsl:variable
                    name="id" 
                    select="substring-after(f:uri(.), '#')"/>
                <div class="toot" id="{$id}">
                  <div>
                    <h2>
                      <xsl:if test="exists(title)">
                        <xsl:sequence select="string(title)||'; '"/>
                      </xsl:if>
                      <xsl:sequence select="$pubdate"/>
                      <span class="toot-id">
                        <xsl:text> #</xsl:text>
                        <xsl:sequence select="$id"/>
                      </span>
                    </h2>
                  </div>
                  <p>
                    <xsl:sequence select="string(description)"/>
                    <xsl:if test="link">
                      <span class="link">
                        <xsl:text>[</xsl:text>
                        <a href="{string(link)}">Link</a>
                        <xsl:text>]</xsl:text>
                      </span>
                    </xsl:if>
                  </p>
                </div>
              </xsl:for-each>
            </div>
          </article>
        </main>
      </body>
    </html>
  </xsl:result-document>
</xsl:template>

<xsl:template match="item">
  <xsl:copy>
    <xsl:apply-templates/>
    <guid>
      <xsl:text>https://xproc.org/@xproc/#</xsl:text>
      <xsl:sequence
          select="substring-before(tokenize(base-uri(.), '/')[last()], '.xml')"/>
    </guid>
  </xsl:copy>
</xsl:template>

<xsl:template match="pubDate">
  <xsl:copy>
    <xsl:sequence select="f:dateTime(.)"/>
  </xsl:copy>
</xsl:template>

<xsl:function name="f:valid" as="element(item)">
  <xsl:param name="item" as="element()"/>

  <xsl:if test="not($item/self::item)">
    <xsl:message terminate="yes"
                 select="'Item is not an item:', local-name($item)"/>
  </xsl:if>

  <xsl:if test="empty($item/description)">
    <xsl:message terminate="yes"
                 select="'Item does not have a description'"/>
  </xsl:if>

  <xsl:if test="empty($item/pubDate)">
    <xsl:message terminate="yes"
                 select="'Item does not have a pubDate'"/>
  </xsl:if>

  <xsl:if test="exists($item/* except ($item/title|$item/link|$item/description
                                       |$item/pubDate))">
    <xsl:message terminate="yes"
                 select="'Unexpected extra content:', $item"/>
  </xsl:if>

  <xsl:sequence select="$item"/>
</xsl:function>

<xsl:function name="f:uri" as="xs:string">
  <xsl:param name="item" as="element(item)"/>
  <xsl:variable
      name="year"
      select="substring-before(substring-after(base-uri($item), '/src/'), '/')"/>
  <xsl:sequence
      select="$year || '#status-' || format-dateTime(xs:dateTime($item/pubDate),
                                                     '[M02][D02][h02][m02]')"/>
</xsl:function>

<xsl:function name="f:dateTime" as="xs:string">
  <xsl:param name="dateTime" as="xs:string"/>

  <xsl:variable name="dt"
                select="adjust-dateTime-to-timezone(xs:dateTime($dateTime), $Z)"/>
  <xsl:sequence
      select="format-dateTime($dt,
                '[FNn,*-3], [D] [MNn,*-3] [Y0001] [H01]:[m01]:[s01] GMT')"/>
</xsl:function>

</xsl:stylesheet>
