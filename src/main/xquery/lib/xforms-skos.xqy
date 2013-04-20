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
        <xf:instance id="submit-results">
            <data xmlns="" />
        </xf:instance>
        
        <!-- replace="all" kicks over to instance replace -->
        <xf:submission id="save" method="put" replace="instance" instance="submit-results" action="/xquery/skos-concept-submit.xqy" ref="instance('skos')">
            <xf:toggle case="case-busy" ev:event="xforms-submit"></xf:toggle>
            <xf:load ev:event="xforms-submit-done" resource="/" show="replace" /> 
            <!-- XFSubmission.submit() -->
            <!-- <xf:toggle case="case-submit-done" ev:event="xforms-submit-done"></xf:toggle> -->
            <xf:toggle case="case-submit-error" ev:event="xforms-submit-error"></xf:toggle>
        </xf:submission>
    </xf:model>
};
