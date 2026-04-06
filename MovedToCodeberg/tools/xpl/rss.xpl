<p:declare-step xmlns:p="http://www.w3.org/ns/xproc"
                xmlns:db="http://docbook.org/ns/docbook"
                xmlns:dbp="http://docbook.github.com/ns/pipeline"
                xmlns:cx="http://xmlcalabash.com/ns/extensions"
                xmlns:h="http://www.w3.org/1999/xhtml"
                exclude-inline-prefixes="dbp cx h"
                name="main" version="1.0">

  <p:input port="parameters" kind="parameter"/>

  <p:declare-step type="cx:message">
    <p:input port="source" sequence="true"/>
    <p:output port="result" sequence="true"/>
    <p:option name="message" required="true"/>
  </p:declare-step>

  <p:xslt name="xslt">
    <p:input port="source">
      <p:document href="../xsl/status-rss.xsl"/>
    </p:input>
    <p:input port="stylesheet">
      <p:document href="../xsl/status-rss.xsl"/>
    </p:input>
  </p:xslt>

  <p:store href="../../build/@xproc/status.rss" indent="true" method="xml"/>

  <p:for-each>
    <p:iteration-source>
      <p:pipe step="xslt" port="secondary"/>
    </p:iteration-source>
    <p:variable name="base" select="base-uri(/)"/>
<!--
    <cx:message>
      <p:with-option name="message" select="'U:' || $base"/>
    </cx:message>
-->
    <p:store method="xhtml">
      <p:with-option name="href" select="$base"/>
    </p:store>
  </p:for-each>
</p:declare-step>
