xquery version "1.0-ml";

module namespace xforms-skos="http://www.xmlmachines.com/xforms-skos";

import module namespace xforms = "http://www.xmlmachines.com/xforms" at "/xquery/lib/xforms.xqy";

declare namespace xf="http://www.w3.org/2002/xforms";
declare namespace ev="http://www.w3.org/2001/xml-events";
declare namespace xhtml="http://www.w3.org/1999/xhtml";
declare namespace xsltforms="http://www.agencexml.com/xsltforms";
declare namespace rte="http://www.agencexml.com/xsltforms/rte";

declare default function namespace "http://www.w3.org/2005/xpath-functions";
 
declare function xforms-skos:base-model() {
        <xf:model>
            <xf:instance id="skos" src="/xml/instance-data/skos-base.xml"/>
            
         
            <!-- you MUST bind each data type to the decimal type for the range control to work 
            <xf:bind nodeset="/data/data1" type="xs:integer" />
            <xf:bind nodeset="/data/data2" type="xs:integer" />
            <xf:bind nodeset="/data/data3" type="xs:integer" / -->
            
        </xf:model>
 };
